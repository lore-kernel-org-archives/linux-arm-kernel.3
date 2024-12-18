Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53420E77184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 00:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuE+k4mRNS5zriJQH1szOEbh2OQG3C1KDJ6y0/T+qgo=; b=YoKLqK13ohqvQurS5OaPUoDxYW
	s8NY9mW6Mcj02BRLhTwSu4aoB8GZUbyNv+/INXQ6X64mTfZV1bmJ8PhAGCyXmGzioutnk/RN3qMPM
	+qRvzISebNxBDxPoIG3Pb8QJHoQbvk2ln+mJh7Ne7Dk7Cikrnil90ZmXerRPeYStUTFHNNGtcVpNc
	Ss+ZWXUlKzRBzd1E6pUHmkq+6LnMcYVBgUfksCt1NYlHXek+cqoBF8tniUw8Xemy+92Lrl8KRq7aE
	tYGx0/gA7gO/qk8fB1D70DnEmsJx/mPDTSy2S9S9Xir+cSaokGwwYV20hRbioMTWMgXLjp18+R6FI
	s9wclG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNiOA-0000000FFsV-3Q4g;
	Wed, 18 Dec 2024 00:58:10 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNiN4-0000000FFnw-3yuE;
	Wed, 18 Dec 2024 00:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=WVQ1t6XbXjKcPHRJLel/oXZDB4vT3usNT7E4mGCaWbo=; b=C
	CrFxfLsQl7/ZdHFUhT+Oiv6NIXnXWNK/3ZReX1pGDma1FKL+C4NDYyy25XHI7BeI
	LwQbALMaRD1emzMVR2Yp0G5yUSxlM0dMEnTDJE1rKt8uTRG8xsuo9UXgAgGdnJxu
	cIz+GDTe85g5XLSUsYkjgQiyb9tz8f7EQKOVA1l5qU=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Wed, 18 Dec 2024 08:55:48 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 18 Dec 2024 08:55:48 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniel@fooishbar.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com, 
	detlev.casanova@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>, 
	"Michael Riesch" <michael.riesch@wolfvision.net>, 
	"Sebastian Reichel" <sebastian.reichel@collabora.com>
Subject: Re:Re: Re: [PATCH v6 08/16] drm/rockchip: vop2: Support 32x8
 superblock afbc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <CAPj87rMfFXkbyh7UEJQw4JV1R18KLXC3GyF0CznrN1k3UdL0Lw@mail.gmail.com>
References: <20241214081719.3330518-1-andyshrk@163.com>
 <20241214081719.3330518-9-andyshrk@163.com>
 <CAPj87rOjqZdyht2y8MK7gVyk_eqEzk1Sy0DcxFtQRuhrHQ_oxA@mail.gmail.com>
 <165af58a.697.193d2100239.Coremail.andyshrk@163.com>
 <CAPj87rMfFXkbyh7UEJQw4JV1R18KLXC3GyF0CznrN1k3UdL0Lw@mail.gmail.com>
X-NTES-SC: AL_Qu2YBviTvEsv7iOfZekZnEobh+Y5UcK2s/ki2YFXN5k0kSTd/Q0jbG5RIFzK/PmpCAemoQmKVD9t6cdjQpdIUb8uN2gn21BCSQHSCgwDyDUQ
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <32246002.9ef.193d7438b96.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgDX_3aUHWJnKQRCAA--.2254W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g25XmdiE2lfZwAEs7
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_165703_371277_D01755F7 
X-CRM114-Status: GOOD (  16.03  )
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

CkhpICBEYW5pZWwsCgpBdCAyMDI0LTEyLTE3IDIwOjA3OjU0LCAiRGFuaWVsIFN0b25lIiA8ZGFu
aWVsQGZvb2lzaGJhci5vcmc+IHdyb3RlOgo+SGkgQW5keSwKPgo+T24gVHVlLCAxNyBEZWMgMjAy
NCBhdCAwMDo0MSwgQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+PiBBdCAyMDI0
LTEyLTE2IDIxOjA2OjA3LCAiRGFuaWVsIFN0b25lIiA8ZGFuaWVsQGZvb2lzaGJhci5vcmc+IHdy
b3RlOgo+PiA+T24gU2F0LCAxNCBEZWMgMjAyNCBhdCAwODoxOCwgQW5keSBZYW4gPGFuZHlzaHJr
QDE2My5jb20+IHdyb3RlOgo+PiA+PiBUaGlzIGlzIHRoZSBvbmx5IGFmYmMgZm9ybWF0IHN1cHBv
cnRlZCBieSB0aGUgdXBjb21pbmcKPj4gPj4gVk9QIGZvciByazM1NzYuCj4+ID4+Cj4+ID4+IEFk
ZCBzdXBwb3J0IGZvciBpdC4KPj4gPgo+PiA+T3V0IG9mIGludGVyZXN0LCBob3cgd2FzIHRoaXMg
dGVzdGVkPyBUaGVyZSBpcyBubyAzMng4IG1vZGlmaWVyIGluIHRoZQo+PiA+Zm9ybWF0IGxpc3Qg
aW4gZm9ybWF0X21vZGlmaWVyc19hZmJjW10sIHNvIGl0IHNlZW1zIGxpa2UgaXQgc2hvdWxkbid0
Cj4+ID5iZSBwb3NzaWJsZSB0byBnZXQgYSAzMng4IGJ1ZmZlciBvbiBhIHBsYW5lIGF0IGFsbC4K
Pj4KPj4gVGhlIDMyeDggbW9kaWZpZXIgIGFkZGVkIGluIFBBVENIIDE2LzE2Ogo+Pgo+PiArLyog
dXNlZCBmcm9tIHJrMzU3NiwgYWZiYyAzMio4IGhhbGYgbW9kZSAqLwo+PiArc3RhdGljIGNvbnN0
IHVpbnQ2NF90IGZvcm1hdF9tb2RpZmllcnNfcmszNTc2X2FmYmNbXSA9IHsKPj4gKyAgICAgICBE
Uk1fRk9STUFUX01PRF9BUk1fQUZCQyhBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tfU0laRV8zMng4IHwK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBRkJDX0ZPUk1BVF9NT0RfU1BMSVQp
LAo+PiArCj4KPkhtbW0sIHRoYXQncyBzdHJhbmdlOyBJIGFwcGxpZWQgdGhlIHdob2xlIHNlcmll
cyB3aXRoIGI0IGJ1dCB3YXNuJ3QKPnNlZWluZyB0aGF0IGJsb2NrIGRlZmluZWQuIE1heWJlIGEg
YmFkIGNvbmZsaWN0IHJlc29sdXRpb24uIFNvcnJ5IGZvcgo+dGhlIGNvbmZ1c2lvbi4KCkkgdGhp
bmsgdGhhdCBtaWdodCBoYXZlIGJlZW4gY2F1c2VkIGJ5IG15IG1pc3Rha2UuIEkgaW5pdGlhbGx5
IHNlbnQgdGhlIFY2IHZlcnNpb24gYXMgYSAtaW4tcmVwbHkgdG8gdGhlIFY1IHZlcnNpb24uCldo
ZW4gSSByZWFsaXplZCB0aGUgbWlzdGFrZSwgYSBwYXJ0IG9mIGl0IGhhZCBhbHJlYWR5IGJlZW4g
c2VudCBvdXQuIFRoZW4gSSBzZW50IHRoZSBlbnRpcmUgVjYgc2VyaWVzIHNlcGFyYXRlbHkKYWdh
aW4uIE1heWJlIHRoYXQgbWFrZSBiNCBhbmQgbG9yZSBjb25mdXNlZOOAggoKPgo+PiBJIHdyaXRl
IGFuIG92bHRlc3RbMF0gdG9vbCB3aGljaCBjYW4gdGFrZSBsaW5lYXIvQUZCQyByZ2IveXV2IGRh
dGEgZnJvbSBhIGZpbGUsIHRoZW4KPj4gY29tbWl0IHRvIGRybSBkcml2ZXIsIEkgdXNlIHRoaXMg
dG9vbCBmb3IgbW9zdCBiYXNpYyBmb3JtYXQgdGVzdC4KPj4KPj4gQnV0IHdoZW4gdGVzdGVkIG9u
IHdlc3RvbiwgSSBmb3VuZCB0aGF0IHdlc3RvbiBkb2VzIG5vdCB1c2UgdGhlIEFGQkMgZm9ybWF0
IGZvciBkaXNwbGF5LAo+PiBkb24ndCBrbm93IHdoeS4KPgo+WW91J2xsIG5lZWQgYSBNZXNhIHRy
ZWUgd2l0aCBlMGY0ODU2OGM3ZjIgaW5jbHVkZWQ7IGlmIHlvdSBoYXZlIHRoaXMKPnRoZW4gaXQg
c2hvdWxkIGp1c3Qgd29yayBvdXQgb2YgdGhlIGJveC4KClRoYW5rcywgSSB3aWxsIGNoZWNrIGl0
LgoKPgo+Q2hlZXJzLAo+RGFuaWVsCg==

