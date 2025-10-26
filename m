Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949DDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBCxex7CHO/U3Dfv5WZKY0SwvhgZfQABXo3pkRN6HTI=; b=s1c9kuKEwT1/0i1RESNiC19vwI
	ITdEvLID/HwcmU8M5zkBKTKWGPPaFzGyLbqgVGN1bfrddo+5ZOLMK0VfUOj744Es0tzSDTvLWI7ji
	+MB4C4ShxLRjXv7ZQGWAtLULQ5N3KEwo1J3bPqFgmYNVt6EmqfyIoVLkGFeKqgQd53iaKxhD7NqAS
	NAf8DKFcIup/OqKCVV77mnwiCc/FVq1nCbn2jmpNwIfSz4Mxjgi0mW1PD3CGkwrYgHhA2hl+DkNDr
	sUNvho2y6EOY3yy2K6oH5XGQsfDUH+ZCSGtuyK+4Ef7ZJF+hudFu4akpmXBlblVcOxAtOI7uALHrq
	m85mEvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCwHO-0000000CB4w-3i7x;
	Sun, 26 Oct 2025 08:39:10 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCwHM-0000000CB3W-01L5;
	Sun, 26 Oct 2025 08:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=G0/fPh3/khSdVcZGrkcOAMGTDLBOWAUPFQxA3kxrAMI=; b=I
	FAl4Bhd+lOzRrVp+AxYyDzPYbG+LOe8xAHB5Ad7B6qjY8bUz5HfQo4SzfQmpcLSW
	efNg2NqV531MztOEeYs/FdYTpsTgcAQEn/AehVUsEL1d/nK7w172CjsAI8lOAIqH
	0K1MSjU6NSwdDJVQdzh+pvdydQp5YIG+b4JauYPWIw=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Sun, 26 Oct 2025 16:38:35 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sun, 26 Oct 2025 16:38:35 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quentin.schulz@cherry.de,
	andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com, "Heiko Stuebner" <heiko.stuebner@cherry.de>
Subject: Re:[PATCH v2 2/9] drm/rockchip: hdmi: add RK3368 controller variant
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251021074254.87065-3-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-3-heiko@sntech.de>
X-NTES-SC: AL_Qu2dA/iduEEq4ySZYOkfmUgWjuw/WsG1v/Ul1YBSP556jC/r9AQFYUF9G1/47+GNFiCiuyqKVwhE0uhmb5F8ZYQUZUyGOIUxNEyoJHiUMsrAYw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1a7115bc.1597.19a1fab5ca2.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgDn2FYL3v1o4ZoTAA--.1233W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gbyXmj911N+rQABs7
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_013908_365834_04C1108F 
X-CRM114-Status: UNSURE (   5.63  )
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

CkhlbGxvIEhlaWtvLAoKQXQgMjAyNS0xMC0yMSAxNTo0Mjo0NywgIkhlaWtvIFN0dWVibmVyIiA8
aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPkZyb206IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVl
Ym5lckBjaGVycnkuZGU+Cj4KPlRoZSBSSzMzNjggaGFzIG9ubHkgb25lIFZPUCwgc28gdGhlcmUg
aXMgbm8gc291cmNlIHNlbGVjdGlvbiBoYXBwZW5pbmcKPmFuZCB0aGUgY29udHJvbGxlciB1c2Vz
IGFuIGludGVybmFsIFBIWSBmb3IgdGhlIEhETUkgb3V0cHV0Lgo+Cj5TaWduZWQtb2ZmLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAY2hlcnJ5LmRlPgoKUmV2aWV3ZWQtYnk6IEFu
ZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPgoKVGhhbmtzCgoKPi0tLQo+IGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAxNiArKysrKysrKysrKysrKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvZHdfaGRtaS1yb2NrY2hpcC5jCj5pbmRleCA3YjYxMzk5N2JiNTAuLjk1ZmYzZmNlOTdhMyAx
MDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMK
PisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKPkBAIC00
NjcsNiArNDY3LDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgcmsz
MzI4X2hkbWlfZHJ2X2RhdGEgPSB7Cj4gCS51c2VfZHJtX2luZm9mcmFtZSA9IHRydWUsCj4gfTsK
PiAKPitzdGF0aWMgc3RydWN0IHJvY2tjaGlwX2hkbWlfY2hpcF9kYXRhIHJrMzM2OF9jaGlwX2Rh
dGEgPSB7Cj4rCS5sY2RzZWxfZ3JmX3JlZyA9IC0xLAo+K307Cj4rCj4rc3RhdGljIGNvbnN0IHN0
cnVjdCBkd19oZG1pX3BsYXRfZGF0YSByazMzNjhfaGRtaV9kcnZfZGF0YSA9IHsKPisJLm1vZGVf
dmFsaWQgPSBkd19oZG1pX3JvY2tjaGlwX21vZGVfdmFsaWQsCj4rCS5tcGxsX2NmZyAgID0gcm9j
a2NoaXBfbXBsbF9jZmcsCj4rCS5jdXJfY3RyICAgID0gcm9ja2NoaXBfY3VyX2N0ciwKPisJLnBo
eV9jb25maWcgPSByb2NrY2hpcF9waHlfY29uZmlnLAo+KwkucGh5X2RhdGEgPSAmcmszMzY4X2No
aXBfZGF0YSwKPisJLnVzZV9kcm1faW5mb2ZyYW1lID0gdHJ1ZSwKPit9Owo+Kwo+IHN0YXRpYyBz
dHJ1Y3Qgcm9ja2NoaXBfaGRtaV9jaGlwX2RhdGEgcmszMzk5X2NoaXBfZGF0YSA9IHsKPiAJLmxj
ZHNlbF9ncmZfcmVnID0gUkszMzk5X0dSRl9TT0NfQ09OMjAsCj4gCS5sY2RzZWxfYmlnID0gRklF
TERfUFJFUF9XTTE2X0NPTlNUKFJLMzM5OV9IRE1JX0xDRENfU0VMLCAwKSwKPkBAIC01MDcsNiAr
NTIwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfaGRtaV9yb2NrY2hp
cF9kdF9pZHNbXSA9IHsKPiAJeyAuY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzMjgtZHctaGRt
aSIsCj4gCSAgLmRhdGEgPSAmcmszMzI4X2hkbWlfZHJ2X2RhdGEKPiAJfSwKPisJeyAuY29tcGF0
aWJsZSA9ICJyb2NrY2hpcCxyazMzNjgtZHctaGRtaSIsCj4rCSAuZGF0YSA9ICZyazMzNjhfaGRt
aV9kcnZfZGF0YQo+Kwl9LAo+IAl7IC5jb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1kdy1o
ZG1pIiwKPiAJICAuZGF0YSA9ICZyazMzOTlfaGRtaV9kcnZfZGF0YQo+IAl9LAo+LS0gCj4yLjQ3
LjIK

