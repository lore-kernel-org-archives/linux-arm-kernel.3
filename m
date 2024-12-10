Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E99E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yN+LpULRymn1niqf9Es2pBV403+9Nd0xdYB19TFh3hU=; b=LZ8CP6arJO3SBaPXp/6tT0+wEB
	+fnzWIvW9Qz2I6SmyXWPJUQsP4/U5MUXRkpOrEsZXcFfRBJWShsR7pJqrlDIbjd1t5Qqfpk2r/UPg
	DvjBD9ccNXoK+/I3V1Vm05gMmN4x8LT08RxHAH1m2ccO5wAZajxZ7p3BEhmaFqNeT1Zptp73BYLJL
	serb58zo9nhOTTcV0HNvFsz+7Ah5N3/HFiO8ZjZFnE4/UTYvyBQSnxWZegqts6bbhXdk8EHAwd0VC
	MIxUELBn7d6VpJWXBtn9iczo9+LP35MWSwwSsMZFW7dJN6H2pkNsQZ4T9Q6iXVBrnUMftktkUMDeb
	zPtFqL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpTv-00000009tQK-36J3;
	Tue, 10 Dec 2024 01:56:11 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpSs-00000009tDt-2fZp;
	Tue, 10 Dec 2024 01:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=xL6MsP46vvQFs6eVSs10fx/xv5QaR2/3vg24LgFgNKw=; b=a
	vKxJ0Lrgm87rmRIZUIkJyudNC0XSCRGW3AX9+hHt+gNSE7qShfOfvKcOcif/UMjJ
	dGBdga67npsDuSmnzlBIrLNeN0Jz3CMh0mUYBM0a+bU/sCb+P8BxJEhv3IDpdNkh
	6ozLQuMwLlkAbLPhBckiOTUKekmo6INE5eSlc98PEM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Tue, 10 Dec 2024 09:54:09 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 10 Dec 2024 09:54:09 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	"Daniel Semkowicz" <dse@thaumatec.com>, 
	"Diederik de Haas" <didi.debian@cknow.org>, andy.yan@rock-chips.com, 
	Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, 
	jonas@kwiboo.se, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	neil.armstrong@linaro.org, quentin.schulz@cherry.de, 
	rfoss@kernel.org, robh@kernel.org, tzimmermann@suse.de
Subject: Re:Re: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <CAA8EJprLA09NP0KAztc5eoAMkGcrom84jg_pcbNcwN0FAaSLrw@mail.gmail.com>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org> <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
 <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
 <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
 <CAA8EJprLA09NP0KAztc5eoAMkGcrom84jg_pcbNcwN0FAaSLrw@mail.gmail.com>
X-NTES-SC: AL_Qu2YAfuSuk4v7yKYY+kZnEobh+Y5UcK2s/ki2YFXN5k0tCTI0SYQW29KGUD2y86DDiKsoAirUQVL5MpFRpJHY45g18x61WhC+0qmUPu3ua2x
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2d68155e.1e5b.193ae4616b9.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3v5JBn1dnOA47AA--.43222W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqR6xXmdXnM09jwACsJ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_175507_014690_CCE77C95 
X-CRM114-Status: GOOD (  17.53  )
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

CkhpIERtaXRyeSwKCuWcqCAyMDI0LTEyLTEwIDA5OjQ1OjEx77yMIkRtaXRyeSBCYXJ5c2hrb3Yi
IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IOWGmemBk++8mgo+T24gVHVlLCAxMCBEZWMg
MjAyNCBhdCAwMzoyMiwgQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+Pgo+Pgo+
PiBIaSBEbWl0cnksCj4+Cj4+IOWcqCAyMDI0LTEyLTEwIDA5OjAxOjM477yMIkRtaXRyeSBCYXJ5
c2hrb3YiIDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IOWGmemBk++8mgo+PiA+T24gVHVl
LCBEZWMgMTAsIDIwMjQgYXQgMDg6NTA6NTFBTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+ID4+
Cj4+ID4+Cj4+ID4+IEhpLAo+PiA+Pgo+PiA+PiBBdCAyMDI0LTEyLTEwIDA3OjEyOjI2LCAiSGVp
a28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+PiA+PiA+QW0gTW9udGFnLCA5
LiBEZXplbWJlciAyMDI0LCAxNzoxMTowMyBDRVQgc2NocmllYiBEaWVkZXJpayBkZSBIYWFzOgo+
PiA+PiA+PiBIaSwKPj4gPj4gPj4KPj4gPj4gPj4gT24gTW9uIERlYyA5LCAyMDI0IGF0IDQ6MDYg
UE0gQ0VULCBEYW5pZWwgU2Vta293aWN6IHdyb3RlOgo+PiA+PiA+PiA+IE9uIDAzLjEyLjI0IDIx
OjU0LCBIZWlrbyBTdHVlYm5lciB3cm90ZToKPj4gPj4gPj4gPiA+IFRoaXMgc2VyaWVzIGFkZHMg
YSBicmlkZ2UgYW5kIGdsdWUgZHJpdmVyIGZvciB0aGUgRFNJMiBjb250cm9sbGVyIGZvdW5kCj4+
ID4+ID4+ID4gPiBpbiB0aGUgcmszNTg4IHNvYyBmcm9tIFJvY2tjaGlwLCB0aGF0IGlzIGJhc2Vk
IG9uIGEgU3lub3BzaXMgSVAgYmxvY2suCj4+ID4+ID4+ID4gPgo+PiA+PiA+PiA+Cj4+ID4+ID4+
ID4gSSBkaWQgbW9yZSB0ZXN0cyB3aXRoIGRpZmZlcmVudCBMVkRTIGRpc3BsYXlzLiBJIHRlc3Rl
ZCBmb2xsb3dpbmcKPj4gPj4gPj4gPiBjb25maWd1cmF0aW9ucyB3aXRoIERTSS9MVkRTIGJyaWRn
ZToKPj4gPj4gPj4gPiAtIDEwMjR4NjAwQDYwLjAxCj4+ID4+ID4+ID4gLSAxMDI0eDc2OEA2MC4w
Mgo+PiA+PiA+PiA+IC0gMTI4MHg4MDBANjAuMDcKPj4gPj4gPj4gPiAtIDEzNjZ4NzY4QDYwLjA2
Cj4+ID4+ID4+ID4KPj4gPj4gPj4gPiBBbGwgb2YgdGhlbSB3b3JrZWQgd2l0aG91dCBpc3N1ZXMs
IGV4Y2VwdCAxMzY2eDc2OC4KPj4gPj4gPj4gPiBXaXRoIHRoaXMgcmVzb2x1dGlvbiwgdmlkZW8g
aXMgYmx1cnJ5LCBhbmQgb2Zmc2V0IGluY29ycmVjdGx5Cj4+ID4+ID4+ID4gdG8gdGhlIGxlZnQu
IFRoZXJlIGFyZSBhbHNvIHJlcGVhdGluZyBlcnJvcnMgb24gdGhlIGNvbnNvbGU6Cj4+ID4+ID4+
ID4KPj4gPj4gPj4gPiAgIHJvY2tjaGlwLWRybSBkaXNwbGF5LXN1YnN5c3RlbTogW2RybV0gKkVS
Uk9SKiBQT1NUX0JVRl9FTVBUWSBpcnEgZXJyIGF0IHZwMwo+PiA+PiA+PiA+Cj4+ID4+ID4+ID4g
SW4gY29ycmVjdCBvcGVyYXRpb24gd2l0aCBvdGhlciByZXNvbHV0aW9ucywgdGhlcmUgaXMgbm8g
ZXJyb3IuCj4+ID4+ID4+ID4gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEgcHJvYmxlbSBpbiB5
b3VyIHNlcmllcyBvciByYXRoZXIgaW4gVk9QMgo+PiA+PiA+PiA+IGRyaXZlci4KPj4gPj4gPgo+
PiA+PiA+VGhpcyByZWFsbHkgc291bmRzIGxpa2Ugc29tZXRoaW5nIGlzIHdyb25nIG9uIHRoZSB2
b3Agc2lkZS4KPj4gPj4gPlRoZSBpbnRlcnJ1cHQgaXMgcGFydCBvZiB0aGUgdm9wLCB0aGUgZGl2
aXNhYmxlIGJ5IDQgdGhpbmdzIGxpa2VseSB0b28uCj4+ID4+Cj4+ID4+IFRoaXMgaXMgYSBoYXJk
d2FyZSBsaW1pdGF0aW9uIG9uIHZvcCBzaWRlOgo+PiA+PiBUaGUgaG9yaXpvbnRhbCByZXNvbHV0
aW9uIG11c3QgYmUgNCBwaXhlbCBhbGlnbmVkLgo+PiA+Cj4+ID5UaGVuIG1vZGVfdmFsaWQoKSBh
bmQgYXRvbWljX2NoZWNrKCkgbXVzdCByZWplY3QgbW9kZXMgdGhhdCBkb24ndCBmaXQuCj4+Cj4+
IFdlIHJvdW5kIGRvd24gdG8gNCBwaXhlbCBhbGlnbmVkIGluIG1vZGVfZml4dXAgaW4gb3VyIGJz
cCBrZXJuZWwsCj4KPldoYXQgaXMgbWVhbnQgYnkgdGhlICJic3Aga2VybmVsIiBoZXJlPyBJIGRv
bid0IHNlZSBpdCBiZWluZyBwcmVzZW50Cgpic3Aga2VybmVsIG1lYW5zIGRvd25zdHJlYW0gdmVu
ZG9yIGtlcm5lbC4KCj5pbiB0aGUgbWFpbmxpbmUga2VybmVsLiBTbywgaWYgdGhlIG1vZGUgaXMg
dW5zdXBwb3J0ZWQsIGl0IHNob3VsZCBiZQoKV2lsbCBpdCBiZSBhY2NlcHRhYmxlIHRvIGFkZCB0
aGlzIHJvdW5kIGRvd24gaW4gdGhlIG1haW5saW5lIG1vZGVfZml4dXA/Cgo+cmVqZWN0ZWQuCj4K
Pj4gYmVjYXVzZSBzb21ldGltZXMsIHNvbWUgYm9hcmRzIGRvIGluZGVlZCBjaG9vc2UgYSBzY3Jl
ZW4gdGhhdCBpcyBub3QgNCBwaXhlbCBhbGlnbmVkCj4+ID4KPj4gPj4KPj4gPj4KPj4gPj4KPj4g
Pgo+PiA+LS0KPj4gPldpdGggYmVzdCB3aXNoZXMKPj4gPkRtaXRyeQo+Cj4KPgo+LS0gCj5XaXRo
IGJlc3Qgd2lzaGVzCj5EbWl0cnkK

