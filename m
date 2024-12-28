Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83F0E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 07:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkbkYm+LvXPsePd8/5mQYBYA0p5ZsCTYe/7h1A6B/l4=; b=FiEM//C2VI7g7j02Tv0QicJnim
	ouVQuoqaHTbmbZNWwEzh6QhkGlrZvVy4FZlxRRrL9ZMZEC6fXJpdKFVUZFfd4HDcgpqtHqU01sqJC
	YPQlShX1V8ELAk4w7PzH5sv+v+fxJAPmzzMZydfKF7LkIuF0ex2bhUmylm8lOwUyOeeZxwX86Cp9e
	iSeqA11aJ0WhAASYo19ZLvRYovfB1y2/K4gmRmNaFcRnUbzz+Sd6df9oYtcoJhNocAsCG4+ZYU0eW
	WfEjKRUiYu5dqr7ZJE9HWnhAKH4xaSltxTDtVDTgembI5rnW0/IZkVeVh3esy/6dsoPUgsEPogKgM
	iWd/FIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRQpr-00000001WEt-1A0J;
	Sat, 28 Dec 2024 07:02:07 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRQod-00000001W7X-3Ddk;
	Sat, 28 Dec 2024 07:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=5X2MHZd/u7OgB2ISQjRGyprLfLYRbpVQl3B843hJpYI=; b=Z
	lDOPd2mM67y53Dah4FG8FfkTyao0TweWBYp5E9w7odfLEnCmcCEBIqH9P9SeHdHm
	pH+mBoHcOqhR487xbMCTRLa6NbZIUjqVmVtDcNUdbgIueVfLq1HMo3AGoYUgicMJ
	3Q92QWF1DP4ER3ZHwKfoJ3OHi5VrGA1AXw4G4wWaZc=
Received: from andyshrk$163.com ( [103.29.142.67] ) by
 ajax-webmail-wmsvr-40-130 (Coremail) ; Sat, 28 Dec 2024 15:00:29 +0800
 (CST)
X-Originating-IP: [103.29.142.67]
Date: Sat, 28 Dec 2024 15:00:29 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, cristian.ciocaltea@collabora.com, 
	detlev.casanova@collabora.com, krzk+dt@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, sebastian.reichel@collabora.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH] dt-bindings: phy: add rk3576 hdptx phy
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <3255768.PYKUYFuaPT@diego>
References: <20241224091919.267698-1-andyshrk@163.com>
 <hh3zowf257dwwp3uo7al5l5ql7hewy7j5rzjqdt3eqvd653mdj@4tgjm6zdsuyi>
 <3255768.PYKUYFuaPT@diego>
X-NTES-SC: AL_Qu2YB/+dtkop7yWYYukfmkcVgOw9UcO5v/Qk3oZXOJF8jADoxjoPQEJSJELo/860NC+UmgmGTTRuyOZHZoV9TZwxLbfjKkBbH5u/Okwj91DDug==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <50a70e66.1b76.1940c1104c8.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gigvCgDX_yANom9nYvNKAA--.42926W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQXDXmdvkmrYJAACs-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_230052_227971_B0BA7338 
X-CRM114-Status: GOOD (  12.76  )
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

CkhpIEhlaWtpbywgS3J6eXN6dG9mLAoKQXQgMjAyNC0xMi0yOCAwNDowODo0MSwgIkhlaWtvIFN0
w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPkhpIEtyenlzenRvZiwgQW5keSwKPgo+
QW0gRnJlaXRhZywgMjcuIERlemVtYmVyIDIwMjQsIDA5OjU1OjU5IENFVCBzY2hyaWViIEtyenlz
enRvZiBLb3psb3dza2k6Cj4+IE9uIFR1ZSwgRGVjIDI0LCAyMDI0IGF0IDA1OjE5OjEzUE0gKzA4
MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiA+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNo
aXBzLmNvbT4KPj4gPiAKPj4gPiBUaGUgSERQVFggUEhZIG9uIHJrMzU3NiBpcyBjb21wYXRpYmxl
IHdpdGggaXQgb24KPj4gPiByazM1ODguCj4+ID4gCj4+ID4gQWRkIGNvbXBhdGlibGUgZm9yIGl0
Lgo+PiA+IAo+PiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBz
LmNvbT4KPj4gPiAtLS0KPj4gPiAKPj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3Jv
Y2tjaGlwLHJrMzU4OC1oZHB0eC1waHkueWFtbCB8IDcgKysrKystLQo+PiA+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gQWxzbzogd2hlcmUg
YXJlIGFueSB1c2VycyBvZiB0aGlzIGJpbmRpbmc/Cj4+IAo+PiBXZSBkb24ndCB0YWtlIGJpbmRp
bmdzIHdpdGhvdXQgKlVQU1RSRUFNKiB1c2Vycy4KPgo+QW5keSwgY2FuIHlvdSBkbyBhIChzZXBh
cmF0ZSkgRFRTIHNlcmllcyB0aGF0IGJpbmRzIGFsbCB0aGUgZGlzcGxheSBzdHVmZgo+dG9nZXRo
ZXIgb24gb25lIHJrMzU3NiBib2FyZD8gKGlvbW11LCBoZHB0eHBoeSwgdm9wLCBoZG1pKQo+Cj5E
ZXBlbmRpbmcgb24gaG93IHRoZSBkcml2ZXIgc2lkZXMgZ28sIHRoaXMgbWF5IGJlIG5lZWQgdG8g
YmUgcmV2aXNlZCBhdAo+dGhlIGVuZCwgYnV0IHNob3VsZCBob3BlZnVsbHkgc2F0aXNmeSB0aGF0
ICJzaG93IGEgdXNlciIgdGhpbmcuCj4KPkkgZ3Vlc3MgS2V2ZXIncyBFVkItc2VyaWVzIFswXSBt
aWdodCBiZSBhIGdvb2QgYmFzZSB0byBidWlsZCB1cG9uLCB3aXRoIGl0Cj5iZWluZyBhIFJvY2tj
aGlwIEVWQj8KCkFzIEVWQiBwYXRjaCBzZXJpZXMgaXMgc3RpbGwgV0lQLCBJIHdpbGwgdXNlIHJr
MzU3Ni1hcm1zb20tc2lnZTUuZHRzIHdoaWNoIGlzIGFscmVhZHkKaW4gbWFpbmxpbmUgYXMgdGhl
IGJhc2UgdG8gY29sbGVjdCBhbGwgZGlzcGxheSByZWxhdGVkIGR0c+OAggoKPgo+Cj5Gb3IgcGVv
cGxlIHJlYWRpbmcgYWxvbmcsIHRoYXQgd2hvbGUgZGlzcGxheSBjaGFpbiBjb25zaXN0cyBvZjoK
Pi0gaW9tbXUgWzFdCj4tIGNvcmUgZGlzcGxheS1jb250cm9sbGVyIGFkZGl0aW9ucyBmb3IgdGhl
IHJrMzU3NiBbMl0KPi0gdGhpcyBoZHB0eHBoeSBiaW5kaW5nCj4tIGFkZGl0aW9ucyBmb3IgdGhl
IGR3LWhkbWktcXAgZ2x1ZSBbM10KPgo+SGVpa28KPgo+Cj5bMF0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDI0MTIyMDEwMTU1MS4zNTA1OTE3LTEta2V2ZXIueWFuZ0Byb2NrLWNoaXBz
LmNvbS8KPlsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwOTIwMDk0OTQ3Ljc1
NjYtMS1hbmR5c2hya0AxNjMuY29tLwo+WzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyNDEyMTQwODE4MzEuMzMzMDcxNC0xLWFuZHlzaHJrQDE2My5jb20vCj5bM30gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MTIyNTEwMzc0MS4zNjQ1OTctMS1hbmR5c2hya0AxNjMu
Y29tLwo+Cj4KPgo=

