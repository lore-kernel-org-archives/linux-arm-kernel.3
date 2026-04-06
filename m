Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509ABF46C40
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OQtUgZBlTwv+xDoaiKb2N7gT+/y7cOGsVK3GMzZHFqc=; b=CCNU9ZZwAXl2zkO6O0sis9pNSs
	H11hMz6rEHN1dIzbtFp0USU0M6sNayPMrMM8Jw+TejeZQxrlIdbeFZcstC6jag9kNzv2VIVVv/hRn
	Jqk0X71fcCodOrtLYcGE47IrPWzcUhESuIEBhKma+5EfE17KDWwKB2OEmuhPSo81bPThzkm+W6FFA
	HlvBZRl7jQJ+VS4D55ZmqRBAkEh4aVymMsiH+N7eFgC0NjAk+ZHZ+DGwBVj2HCL1fXB+Zc9ro5pQv
	8Wi/l2X6aArBXa8rOE9cDA97+tGoUjmXsjpR0ag8KDSBORceGm7bgFdOYmjKxPjTMipxXaJ46XZ1O
	Dd3iXA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kRk-00000005ARR-0UGe;
	Mon, 06 Apr 2026 13:56:56 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kRh-00000005AQm-1DRo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 13:56:54 +0000
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b941762394aso509961466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 06:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775483811; x=1776088611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQtUgZBlTwv+xDoaiKb2N7gT+/y7cOGsVK3GMzZHFqc=;
        b=ZRSrGJRCGAun6eUc/yRB7zxBaeJuMdOFtBg9ap8rMJwKmLD8wZKbFPpihrQgDbiebU
         qF5dN5EnWAJALldWssyOan2Zmuagd5yz1tJMNH1fscV2igT505MhN82m9izKgr1VMZNS
         Tqw/J/Lx2SGfmyOS9tC03+zbLI0bhw8W2BXCfzd/Givqg2FdQm1v3Xj+Ho3szMmZKK0Z
         jf/uqbBxWmn+g7TfyR1K4cNUNljdpcRmqahiGxFMJbZhM3cOewhKJu9CdC26t2tVpl+J
         9NLHYNLiLHkKkvZOPcXeF8b3ECM0ez7JGOJXv+4AE61S4kkPR018MbUKLYJrK2Cn2Pet
         Op5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPk7aFU3YJeIcPT5SHdQKTiy+pA/p5dJhdXRFclbyA+1VpJsJS7zdo3SXwb7xfGvrBPfAezTsMDdk5Z9+tVIwu@lists.infradead.org
X-Gm-Message-State: AOJu0YxlHOmyizgFKjk3WJbeCGH6mQLyMCUAhG6ztaHZxQ8IWEBYotA0
	VqDDy+XGdRbRulUyb0mUPbH+qSGKuHHWFXGAJ9GkXBwUhBvs1dP7vTlb
X-Gm-Gg: AeBDietSwRZBIJjuyBy/E8wdCyDaZ5siFpjcvAmKp24uVbzVdn6+qugoMNjVXRcvo4J
	8gd319DYIWBOjT+nFnPS3K70lKoHiY2Rn+qfan809+PAxLRqX+6C7hN/DnjjgAawPHmTHj38SDq
	v2L8latkiSAsalhdWebHGkEMt1eC0sd0owkT8o3eQmH78ikMIE8EtMZOZ5voYCmacwifmpjjj19
	4Amsc8+FBIigPuj/WIYfmDCU969QD5ovTddSgPmPxy5yrR22TFojVtfiT1OMu8Zzm7s9mhZ7HQw
	mEF9gaxsamdQ0e2en8UJyKR/F7h3nIVubUpokJzuFyvNQvWev4KhyaTkA2qR4oTp1t1P7y5n8X5
	UVeke8Gd5DK4rr3I8EqhKk3Yo/H+nfUK9kswiCQYfDGI/dzvMQbEgvZpewVU7/sZcmHIuQ0Hq07
	G141juQPultdWk2BqelMkbU912KgqOA6/Uz5VFvCFvNz0yOqs3A56xHu5NmXx6xw==
X-Received: by 2002:a17:907:2d9f:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9cb3b5bc8fmr276106266b.6.1775483810728;
        Mon, 06 Apr 2026 06:56:50 -0700 (PDT)
Received: from aorus.localdomain (5.185.72.109.ipv4.public.orange.pl. [5.185.72.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cac0e1asm472921266b.27.2026.04.06.06.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 06:56:50 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	andre.draszik@linaro.org,
	pritam.sutar@samsung.com,
	kauschluss@disroot.org,
	johan@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] phy: exynos5-usbdrd: fix USB 2.0 HS PHY tuning values for Exynos7870
Date: Mon,  6 Apr 2026 15:56:27 +0200
Message-ID: <20260406135627.234835-1-kernel@lvkasz.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_065653_366894_B44D4BE0 
X-CRM114-Status: GOOD (  10.37  )
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

The existing PHYPARAM0 tuning values for Exynos7870 are incorrect,
causing the USB 2.0 PHY to fail high-speed negotiation and fall back
to full-speed (12Mbps) operation.

Fix TXVREFTUNE (transmitter voltage reference) from 14 to 3,
TXRESTUNE (transmitter impedance) from 3 to 2, and SQRXTUNE
(squelch threshold) from 6 to 5. Also explicitly set
TXPREEMPPULSETUNE to 0, which was previously missing from the
tuning table despite being included in the register mask.

All values are derived from the vendor kernel for the Samsung
Galaxy A6 (SM-A600FN), as no public hardware documentation is
available for the Exynos7870 USB DRD PHY. With these corrections,
the PHY successfully negotiates high-speed (480Mbps) operation.

Fixes: 588d5d20ca8d ("phy: exynos5-usbdrd: add exynos7870 USBDRD support")
Cc: stable@vger.kernel.org
Tested-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Łukasz Lebiedziński <kernel@lvkasz.us>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 5a181cb4597e..8711a3b62c8e 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1958,13 +1958,14 @@ const struct exynos5_usbdrd_phy_tuning exynos7870_tunes_utmi_postinit[] = {
 			      PHYPARAM0_TXPREEMPAMPTUNE | PHYPARAM0_TXHSXVTUNE |
 			      PHYPARAM0_TXFSLSTUNE | PHYPARAM0_SQRXTUNE |
 			      PHYPARAM0_OTGTUNE | PHYPARAM0_COMPDISTUNE),
-			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 14) |
+			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 3) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXRISETUNE, 1) |
-			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 2) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPPULSETUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPAMPTUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXHSXVTUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXFSLSTUNE, 3) |
-			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 6) |
+			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 5) |
 			      FIELD_PREP_CONST(PHYPARAM0_OTGTUNE, 2) |
 			      FIELD_PREP_CONST(PHYPARAM0_COMPDISTUNE, 3))),
 	PHY_TUNING_ENTRY_LAST
-- 
2.53.0


