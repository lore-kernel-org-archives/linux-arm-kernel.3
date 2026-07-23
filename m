Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41219C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lNhsWaCOFhbQHHDnSl6n0G8/WNkaQONVm0oZW9lnXh0=; b=IF63lCPbo9Pjk4
	0TgpkaQxf8h1abg1aCh2zZx7GG8JhWQx3gy1cbaNgIamxgl9TWFRC2KlBbxIwDl3cR45WzpyJkjxC
	5N2OcDeXKH1CfE/ru/QrJQYDS2ZrduG6uR9Tgi2lp0Y6P8qsfKL7yAAGdQPjshtTli8wD1bYjYTOi
	xsLVpC7hYpR+bimkl2cLr/kGkN+3gte457sGNGjsks5vu/9Gy7H0dc/K1QFZzcJMKjFnl80SV8xbr
	rJeDCkirDD4uifGp+tNEJpMCVGydGHu0wVDxavvEiuLj3S51TJvqwYoTFF+0ER4tt2GBHjKZZXi8D
	mN+qfS64Ad4v8g8qprFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzBH-0000000EyLp-205V;
	Thu, 23 Jul 2026 19:34:07 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzBF-0000000EyLJ-06BV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 19:34:06 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 767938444E;
	Thu, 23 Jul 2026 21:24:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ok0EQX9YxwfW; Thu, 23 Jul 2026 21:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784834658; bh=0IyY3WD1+waTTaaDTZVwe6gg2HdaKZ9OBT8RRjdbj1s=;
	h=From:Subject:Date:To:Cc;
	b=NUtEnkGWLMDuU/4EXZJvE5m5wo/pV5Xqombi8N+R+Y/V2ulyrC/TSSGFfsDPkYoXG
	 +HGp6+g+EXljg6sWaFkVIfFS14mXkuBafwJx8h6lpnlwlJP+Bm91qO4tAEiN0tIMBU
	 pFJa3SVNbqQOdp01I8H39FUomaJpum9pNZ9rIkk+lG+kmXT0A1fnxAmepBLqxZr4Ji
	 BoRh8zoTZ0Qesn2Lmq5nh/J5UgVvbiKi14UfZkWr0YQE+QhpMf+ehOyEEps95hAai/
	 xqeL6M/s9t/I8eIgoOBFks5CI6YQJ0CWbyuQ7g+DiKxlDNj09mRGWM1qaLSG2gl2gR
	 Q98H6bmhGbK8w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/5] Support zinitix touch modes 0 and 1, dt changes to
 Galaxy J6 (j6lte)
Date: Fri, 24 Jul 2026 00:54:02 +0530
Message-Id: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrBtIoyjpVaQLTf7qCEbJqIji3
 U3b5bd47yRBZAi9spMiNhaeQsLzkZHrm9BBsU8mo02pK5OrgwMvvKtx8hBlXeELbVsL5JSaOeL
 D++9Xv/+WtR3glu+ErusG7RyfkHEAAAA=
X-Change-ID: 20260723-zinitix-modes-9c4d409b9ee3
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_123405_210495_F64C8D35 
X-CRM114-Status: GOOD (  13.02  )
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
Kaustabh Chakraborty (5):
      Input: zinitix - check all available fingers for every touch event
      Input: zinitix - do not ignore non-moving fingers
      Input: zinitix - add support for modes 0 and 1
      dt-bindings: input/ts/zinitix: document mode 0
      arm64: dts: exynos7870-j6lte: set mode 0 as default for zinitix touchscreen

 .../bindings/input/touchscreen/zinitix,bt400.yaml  |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   2 +
 drivers/input/touchscreen/zinitix.c                | 144 +++++++++++++++++++--
 3 files changed, 136 insertions(+), 14 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-zinitix-modes-9c4d409b9ee3

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


