Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7617C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 17:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f4cvIWSOqdkpRAx+1GB6UUjB2urEmzkRFC1hEkTh8JI=; b=kJKIV2iH02UtBv
	x2MX5ODewKD0UeToainwwVhY8SeHf0H0FLcZ5f3T/CrO40EZcMpqj5mIlEcAmfYmlEDEdW2lnuwEV
	qZ8w2/v+4/b7NI7CFv/MlKixeESoZIU4nGSR5f1inYfBU6e7T+FM09xT5I5I96gZL2aZRAobjBkzz
	5y85P2NvI5WYBdC6NqdADn2VGo6kwYYnGsW9JOGQvt4Ybxx2jcFM2awx1+T3EDwfjl9LsvCviTsOR
	N4g5fOm7VVmqBSmTgj90RU8/x1wku/eCnKk0EA5Py/99kq8+flvOBFgsCliaxUhenJ4ixWOd7Iuvf
	3Lizzb4OHCAvHV3EeY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYTE6-00000000aFh-0Vry;
	Sun, 06 Jul 2025 17:32:30 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYTBk-00000000a1a-22dE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 17:30:06 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A90C225CC7;
	Sun,  6 Jul 2025 19:30:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G03BX57gX3CC; Sun,  6 Jul 2025 19:30:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751823000; bh=4QixqbGy0XLMGNdgyiJE46+isoTboBCUR/vHxQlDSuw=;
	h=From:Subject:Date:To:Cc;
	b=hNFbB9ucboIruz1f9JcTIwVizc0IImZWxPrJPY5e7p3VRNiQ6KwEoFlGVlW3CZAMo
	 pHQM/Ql2kuU+nBqkl/Y0ODugYT6fY+gu474Ybl2Aa/8Mf2ONOFrE/Y5sRUC9ZbXaxR
	 DG4rdyn6q6XpxC0TSQoaH2T63zfgeVIPcV2QLZKWmCbZCmA+/KU47Exv8qFnkaPQeE
	 2PMVdK6oaFja4fgjKeprdWoHPPoNIBaVrnuzo0gAOHxvECyzc/1iUvHxgknSVWqu/t
	 8S+4X4QwwZdKWh6rhK12VCZC8hLitokiiCCjnXLl1EFUnZcSq+XY0TAUZJ8Tasi7ec
	 LCLYbgP5TnZug==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 0/2] Samsung Exynos 7870 DECON driver support
Date: Sun, 06 Jul 2025 22:59:44 +0530
Message-Id: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIiyamgC/2XPQQ6DIBAF0Ks0rEsDIyB21Xs0XeiAyqLSgCEa4
 92LJiZtXP5J5v2ZhUQbnI3kfllIsMlF54ccxPVCsK+HzlJncibAQLCKl9RO8+CjCW9qLPqBCgT
 QxnADTUvy1ifY1k27+Hzl3Ls4+jDvBYlv08OqTlbilFGFUiuOHBsmHsbF4P1486Ejm5bgECRTH
 M4CZMEozOdw1EyWZ6H4EeD8TyqyIBshVas1trb+F9Z1/QLJohzdNAEAAA==
X-Change-ID: 20240917-exynosdrm-decon-4c228dd1d2bf
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751822991; l=1775;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=4QixqbGy0XLMGNdgyiJE46+isoTboBCUR/vHxQlDSuw=;
 b=AHwu7q2UAAhZXbmj/8AYRvdQoa71glMdtoigvUtfOTaJ5nuJl/G+qwdu7tXKHV6miyJeLd8cX
 1gsE+Zl8ld+AChxIZ4FzfrY556CKa5EjtE4jwIg/V+nZOPDbKjiwQ6Q
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_103004_948183_29AF2743 
X-CRM114-Status: UNSURE (   9.56  )
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

This patch series aims at adding support for Exynos7870's DECON in the
Exynos7 DECON driver. It introduces a driver data struct so that support
for DECON on other SoCs can be added to it in the future.

It also fixes a few bugs in the driver, such as functions receiving bad
pointers.

Tested on Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2
Core (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v4:
- Drop applied patch [v2 3/3].
- Correct documentation of port dt property.
- Add documentation of memory-region.
- Remove redundant ctx->suspended completely.
- Link to v3: https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org

Changes in v3:
- Add a new commit documenting iommus and ports dt properties.
- Link to v2: https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org

Changes in v2:
- Add a new commit to prevent an occasional panic under circumstances.
- Rewrite and redo [v1 2/6] to be a more sensible commit.
- Link to v1: https://lore.kernel.org/r/20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: samsung,exynos7-decon: document iommus, memory-region, and ports
      drm/exynos: exynos7_drm_decon: remove ctx->suspended

 .../display/samsung/samsung,exynos7-decon.yaml     | 21 +++++++++++++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 36 ----------------------
 2 files changed, 21 insertions(+), 36 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20240917-exynosdrm-decon-4c228dd1d2bf

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


