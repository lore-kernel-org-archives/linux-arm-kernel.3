Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DF7F513E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 22:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o4CwpLvrWMNBwZR/193ufuK7GNj2hPOpYhTODHVK2mg=; b=PUGUOS27sKvor2UGij2xUQC60P
	hoMI6s69960P7Zgh9gwlVKU+QYH3ntKeBoy4yW2AitIq/RRRCctnXaksb90yYqQ8DtQd/Yen26/MP
	u4wfDoqW7XT/GHf+FXRorEy9TE2LGdy98AUbc9oljyTJVHvaPgLPuGLvM0+ZIdGSyy6+KQOLQad4W
	Ex7EJRz7uCOLXVaBQskF98+on6DmrgsB0UWLuoq9Rba0ANLdqkJpSn+SwT632RPXzOGLMBmw3MFsO
	M3uvkxkfaZvudT4cw++bJ9jcNcGa+rdJVvNmuLnaT7UHiVNwawlgO/PhBj+/ywvo7nG1mYm8jsUGp
	ZSA166Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH8K-00000002gFp-3AdG;
	Thu, 05 Mar 2026 22:25:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH8H-00000002gF6-2ZHL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 22:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2CD060126;
	Thu,  5 Mar 2026 22:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F70C116C6;
	Thu,  5 Mar 2026 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772749524;
	bh=M1XQ6GPIPdpR5MeXci4ZnCAHWBSdef3r642MG2Lpw68=;
	h=From:Date:Subject:To:Cc:From;
	b=TY2ObdWeT6qjYHC0ZFyPdxCgF0HtRJeIndNGH1ffg5Lh/468BnncTSiAKpf3ovbnr
	 o8q3JJ73aJBYMfJ+AF5wnRSnBX365ZAt/xLv89E1AaLQRGw/CP7i81i8tZwVtAphEw
	 p9DJlrEF8MWpmC8EJSK5t/cp2adGEf6k8HIV5x4UyZzsmC+eMVS3tFGIFq7QuoIkvP
	 nWTjhGcGtC1bvgaUu06uYWwYED8xL/dY/lPd5PBbFpkY0HpJsbJPMfOKecS6J887Dz
	 Mp7OJZESw6+vDOZRwHVQLHw1a56F/jG31PsNEjltDwkvK8tJVDW10nabe6ytmv4DCD
	 cRz4nuttAbOKA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 05 Mar 2026 15:25:18 -0700
Subject: [PATCH] ARM: multi_v7_defconfig: Drop duplicate CONFIG_TI_PRUSS=m
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm-defconfig-drop-duplicate-ti-pruss-v1-1-2839e3b42a8b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBBA0as0s3YSqNaFVzEugBnqGKWEgcak6
 d1FXb7N/xsoF2GFy7BB4VVUltRhDwOEu0szo1A3jGY8m6OZ0JUXEsewpCgzUlkyUstPCa4yVsF
 cmipGezKBJnLeW+itXDjK+/e53v7W5h8c6jcO+/4B3UyVvYkAAAA=
X-Change-ID: 20260305-arm-defconfig-drop-duplicate-ti-pruss-f140cd5dabb1
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, soc@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=nathan@kernel.org;
 h=from:subject:message-id; bh=M1XQ6GPIPdpR5MeXci4ZnCAHWBSdef3r642MG2Lpw68=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmrmC4df/xMxTD6wfHp0tHpO7SD1mZtm7sj/NZbnwubr
 6/OMK9j7ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATmTydkeHrkR63lFYbSUGv
 YN/bx56oKXucv3aui/N4SvViZd41aY0M/2wFp85ZZRW/X+nVXB57U4Mj03malFPNOD8uS9k52Ss
 4jxcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Commit ee1ab82ee032 ("ARM: defconfig: move entries") added a duplicate
instance of CONFIG_TI_PRUSS=m, causing a Kconfig warning:

  arch/arm/configs/multi_v7_defconfig:1152:warning: override: reassigning to symbol TI_PRUSS

Drop the first instance, as the second instance added by the
aforementioned change is where savedefconfig puts it.

Fixes: ee1ab82ee032 ("ARM: defconfig: move entries")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c8..70d05f74049e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -279,7 +279,6 @@ CONFIG_TI_CPSW_SWITCHDEV=y
 CONFIG_TI_CPTS=y
 CONFIG_TI_KEYSTONE_NETCP=y
 CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
-CONFIG_TI_PRUSS=m
 CONFIG_TI_PRUETH=m
 CONFIG_XILINX_EMACLITE=y
 CONFIG_SFP=m

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260305-arm-defconfig-drop-duplicate-ti-pruss-f140cd5dabb1

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


