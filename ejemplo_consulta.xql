<ul> 
{
for $x in doc("biblio.xml")/bookstore/book/title 
order by $x
return <li>{$x}</li> 
}
</ul>

