@extends('layouts.app')
@section('content')
<div class="panel-body">
    <div class="alert alert-success" role="alert">
        Search terms <strong>"{{ $searchData['0'] }}"</strong> and Search values
        <strong>"{{ $searchData['1'] }}"</strong>
    </div>
    <div class="pull-left">
        <a href="{{ url('/add-note') }}" class="btn btn-success">Add new entry</a>
    </div>
    <form method="POST" id="search" action="{{ url('/search') }}">
        <div class="row text-right">
            <div class="col-xs-8 col-xs-offset-2">
                <div class="input-group">
                    <div class="input-group-btn search-panel">
                        <button type="button" class="btn btn-default dropdown-toggle"
                        data-toggle="dropdown">
                        <span id="search_concept">Filter by</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#id">ID</a></li>
                        <li><a href="#name">Name</a></li>
                        <li><a href="#phone_number">Phone Number</a></li>
                        <li><a href="#additional_notes">Address</a></li>
                        <li><a href="#created_at">Created Date</a></li>
                    </ul>
                </div>
                {!! csrf_field() !!}
                <input type="hidden" name="search_param" value="id" id="search_param">
                <input type="text" class="form-control" name="search"
                placeholder="Search term...">
                <span class="input-group-btn">
                    <button class="btn btn-default search" type="button"><span
                        class="glyphicon glyphicon-search"></span>
                    </button>
                </span>
            </div>
        </div>
    </div>
</form>
@if(isset($result) && count($result) > 0)
<table class="table table-striped">
    <thead>
        <tr>
            <th class="text-center">#</th>
            <th class="text-center">Name</th>
            <th class="text-center">Phone Number</th>
            <th class="text-center">Additional Notes</th>
            <th class="text-center">Created At</th>
            <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>
        @foreach($result as $item)
        <tr>
            <th class="text-center" scope=row><a href="#">{{$item->id}}</a></th>
            <td class="text-center">{{ucfirst($item->name)}}</td>
            <td class="text-center">{{$item->phone_number}}</td>
            <td class="text-center">{{ (isset($item->additional_notes) && !empty($item->additional_notes)) ? $item->additional_notes : 'N/A' }}</td>
            <td class="text-center">{{$item->created_at}}</td>
            <td class="text-center">
                <a href="{{ url('/edit/') . '/' . $item->id}}">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                </a>
                &nbsp;&nbsp;&nbsp;
                <a href="{{ url('/delete/') . '/' . $item->id }}" class="removeRecord">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </a>

            </td>
        </tr>
        @endforeach
    </tbody>
</table>
<div class="text-center">
    @if($result->render())
    <?php echo $result->appends(['search_param' => $searchData['0'], 'search' => $searchData['1']])->render(); ?>
    @endif
</div>
@else
<div class="alert alert-info" role="alert">
    No records found!
</div>
@endif
</div>
@endsection

@section('footer')
<script>
    $(document).ready(function (e) {
        $('.search-panel .dropdown-menu').find('a').click(function (e) {
            e.preventDefault();
            var param = $(this).attr("href").replace("#", "");
            var concept = $(this).text();
            $('.search-panel span#search_concept').text(concept);
            $('.input-group #search_param').val(param);
        });
        $('.search').click(function () {
            $('#search').submit();
        });
        $('.removeRecord').click(function () {
            var answer = confirm('Are you sure want to delete this record?');
            if (!answer) return false;
        });
    });
</script>
@endsection