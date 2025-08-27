Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6358CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/HpBdx73WG8jkJsbbvugLv/8XrN/gIbmV0MyszxUfg=; b=1UGEtA3yG1FKUkEMUQUlMgs/kn
	94JxS9IW1VTLOLNYGnqJQ0EA5tVt5T5m2xS1dKKere+TQUJK6Cc1lpDHwHqJKBTr6FeuLezpDcV8q
	QgylkG4+/C9IhnEu7Lc+CVFbRFAXmOMZ0SvteJvUjAjNawItf160HybPAuQZft+CBk4RVFxPqoTvF
	JHdctJocL76N1i28SNW4HoWXaDDUtfv1cC5J93ilii7+Cy/PuUlghxPhNwd+6pVYdXlHZEmKdyH94
	t+ydIAIzdffQxZrhaHPfcbvlYhWvGS1CDihrz86jzZci7kWvRhL4mG4w9gWYGTgugCfgpjuFCSg1N
	5DBz+MCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJmZ-0000000GI5n-2pvy;
	Wed, 27 Aug 2025 17:17:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHrV-0000000Fsfc-2TMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:14:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 084DA60267;
	Wed, 27 Aug 2025 15:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70498C4CEF9;
	Wed, 27 Aug 2025 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756307696;
	bh=gw2Ah4Rt2D+6bPW1+7M02U96xkL1iHc+3kS1D3Z/L0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAYx8mqsUEpyjqV3d0BmRT0pzARb3YUwvqI6cxKolz5P4W0Bf+U/uslnOuw/nQaXN
	 MEtT+p5upyuIPnne/UbnAFfdRtu2Iw5LEKM/JSz7zP5JYhFt+9owmvw5C9/NSLqvaw
	 vn0NgfxGw0d2ikqcCw6jzxucfabdyK8SjBEYEVohweCQmqJSk3IwkzH0L+if56SQNe
	 lZmmAb2BR+Sls6RV/QXEKDdrtv/TX5ZEEn+pzy5gMKSsMvA8KK3Kt8+AE9OX/uItZT
	 EPS+MQB3IcbLUeITEbvSNCX3AONYnf1dHX5eX8zoyP/aYdkcMC9eRR+gWfii0SgMY5
	 K7V/9i5SWn6rg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 01/12] arm: configs: Remove obsolete assignments to CRYPTO_CHACHA20_NEON
Date: Wed, 27 Aug 2025 08:11:20 -0700
Message-ID: <20250827151131.27733-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827151131.27733-1-ebiggers@kernel.org>
References: <20250827151131.27733-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

Since v6.15, CRYPTO_CHACHA20_NEON is a hidden option and is selected
automatically.  Therefore, assigning a value to it in a defconfig no
longer has any effect.  Remove it from all files that did this.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/configs/exynos_defconfig        | 1 -
 arch/arm/configs/milbeaut_m10v_defconfig | 1 -
 arch/arm/configs/multi_v7_defconfig      | 1 -
 arch/arm/configs/omap2plus_defconfig     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 6915c766923a2..84070e9698e8c 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -362,11 +362,10 @@ CONFIG_CRYPTO_LZ4=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_CRYPTO_AES_ARM_BS=m
-CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_EXYNOS_RNG=y
 CONFIG_CRYPTO_DEV_S5P=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=96
 CONFIG_FONTS=y
diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/milbeaut_m10v_defconfig
index a3be0b2ede09c..a2995eb390c60 100644
--- a/arch/arm/configs/milbeaut_m10v_defconfig
+++ b/arch/arm/configs/milbeaut_m10v_defconfig
@@ -99,11 +99,10 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_SEQIV=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
-CONFIG_CRYPTO_CHACHA20_NEON=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f2822eeefb957..cc0e0e4a879cb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1289,11 +1289,10 @@ CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
-CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_SUN4I_SS=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
 CONFIG_CRYPTO_DEV_S5P=m
 CONFIG_CRYPTO_DEV_ATMEL_AES=m
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 939913ed9a73b..1d5f752417398 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -706,11 +706,10 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_MICHAEL_MIC=y
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
-CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_OMAP=m
 CONFIG_CRYPTO_DEV_OMAP_SHAM=m
 CONFIG_CRYPTO_DEV_OMAP_AES=m
 CONFIG_CRYPTO_DEV_OMAP_DES=m
 CONFIG_DMA_CMA=y
-- 
2.50.1


