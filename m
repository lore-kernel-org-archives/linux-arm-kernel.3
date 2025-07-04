Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A1EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 00:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HvshWDHlLlPvbXK9Y83KcYdKVX+YX4UjkJdPlQODCg=; b=LufPY6dm7DzyOMBJub8hnXDjAu
	CCwakgqMkGTTP4RtNeR3ll7NzXAicSFTBprxNzJ7QGB0q586iYOJi/MmEWohQlmlFUVCu7yadxBIC
	+t5asTipvi7/jTQBLuwSOKdFtOb7aAOQcc9Szo9kdfa7446+aBeZOceh8mIaucPl1aOTZmxXYzG0V
	p3Qho2B+IK3fY2fAMgINfxI47uawgMBP5Rf3iabRFyJAKxzctw6Xcz7D24O7bZM0/lo/4OlKVGv8a
	DlEt56a4ttyyvbIE0lVc3q9RK2Yyy60Jy9VYWzkrXWW3g/eop8d1BgqMVYwT4VrfKrHsL/xlsTZrB
	l5zS1i5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXU5D-0000000Cuqt-1eN5;
	Fri, 04 Jul 2025 00:15:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTwv-0000000CuFh-1ByS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 00:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751587594;
	bh=4HvshWDHlLlPvbXK9Y83KcYdKVX+YX4UjkJdPlQODCg=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=bd8cK7MYknGTS0lOj+U8WZ6K9i1+iL4/RcZ+73L+lPeLQ+/miHT1MDVXHrbVf1To8
	 C5X6XpLEK6MffQ1s78rE7Y+heB8kXVhyjtBf6eeD0nQ8XtD2zZE4rseor3xURQ8SFV
	 72jk/KMostVgC9EsC9AB7NasfNH/i0p1kfQnXVOaoWjelDS5zw0CuMm5FXdMtAR2b5
	 FCbJTrOhbAlt9ZUnCaFUajIcfRUuCOVeRNxN3yh5SpDAZXKGKwJqY5228nsOnzo5W/
	 hs3108j+Sw3AywZrDMEKTvq1sFY3CDCMMdOPU2vUqFTVgVLF+Fl1EGuPoBN+imQkG8
	 TK9ry16QRj3Kg==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 431E36443C;
	Fri,  4 Jul 2025 08:06:33 +0800 (AWST)
Message-ID: <78f9fcbc58261064f248e95eb7740549e338bc78.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/5] ARM: dts: aspeed: Expand data0 partition in
 facebook-bmc-flash-layout-128.dtsi
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: rentao.bupt@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Tao Ren <taoren@meta.com>
Date: Fri, 04 Jul 2025 09:36:29 +0930
In-Reply-To: <20250702050421.13729-2-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
	 <20250702050421.13729-2-rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_170641_520872_C3716741 
X-CRM114-Status: GOOD (  14.91  )
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

T24gVHVlLCAyMDI1LTA3LTAxIGF0IDIyOjA0IC0wNzAwLCByZW50YW8uYnVwdEBnbWFpbC5jb20g
d3JvdGU6Cj4gRnJvbTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgo+IAo+IEV4cGFu
ZCBkYXRhMCBwYXJ0aXRpb24gdG8gNjRNQiBpbiBmYWNlYm9vay1ibWMtZmxhc2gtbGF5b3V0LTEy
OC5kdHNpIGZvcgo+IGxhcmdlciBwZXJzaXN0ZW50IHN0b3JhZ2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGFvIFJlbiA8cmVudGFvLmJ1cHRAZ21haWwuY29tPgo+IC0tLQo+IMKgLi4uL2Jvb3QvZHRz
L2FzcGVlZC9mYWNlYm9vay1ibWMtZmxhc2gtbGF5b3V0LTEyOC5kdHNpIHwgMTAgKysrKystLS0t
LQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2ZhY2Vib29rLWJtYy1mbGFz
aC1sYXlvdXQtMTI4LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQvZmFjZWJvb2stYm1j
LWZsYXNoLWxheW91dC0xMjguZHRzaQo+IGluZGV4IDdmMzY1MmRlYTU1MC4uZWZkOTIyMzJjZGEy
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9mYWNlYm9vay1ibWMtZmxh
c2gtbGF5b3V0LTEyOC5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2ZhY2Vi
b29rLWJtYy1mbGFzaC1sYXlvdXQtMTI4LmR0c2kKPiBAQCAtMzIsMTkgKzMyLDE5IEBAIGltYWdl
LW1ldGFAZjAwMDAgewo+IMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oC8qCj4gLcKgwqDCoMKgwqDCoMKgICogRklUIGltYWdlOiAxMTkgTUIuCj4gK8KgwqDCoMKgwqDC
oMKgICogRklUIGltYWdlOiA2MyBNQi4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDC
oMKgwqDCoGZpdEAxMDAwMDAgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcg
PSA8MHgxMDAwMDAgMHg3NzAwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmVnID0gPDB4MTAwMDAwIDB4M2YwMDAwMD47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBsYWJlbCA9ICJmaXQiOwo+IMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoC8qCj4gLcKgwqDCoMKgwqDCoMKgICogImRhdGEwIiBwYXJ0aXRpb24gKDhNQikgaXMg
dXNlZCBieSBGYWNlYm9vayBCTUMgcGxhdGZvcm1zIGFzCj4gK8KgwqDCoMKgwqDCoMKgICogImRh
dGEwIiBwYXJ0aXRpb24gKDY0TUIpIGlzIHVzZWQgYnkgRmFjZWJvb2sgQk1DIHBsYXRmb3JtcyBh
cwo+IMKgwqDCoMKgwqDCoMKgwqAgKiBwZXJzaXN0ZW50IGRhdGEgc3RvcmUuCj4gwqDCoMKgwqDC
oMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoGRhdGEwQDc4MDAwMDAgewo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8MHg3ODAwMDAwIDB4ODAwMDAwPjsKPiArwqDCoMKg
wqDCoMKgwqBkYXRhMEA0MDAwMDAwIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmVnID0gPDB4NDAwMDAwMCAweDQwMDAwMDA+Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgbGFiZWwgPSAiZGF0YTAiOwo+IMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgCgpUd28gZXhp
c3Rpbmcgc3lzdGVtcyB1c2UgdGhpcyBkdHNpOgoKICAgPiBnaXQgZ3JlcCBmYWNlYm9vay1ibWMt
Zmxhc2gtbGF5b3V0LTEyOC5kdHNpCiAgIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQt
Ym1jLWZhY2Vib29rLXdlZGdlNDAwLmR0czojaW5jbHVkZSAiZmFjZWJvb2stYm1jLWZsYXNoLWxh
eW91dC0xMjguZHRzaSIKICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkL2FzdDI2MDAtZmFjZWJv
b2stbmV0Ym1jLWNvbW1vbi5kdHNpOiNpbmNsdWRlICJmYWNlYm9vay1ibWMtZmxhc2gtbGF5b3V0
LTEyOC5kdHNpIgoKVGhpcyBjaGFuZ2UgcmVxdWlyZXMgYSBmdWxsIHJlZmxhc2ggb2YgdGhvc2Ug
ZGV2aWNlcywgd2hpY2ggaXMgcHJldHR5CmRpc3J1cHRpdmUuCgpJdCBzZWVtcyBtb3JlIGFwcHJv
cHJpYXRlIHRvIG1lIHRvIGNyZWF0ZSBhIHNlcGFyYXRlIGR0c2kgZm9yIHRoZSBuZXcKZmxhc2gg
bGF5b3V0IHRvIHVzZSBpbiBuZXcgc3lzdGVtcy4KCkFuZHJldwo=


