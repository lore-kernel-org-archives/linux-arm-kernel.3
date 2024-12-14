Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49414E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBAdSv4vyH7sryCKLaYwlyuAXZMbbANVQAi9Asbtj30=; b=ueQgVgNwELENtNJsxd/jAc/5nS
	QMmMNfdbUfaZkZHImBRiI6k0fwrsJtqTJqe1dez271ROmbT2YpiqrT159tnnyaAdq+N+2IZg8oUaN
	z83qvPOnjcrOJ5hOj5+jzVd3xVf10kEYOXwdO2ys5BIlJkF+zITxRjAHEidvR5oVGQoCkU7Mdjrgt
	D2PyZzHW25hAJhy88OeWOd+DFXxfG/aJ6jUnx9MBGSoVczFTslujWuXrQU95gXZKxcFPWfuH6L9Ws
	DC+Ac/8MoiZFQvF9/kmGtLzdcBIuwbg7ut+VDPXqtjuMsLwHdrH1g/7ClWnu6rxmSThA4+kkYgNOx
	LTmnr+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMN6p-00000005wnd-0wJr;
	Sat, 14 Dec 2024 08:02:43 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMN5j-00000005wew-1Ar0;
	Sat, 14 Dec 2024 08:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=0o+z+EkurJaMlImlt88yGIJCVWZD3/7Ecx82GOvn8sc=; b=U
	hcOTYti//V3hiQTeBz4zLvGkRSf1y4kYLg7uIq2GCXuOcIBpzb2b5n0Fp3hmVD7C
	V+dp1qA+5OakaGa7n3X512USS9NJEZTC3eoN8OnFPQQhRv+o4iuMJq7ODUTY+/vW
	lp0/bgIt2pLkHUAeoKNY3500ARuPcU9KavuetrQBk4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-133 (Coremail) ; Sat, 14 Dec 2024 16:01:11 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 14 Dec 2024 16:01:11 +0800 (CST)
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
In-Reply-To: <13660005.uLZWGnKmhe@bootstrap>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <5843712.DvuYhMxLoT@bootstrap>
 <3f1eace4.75cf.193b9daf585.Coremail.andyshrk@163.com>
 <13660005.uLZWGnKmhe@bootstrap>
X-NTES-SC: AL_Qu2YBv2dvEos5yWfZ+lSwjJi9558MKvZ7qd+qcQSetEqqTHrwRInWV1kMlnE6vk6cbg7Df61gTPSD7ezjI7u
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <56a01c0e.20d5.193c42f8f9b.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hSgvCgD3H9xHO11n7Sg_AA--.8272W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gK1XmddMGxEvgACsl
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_000135_682899_6D03747C 
X-CRM114-Status: GOOD (  17.45  )
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

SGkgRGV0bGV2LAoKQXQgMjAyNC0xMi0xNCAwMjozNDowMywgIkRldGxldiBDYXNhbm92YSIgPGRl
dGxldi5jYXNhbm92YUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPk9uIFRodXJzZGF5LCAxMiBEZWNl
bWJlciAyMDI0IDAyOjUyOjM0IEVTVCBBbmR5IFlhbiB3cm90ZToKPj4gSGkgRGV0bGV2LAo+PiAK
Pj4gQXQgMjAyNC0xMi0xMSAyMzo0NTowMSwgIkRldGxldiBDYXNhbm92YSIgPGRldGxldi5jYXNh
bm92YUBjb2xsYWJvcmEuY29tPiAKPndyb3RlOgo+PiA+T24gV2VkbmVzZGF5LCAxMSBEZWNlbWJl
ciAyMDI0IDAxOjM0OjM0IEVTVCBBbmR5IFlhbiB3cm90ZToKPj4gPj4gSGkgRGV0bGV2LAo+PiA+
PiAKPj4gPj4gQXQgMjAyNC0xMi0xMSAwMjo0MDoxNCwgIkRldGxldiBDYXNhbm92YSIgPGRldGxl
di5jYXNhbm92YUBjb2xsYWJvcmEuY29tPgo+PiA+Cj4+ID53cm90ZToKPj4gPj4gPkhpIEFuZHks
Cj4+ID4+ID4KPj4gPj4gPk9uIE1vbmRheSwgOSBEZWNlbWJlciAyMDI0IDA3OjI5OjE4IEVTVCBB
bmR5IFlhbiB3cm90ZToKPj4gPj4gPj4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hp
cHMuY29tPgo+PiA+PiA+PiAKPj4gPj4gPj4gVGhlcmUgYXJlIHR3byBBWEkgYnVzIGluIHZvcDIs
IHdpbmRvd3MgYXR0YWNoZWQgb24gdGhlIHNhbWUgYnVzIG11c3QKPj4gPj4gPj4gaGF2ZSBhIHVu
aXF1ZSBjaGFubmVsIFlVViBhbmQgUkdCIGNoYW5uZWwgSUQuCj4+ID4+ID4+IAo+PiA+PiA+PiBU
aGUgZGVmYXVsdCBJRHMgd2lsbCBjb25mbGljdCB3aXRoIGVhY2ggb3RoZXIgb24gdGhlIHJrMzU4
OCwgc28gdGhleQo+PiA+PiA+PiBuZWVkIHRvIGJlIHJlYXNzaWduZWQuCj4+ID4+ID4+IAo+PiA+
PiA+PiBGaXhlczogNWEwMjhlOGYwNjJmICgiZHJtL3JvY2tjaGlwOiB2b3AyOiBBZGQgc3VwcG9y
dCBmb3IgcmszNTg4IikKPj4gPj4gPj4gU2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFu
QHJvY2stY2hpcHMuY29tPgo+PiA+PiA+PiBUZXN0ZWQtYnk6IERlcmVrIEZvcmVtYW4gPGRlcmVr
LmZvcmVtYW5AY29sbGFib3JhLmNvbT4KPj4gPj4gPj4gCj4+ID4+ID4+IC0tLQo+PiA+PiA+PiAK
Pj4gPj4gPj4gQ2hhbmdlcyBpbiB2NToKPj4gPj4gPj4gLSBBZGRlZCBpbiBWNQo+PiA+PiA+PiAK
Pj4gPj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwg
MTQgKysrKysrKysrKysKPj4gPj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wMi5oIHwgIDkgKysrKysrKwo+PiA+PiA+PiAgZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX3ZvcDJfcmVnLmMgfCAyNgo+PiA+PiA+PiAgKysrKysrKysrKysrKysrKysr
Ky0KPj4gPj4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+PiA+PiA+PiAKPj4gPj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+ID4+ID4+IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AyLmMgaW5kZXgKPj4gPj4gPj4gZGM0ZWRkNjViYzllLi44Yjlj
YTA0NmVlZWIgMTAwNjQ0Cj4+ID4+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jCj4+ID4+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+ID4+ID4+IEBAIC0xNDI2LDYgKzE0MjYsMTIgQEAgc3Rh
dGljIHZvaWQgdm9wMl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdAo+PiA+PiA+PiBkcm1fcGxh
bmUgKnBsYW5lLCAmZmItPmZvcm1hdC0+Zm9ybWF0LAo+PiA+PiA+PiAKPj4gPj4gPj4gIAkJYWZi
Y19lbiA/ICJBRkJDIiA6ICIiLCAmeXJnYl9tc3QpOwo+PiA+PiA+PiAKPj4gPj4gPj4gKwlpZiAo
dm9wMi0+ZGF0YS0+c29jX2lkID4gMzU2OCkgewo+PiA+PiA+Cj4+ID4+ID5TaG91bGRuJ3QgdGhp
cyBiZSBkb25lIG9ubHkgZm9yIHJrMzU4OCwgYXMgc3BlY2lmaWVkIGluIHRoZSBjb21tZW50cwo+
PiA+PiA+YmVsb3cKPj4gPj4gPj8gVGhlIHRlc3Qgd2UgZGlkIGJlZm9yZSBzaG93ZWQgdGhhdCBp
dCBpcyBmYWlsaW5nIG9uIHJrMzU3NiBhbmQgMzU3NiBpcwo+PiA+PiA+Pgo+PiA+PiA+MzU4OC4K
Pj4gPj4gCj4+ID4+IEkgdGhpbmsgdGhpcyBpcyBiZWNhdXNlIHlvdSB0ZXN0ZWQgYmVmb3JlIHdp
dGggdGhlIHBhdGNoIEkgZ2F2ZSBEZXJlawo+PiA+PiB3aXRob3V0IGF4aSBpZCBhc3NpZ25lZCBm
b3IgcmszNTc2Lgo+PiA+PiBJIGFzc2lnbmVkIGF4aSBpZCBmb3IgcmszNTc2IGluIHRoaXMgdmVy
c2lvbiAxOC8xOO+8iFRoZSBuZXcgSUQgYXNzaWdubWVudAo+PiA+PiBjYW4gYWRhcHQgdG8gbW9y
ZSBhcHBsaWNhdGlvbiBzY2VuYXJpb3Mu77yJLCBjYW4geW91IHRlc3QgaXQgd2l0aCB0aGUKPj4g
Pj4gd2hvbGUgVjUgdmVyc2lvbiBhZ2Fpbj8KPj4gPgo+PiA+WWVzLCBJIHdpbGwgZG8gdGhhdC4g
QnV0IHBhdGNoIDE4IG1lbnRpb25zOgo+PiA+KyAgICAgICAvKiBSZWFkIG9ubHkgYml0IG9uIHJr
MzU3NiovCj4+ID4rICAgICAgIFtWT1AyX1dJTl9BWElfQlVTX0lEXSA9IFJFR19GSUVMRChSSzM1
NjhfQ0xVU1RFUl9DVFJMLCAxMywgMTMpLAo+PiA+Cj4+ID5BbmQgdGhlIGJpdCBpcyBiZWluZyB3
cml0dGVuIGhlcmUuIElmIGl0IGlzIGluZGVlZCB3cml0YWJsZSwgdGhlbiBJIHdvdWxkCj4+ID5k
cm9wIHRoYXQgY29tbWVudC4KPj4gCj4+IFRoZSBBWElfQlVTX0lEIGZvciB0d28gQ2x1c3RlciB3
aW5kb3dzIG9uIFJLMzU3NiBhcmUgZml4ZWQgYnkgaGFyZHdhcmUsIHRoYXQKPj4gbWVhbnMgd2hl
dGhlciB3ZSB3cml0ZSBpdCBvciBub3QsIGl0IHdvbid0IGNoYW5nZSBhbnl0aGluZy4KPj4gQnV0
IHRoZSBBWElfQlVTX0lEIGZvciBFc21hcnQgd2luZG93cyBvbiByazM1NzYgYW5kICBBWElfWVJH
Qi9VVl9SX0lEIGZvcgo+PiBhbGwgY2x1c3Rlci9lc21hcnQgd2luZG93cyBvbiByazM1NzYgYXJl
IHdyaXRlYWJsZS4KPj4gSSB0aGluayB3ZSBkaXJlY3RseSB3cml0ZSBpdCBoZXJlIGFzIHRoZSBj
dXJyZW50IGNvZGUgY2FuIG1ha2UgdGhpbmdzIGVhc3kuCj4KPkkgc2VlLCBzYXlpbmcgaXQgaXMg
cmVhZCBvbmx5IG1heSBiZSBhIGJpdCBjb25mdXNpbmcgdGhlbiwgYnV0IGl0IG1ha2VzIHNlbnNl
LiAKPllvdSBjb3VsZCBiZSBtb3JlIHNwZWNpZmljIGFkZGluZyB0aGF0IHdyaXRpbmcgaGFzIG5v
IGVmZmVjdC4KCk9rYXksICBJIHdpbGwgYWRkIG1vcmUgc3BlY2lmaWMgZXhwbGFuYXRpb24gaW4g
djYKCj4KPkFueXdheSwgSSB0ZXN0ZWQgdGhpcyBhbmQgaXQgd29ya3MgYXMgZXhwZWN0ZWQ6Cj4K
PlRlc3RlZC1ieTogRGV0bGV2IENhc2Fub3ZhIDxkZXRsZXYuY2FzYW5vdmFAY29sbGFib3JhLmNv
bT4KPgo+UmVnYXJkcywKPkRldGxldi4KPgo+PiA+PiA+SSBzdWdnZXN0Cj4+ID4+ID4KPj4gPj4g
PglpZiAodm9wMi0+ZGF0YS0+c29jX2lkID09IDM1ODgpIHsKPj4gPj4gPgo+PiA+PiA+UmVnYXJk
cywKPj4gPj4gPkRldGxldgo+PiA+PiA+Cj4+ID4+ID4+ICsJCXZvcDJfd2luX3dyaXRlKHdpbiwg
Vk9QMl9XSU5fQVhJX0JVU19JRCwgd2luLT5kYXRhLQo+PiA+PiA+Pgo+PiA+PiA+PmF4aV9idXNf
aWQpOwo+PiA+PiA+Pgo+PiA+PiA+PiArCQl2b3AyX3dpbl93cml0ZSh3aW4sIFZPUDJfV0lOX0FY
SV9ZUkdCX1JfSUQsIHdpbi0+ZGF0YS0KPj4gPj4gPj4KPj4gPj4gPj5heGlfeXJnYl9yX2lkKTsK
Pj4gPj4gPj4KPj4gPj4gPj4gKwkJdm9wMl93aW5fd3JpdGUod2luLCBWT1AyX1dJTl9BWElfVVZf
Ul9JRCwgd2luLT5kYXRhLQo+PiA+PiA+Pgo+PiA+PiA+PmF4aV91dl9yX2lkKTsKPj4gPj4gPj4K
Pj4gPj4gPj4gKwl9Cj4+ID4+ID4+ICsKPj4gPj4gPj4gCj4+ID4+ID4+ICAJaWYgKHZvcDJfY2x1
c3Rlcl93aW5kb3cod2luKSkKPj4gPj4gPj4gIAkKPj4gPj4gPj4gIAkJdm9wMl93aW5fd3JpdGUo
d2luLCBWT1AyX1dJTl9BRkJDX0hBTEZfQkxPQ0tfRU4sCj4+ID4+ID4KPj4gPj4gPmhhbGZfYmxv
Y2tfZW4pOwo+PiA+Cj4+ID5EZXRsZXYuCj4+ID4KPj4gPgo+PiA+Cj4+ID5fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiA+TGludXgtcm9ja2NoaXAgbWFp
bGluZyBsaXN0Cj4+ID5MaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+ID5odHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCj4K
Pgo+Cj4K

