Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18966E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrLRFPqL5xC8SmHy9nqWA0h4pAbxAC0kTRd0qE+Zoe4=; b=eRca6efpvmRR2oYIm3uggZo1rv
	nFaeu3OPC9jocSRCjMbSPPmycaGqHEcCDLUGRwjjFCKWxAShqkRuzJDRKcB2W13ogLJojhkHMDpsf
	QFnB3UTTxqurGasesf1k6vdXREDGh++dWuNFtSNtfw3MHULqErpf+baWrr7neFL6oI1zXffg7JFj6
	PNTMcvskeBYnO5RRUsuYaOJSsaTnVdDwNtPH9EHE621i0lN22yG+OQAYAExzL+DTaapSCE5xbYqkY
	GiHNmRgbQOUVOz4PhPaYL1e4mOTF8RgoMDSBg+w4TT/ruMeynww5XdY/YD1avM5aQNO5weSfZdW8f
	ooTL+KsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuI1-0000000AV0k-315U;
	Tue, 10 Dec 2024 07:04:13 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuGx-0000000AUrv-0raV;
	Tue, 10 Dec 2024 07:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=KsNxn/V9jsZH8S8jVaxxltqPa9bgN7LFDP+cLTpZFt4=; b=K
	IIB39B0ilf71OAen+R8Krs3J1oK6mcpidO3h29l74gkoraTP2mn0Kt3N1bzyQY/B
	JuZGISFW2i80zu9KoxReVM4NBzvftwk7lV7VFoDom0DpOVnI+zbbsdqvi4qdOl2I
	gR9/XfU+0mRsyWM7D1WIX6vtLv/PF8cWXA/V4sclGc=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Tue, 10 Dec 2024 15:01:50 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 10 Dec 2024 15:01:50 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniel@fooishbar.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com, 
	detlev.casanova@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v5 08/18] drm/rockchip: vop2: Add check for 32 bpp
 format
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <CAPj87rO0MG2yE_NTndbxQ77rW-p6-ht5kx5vsaOZikQfVmwrgg@mail.gmail.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209123215.2781721-1-andyshrk@163.com>
 <CAPj87rO0MG2yE_NTndbxQ77rW-p6-ht5kx5vsaOZikQfVmwrgg@mail.gmail.com>
X-NTES-SC: AL_Qu2YAfSau0kq5imeY+kZnEobh+Y5UcK2s/ki2YFXN5k0tCTI0SYQW29KGUD2y86DDiKsoAirUQVL5MpFRpJHY44bkaXh1iG/7cPZF5Qxw25b
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3576a3c5.6d72.193af5fcafb.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3X79f51dn73o7AA--.49817W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gWxXmdX4aZ9kAACsg
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_230307_615307_0E950C27 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

CkhpIERhbmllbCwKCkF0IDIwMjQtMTItMTAgMDE6MDY6MDUsICJEYW5pZWwgU3RvbmUiIDxkYW5p
ZWxAZm9vaXNoYmFyLm9yZz4gd3JvdGU6Cj5IaSBBbmR5LAo+Cj5PbiBNb24sIDkgRGVjIDIwMjQg
YXQgMTI6MzIsIEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPiB3cm90ZToKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPj4gaW5kZXggYmQ4ZGI0NWVl
YmE2Li4xZjEwMWEzYzM5NDIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jCj4+IEBAIC0xMjI0LDcgKzEyMjQsMTUgQEAgc3RhdGljIGludCB2
b3AyX3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgfQo+PiAgICAgICAgICAgICAgICAgfQo+PiArICAgICAgIH0KPj4KPj4gKyAg
ICAgICBpZiAoZmItPmZvcm1hdC0+Zm9ybWF0ID09IERSTV9GT1JNQVRfWFJHQjIxMDEwMTAgfHwg
ZmItPmZvcm1hdC0+Zm9ybWF0ID09IERSTV9GT1JNQVRfWEJHUjIxMDEwMTApIHsKPj4gKyAgICAg
ICAgICAgICAgIGlmICh2b3AyLT5kYXRhLT5zb2NfaWQgPT0gMzU4OCkgewo+PiArICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoIXJvY2tjaGlwX2FmYmMocGxhbmUsIGZiLT5tb2RpZmllcikpIHsK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fZXJyKHZvcDItPmRybSwgIlVu
c3VwcG9ydGVkIGxpbmVhciAzMiBicHAgZm9yICVzXG4iLCB3aW4tPmRhdGEtPm5hbWUpOwo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiArICAgICAg
ICAgICAgICAgICAgICAgICB9Cj4+ICsgICAgICAgICAgICAgICB9Cj4KPlBsZWFzZSBkbyB0aGlz
IGluIHRoZSBmb3JtYXRfbW9kX3N1cHBvcnRlZCgpIGhvb2ssIHNvIHVzZXJzcGFjZSBjYW4KPnNl
ZSB0aGUgdHJ1ZSBzdXBwb3J0IG9mIGVhY2ggZm9ybWF0L21vZGlmaWVyIHBlciBwbGFuZS4gVGhp
cyB3aWxsIHRoZW4KPmJlIGNoZWNrZWQgaW4gZHJtX2F0b21pY19wbGFuZV9jaGVjaygpIHNvIHlv
dSBkb24ndCBuZWVkIHRvIG9wZW4tY29kZQo+aXQgaGVyZS4KClRoYW5rcywgd2lsbCBkbyBpbiBW
Ni4KCj4KPkNoZWVycywKPkRhbmllbAo=

