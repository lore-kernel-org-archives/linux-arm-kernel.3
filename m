Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA533C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu+5IVXA6pbzC+y9EyJIaWB0KxreFLrxpLXUy3Xbk7I=; b=Pn8Exuveg/CFLPL0D0a0HqHa1A
	IXNJbEM3TNzfWtRf4MK2SWXM9FoUiyV+y94ETLjtpBD+wSJ1W9ykBY+7RuXCBY7C94TBp42cBywGL
	o6dJLMaCEWv7o3IUPkP9XDxLwhfnC611+LNY+Q8D9+rjxwW7IIfosALNzBojO6U0CVZe5d2hKW7WE
	VM9x00PJpwOsYWzYc03HIPr4Um7nemPnRecpE506NOlqMR1Uboh8xjRAUdlmdayLtWOpo60ESKJSq
	nFgBqt7sobuLJzTRa7WLxLd1bUii2p3+lRWUNLN/PFMV7yGhcSsaQFNJn6gGv+FNra1LnA+WjqZBs
	qpvynxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhjn-0000000G8bg-1Kl6;
	Mon, 21 Jul 2025 04:02:51 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhZh-0000000G7qp-2rmU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 03:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753069943;
	bh=Iu+5IVXA6pbzC+y9EyJIaWB0KxreFLrxpLXUy3Xbk7I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QnWEapU1KJwFhPi0H8SqC7IGQ+rS4thZas19e+89eSgYus/fFo7Erw5lkQzWhGobp
	 sEfzpXqR5pqjHveRlUktHBPgi7nCjeZMLX7QWc1Re9+yKWEAKLiOd7MZd45aj27zD9
	 SpXgFop+4zsNrVblzmb6rJqd1Hambs4C8wy1GdX8RtGxkJ5wz/Z0TYG80bMMxPwGYH
	 ZIdFYsYy5XVilJBjqjFME/lGXZrrrb9I9VuZ4UdN4MZ4Bdn23+sJDAC8rrbW9s+v7f
	 LiMwLStxZOnNEQVxsvrRzWGMkbxy5LIYpQExqsR/sPzgWnGECjS6ComyetMO0oCTfK
	 Xihalh19KCsaQ==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7E777640A2;
	Mon, 21 Jul 2025 11:52:20 +0800 (AWST)
Message-ID: <c980c6c55f3a4914f1393498763bdf9cfb109ad2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com
Date: Mon, 21 Jul 2025 13:22:19 +0930
In-Reply-To: <20250717-add-support-for-meta-clemente-bmc-v8-2-2ff6afb36b0e@fii-foxconn.com>
References: <20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com>
	 <20250717-add-support-for-meta-clemente-bmc-v8-2-2ff6afb36b0e@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_205225_911873_C3830C67 
X-CRM114-Status: GOOD (  12.96  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDI1LTA3LTE3IGF0IDIyOjU5ICswODAwLCBMZW8gV2FuZyB3cm90ZToKPiBGcm9t
OiBMZW8gV2FuZyA8bGVvLmp0LndhbmdAZ21haWwuY29tPgo+IAo+IEFkZCBsaW51eCBkZXZpY2Ug
dHJlZSBlbnRyeSBmb3IgTWV0YSBDbGVtZW50ZSBjb21wdXRlLXRyYXkKPiBCTUMgdXNpbmcgQVNU
MjYwMCBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGVvIFdhbmcgPGxlby5qdC53YW5nQGdtYWls
LmNvbT4KPiAKClsuLi5dCgo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gKwo+ICsvLyBQREIgVEVNUCBT
RU5TT1IKClRoaXMgY29tbWVudCBzaG91bGQgYmUgaW5kZW50ZWQgYXBwcm9wcmlhdGVseT8KCj4g
K8KgwqDCoMKgwqDCoMKgdGVtcGVyYXR1cmUtc2Vuc29yQDRlIHsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJ0aSx0bXAxMDc1IjsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4NGU+Owo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gCgpb
Li4uXQoKPiArCj4gKyZpMmMxMSB7Cj4gK8KgwqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+
ICvCoMKgwqDCoMKgwqDCoGFzcGVlZCxlbmFibGUtYnl0ZTsKClRoaXMgaXMgbm90IGEgcHJvcGVy
dHkgc3BlY2lmaWVkIGluIGFueSBhY2NlcHRlZCBiaW5kaW5nLCBwbGVhc2UgZHJvcAppdC4KCiAg
IGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQtYm1jLWZhY2Vib29rLWNsZW1lbnRlLmR0
YjogaTJjQDYwMCAoYXNwZWVkLGFzdDI2MDAtaTJjLWJ1cyk6IFVuZXZhbHVhdGVkIHByb3BlcnRp
ZXMgYXJlIG5vdCBhbGxvd2VkICgnYXNwZWVkLGVuYWJsZS1ieXRlJyB3YXMgdW5leHBlY3RlZCkK
ICAgCWZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaTJjL2Fz
cGVlZCxpMmMueWFtbCMKCj4gKwo+ICvCoMKgwqDCoMKgwqDCoHNzaWYtYm1jQDEwIHsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJzc2lmLWJtYyI7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDEwPjsKPiArwqDCoMKgwqDCoMKg
wqB9Owo+ICt9Owo+IAoKWy4uLl0KCj4gKwo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9hc3BlZWQvYXNwZWVkLWc2LXBpbmN0cmwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC9hc3BlZWQtZzYtcGluY3RybC5kdHNpCj4gaW5kZXggMjg5NjY4ZjA1MWViNDI3MWFjNDhhZTNj
ZTliODI1ODc5MTE1NDhlZS4uNjFiMWQxYzUwNDBjODIwZjhjOTk1MTMyNzM5YmVjZGU4MGUwNjli
YiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvYXNwZWVkLWc2LXBpbmN0
cmwuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQtZzYtcGluY3Ry
bC5kdHNpCj4gQEAgLTQxMiw2ICs0MTIsMTYgQEAgcGluY3RybF9tZGlvNF9kZWZhdWx0OiBtZGlv
NF9kZWZhdWx0IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdyb3VwcyA9ICJN
RElPNCI7Cj4gwqDCoMKgwqDCoMKgwqDCoH07Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBwaW5jdHJs
X25jc2kzX2RlZmF1bHQ6IG5jc2kzX2RlZmF1bHQgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBmdW5jdGlvbiA9ICJSTUlJMyI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdyb3VwcyA9ICJOQ1NJMyI7Cj4gK8KgwqDCoMKgwqDCoMKgfTsKPiArCj4gK8KgwqDCoMKg
wqDCoMKgcGluY3RybF9uY3NpNF9kZWZhdWx0OiBuY3NpNF9kZWZhdWx0IHsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZnVuY3Rpb24gPSAiUk1JSTQiOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBncm91cHMgPSAiTkNTSTQiOwo+ICvCoMKgwqDCoMKgwqDCoH07Cj4g
KwoKQ2FuIHlvdSBwbGVhc2UgbWFrZSB0aGlzIGEgc2VwYXJhdGUgcGF0Y2g/CgpUaGFua3MsCgpB
bmRyZXcK


