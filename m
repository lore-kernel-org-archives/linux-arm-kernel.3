Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1387DC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8PTwaDj7K59RujK2e0J/WXmp9xxoOcYfe4vkX2JjI0=; b=zjm1gpxA+y9NzVdkE7dU10JIQd
	sTfb2TCo7sF4SZjvbCnADgzNKwEihheaQmHNV5KG38u3XPlAdj/gw0OwxaST/NtLTy3qBfgGZloAU
	sal6axK0V8LJN+9BrO9qIkJRjIqag7LBunruU0oYkyNZWv27HhqDyqy+F+ODwTgOyIbFXskJVFli5
	K/widdHWTHi3wgUeek5QAlAyYqrNWJRu8uy9ZKUKRhxoz83pQ05r97/DQdPS/BIRQTfeMAqDrF7Uk
	lIN6C+CV0oVqQVo0E2lHKTyCHcjfLhVp+Msy1KmNhOwbx2D244KO6BIcpAMzuIyB+K6ry3lZ8JTTw
	+jQ+0xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28nJ-000000048h4-46Fh;
	Tue, 08 Apr 2025 13:15:14 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27p9-00000003xGC-0hpF;
	Tue, 08 Apr 2025 12:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ILA1Emj1QLC1c231nW4rM5keKBvhKOxLvHOZgZlnRr8=; b=I
	x6CQ+a2FSvO5Qo5ExDJs63EszJSbZphGNR0FsT6uxiEkN+19w/wOIaz0QIC3Fd3i
	+OBkizvL5GxBJjxaTSIe6ySFEgGvsb+hFq9bLW1VjDt6vk0FJkhZc003MgGsM/MI
	/oxeF4zBMwnlM094SLXhaqcJ+c78/SJMqMVKahA8a0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-119 (Coremail) ; Tue, 8 Apr 2025 20:12:29 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 8 Apr 2025 20:12:29 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Alex Bee" <knaerzche@gmail.com>
Cc: heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org,
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v3 7/7] drm/rockchip: inno-hdmi: Convert to drm
 bridge
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <680a40a8-07c1-4dde-93b2-337ab15f7afe@gmail.com>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-8-andyshrk@163.com>
 <680a40a8-07c1-4dde-93b2-337ab15f7afe@gmail.com>
X-NTES-SC: AL_Qu2fBv2au0sv7ySQZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jD7p+iM7bGVSOVjpzuO0ATqGmgmGbTRc5OZaT5NBc5I6aLpXBZMdvZ3O/9vr63+/wg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <618c65eb.b8a8.1961550f5ae.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dygvCgCnr56tEvVnldSSAA--.23618W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAYpXmf1CbLjmQACsw
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_051303_634625_08374FF2 
X-CRM114-Status: GOOD (  14.84  )
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

CgpIaSBBbGV477yMCgpBdCAyMDI1LTA0LTAzIDAxOjI0OjIyLCAiQWxleCBCZWUiIDxrbmFlcnpj
aGVAZ21haWwuY29tPiB3cm90ZToKPgo+SGkgQW5keSwKPgo+PiBGcm9tOiBBbmR5IFlhbiA8YW5k
eS55YW5Acm9jay1jaGlwcy5jb20+Cj4+IAo+PiBDb252ZXJ0IGl0IHRvIGRybSBicmlkZ2UgZHJp
dmVyLCBpdCB3aWxsIGJlIGNvbnZlbmllbnQgZm9yIHVzIHRvCj4+IG1pZ3JhdGUgdGhlIGNvbm5l
Y3RvciBwYXJ0IHRvIHRoZSBkaXNwbGF5IGRyaXZlciBsYXRlci4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gCj4+IC0tLQo+PiAKPj4g
Q2hhbmdlcyBpbiB2MzoKPj4gLSBGaXJzdCBpbmNsdWRlZCBpbiB2Mwo+PiAtIExpbmsgdG8gVjI6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDI1MDMyNTEzMjk0NC4xNzExMTEt
MS1hbmR5c2hya0AxNjMuY29tLwo+PiAKPj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25m
aWcgICAgICAgICAgICAgICAgfCAgIDcgKwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFr
ZWZpbGUgICAgICAgICAgICAgICB8ICAgMSArCj4+ICAgLi4uL2lubm9faGRtaS5jID0+IGJyaWRn
ZS9pbm5vLWhkbWkuY30gICAgICAgIHwgOTI0ICsrKysrKysrKystLS0tLS0tLQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnICAgICAgICAgICAgICB8ICAgMSArCj4+ICAgZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL01ha2VmaWxlICAgICAgICAgICAgIHwgICAyICstCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS1yb2NrY2hpcC5jIHwgMTg3ICsrKysK
Pj4gICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1pLmggICAgICAgICAgfCAzNDkg
LS0tLS0tLQo+PiAgIGluY2x1ZGUvZHJtL2JyaWRnZS9pbm5vX2hkbWkuaCAgICAgICAgICAgICAg
ICB8ICAzMyArCj4+ICAgOCBmaWxlcyBjaGFuZ2VkLCA3NDEgaW5zZXJ0aW9ucygrKSwgNzYzIGRl
bGV0aW9ucygtKQo+PiAgIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0ve3JvY2tjaGlwL2lubm9faGRt
aS5jID0+IGJyaWRnZS9pbm5vLWhkbWkuY30gKDUyJSkKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS1yb2NrY2hpcC5jCj4+ICAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuaAo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9icmlkZ2UvaW5ub19oZG1pLmgKPj4KPgo+Li4u
Cj4KPj4gKyNkZWZpbmUgbV9SWF9ET05FCQkJKDEgPDwgMCkKPj4gKwo+PiArI2RlZmluZSBIRE1J
X0NFQ19UWF9JTlQJCQkweGRhCj4+ICsjZGVmaW5lIEhETUlfQ0VDX1JYX0lOVAkJCTB4ZGIKPj4g
KyNkZWZpbmUgSERNSV9DRUNfQlVTRlJFRVRJTUVfTAkJMHhkYwo+PiArI2RlZmluZSBIRE1JX0NF
Q19CVVNGUkVFVElNRV9ICQkweGRkCj4+ICsjZGVmaW5lIEhETUlfQ0VDX0xPR0lDQUREUgkJMHhk
ZQo+PiArCj4+ICAgc3RydWN0IGlubm9faGRtaV9pMmMgewo+PiAgIAlzdHJ1Y3QgaTJjX2FkYXB0
ZXIgYWRhcDsKPj4gICAKPj4gQEAgLTY4LDQxICszOTUsMTggQEAgc3RydWN0IGlubm9faGRtaV9p
MmMgewo+PiAgIAo+PiAgIHN0cnVjdCBpbm5vX2hkbWkgewo+PiAgIAlzdHJ1Y3QgZGV2aWNlICpk
ZXY7Cj4+IC0KPj4gKwlzdHJ1Y3QgZHJtX2JyaWRnZSBicmlkZ2U7Cj4+ICAgCXN0cnVjdCBjbGsg
KnBjbGs7Cj4+ICAgCXN0cnVjdCBjbGsgKnJlZmNsazsKPj4gICAJdm9pZCBfX2lvbWVtICpyZWdz
Owo+PiAgIAlzdHJ1Y3QgcmVnbWFwICpncmY7Cj4+ICAgCj4+IC0Jc3RydWN0IGRybV9jb25uZWN0
b3IJY29ubmVjdG9yOwo+PiAtCXN0cnVjdCByb2NrY2hpcF9lbmNvZGVyCWVuY29kZXI7Cj4+IC0K
Pj4gICAJc3RydWN0IGlubm9faGRtaV9pMmMgKmkyYzsKPj4gICAJc3RydWN0IGkyY19hZGFwdGVy
ICpkZGM7Cj4+IC0KPj4gLQljb25zdCBzdHJ1Y3QgaW5ub19oZG1pX3ZhcmlhbnQgKnZhcmlhbnQ7
Cj4+ICsJY29uc3Qgc3RydWN0IGlubm9faGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YTsKPj4gKwl1
bnNpZ25lZCBpbnQgY29sb3JpbWV0cnk7Cj4KPnRoYW5rcyBhIGxvdCBmb3IgZG9pbmcgdGhlIGJy
aWRnZSBjb252ZXJzaW9uIGZvciB0aGlzIGRyaXZlci4KPlBsZWFzZSBrZWVwIHRoZSBjdXN0b20g
Y29ubmVjdG9yIHN0YXRlIHdoaWNoIHdhcyBpbnRyb2R1Y2VkIGFmdGVyIE1heGltJ3MKPnJldmll
dyBkdXJpbmcgdGhlIGxhc3QgcmV3b3JrIG9mIHRoaXMgWzBdIGRyaXZlci4gVGhlIGNvbG9yaW1l
dHJ5IGlzIG5vdAo+cGFydCBvZiB0aGUgZGV2aWNlLCBidXQgb2YgdGhlIGNvbm5lY3RvciBhbmQg
dGh1cyBzaG91bGQgbm90IGJlIHBhcnQgb2YgdGhlCj5kZXZpY2Ugc3RydWN0Lgo+SXQncywgaG93
ZXZlciwgbGlrZWx5IHRoYXQgdGhlIGNvbW1vbiAoaGRtaS0pY29ubmVjdG9yIGZyYW1ld29yayB3
aWxsIG9uY2UKPmhvbGQgaXRzIG93biBjb2xvcmltZXRyeSBwcm9wZXJ0eSBhbmQgdGhlbiB0aGUg
Y3VzdG9tIGNvbm5lY3RvciBzdGF0ZSBpbgo+dGhpcyBkcml2ZXIgY2FuIGdvIGF3YXksIGJ1dCB1
bnRpbCB0aGFuIHdlIGhhdmUgdG8ga2VlcCBpdCBoZXJlLgoKQWZ0ZXIgY29udmVydGluZyB0byBh
IGJyaWRnZSBkcml2ZXIsIHRoaXMgZHJpdmVyIG5vIGxvbmdlciBoYXMgYSBjb25uZWN0b3IuIApJ
biB0aGlzIGNhc2UsIGhvdyBzaG91bGQgSSBjcmVhdGUgY3VzdG9taXplZCBjb25uZWN0b3Igc3Rh
dGVzPwoKPgo+VGhhbmtzLAo+QWxleAo+Cj5bMF0KPmh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1j
ZWViMGYwMTA0YTYyYzg2NzY1NmMyNzMwYTUxZGY0N2U3MzUwYjhmCj4KPgo+PiAgIH07Cj4+ICAg
Cj4+IC1zdHJ1Y3QgaW5ub19oZG1pX2Nvbm5lY3Rvcl9zdGF0ZSB7Cj4+IC0Jc3RydWN0IGRybV9j
b25uZWN0b3Jfc3RhdGUJYmFzZTsKPj4gLQl1bnNpZ25lZCBpbnQJCQljb2xvcmltZXRyeTsKPj4g
LX07Cj4+IC0KPj4gLXN0YXRpYyBzdHJ1Y3QgaW5ub19oZG1pICplbmNvZGVyX3RvX2lubm9faGRt
aShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4+IC17Cj4+IC0Jc3RydWN0IHJvY2tjaGlw
X2VuY29kZXIgKnJrZW5jb2RlciA9IHRvX3JvY2tjaGlwX2VuY29kZXIoZW5jb2Rlcik7Cj4+IC0K
Pj4gLQlyZXR1cm4gY29udGFpbmVyX29mKHJrZW5jb2Rlciwgc3RydWN0IGlubm9faGRtaSwgZW5j
b2Rlcik7Cj4+IC19Cj4+IC0KPj4gLXN0YXRpYyBzdHJ1Y3QgaW5ub19oZG1pICpjb25uZWN0b3Jf
dG9faW5ub19oZG1pKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4uLi4K

