Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B04FED2E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGePfy8u6XKnqNUhFzanr27OG7V/M5+n+RUzQR7Fr4s=; b=q4rRi1272Hp+NXAa3v7tSQiOfk
	PtX7orXT8BO9966kvGIVKoybFB6Q7HN1aEbXe2xzJmHk/QT9ZX3RAua9T7ywqF/7AbqmMNyrSeagf
	fVZsxpSbccukhKTOOhw4clSyzFsjDHjiiU9YLcOege7HwqN4dgIsLdSIIn67yf4ftKtUzXf1hK0Tk
	eCLTnjFQCFyw3NNukPir0UobtJJbfHHcm/vwvRKVeOtuDyc8eoxubem+ztNc/LQq3TSm43vkNPTUd
	uolDalel0gHIihxPOOn6rP3G4OOEoXbG8SvynJH+ujxe15l+NGQNVnU7hXXLQY3+CzPI4d7Pp8NjF
	N5HxiqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b2Z-0000000DaLD-2OOY;
	Thu, 12 Mar 2026 08:05:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b2V-0000000DaJP-1nz8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 255C444404
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0380C19424;
	Thu, 12 Mar 2026 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302703;
	bh=ozzuj0X/PtzwBrR765l0/YzAmLPg8mI7Pw/GI5p4YRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ok9i91G36sGhFiu9Y4Ttdr0KMibF0qeTM7ReY6MZgkGswNfpF87TmLgC0BkoRCbOy
	 rPVAcukPTJyOrprYh9Yyz1wnCI5CVAg22KmSBBoosNsPkXvu6ZAS3EXna0ajn5HZw7
	 Sih4H8AOiTBppiAnUJZB03Oa3kfEmuDn2bMlcHxq2X00vEu19KhMxc76rkXE1ZG4Ik
	 c5Jm7JLp4xz8rmVSxTHfPqUJ5z8l/7hKLkxWUAh41qvaB72k8+ZyQbQ31WHeWRc4mG
	 GCbkR2Fq261EkYhWPD3uLhEN5NT+Fbggq7YtXeTGVWwUxZtT9C7OQo+vKjfKHTq7Rw
	 Uq0CMeAvqod+w==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [RFC PATCH v3 02/11] coco: guest: arm64: Fix a typo in the ARM_CCA_GUEST Kconfig help string ("and" -> "an").
Date: Thu, 12 Mar 2026 13:34:33 +0530
Message-ID: <20260312080442.3485633-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
References: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010503_488958_18E4709A 
X-CRM114-Status: GOOD (  11.32  )
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

Fix a typo in Kconfig file.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-guest/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 5f7f284dae1a..d295146bd92a 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -8,7 +8,7 @@ config ARM_CCA_GUEST
 	select TSM_REPORTS
 	select AUXILIARY_BUS
 	help
-	  The driver provides userspace interface to request and
+	  The driver provides userspace interface to request an
 	  attestation report from the Realm Management Monitor(RMM).
 	  If the DA feature is supported, it also register with TSM framework.
 
-- 
2.43.0


