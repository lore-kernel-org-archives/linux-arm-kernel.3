Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13FFC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lGVquPdLm5iCHyN6vtfcTrIQSO+K7PXkfivVp8RwPIA=; b=0P7FCWQwuH/tNQOBDcs7tYuQpr
	wJKf9Np+/KGxAfyyEB8Eb+fk4OTIXVZURBV7KUUHKNYHVi7PP4g2H7UYwA8yxtrLEw/RMTIh+ilY6
	fIO6/SFHLUqXbJdimMzjQqITMXQH6bZ/OxpYtQ5uD/LiSeKByuv4eJPR7t9E3oXSaM6LKmJGP2Oi2
	PdQogIBOI3kxp4F/kJwsjO9SsQIyisLACflrLyaXFx5WaBCnZsYK/0eDRi+2nTq0E1NIBkJ4GI9XV
	LNZu+2c4URkQOHO6vX5vdCXf1LWaVS3wxxu5ebQ+y+TZuetrqYC55hWwSwWC0i9R44tiI65ZdmedU
	Byvx/59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtT0-00000005EaJ-120x;
	Thu, 06 Aug 2026 08:28:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtSy-00000005EZt-3f5X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:28:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4213F60A8C;
	Thu,  6 Aug 2026 08:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BC51F000E9;
	Thu,  6 Aug 2026 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004920;
	bh=lGVquPdLm5iCHyN6vtfcTrIQSO+K7PXkfivVp8RwPIA=;
	h=From:To:Cc:Subject:Date;
	b=gdY+aVt/d2meuxbCOWFFPYJYgvR4pFknlbSk/Deyyn3duPcXrMIZ7P68rRcUr97yY
	 30dtFUEbUvIOA/r0z89AHhclMGYQOhjldBS8MLkOahnIfXK721VDeTlUpLEhf5p5KW
	 N1houl7xLGegpKxeazqJuCjaWSJl/24qskS7UYoQOnA6Nq4MgMJ6ZLYPF/qcYTbizS
	 GfEKWJyz8oxj1dseSQLkLai3i7BgnFkUqbbCgFJVPGe9etmE8G7/EHBY81OSQmRa9l
	 U2IE8+f7xbOcwwFTrAV8AG8cY/SfHpTVHpAK5jLhhZ5U0p9OAQ2YccFNL9l047r5yI
	 eD+7tERjJheXw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [GIT PULL] pinctrl: samsung: for v7.3
Date: Thu,  6 Aug 2026 10:28:31 +0200
Message-ID: <20260806082831.350285-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=krzk@kernel.org; h=from:subject; bh=wHBsbGN9pb7/610WcdUv6xMxzm/J3FNizWzhkmu4r+A=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEWvE2i5ZJRBaIFs8/5iQLObjFNMadfOnos67 efYVnHTocaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRFrwAKCRDBN2bmhouD 1ywMD/9TQ/VsbVZW/6gsuMTjDfGKfY6fPHx5GPMdwXkhV+zS5KPUkWUlyr800qaHcEV292cbYx3 rp97b3yDwYrDKlvdrWxBpHiSbnGqU3sgmHHHlTVYt6t8zjaAzM4vmsvHkAv07vW9NTxsPwJY/VU JLa0EphKiCVH8uOjMsNHbxve8RM954QsWZ3RQu8rMPhHxzjh4MwLuL71ClHJE5CDCkvJjp3jx2L pODJBZ4/h9HpPDy5IsrzFifm8ql/zZsiT3ugIATcogLeK0tEQNGfLL3ErL4yC0OVoLR+s6jiLpv WaCN0VD4p3s5i6K8xupoDPE77maQX6ijZQhI5kD7fD3qq5JtcAhp6SWMt0VCV9yH7Jr/tMwI+fZ HHNriB4xnJl7NL2gOm7CTGUSCUYQeupXYsEimT/ZTTtRW4tssYDRWp2jIqfB+12RdobKM8embQK 06sJ+Mb6JH+CLX+B0qWu21kMQxrDztSyrqyznhxSf7f7B3fxx+ye2y+TjErvCqeLb57FqJH0dmv VEWJu6+fi8CI95WZuni+IeRG835YQAseXMZukCxhIesutMWH+N2dp9lGel0DSo1T8wW0Fv/fa4N B4bbGVupBWq90NoEIzjzCTM5x6BAkM4HuYo3bP3W9FGp5TyvwU0hHnI740dNKFKlDBMEX7ZLyqY S4SMOJX9yUPnYtQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-7.3

for you to fetch changes up to d441836c9d704d0f3db5dbf44df87af2ba7a9d26:

  pinctrl: samsung: Add Exynos8855 pinctrl configuration (2026-07-13 09:17:05 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v7.3

Add drivers for newly introduced Samsung Exynos8855 SoC.

----------------------------------------------------------------
Alim Akhtar (3):
      dt-bindings: pinctrl: samsung: Add exynos8855-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos8855-wakeup-eint compatible
      pinctrl: samsung: Add Exynos8855 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 132 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 137 insertions(+)

