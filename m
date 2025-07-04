Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79523C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mibiWF16hdn0bP5qO7tnSAg+k3n38sdVq+w+Ms8wFHY=; b=ZC7Qx93+YmBJcGlVHFQivw6Zmh
	nVlGFCwy8MO8wib6OlTRJaWxa98UGCP8c6Q6VS6JGSg/DICik7FtGmBwEZ5m2ChSRsk+LpjZ59Ph4
	tCvIRqRVYFklQAmAknlbsm6KsgaNjsYB6nzJiKxYje2U8PaxxEcjIvf3L7SycJd+A7oNDLWTQSc5o
	kiSxheABGSSG0m/ldn4N6SLCNpb5XwBY/jqL8k3+5snx/OTTjKYbMPcK7qhPhiAgJdXWKr/XoBvNt
	KmV6yTaLDB4BeWtzsuOV4pWPGNe1r/cbA7U84pyln0ZnpNsKRzWnny3D6wzbXNnuCSPHe4gDIr8+H
	upRaW5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeU6-0000000EBuQ-1RzB;
	Fri, 04 Jul 2025 11:21:38 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbeS-0000000Dhz7-25cw;
	Fri, 04 Jul 2025 08:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=mibiWF16hdn0bP5qO7tnSAg+k3n38sdVq+w+Ms8wFHY=; b=g
	3kz60z3AYDuGu9PCSO3ovTsSFZsx7LxoJhDEdAEQB7JO4VMWzGp0zDd3E49U+zbe
	X08CMairuKKEg26hx1rGIyGKoUol6qlAcwd9nsI9a0qz029u1yGd2fyT0RcyuePt
	zIAphFeNyGFbC4q7Kf3U8svfzq5icHNxXiTn33wuv4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Fri, 4 Jul 2025 16:19:30 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 4 Jul 2025 16:19:30 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Zalewski" <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Diederik de Haas" <didi.debian@cknow.org>
Subject: Re:[PATCH] rockchip/drm: vop2: make vp registers nonvolatile
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250628180914.1177177-2-pZ010001011111@proton.me>
References: <20250628180914.1177177-2-pZ010001011111@proton.me>
X-NTES-SC: AL_Qu2eA/qauEks5iWbYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jC/rxCoxfntMEmPnyfOOFCWcrheYUhhh58BWV4JgQoINVNPLzzTi97dc2ZFl3s1NsQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <9947ce4.7929.197d484ec6b.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgD3V2KSjmdo0I0CAA--.22062W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhSAXmhnjU0l2AABsr
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_012008_903849_1E5826DB 
X-CRM114-Status: GOOD (  12.84  )
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

SGVsbG8gUGlvdHIsCgpBdCAyMDI1LTA2LTI5IDAyOjExOjAwLCAiUGlvdHIgWmFsZXdza2kiIDxw
WjAxMDAwMTAxMTExMUBwcm90b24ubWU+IHdyb3RlOgo+TWFrZSB2aWRlbyBwb3J0IHJlZ2lzdGVy
cyBub252b2xhdGlsZS4gQXMgRFNQX0NUUkwgcmVnaXN0ZXIgaXMgd3JpdHRlbgo+dG8gdHdpY2Ug
ZHVlIHRvIGdhbW1hIExVVCBlbmFibGUgYml0IHdoaWNoIGlzIHNldCBvdXRzaWRlIG9mIHRoZSBt
YWluCj5EU1BfQ1RSTCBpbml0aWFsaXphdGlvbiB3aXRoaW4gYXRvbWljX2VuYWJsZSAoZm9yIHJr
MzU2eCBjYXNlIGl0IGlzIGFsc28KPm5lY2VzYXJyeSB0byBhbHdheXMgZGlzYWJsZSBnYW1tYSBM
VVQgYmVmb3JlIHdyaXRpbmcgYSBuZXcgTFVUKSB0aGVyZSBpcwo+YSBjaGFuY2UgdGhhdCBEU1Bf
Q1RSTCB2YWx1ZSByZWFkLW91dCBpbiBnYW1tYSBMVVQgaW5pdC91cGRhdGUgY29kZSBpcwo+bm90
IHRoZSBvbmUgd2hpY2ggd2FzIHdyaXR0ZW4gYnkgdGhlIHByZWNlZGluZyBEU1BfQ1RSTCBpbml0
aWFsaXphdGlvbgo+Y29kZSB3aXRoaW4gYXRvbWljX2VuYWJsZS4gVGhpcyBtaWdodCByZXN1bHQg
aW4gbWlzY29uZmlndXJlZCBEU1BfQ1RSTAo+d2hpY2ggbGVhZHMgdG8gbm8gdmlzdWFsIG91dHB1
dFsxXS4gU2luY2UgRFNQX0NUUkwgd3JpdGUgdGFrZXMgZWZmZWN0Cj5hZnRlciBWU1lOQ1sxXSB0
aGUgaXNzdWUgaXMgbm90IGFsd2F5cyBwcmVzZW50LiBXaGVuIHRlc3RlZCBvbiBQaW5ldGFiMgo+
d2l0aCBrZXJuZWwgNi4xNCBpdCBoYXBwZW5lcyBvbmx5IHdoZW4gRFJNIGlzIGNvbXBpbGVkIGFz
IGEgbW9kdWxlWzFdLgo+SW4gb3JkZXIgdG8gY29uZmlybSB0aGF0IGl0IGlzIGJlY2F1c2Ugb2Yg
dGltaW5nIEkgaW5zZXJ0ZWQgMThtcyB1ZGVsYXkKPmJlZm9yZSB2b3AyX2NydGNfYXRvbWljX3Ry
eV9zZXRfZ2FtbWEgaW4gYXRvbWljIGVuYWJsZSBhbmQgY29tcGlsZWQgRFJNCj5hcyBtb2R1bGUg
LSB0aGlzIGhhcyBhbHNvIGZpeGVkIHRoZSBpc3N1ZSBvbiBQaW5ldGFiMi4KPgo+WzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJvY2tjaGlwLzU2MmIzOGU1LmE0OTYuMTk3NWYwOWY5
ODMuQ29yZW1haWwuYW5keXNocmtAMTYzLmNvbS8KPgo+UmVwb3J0ZWQtYnk6IERpZWRlcmlrIGRl
IEhhYXMgPGRpZGkuZGViaWFuQGNrbm93Lm9yZz4KPkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcm9ja2NoaXAvREFFVkRTVE1XSTFFLko0NTRWWk4wUjlNQUBja25vdy5vcmcv
Cj5TdWdnZXN0ZWQtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPlNpZ25l
ZC1vZmYtYnk6IFBpb3RyIFphbGV3c2tpIDxwWjAxMDAwMTAxMTExMUBwcm90b24ubWU+Cj4tLS0K
PiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyB8IDkgKysrKyst
LS0tCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5j
IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4IGQw
ZjVmZWExNWUyMS4uMjQxMDYwY2MyNGNiIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5AQCAtMjU4OSwxMiArMjU4OSwxMyBAQCBzdGF0aWMgaW50
IHZvcDJfd2luX2luaXQoc3RydWN0IHZvcDIgKnZvcDIpCj4gfQo+IAo+IC8qCj4tICogVGhlIHdp
bmRvdyByZWdpc3RlcnMgYXJlIG9ubHkgdXBkYXRlZCB3aGVuIGNvbmZpZyBkb25lIGlzIHdyaXR0
ZW4uCj4tICogVW50aWwgdGhhdCB0aGV5IHJlYWQgYmFjayB0aGUgb2xkIHZhbHVlLiBBcyB3ZSBy
ZWFkLW1vZGlmeS13cml0ZQo+LSAqIHRoZXNlIHJlZ2lzdGVycyBtYXJrIHRoZW0gYXMgbm9uLXZv
bGF0aWxlLiBUaGlzIG1ha2VzIHN1cmUgd2UgcmVhZAo+LSAqIHRoZSBuZXcgdmFsdWVzIGZyb20g
dGhlIHJlZ21hcCByZWdpc3RlciBjYWNoZS4KPisgKiBUaGUgd2luZG93IGFuZCB2aWRlbyBwb3J0
IHJlZ2lzdGVycyBhcmUgb25seSB1cGRhdGVkIHdoZW4gY29uZmlnCj4rICogZG9uZSBpcyB3cml0
dGVuLiBVbnRpbCB0aGF0IHRoZXkgcmVhZCBiYWNrIHRoZSBvbGQgdmFsdWUuIEFzIHdlCj4rICog
cmVhZC1tb2RpZnktd3JpdGUgdGhlc2UgcmVnaXN0ZXJzIG1hcmsgdGhlbSBhcyBub24tdm9sYXRp
bGUuIFRoaXMKPisgKiBtYWtlcyBzdXJlIHdlIHJlYWQgdGhlIG5ldyB2YWx1ZXMgZnJvbSB0aGUg
cmVnbWFwIHJlZ2lzdGVyIGNhY2hlLgo+ICAqLwo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFw
X3JhbmdlIHZvcDJfbm9udm9sYXRpbGVfcmFuZ2VbXSA9IHsKPisJcmVnbWFwX3JlZ19yYW5nZShS
SzM1NjhfVlAwX0NUUkxfQkFTRSwgUkszNTg4X1ZQM19DVFJMX0JBU0UrMjU1KSwKClNtYWxsIG5p
dDogdGhlcmUgc2hvdWxkIGJlIHNwYWNlcyBiZWZvcmUgYW5kIGFmdGVyIHRoZSAgKyAKCj4gCXJl
Z21hcF9yZWdfcmFuZ2UoMHgxMDAwLCAweDIzZmYpLAo+IH07Cj4gCj4tLSAKPjIuNTAuMAo+Cj4K


