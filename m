Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED5FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Du1q0d8iaqBmjtERDybGAzIfy4R227O66LOdBibIRSM=; b=2zBAvtvD2+iRfDy22/pljIZgsK
	qf4X1O6diuWrJyMOrsc9Hnkx1SfPMROHJRKx21fTI2uEJqBrSac7OMUBRAw5J7mdQ4ckA1pvudfR+
	SnaTV/NTrIWftCu6xtHt5Ue88fRzzGO7VBFwNLVNIcITYhq769n8ivA/SAKFHSfUnbaMO+fCdEk/p
	uhtXq7TG0otGPWRTxnkgklm33cuRmRkpKheNFeDa3PyE6QhgR3lsb1hpSnJA8NbpaJ/NXHoDRpc5j
	MQPCsnrqWHKumDNIGpFIvUQSa9vnD/EUrS8E2w2aDPS50gWfD4wHlfWGVeZnts4DjA8wdYZVMsnBc
	5FikcgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HUZ-0000000D6ZT-4189;
	Mon, 13 Oct 2025 12:17:31 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HUX-0000000D6Yp-2osx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Du1q0d8iaqBmjtERDybGAzIfy4R227O66LOdBibIRSM=; b=21iEEdtVLyqas0aNnOcZjTKntt
	ZNA7ATosy4Fr6Ptu7q5SB4+t+eicCNXHJtqyfeYwxRoU5FnflligZ51sejMPaKdzk7NVPwkhIxwxA
	vdrXQY5vAyFZ9aPw7t3pFxRVFynn9TRaYZoQNcFN1dmejBRSw1Q3h6nEGVXT3Z0TNHcpujngvKX+8
	CcmbN5LB4WKGPNrbopZ82KmBlp8t1OSJT9ElcwYu4b/s25OK0HbUxi1oY+HkK3Yx8Uqka8AAj3wGa
	efh3upEJn4JIyBOPIFoG7PWpNN60yLLCMi2rFh3cr8+V7yVLMFI3g0ilK3aBO4oVMTdKZyjzAEUeK
	jNnkhKxg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: linux@armlinux.org.uk,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	ebiggers@google.com,
	ardb@kernel.org,
	dario.binacchi@amarulasolutions.com,
	martin.petersen@oracle.com,
	andreas@kemnade.info,
	alexander.stein@ew.tq-group.com,
	stefan.eichenberger@toradex.com,
	lukas.bulwahn@redhat.com,
	tytso@mit.edu,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: imx_v6_v7_defconfig: enable ext4 directly
Date: Mon, 13 Oct 2025 14:17:09 +0200
Message-ID: <20251013121709.104546-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_051729_707516_256195E5 
X-CRM114-Status: UNSURE (   7.62  )
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

In former times, ext4 was enabled implicitely by enabling ext3 but with
the ext3 fs gone, it does not get enabled, which lets devices fail to
mount root on non-initrd based boots with an ext4 root.

Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/imx_v6_v7_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 9a57763a8d38a..0d55056c6f821 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -436,9 +436,9 @@ CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT2_FS_SECURITY=y
-CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
 CONFIG_AUTOFS_FS=y
-- 
2.47.3


