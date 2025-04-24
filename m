Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAC3C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 01:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83mcjUifPIfk/6ORujgQWzGN58qZCqIJuR06Usw8ypw=; b=V0/zMBYmwf22p4r5pJBcILvSAs
	9sadiPmf8CUJmhFtsqMgUoO1FXOnBVGqdrRe+udWlZfCzo97DMTuouOyMvrisACEk8PRvsQ5No7X/
	wPUwwt9Gqv03BRDNXN520do3q9Jk3P0TlOFImf7DeE8lKZrJhMthEJfu6wpdEi3n9Vc2jrvjJ+4wA
	GdrnbrzLsZHwypK2kkF/YXfjCcri//IJlP8XbbF81fBE++HsDl3v8hLJFG+HifpuDqmxINWxtUIYm
	2EKESFsi5zQJuy65/5xtuq+eAzuGE6n5FjI4ooWYIP5OCM9Nf4LpisJbt/rmKwSYyyY/si7425Yhw
	HQyVRw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kx9-0000000CSnh-207z;
	Thu, 24 Apr 2025 01:00:35 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kgx-0000000CQVF-31N4;
	Thu, 24 Apr 2025 00:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QTVmIoV8bT7TS1J/bHn0cF9ZcR5e5MVRDdBrhghGq8c=; b=m
	YxNlMXlspOe81pr+rfZ922TXq7NPZVFz2l/cr9hGOHCmECkeuqrNXH+or4V2+NQk
	hZuLwwMjC6S1sQdRE8ZdnCPit5RfJutnbss/kSCvxmZLU0NUs5WRDtXFXdZwpI9g
	ZJdiSQ9ZaHzk9kWFAXg7ytfzoXuzf3+hr3OFCu4ZyI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 24 Apr 2025 08:42:47 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 24 Apr 2025 08:42:47 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Douglas Anderson" <dianders@chromium.org>,
	"Damon Ding" <damon.ding@rock-chips.com>,
	"Arnd Bergmann" <arnd@arndb.de>,
	"Heiko Stuebner" <heiko.stuebner@cherry.de>,
	"Geert Uytterhoeven" <geert+renesas@glider.be>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] drm/rockchip: add CONFIG_OF dependency
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <a4tcrxepuvvxixpab3txz6tdbh6janiedjqddl2ybfo6plhjcl@r5bxdabuhjep>
References: <20250423164422.2793634-1-arnd@kernel.org>
 <a4tcrxepuvvxixpab3txz6tdbh6janiedjqddl2ybfo6plhjcl@r5bxdabuhjep>
X-NTES-SC: AL_Qu2fB/ieukst4SadbekfmkcVgOw9UcO5v/Qk3oZXOJF8jCzp8D4yf1JTEnDy1fCDKg+MkAiHYjpJ8Pt0f7d2fYwuVF/Ep8+wUnGXRqnQ58Y+5g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <13627027.772.196653f45f1.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgAXfIYHiQlo2ESdAA--.63259W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBU5XmgJh6IglgABsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_174352_054449_810A4398 
X-CRM114-Status: UNSURE (   6.70  )
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

SGksIAoKQXQgMjAyNS0wNC0yNCAwMToxODo0NSwgIkRtaXRyeSBCYXJ5c2hrb3YiIDxkbWl0cnku
YmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+T24gV2VkLCBBcHIgMjMsIDIwMjUg
YXQgMDY6NDQ6MTZQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4gRnJvbTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gCj4+IERSTV9ESVNQTEFZX0RQX0FVWF9CVVMgY2Fu
bm90IGJlIHNlbGVjdGVkIHdoZW4gQ09ORklHX09GIGlzIGRpc2FibGVkOgo+PiAKPj4gV0FSTklO
RzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgRFJNX0RJU1BMQVlfRFBf
QVVYX0JVUwo+PiAgIERlcGVuZHMgb24gW25dOiBIQVNfSU9NRU0gWz15XSAmJiBEUk0gWz15XSAm
JiBPRiBbPW5dCj4+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+PiAgIC0gRFJNX1JPQ0tDSElQIFs9eV0g
JiYgSEFTX0lPTUVNIFs9eV0gJiYgRFJNIFs9eV0gJiYgUk9DS0NISVBfSU9NTVUgWz15XSAmJiBS
T0NLQ0hJUF9BTkFMT0dJWF9EUCBbPXldCj4+IAo+PiBSb2NrY2hpcCBwbGF0Zm9ybXMgYWxsIGRl
cGVuZCBvbiBPRiBhbnl3YXksIHNvIGFkZCB0aGUgZGVwZW5kZW5jeSBoZXJlCj4+IGZvciBjb21w
aWxlIHRlc3RpbmcuCj4+IAo+PiBGaXhlczogZDdiNDkzNmIyYmMwICgiZHJtL3JvY2tjaGlwOiBh
bmFsb2dpeF9kcDogQWRkIHN1cHBvcnQgdG8gZ2V0IHBhbmVsIGZyb20gdGhlIERQIEFVWCBidXMi
KQo+PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKICAgIEFj
a2VkLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cgo+PiAtLS0KPj4gIGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnIHwgMSArCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPj4gCj4KPlJldmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0
cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+Cj4KPi0tIAo+V2l0aCBiZXN0IHdpc2hlcwo+
RG1pdHJ5Cg==

