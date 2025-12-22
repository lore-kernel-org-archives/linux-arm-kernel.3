Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7B5E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UzaQ0uVsvsP9DR/7XSaUNdKHLrt3MSrFE3PXxsAuTSo=; b=AooKpo4LBJqaLClMx9uyFZ1irG
	FAMlgcHiSmQ54COq4NBlqBAzcYT/UTuln6DPm10ocC1Q2AtxAgOayN9W8MD02DSIrJYbnMCcVRN4P
	Whal7bFJ/ZVzqWHsgFSe0iTUATTH3c2Fgyuq/Y4lxsK+CAFu7ogwQ9/QWyQzvnWCwqsc/kBuiQlFz
	AoG8+ZjF7XBHAbgcdE1mbV1ZljeVAXN33DsGU5MJL8Gd0ymmpEmuw+QaUAwmqaEH8CJSDEDtUBbFp
	1yxljkIcNOok8x9bm85Ox1bOMcvspRh1PW22d971w3WmMpRm8uWGw02m2TP01xzclx70RgGhWVDvi
	0Ov+sKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbzx-0000000DVSr-00b9;
	Mon, 22 Dec 2025 09:14:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbzu-0000000DVSU-1EP1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 379AE4423F;
	Mon, 22 Dec 2025 09:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4DFC4CEF1;
	Mon, 22 Dec 2025 09:14:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.19-rc1
Date: Mon, 22 Dec 2025 10:14:27 +0100
Message-ID: <2dc339bee5bee0a425e2b00bbb784b0ec21a0a33.1766394793.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_011434_434116_12AD470C 
X-CRM114-Status: GOOD (  10.94  )
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

Refresh the defconfig for Renesas ARM systems:
  - Enable Renesas RZ/N1 ADC support,
  - Drop CONFIG_RPCSEC_GSS_KRB5=n (no longer auto-enabled since now
    commit 324be6dcbf09133a ('Revert "SUNRPC: Make RPCSEC_GSS_KRB5
    select CRYPTO instead of depending on it"')).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.20.
---
 arch/arm/configs/shmobile_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 0085921833c3e832..ef487eab17cc70aa 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -202,6 +202,7 @@ CONFIG_RZ_DMAC=y
 CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=1
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
+CONFIG_RZN1_ADC=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_RENESAS_RCAR=y
@@ -218,7 +219,6 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_ROOT_NFS=y
-# CONFIG_RPCSEC_GSS_KRB5 is not set
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_DMA_CMA=y
-- 
2.43.0


