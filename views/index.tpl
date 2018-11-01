<!DOCTYPE html>
<html>
<head>
	<title>Verkefni 6. Sessions</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/static/normalize.css">
	<link rel="stylesheet" type="text/css" href="/static/main.css">
</head>
<body>
    <header>
        <h1>Veforritun</h1>
        <a class="a" href="/">Home</a>
    </header>

    <section class="container">
        %cnt = 1
        %for i in range(6):

            <div class="element"><a href="/chart/{{i}}"><img src="/static/Aurora_{{cnt}}.jpg"></a><h4>Verð: {{vara[i]['price']}}</h4></div>
            %cnt += 1
        %end
    </section>
    <%
        from bottle import *
        from beaker.middleware import SessionMiddleware
        bs = request.environ.get('beaker.session')
        cnt2 = 0
        for i in range(6):
            if bs.get(str(i)):
            cnt2 += 1
            end
        end
    %>
    <asside class="karfa">
        ({{cnt2}})
        <a href="/chart" title="Skoða körfu"><img src="/static/cart.png"></a>

    </asside>


        <footer>
            <p>Copyright &copy; 2018, Sigsteinn</p>
        </footer>
</body>
</html>
