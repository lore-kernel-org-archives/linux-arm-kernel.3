Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E294C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axlssTCq9Kchrk499we+f3Lx4WoYd4erGv4hZ6Mo/co=; b=tmSMYFkSeE5yxXStK7+ofE7tc0
	zdrCQqVZObzkk/MDOgHF5Z+iItv2ToMbh425gPRy6nk6RBcznzDuzQlkDjT85h6+sO1oS5JW6DmjL
	47vJxztDPvLm9JLOjTD82E5lpFpiRHBKAiETjsaXJI5fFXVmr8jDURY1N1Fb6mSzvCcsbD3KzAk3t
	CfKqLMtyMBgOcqnRzGRxjN7ArIMgkSfiY099TieV/NaHhxh0A7VjNX37CzlrDvctlCx2VuXI0kmox
	LevPy+BWAjZ+MtHeqhyxcfv5/HPBqVvBB+2HVHH/80AtJO3LussbehX6dh/bB1l9Riz3Dca0RstQ0
	db5WNESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXLX-00000009pfZ-2PkV;
	Wed, 22 Jan 2025 09:48:27 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXKE-00000009pSi-2Acv;
	Wed, 22 Jan 2025 09:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=yWAJhbS/Q4MdxkCcBp+SmWjdnLYTjbVw2yNkD6kRxTc=; b=m
	iWC5lsm0JB7e8qPX/ddL0OKPtrrkSeIwIzLKvgnUSsRVh/Zg+YzrLPDF87BrHzDH
	HrcZ9sFV3DRLYMBHFyOmmroWmPOOdZiBpGippY2wgq1G3SjetN6VGAfDSFsl6rmH
	ku9VAl5yMiyEiQpl6AqFXNrs47lUSVAzVR9k7N6ECQ=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Wed, 22 Jan 2025 17:46:43 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 22 Jan 2025 17:46:43 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
	detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
	sebastian.reichel@collabora.com,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v12 12/13] dt-bindings: display: vop2: Add rk3576
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250122-amber-moth-of-upgrade-fa8331@krzk-bin>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103500.2528258-1-andyshrk@163.com>
 <20250122-amber-moth-of-upgrade-fa8331@krzk-bin>
X-NTES-SC: AL_Qu2YBfmYtkor5SifbekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr+CUnVkFMJFbsweeONhCLrheYTj1O48h1bZN6b5MbkJYlmVCGtvKvPsZd0ZQhuQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5eb4acaa.6df6.1948d68332d.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgD3v_uDvpBnS8lcAA--.18343W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQvcXmeQtfafFwACse
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_014706_879607_35019F30 
X-CRM114-Status: GOOD (  16.69  )
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

CkhpCgpBdCAyMDI1LTAxLTIyIDE2OjA0OjU5LCAiS3J6eXN6dG9mIEtvemxvd3NraSIgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj5PbiBUdWUsIEphbiAyMSwgMjAyNSBhdCAwNjozNDo1N1BNICsw
ODAwLCBBbmR5IFlhbiB3cm90ZToKPj4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hp
cHMuY29tPgo+PiAKPj4gQWRkIHZvcCBmb3VuZCBvbiByazM1NzYsIHRoZSBtYWluIGRpZmZlcmVu
Y2UgYmV0d2VlbiByazM1NzYgYW5kIHRoZQo+PiBwcmV2aW91cyB2b3AgaXMgdGhhdCBlYWNoIFZQ
IGhhcyBpdHMgb3duIGludGVycnVwdCBsaW5lLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW5keSBZ
YW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiAKPj4gLS0tCj4+IAo+PiBDaGFuZ2VzIGlu
IHYxMjoKPj4gLSBTcGxpdCBmcm9tIHBhdGNoIDEwLzEzCj4KPk9yZGVyIHlvdXIgcGF0Y2hlcyBm
aW5hbGx5LiBJdCdzIHYxMiBhbmQgeW91IHN0aWxsIHNlbmQgYmluZGluZyBhZnRlcgo+dGhlIHVz
ZXIuIFJlYWQgY2FyZWZ1bGx5IHN1Ym1pdHRpbmcgYmluZGluZ3MvcGF0Y2hlcy4KPgo+PiAKPj4g
Q2hhbmdlcyBpbiB2MTE6Cj4+IC0gUmVtb3ZlIHJlZHVuZGFudCBtaW4vbWF4SXRlbXMgY29uc3Ry
YWludAo+PiAKPj4gQ2hhbmdlcyBpbiB2MTA6Cj4+IC0gTW92ZSBpbnRlcnJ1cHQtbmFtZXMgYmFj
ayB0byB0b3AgbGV2ZWwKPj4gLSBBZGQgY29uc3RyYWludCBvZiBpbnRlcnJ1cHRzIGZvciBhbGwg
cGxhdGZvcm0KPj4gLSBBZGQgY29uc3RyYWludCBmb3IgYWxsIGdyZiBwaGFuZGxlcwo+PiAtIFJl
b3JkZXIgc29tZSBwcm9wZXJ0aWVzCj4+IAo+PiBDaGFuZ2VzIGluIHY5Ogo+PiAtIERyb3AgJ3Zv
cC0nIHByZWZpeCBvZiBpbnRlcnJ1cHQtbmFtZXMuCj4+IC0gQWRkIGJsYW5rIGxpbmUgYmV0d2Vl
biBEVCBwcm9wZXJ0aWVzCj4+IC0gUmVtb3ZlIGxpc3QgaW50ZXJydXB0LW5hbWVzIGluIHRvcCBs
ZXZlbAo+PiAKPj4gQ2hhbmdlcyBpbiB2ODoKPj4gLSBGaXggZHRfYmluZGluZ19jaGVjayBlcnJv
cnMKPj4gLSBvcmRlcmVkIGJ5IHNvYyBuYW1lCj4+IC0gTGluayB0byB0aGUgcHJldmlvdXMgdmVy
c2lvbjoKPj4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yb2NrY2hpcC82cG4zcWp4
b3RkdHB6dWNwdWwyNHlybzdwcGRkZXp3dWl6bmVvdnF2bWdkd3l2Mmo3cEB6dGc0bXF5aXFtamYv
VC8jdQo+PiAKPj4gQ2hhbmdlcyBpbiB2NDoKPj4gLSBkZXNjcmliZSBjb25zdHJhaW50IFNPQyBi
eSBTT0MsIGFzIGludGVycnVwdHMgb2YgcmszNTc2IGlzIHZlcnkKPj4gICBkaWZmZXJlbnQgZnJv
bSBvdGhlcnMKPj4gLSBEcm9wIEtyenlzenRvZidzIFJldmlld2VkLWJ5LCBhcyB0aGlzIHZlcnNp
b24gY2hhbmdlZCBhIGxvdC4KPj4gCj4+IENoYW5nZXMgaW4gdjM6Cj4+IC0gb3JkZXJlZCBieSBz
b2MgbmFtZQo+PiAtIEFkZCBkZXNjcmlwdGlvbiBmb3IgbmV3bHkgYWRkZWQgaW50ZXJydXB0Cj4+
IAo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIEFkZCBkdCBiaW5kaW5ncwo+PiAKPj4gIC4uLi9kaXNw
bGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcDIueWFtbCAgICAgICB8IDU1ICsrKysrKysrKysrKysr
KysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+PiAKPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcDIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcDIueWFtbAo+PiBpbmRl
eCAxNTdhMzdlZDg0ZGEuLmEyYTYzNjljN2I2ZiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wMi55YW1s
Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tj
aGlwL3JvY2tjaGlwLXZvcDIueWFtbAo+PiBAQCAtMjEsNiArMjEsNyBAQCBwcm9wZXJ0aWVzOgo+
PiAgICAgIGVudW06Cj4+ICAgICAgICAtIHJvY2tjaGlwLHJrMzU2Ni12b3AKPj4gICAgICAgIC0g
cm9ja2NoaXAscmszNTY4LXZvcAo+PiArICAgICAgLSByb2NrY2hpcCxyazM1NzYtdm9wCj4+ICAg
ICAgICAtIHJvY2tjaGlwLHJrMzU4OC12b3AKPj4gIAo+PiAgICByZWc6Cj4+IEBAIC0zOCwxMCAr
MzksMjEgQEAgcHJvcGVydGllczoKPj4gICAgICAgIC0gY29uc3Q6IGdhbW1hLWx1dAo+PiAgCj4+
ICAgIGludGVycnVwdHM6Cj4+IC0gICAgbWF4SXRlbXM6IDEKPj4gKyAgICBtaW5JdGVtczogMQo+
PiArICAgIG1heEl0ZW1zOiA0Cj4+ICAgICAgZGVzY3JpcHRpb246Cj4+IC0gICAgICBUaGUgVk9Q
IGludGVycnVwdCBpcyBzaGFyZWQgYnkgc2V2ZXJhbCBpbnRlcnJ1cHQgc291cmNlcywgc3VjaCBh
cwo+PiAtICAgICAgZnJhbWUgc3RhcnQgKFZTWU5DKSwgbGluZSBmbGFnIGFuZCBvdGhlciBzdGF0
dXMgaW50ZXJydXB0cy4KPj4gKyAgICAgIEZvciBWT1AgdmVyc2lvbiB1bmRlciByazM1NzYsIHRo
ZSBpbnRlcnJ1cHQgaXMgc2hhcmVkIGJ5IHNldmVyYWwgaW50ZXJydXB0Cj4+ICsgICAgICBzb3Vy
Y2VzLCBzdWNoIGFzIGZyYW1lIHN0YXJ0IChWU1lOQyksIGxpbmUgZmxhZyBhbmQgb3RoZXIgaW50
ZXJydXB0IHN0YXR1cy4KPj4gKyAgICAgIEZvciBWT1AgdmVyc2lvbiBmcm9tIHJrMzU3NiB0aGVy
ZSBpcyBhIHN5c3RlbSBpbnRlcnJ1cHQgZm9yIGJ1cyBlcnJvciwgYW5kCj4+ICsgICAgICBldmVy
eSB2aWRlbyBwb3J0IGhhcyBpdCdzIGluZGVwZW5kZW50IGludGVycnVwdHMgZm9yIHZzeW5jIGFu
ZCBvdGhlciB2aWRlbwo+PiArICAgICAgcG9ydCByZWxhdGVkIGVycm9yIGludGVycnVwdHMuCj4+
ICsKPj4gKyAgaW50ZXJydXB0LW5hbWVzOgo+PiArICAgIGl0ZW1zOgo+PiArICAgICAgLSBjb25z
dDogc3lzCj4+ICsgICAgICAtIGNvbnN0OiB2cDAKPj4gKyAgICAgIC0gY29uc3Q6IHZwMQo+PiAr
ICAgICAgLSBjb25zdDogdnAyCj4+ICAKPj4gICAgIyBTZWUgY29tcGF0aWJsZS1zcGVjaWZpYyBj
b25zdHJhaW50cyBiZWxvdy4KPj4gICAgY2xvY2tzOgo+PiBAQCAtMTM1LDYgKzE0Nyw4IEBAIGFs
bE9mOgo+PiAgICAgICAgICBpbnRlcnJ1cHRzOgo+PiAgICAgICAgICAgIG1heEl0ZW1zOiAxCj4K
PlNvIHRoaXMgY2hhbmdlIG1vdmVzIHRvIHRoaXMgcGF0Y2guCj4KPj4gIAo+PiArICAgICAgICBp
bnRlcnJ1cHQtbmFtZXM6IGZhbHNlCj4+ICsKPj4gICAgICAgICAgcG9ydHM6Cj4+ICAgICAgICAg
ICAgcmVxdWlyZWQ6Cj4+ICAgICAgICAgICAgICAtIHBvcnRAMAo+PiBAQCAtMTQ4LDYgKzE2Miwz
OSBAQCBhbGxPZjoKPj4gICAgICAgIHJlcXVpcmVkOgo+PiAgICAgICAgICAtIHJvY2tjaGlwLGdy
Zgo+PiAgCj4+ICsgIC0gaWY6Cj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBjb21w
YXRpYmxlOgo+PiArICAgICAgICAgIGNvbnRhaW5zOgo+PiArICAgICAgICAgICAgZW51bToKPj4g
KyAgICAgICAgICAgICAgLSByb2NrY2hpcCxyazM1NzYtdm9wCj4+ICsgICAgdGhlbjoKPj4gKyAg
ICAgIHByb3BlcnRpZXM6Cj4+ICsgICAgICAgIGNsb2NrczoKPj4gKyAgICAgICAgICBtaW5JdGVt
czogNQo+Cj5Oby4gWW91IGRpZCBub3QgaW1wbGVtZW50IG15IGNvbW1lbnQgYXQgYWxsLgo+Cj5T
byBhZ2FpbjoKPiJXaHkgbWluSXRlbXM/IE5vdGhpbmcgaW4gdGhpcyBwYXRjaCBtYWtlcyBzZW5z
ZSBmb3IgbWUuIE5laXRoZXIgY2hhbmdpbmcKPmV4aXN0aW5nIGJpbmRpbmcgbm9yIG5ldyBiaW5k
aW5nIGZvciByazM1NzYuIgoKRG8geW91IG1lYW4gYmVjYXVzZSBJIGFscmVhZHkgZGVmaW5lZCBt
aW5JdGVtcyBvZiBjbG9ja3MgaXMgNSBvbiB0aGUgdG9wLCBzbyAKdGhlcmUgaXMgbm8gbmVlZCB0
byByZWRlZmluZSB0aGUgc2FtZSBtaW5JdGVtcyBoZXJlID8KCj4KPlRvIGFkZHJlc3Mgc3VjaCBj
b21tZW50LCBjb21lIHdpdGggcmVhc29uYWJsZSBhbnN3ZXIgdG8gIndoeSIuIE5vdCBqdXN0Cj5z
ZW5kIHRoZSBzYW1lLiBJdCdzIGEgd2FzdGUgb2YgbXkgdGltZSB0byBrZWVwIHJldmlld2luZyB0
aGUgc2FtZS4KCkJlZm9yZSBzZW5kaW5nIHRoaXMgcGF0Y2gsIEkgYXNrZWQgeW91IHdoYXQgdGhl
IG5leHQgc3RlcCBzaG91bGQgYmUsIGJ1dCB5b3UgZGlkbid0IHJlc3BvbmQuCkkgbWlnaHQgaW5k
ZWVkIGhhdmUgZmFpbGVkIHRvIGdyYXNwIHlvdXIgbWFpbiBwb2ludCwgSSdtIGluZGVlZCBub3Qg
IHdyaXRpbmcgZHQtc2NoZW1hLiAKSG9wZSB5b3UgY2FuIGV4cGxhaW4gc29tZSBvZiB0aGUgc3Bl
Y2lmaWMgaXNzdWVzIGluIG1vcmUgZGV0YWlsIHRvIGF2b2lkIHdhc3RpbmcgdGhlIHRpbWUgb2Yg
Ym90aApvZiB1cy4KCgoKPgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6dG9mCj4KPgo+X19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPkxpbnV4LXJvY2tjaGlwIG1h
aWxpbmcgbGlzdAo+TGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwo+aHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=

