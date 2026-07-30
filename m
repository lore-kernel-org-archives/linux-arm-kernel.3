Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FABC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 20:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SSss2AlgblKGQS5pxAXZpE4GXY3a19QRmB30jGHhluM=; b=OpjBx8+sPN7uQH
	RgPt0ADotyZUMKYrfT80qg2aSl3pJFJAUOJbFb4/01fEVsFxiDmfJIDoBkTESFAIoGoaI70plOf8i
	E+zKy1QgAWzTekBtf20xorHyBXn58dJpFSC3N77d6HCIT2wiHZqfh29muhy1OXWKucKEDean7L0bL
	GcWkm9OJfhdbVQNVLkd6jPAIwrSCjHPpQo00dA5MH2qojj6K4BQ/BjiDXpoO/BVATmN8wKvQrBv6F
	IP35vLt91cRWdltYjI3SmRyOIBAlVD9AFZjR2R1QGEeNIfl+BAZW8cNZtXVi+0OhiRfB5nyPJ7PoN
	4kJVh2qJ1vnr7ZjbLN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXDd-0000000BJYT-1s0Y;
	Thu, 30 Jul 2026 20:19:05 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXDa-0000000BJY5-12Rk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 20:19:03 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 014BD41C0E;
	Thu, 30 Jul 2026 22:18:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWGMjAyJ6sSe; Thu, 30 Jul 2026 22:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785442733; bh=kS07rs8jAWlfe7B/LvYSaMcoT0php0+PprTpBsh9mz0=;
	h=From:Subject:Date:To:Cc;
	b=VyGQHtVQCiAKAqO4qzEvPg4T0GQUPVQUbWPMcarK+8avEWPCr75UxxvuP6C998Wdb
	 W61i0LO9yuaEiQds3TeRc9CYPJwTP1zxQcK3OZ/Lj6pVu8itIYWfO8s0J52MGhckls
	 iDiz6E32M9U7VE3Lh4xckLVFhvwg/IGaIy8lRZdWje5HbFsAxp9HzE89tV6z5iu9Px
	 6e5CdaucoEMwtmA1KgV9cX4VIxIXF6S5Ld1AgxXX+Z/mPFgXmsbazXDL1Ig1Dxa5OZ
	 4c1QESLRRV227ZvttJfhZAN4z7IltOaxMfyyAF2USnoAOQM/l9y+0kjZYliLwqHh0A
	 /YzlVWCnHXwRg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/5] Support zinitix touch modes 0 and 1, dt changes to
 Galaxy J6 (j6lte)
Date: Fri, 31 Jul 2026 01:48:33 +0530
Message-Id: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Nyw6CMBQFf8V0bU0fBKgr/8O4gPYWronUtLVBC
 f8uxZgoy0nOzJlIAI8QyHE3EQ8JA7phAbnfEd03QwcUzcJEMFGySkj6wgEjjvTmDASqdGEKplo
 FIMni3D1YHNfe+fLh8GivoGOO5EWPITr/XA8Tz7tvu9i0E6eM2tLYytRlU1f1yWDwzsWD8x3J9
 SR+fMm3vsi+BQFaNYpJ/u/P8/wG/jIQ4P4AAAA=
X-Change-ID: 20260723-zinitix-modes-9c4d409b9ee3
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_131902_447365_DA7912E6 
X-CRM114-Status: GOOD (  13.84  )
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

The zinitix family of touchscreens support at least three modes, called
0, 1, and 2. At least some digitizers (including, but not limited to
ZT7548) are able to support multiple modes. Currently, the driver in
linux supports mode 2 only. This series aims to add support for modes 0
and 1, accompanied with necessary architectural changes.

Among other things, perhaps the biggest difference between multiple
modes is how the touch report schema is laid out. Modes may skip
reporting certain properties such as touch width and pressure. For more
implementation details, the android driver [1] can be referred to, which
was also the primary reference material for these changes.

The last patch is for the Samsung Galaxy J6 (samsung-j6lte), which has a
zinitix touchscreen digitizer. By default, mode 2 is assumed for the
touchscreen, however the downstream kernel driver [1] for this device
uses mode 0 by default. This creates an issue with aftermarket
digitizers where mode 2 implementation isn't available simply because
it's not required by the driver downstream.

This last patch needs to be accepted into next only when the former
patches are in next.  

[1] https://github.com/samsungexynos7870/android_kernel_samsung_exynos7870/blob/master/drivers/input/touchscreen/zinitix/zinitix_zt75xx_ts.c

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Add missing review trailers from v1
- Link to v2: https://patch.msgid.link/20260731-zinitix-modes-v2-0-ffe2ec9a9031@disroot.org

Changes in v2:
- Change condition for calling zinitix_report_finger() (Dmitry Torokhov)
- Use function pointer for read_status_mode* switching (Dmitry Torokhov)
- Link to v1: https://patch.msgid.link/20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org

---
Kaustabh Chakraborty (5):
      Input: zinitix - check all available fingers for every touch event
      Input: zinitix - do not ignore non-moving fingers
      Input: zinitix - add support for modes 0 and 1
      dt-bindings: input/ts/zinitix: document mode 0
      arm64: dts: exynos7870-j6lte: set mode 0 as default for zinitix touchscreen

 .../bindings/input/touchscreen/zinitix,bt400.yaml  |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   2 +
 drivers/input/touchscreen/zinitix.c                | 141 +++++++++++++++++++--
 3 files changed, 132 insertions(+), 15 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-zinitix-modes-9c4d409b9ee3

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


