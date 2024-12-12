Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE64E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KunlKm5kaIElk2nbkGl2d4XuxJwpNFP6nt61GIAWgnU=; b=12Na/37TlZXPtdf4u+uuzZb/Bg
	9arEh8jZf0O1h52T5nlpkaONLJRrIoN/leZIz7dgKl2mocuFhEa+kCCU4VClgz4mkQ5JGbfuVdpeY
	YooV0S2W11lm40SDl4kTSRahRhP/j2HbxTftNrSdB5GRCvknoMu1ESITuNN1cxdyUZEIAugt29+Kb
	NXn2KwB3RMWIXdi0WNegET9gMu00ELaGqxI2GiSGMrkIofMBLf5YwA7QiN7EiTnA6dEk73qj5yNhc
	rqlbiqkKsI94eJ3B2o/gtVnnWpzgEso3zWkWgnDQLo2+irut0K4laaZzoeqUcIb/bkultiuHzBpfL
	S1La1ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLe1W-0000000HCxo-1mwj;
	Thu, 12 Dec 2024 07:54:14 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLe0R-0000000HCno-2nSV;
	Thu, 12 Dec 2024 07:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=HBi+04JPLT7DrBLR/Lw8GlnHsF4umta8MvAXzK493tM=; b=H
	jhtkBvVSBFpWgywG2DsDJxzDRHwiyu2Z9StVS07RpLDttiyc7qvoataRs76NeoSo
	X2Ahr+itAYTXphLzDdtm8BCi27Q2JRv1dYSU/FE03iQIIhLLrKipDZQCJFJDjn8b
	EHJs6VfR78uJsZsR9CC2eFPhSZxn9yQrdI9Yd6r56s=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 12 Dec 2024 15:52:34 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 12 Dec 2024 15:52:34 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com, 
	"Andy Yan" <andy.yan@rock-chips.com>, kernel@collabora.com
Subject: Re:Re: [PATCH v5 05/18] drm/rockchip: vop2: Set AXI id for rk3588
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <5843712.DvuYhMxLoT@bootstrap>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <5839604.DvuYhMxLoT@trenzalore>
 <2d381563.5e54.193b46d2f30.Coremail.andyshrk@163.com>
 <5843712.DvuYhMxLoT@bootstrap>
X-NTES-SC: AL_Qu2YAfWTtkEu4imcYekZnEobh+Y5UcK2s/ki2YFXN5k0tCTI0SYQW29KGUD2y86DDiKsoAirUQVL5MpFRpJHY44FoLj+8T3YPbknvEeelJJE
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3f1eace4.75cf.193b9daf585.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3n75Dllpno5Q9AA--.64501W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxyzXmdaj6atHgACsn
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_235308_077091_B03D3736 
X-CRM114-Status: GOOD (  16.31  )
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

CkhpIERldGxldiwKCkF0IDIwMjQtMTItMTEgMjM6NDU6MDEsICJEZXRsZXYgQ2FzYW5vdmEiIDxk
ZXRsZXYuY2FzYW5vdmFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5PbiBXZWRuZXNkYXksIDExIERl
Y2VtYmVyIDIwMjQgMDE6MzQ6MzQgRVNUIEFuZHkgWWFuIHdyb3RlOgo+PiBIaSBEZXRsZXYsCj4+
IAo+PiBBdCAyMDI0LTEyLTExIDAyOjQwOjE0LCAiRGV0bGV2IENhc2Fub3ZhIiA8ZGV0bGV2LmNh
c2Fub3ZhQGNvbGxhYm9yYS5jb20+IAo+d3JvdGU6Cj4+ID5IaSBBbmR5LAo+PiA+Cj4+ID5PbiBN
b25kYXksIDkgRGVjZW1iZXIgMjAyNCAwNzoyOToxOCBFU1QgQW5keSBZYW4gd3JvdGU6Cj4+ID4+
IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gPj4gCj4+ID4+IFRo
ZXJlIGFyZSB0d28gQVhJIGJ1cyBpbiB2b3AyLCB3aW5kb3dzIGF0dGFjaGVkIG9uIHRoZSBzYW1l
IGJ1cyBtdXN0Cj4+ID4+IGhhdmUgYSB1bmlxdWUgY2hhbm5lbCBZVVYgYW5kIFJHQiBjaGFubmVs
IElELgo+PiA+PiAKPj4gPj4gVGhlIGRlZmF1bHQgSURzIHdpbGwgY29uZmxpY3Qgd2l0aCBlYWNo
IG90aGVyIG9uIHRoZSByazM1ODgsIHNvIHRoZXkKPj4gPj4gbmVlZCB0byBiZSByZWFzc2lnbmVk
Lgo+PiA+PiAKPj4gPj4gRml4ZXM6IDVhMDI4ZThmMDYyZiAoImRybS9yb2NrY2hpcDogdm9wMjog
QWRkIHN1cHBvcnQgZm9yIHJrMzU4OCIpCj4+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxh
bmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gPj4gVGVzdGVkLWJ5OiBEZXJlayBGb3JlbWFuIDxk
ZXJlay5mb3JlbWFuQGNvbGxhYm9yYS5jb20+Cj4+ID4+IAo+PiA+PiAtLS0KPj4gPj4gCj4+ID4+
IENoYW5nZXMgaW4gdjU6Cj4+ID4+IC0gQWRkZWQgaW4gVjUKPj4gPj4gCj4+ID4+ICBkcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyB8IDE0ICsrKysrKysrKysrCj4+
ID4+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuaCB8ICA5ICsr
KysrKysKPj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3AyX3JlZy5j
IHwgMjYgKysrKysrKysrKysrKysrKysrKy0KPj4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiA+PiAKPj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+ID4+IGIvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgaW5kZXgKPj4gPj4gZGM0ZWRkNjVi
YzllLi44YjljYTA0NmVlZWIgMTAwNjQ0Cj4+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+ID4+IEBAIC0xNDI2LDYgKzE0MjYsMTIgQEAgc3Rh
dGljIHZvaWQgdm9wMl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdAo+PiA+PiBkcm1fcGxhbmUg
KnBsYW5lLCAmZmItPmZvcm1hdC0+Zm9ybWF0LAo+PiA+PiAKPj4gPj4gIAkJYWZiY19lbiA/ICJB
RkJDIiA6ICIiLCAmeXJnYl9tc3QpOwo+PiA+PiAKPj4gPj4gKwlpZiAodm9wMi0+ZGF0YS0+c29j
X2lkID4gMzU2OCkgewo+PiA+Cj4+ID5TaG91bGRuJ3QgdGhpcyBiZSBkb25lIG9ubHkgZm9yIHJr
MzU4OCwgYXMgc3BlY2lmaWVkIGluIHRoZSBjb21tZW50cyBiZWxvdwo+PiA+PyBUaGUgdGVzdCB3
ZSBkaWQgYmVmb3JlIHNob3dlZCB0aGF0IGl0IGlzIGZhaWxpbmcgb24gcmszNTc2IGFuZCAzNTc2
IGlzID4KPj4gPjM1ODguCj4+IEkgdGhpbmsgdGhpcyBpcyBiZWNhdXNlIHlvdSB0ZXN0ZWQgYmVm
b3JlIHdpdGggdGhlIHBhdGNoIEkgZ2F2ZSBEZXJlayAKPj4gd2l0aG91dCBheGkgaWQgYXNzaWdu
ZWQgZm9yIHJrMzU3Ni4KPj4gSSBhc3NpZ25lZCBheGkgaWQgZm9yIHJrMzU3NiBpbiB0aGlzIHZl
cnNpb24gMTgvMTjvvIhUaGUgbmV3IElEIGFzc2lnbm1lbnQgY2FuCj4+IGFkYXB0IHRvIG1vcmUg
YXBwbGljYXRpb24gc2NlbmFyaW9zLu+8iSwgY2FuIHlvdSB0ZXN0IGl0IHdpdGggdGhlIHdob2xl
IFY1Cj4+IHZlcnNpb24gYWdhaW4/Cj4KPlllcywgSSB3aWxsIGRvIHRoYXQuIEJ1dCBwYXRjaCAx
OCBtZW50aW9uczoKPisgICAgICAgLyogUmVhZCBvbmx5IGJpdCBvbiByazM1NzYqLwo+KyAgICAg
ICBbVk9QMl9XSU5fQVhJX0JVU19JRF0gPSBSRUdfRklFTEQoUkszNTY4X0NMVVNURVJfQ1RSTCwg
MTMsIDEzKSwKPgo+QW5kIHRoZSBiaXQgaXMgYmVpbmcgd3JpdHRlbiBoZXJlLiBJZiBpdCBpcyBp
bmRlZWQgd3JpdGFibGUsIHRoZW4gSSB3b3VsZCBkcm9wIAo+dGhhdCBjb21tZW50LgpUaGUgQVhJ
X0JVU19JRCBmb3IgdHdvIENsdXN0ZXIgd2luZG93cyBvbiBSSzM1NzYgYXJlIGZpeGVkIGJ5IGhh
cmR3YXJlLCB0aGF0IG1lYW5zCndoZXRoZXIgd2Ugd3JpdGUgaXQgb3Igbm90LCBpdCB3b24ndCBj
aGFuZ2UgYW55dGhpbmcuCkJ1dCB0aGUgQVhJX0JVU19JRCBmb3IgRXNtYXJ0IHdpbmRvd3Mgb24g
cmszNTc2IGFuZCAgQVhJX1lSR0IvVVZfUl9JRCBmb3IgYWxsCmNsdXN0ZXIvZXNtYXJ0IHdpbmRv
d3Mgb24gcmszNTc2IGFyZSB3cml0ZWFibGUuCkkgdGhpbmsgd2UgZGlyZWN0bHkgd3JpdGUgaXQg
aGVyZSBhcyB0aGUgY3VycmVudCBjb2RlIGNhbiBtYWtlIHRoaW5ncyBlYXN5LgoKCgo+Cj4+ID5J
IHN1Z2dlc3QKPj4gPgo+PiA+CWlmICh2b3AyLT5kYXRhLT5zb2NfaWQgPT0gMzU4OCkgewo+PiA+
Cj4+ID5SZWdhcmRzLAo+PiA+RGV0bGV2Cj4+ID4KPj4gPj4gKwkJdm9wMl93aW5fd3JpdGUod2lu
LCBWT1AyX1dJTl9BWElfQlVTX0lELCB3aW4tPmRhdGEtCj4+ID4+Cj4+ID4+YXhpX2J1c19pZCk7
Cj4+ID4+Cj4+ID4+ICsJCXZvcDJfd2luX3dyaXRlKHdpbiwgVk9QMl9XSU5fQVhJX1lSR0JfUl9J
RCwgd2luLT5kYXRhLQo+PiA+Pgo+PiA+PmF4aV95cmdiX3JfaWQpOwo+PiA+Pgo+PiA+PiArCQl2
b3AyX3dpbl93cml0ZSh3aW4sIFZPUDJfV0lOX0FYSV9VVl9SX0lELCB3aW4tPmRhdGEtCj4+ID4+
Cj4+ID4+YXhpX3V2X3JfaWQpOwo+PiA+Pgo+PiA+PiArCX0KPj4gPj4gKwo+PiA+PiAKPj4gPj4g
IAlpZiAodm9wMl9jbHVzdGVyX3dpbmRvdyh3aW4pKQo+PiA+PiAgCQo+PiA+PiAgCQl2b3AyX3dp
bl93cml0ZSh3aW4sIFZPUDJfV0lOX0FGQkNfSEFMRl9CTE9DS19FTiwKPj4gPgo+PiA+aGFsZl9i
bG9ja19lbik7Cj4+ID4KPgo+RGV0bGV2Lgo+Cj4KPgo+X19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGlu
dXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=

