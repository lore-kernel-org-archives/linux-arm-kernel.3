Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116B0F34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NlYr/01Hf8ueDgKH49JTXpM2lXxvGHCmjbtQwqMLs8c=; b=R/RladrGMmDrxsIg/X1pUc4iEz
	997OlsQ0l8KojSkQAXXlj+A4O2oBC0LEsRjAADroHvlyOjUIGBYH/BG4gQMeMOX1xelyLsGx1QNYp
	5p7JNk8mAkssQPNN/edGSdcfhBoIpGmju1IYxIQrZG9gH4VMhZc7EBIszFgGsF8DDHuFien34fa8o
	TICYo0TzkmZCeUWV3Qn3U+Rm6W6PjkkxLUxGYIssjWze6tItGTB+kpWxQieXUkoexW3CUS/32IvZ1
	YPDMMS+YfNX4TjTDeM2q75jtryJeZTFdqeIq/3Z33QGf2k+j2PYLrp5xzFLsYl8zMmL5+FQq3Zcrs
	oT9qaJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJSs-0000000FzvK-0D06;
	Mon, 13 Apr 2026 15:44:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJSp-0000000Fzua-1GtY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 15:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20EBC41666;
	Mon, 13 Apr 2026 15:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78F2C2BCAF;
	Mon, 13 Apr 2026 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776095078;
	bh=yFDvdAlpO+2GTLSIDX4huUh4E164R/+Dviqu5IbdcQg=;
	h=From:Date:Subject:To:Cc:From;
	b=GlOG0iqdP4QL3GxEvtfz7rceAXwbpvyhCt25NyfG0S35IjtxrHv7LQgmmnEyoHxU7
	 OSlBB7ZnOMl81VeersSoNpeEE/VznL9m061yy6aZfUxag5pcPaos2GnpaKFj6wlCiv
	 QeEb9uUm0aCo9qnpwfqtTCZt+nNTNQRjGkOr89wiBTDurBL1n9H0mFTOMnSvfzWOyo
	 vqAAUp8yQujXiLovpoPwCh0mmBaDgk3cbr0MyHXharXqTK8MXOUOIi0GpCVuLd642o
	 QdYqN3K0vyX29bjo31zYIZB0FAW2nUJQd+lN9hNbxVDpw2Gqbcbm0Jd4Pa6mJT44VV
	 9/lgRWytbgaLg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 13 Apr 2026 16:44:11 +0100
Subject: [PATCH] arm64/hwcap: Include kernel-hwcap.h in list of generated
 files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEoP3WkC/yXMQQqDMBCF4avIrB1IbAjUq4iLTJyaKRgl0bYg3
 t1ol9+D9++QOQlnaKsdEn8kyxwLdF2BDy6OjDIUQ6Maq4x+oEuTNRi+3i04csSX/JA9GSI7ED0
 1lOeSuMx3tev/zhu92a9XCo7jBOzWzUR3AAAA
X-Change-ID: 20260413-arm64-hwcap-gen-fix-ecb4bb6dbb91
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yFDvdAlpO+2GTLSIDX4huUh4E164R/+Dviqu5IbdcQg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp3Q9j/m2/9XSWqlzMydSX/95uS95aMw0C3wrNV
 kx/DtfU4mqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCad0PYwAKCRAk1otyXVSH
 0PYLB/9vXU4U7zkFeVeJFp6Kej3aS/Dvw4F7n1QrnVdHRg9FAFCphnaboBkiB0o164DeMrGpPjj
 O0aZDM5QgwO9ZbPEBqAm2kpgd+YrLqHObnHa8Bl2869h2rxK+NlZDkqecMPiWpneiFtecLYVO/S
 82HUvFDbLDQLxmcHDjozs284dKIQcWXSb4kDhwrSdCUzJPzHjux4WctBSkPzpbQxO5NNUSUWQ/A
 N+SETTn/QQ37U40mekLyEiGO9BLu37tUn1mABz0ItgPzlYxmB7X1dolt6xR0hK9x/VU/gmvn3ZB
 bgdOua/c+ZMUtXD5XOPmPMIKBmEN1Ug7UxGf4QLCcSLjtL/C
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084439_368489_63E77411 
X-CRM114-Status: UNSURE (   9.06  )
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

When adding generation for the kernel internal constants for hwcaps the
generated file was not explicitly flagged as such in the build system,
causing it to be regenerated on each build. This wasn't obvious when the
series the change was included in was developed since it was all about
changes that trigger rebuilds anyway.

Fixes: abed23c3c44f5 (arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps)
Reported-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/Kbuild | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
index d2ff8f6c3231..31441790b808 100644
--- a/arch/arm64/include/asm/Kbuild
+++ b/arch/arm64/include/asm/Kbuild
@@ -17,4 +17,5 @@ generic-y += parport.h
 generic-y += user.h
 
 generated-y += cpucap-defs.h
+generated-y += kernel-hwcap.h
 generated-y += sysreg-defs.h

---
base-commit: abed23c3c44f565dc812563ac015be70dd61e97b
change-id: 20260413-arm64-hwcap-gen-fix-ecb4bb6dbb91

Best regards,
--  
Mark Brown <broonie@kernel.org>


