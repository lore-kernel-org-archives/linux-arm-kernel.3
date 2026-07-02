Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC10C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coVcvglA4gi9EbFO8pV//jEU/rmnn0BkIq6bsE7KnOU=; b=k/wPvdj4b6oiTygCO2QDFdQY4a
	Rd3vX/g1/JGIQlVesJbsde1wU7b1N7idCqmwn+WwGgSnvjJm+BsW1RzWxf1R1TFTfXGcY+7arf2co
	PAjwVToN5MdVMpQBbSSmhcJUdTPZJ5qZcI8uK5a5RaCm/H/KUHQN83CR9xJXavQlIcQk1L9zcoYtx
	nu5SzcNCrySxWhBP1QPX0U7SD7zw2wHQKTjWSJqZridTmdgK+DZqQySlRrb/3F340P+C6oNL0e82j
	Zn8U/7eRVVwKVxmIzkTku5YCEx2bWmAOtx//P0LQr1A9yMLGRY/Gpy0UkcQyjpXUuY74qE/oImM3v
	JvrgcJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsU-00000004uEP-49Fm;
	Thu, 02 Jul 2026 16:03:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsT-00000004uCG-1c73
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3315601E3;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3C01F00A3A;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008180;
	bh=coVcvglA4gi9EbFO8pV//jEU/rmnn0BkIq6bsE7KnOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=an3wJfxwsZ1QQZ2LzI+wk6yOlnJjtz02Z7f0AmY/PAelPekQDEZrvzxOSA1wH3/iY
	 vrEr1G5FEgo5mofQNlWIL1z/KgtQxRR1ES19OOa18zL4JGBN+gNW6zHYIg5NN1aKwx
	 qMpXx/FCzx4CI9upO8wZkn6oxhR0aHWoJpTDwu0tVRaz6DsyySWvgw9dkhs21x7ssD
	 fB4b5JvjBem+DCu7hJSC34hcIVlct2DpHoJRJLYGUnM2ZDloH+gMINrOIhlThsiwtu
	 CA+imR72Wt+XhpyPM81OQpoYEiuGu5uzP4ZjzJNF3Pw+s/maFc5V+payyG8+mIVqbQ
	 DhvqxpLbZ8J/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsQ-00000000ojd-2ARZ;
	Thu, 02 Jul 2026 16:02:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 02/28] arm64: Update ID_AA64MMFR4_EL1 description to 2026-03 JSON release
Date: Thu,  2 Jul 2026 17:02:22 +0100
Message-ID: <20260702160248.1377250-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

ID_AA64MMFR4_EL1 has gained a few fields and enum values in the past
few months, so resync its definition with the 2026-03 JSON release.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bc1788b1662b7..32e2f9856768b 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2386,17 +2386,40 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64MMFR4_EL1	3	0	0	7	4
-Res0	63:48
+UnsignedEnum	63:60	MTEFGT
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	59:56	SCRX
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	55:52	TEV
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	51:48	TPS
+	0b0000	VAL_0000
+	0b0001	VAL_0001
+	0b0010	VAL_0010
+EndEnum
 UnsignedEnum	47:44	SRMASK
 	0b0000	NI
 	0b0001	IMP
+	0b0010	SRMASK2
+EndEnum
+UnsignedEnum	43:40	TLBID
+	0b0000	NI
+	0b0001	IMP
 EndEnum
-Res0	43:40
 UnsignedEnum	39:36	E3DSE
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	35:32
+UnsignedEnum	35:32	EAESR
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	31:28	RMEGDI
 	0b0000	NI
 	0b0001	IMP
@@ -2410,6 +2433,7 @@ UnsignedEnum	23:20	NV_frac
 	0b0000	NV_NV2
 	0b0001	NV2_ONLY
 	0b0010	NV2P1
+	0b0011	NV3
 EndEnum
 UnsignedEnum	19:16	FGWTE3
 	0b0000	NI
-- 
2.47.3


