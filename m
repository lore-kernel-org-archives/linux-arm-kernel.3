Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480B3E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91dfVHO4aw7lINM/DBrBSiY/HH1o3ES6BOSHTsMtd3Q=; b=KEwIuTEKHo3NSmNXP3xMaIjiGD
	xHw+UygOmAbxpllkdVJc39R9Oy3DUaMbLpgnZPmAwxH+0SKzb7zDv9sUp2vwXmPW82nsVlEUAot6l
	lRIbauJ19s8ZeWAADpD4FBEXLFdFd8IcyaT6ucGLbsBlYHZaKDy2+YADSU1CV4LjwI+vd6jAK7m7B
	S9z+C+aHNq/Ifn6q1Pvcl45Y1rCtgFzZq6QvAR/uHPu+pHVu00CvhgKIQn2wZJ8xiUa5B6RdDJWar
	SoY+KprWp9gk6pIcC1z+igieOAI1HxMVVamjRa3a/rn2vLye7yjqTijiUsYqECeunN4W2m22Gyulj
	mamRkegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKoys-00000009orn-1lN4;
	Tue, 10 Dec 2024 01:24:06 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKoxn-00000009og6-2Oax;
	Tue, 10 Dec 2024 01:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=C8RlaUKPf21j08ezs3E/JiewGDRmoycUNvyVAbMCuu4=; b=I
	B65uBjIN/o9jnLcLVy9aDh0cETx7W7zgLzGRscrTG+jlcb4jFsfyjLf3PqD9CN4p
	c8Cohfw5QxZpEjGm5bcpU0gQEJogIly8esXHE3v8Gj0LF0BopoLg7BFIa0EAuQjx
	SlE4CjXkBLURxmNP3gBgb9QDZ+EsZT2njssXRAJ8v4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Tue, 10 Dec 2024 09:21:36 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 10 Dec 2024 09:21:36 +0800 (CST)
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
Subject: Re:Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org> <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
 <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
X-NTES-SC: AL_Qu2YAfuSvE4i4CaZYekZnEobh+Y5UcK2s/ki2YFXN5k0tCTI0SYQW29KGUD2y86DDiKsoAirUQVL5MpFRpJHY4609LG24bETf9Rb4QXd0iNV
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3f7ehl1dnU_46AA--.45701W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gixXmdXkkuwGQACs3
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_172259_975115_AD4A60AC 
X-CRM114-Status: GOOD (  15.34  )
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

CkhpIERtaXRyeSwKCuWcqCAyMDI0LTEyLTEwIDA5OjAxOjM477yMIkRtaXRyeSBCYXJ5c2hrb3Yi
IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IOWGmemBk++8mgo+T24gVHVlLCBEZWMgMTAs
IDIwMjQgYXQgMDg6NTA6NTFBTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+IAo+PiAKPj4gSGks
Cj4+IAo+PiBBdCAyMDI0LTEyLTEwIDA3OjEyOjI2LCAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0Bz
bnRlY2guZGU+IHdyb3RlOgo+PiA+QW0gTW9udGFnLCA5LiBEZXplbWJlciAyMDI0LCAxNzoxMTow
MyBDRVQgc2NocmllYiBEaWVkZXJpayBkZSBIYWFzOgo+PiA+PiBIaSwKPj4gPj4gCj4+ID4+IE9u
IE1vbiBEZWMgOSwgMjAyNCBhdCA0OjA2IFBNIENFVCwgRGFuaWVsIFNlbWtvd2ljeiB3cm90ZToK
Pj4gPj4gPiBPbiAwMy4xMi4yNCAyMTo1NCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4+ID4+ID4g
PiBUaGlzIHNlcmllcyBhZGRzIGEgYnJpZGdlIGFuZCBnbHVlIGRyaXZlciBmb3IgdGhlIERTSTIg
Y29udHJvbGxlciBmb3VuZAo+PiA+PiA+ID4gaW4gdGhlIHJrMzU4OCBzb2MgZnJvbSBSb2NrY2hp
cCwgdGhhdCBpcyBiYXNlZCBvbiBhIFN5bm9wc2lzIElQIGJsb2NrLgo+PiA+PiA+ID4gCj4+ID4+
ID4KPj4gPj4gPiBJIGRpZCBtb3JlIHRlc3RzIHdpdGggZGlmZmVyZW50IExWRFMgZGlzcGxheXMu
IEkgdGVzdGVkIGZvbGxvd2luZwo+PiA+PiA+IGNvbmZpZ3VyYXRpb25zIHdpdGggRFNJL0xWRFMg
YnJpZGdlOgo+PiA+PiA+IC0gMTAyNHg2MDBANjAuMDEKPj4gPj4gPiAtIDEwMjR4NzY4QDYwLjAy
Cj4+ID4+ID4gLSAxMjgweDgwMEA2MC4wNwo+PiA+PiA+IC0gMTM2Nng3NjhANjAuMDYKPj4gPj4g
Pgo+PiA+PiA+IEFsbCBvZiB0aGVtIHdvcmtlZCB3aXRob3V0IGlzc3VlcywgZXhjZXB0IDEzNjZ4
NzY4Lgo+PiA+PiA+IFdpdGggdGhpcyByZXNvbHV0aW9uLCB2aWRlbyBpcyBibHVycnksIGFuZCBv
ZmZzZXQgaW5jb3JyZWN0bHkKPj4gPj4gPiB0byB0aGUgbGVmdC4gVGhlcmUgYXJlIGFsc28gcmVw
ZWF0aW5nIGVycm9ycyBvbiB0aGUgY29uc29sZToKPj4gPj4gPgo+PiA+PiA+ICAgcm9ja2NoaXAt
ZHJtIGRpc3BsYXktc3Vic3lzdGVtOiBbZHJtXSAqRVJST1IqIFBPU1RfQlVGX0VNUFRZIGlycSBl
cnIgYXQgdnAzCj4+ID4+ID4KPj4gPj4gPiBJbiBjb3JyZWN0IG9wZXJhdGlvbiB3aXRoIG90aGVy
IHJlc29sdXRpb25zLCB0aGVyZSBpcyBubyBlcnJvci4KPj4gPj4gPiBJIGFtIG5vdCBzdXJlIGlm
IHRoaXMgaXMgYSBwcm9ibGVtIGluIHlvdXIgc2VyaWVzIG9yIHJhdGhlciBpbiBWT1AyCj4+ID4+
ID4gZHJpdmVyLgo+PiA+Cj4+ID5UaGlzIHJlYWxseSBzb3VuZHMgbGlrZSBzb21ldGhpbmcgaXMg
d3Jvbmcgb24gdGhlIHZvcCBzaWRlLgo+PiA+VGhlIGludGVycnVwdCBpcyBwYXJ0IG9mIHRoZSB2
b3AsIHRoZSBkaXZpc2FibGUgYnkgNCB0aGluZ3MgbGlrZWx5IHRvby4KPj4gCj4+IFRoaXMgaXMg
YSBoYXJkd2FyZSBsaW1pdGF0aW9uIG9uIHZvcCBzaWRlOgo+PiBUaGUgaG9yaXpvbnRhbCByZXNv
bHV0aW9uIG11c3QgYmUgNCBwaXhlbCBhbGlnbmVkLgo+Cj5UaGVuIG1vZGVfdmFsaWQoKSBhbmQg
YXRvbWljX2NoZWNrKCkgbXVzdCByZWplY3QgbW9kZXMgdGhhdCBkb24ndCBmaXQuCgpXZSByb3Vu
ZCBkb3duIHRvIDQgcGl4ZWwgYWxpZ25lZCBpbiBtb2RlX2ZpeHVwIGluIG91ciBic3Aga2VybmVs
LCAKYmVjYXVzZSBzb21ldGltZXMsIHNvbWUgYm9hcmRzIGRvIGluZGVlZCBjaG9vc2UgYSBzY3Jl
ZW4gdGhhdCBpcyBub3QgNCBwaXhlbCBhbGlnbmVkCj4KPj4gCj4+IAo+PiAKPgo+LS0gCj5XaXRo
IGJlc3Qgd2lzaGVzCj5EbWl0cnkK

