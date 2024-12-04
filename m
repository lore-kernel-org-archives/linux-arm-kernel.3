Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D4FE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgahl4m+3+XZp9flSnrUDfGyMzC7fnB+TqfUZdAvcWM=; b=ix72z3bR14mIsPRO5BHLwWQYBh
	Wj6ZC097CHqTZspgB1I2GuEf94nUKaovqlw8xpXGRMUGnzqKzp5Q1F8jSilV5N0ONBJBSjfEsco9D
	2x4GlTBx/dNCnMPS1rg3Oc5lbn38e8EiVkcEiM0FBunKhnSZj2bZUXeVPpwV0515rtplGmeac56zu
	ox1q8ZxFW9ocFfycR1ZX3pGt8kWKNhQBFadDHRGmXiZ9YEZY93e8SYBAy7k0+aEm0E1iYuboarplm
	R9By3K2emluO5GrTiOhdm2e0cPcEdVPS7JRanCkZFxRWlPXylDlz5qjnlMwOqKlur/8QzA4fSBB62
	dHq63P6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpy4-0000000CklH-2k0Q;
	Wed, 04 Dec 2024 14:03:04 +0000
Received: from gauss.telenet-ops.be ([2a02:1800:120:4::f00:11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpx2-0000000CkVk-3d5y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:02:02 +0000
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Y3K2S19pSz4x8Yv
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 15:01:52 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:8249:563a:8153:89fa])
	by laurent.telenet-ops.be with cmsmtp
	id ke1q2D00M1ljHKM01e1qCN; Wed, 04 Dec 2024 15:01:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIpwr-000HEE-Dc;
	Wed, 04 Dec 2024 15:01:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIpws-00DJcO-4S;
	Wed, 04 Dec 2024 15:01:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.13-rc1
Date: Wed,  4 Dec 2024 15:01:47 +0100
Message-Id: <b8727e642508433016290a998c880b54de2e208d.1733320866.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_060201_044065_C67DBF84 
X-CRM114-Status: UNSURE (   9.73  )
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

Refresh the defconfig for Renesas ARM systems:
  - Enable RZ DMA Controller support, as used on the Genmai and RSK+RZA1
    development boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.14.

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 0e380e450a620e61..fd28f3176c6ba181 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -192,6 +192,7 @@ CONFIG_DW_DMAC=y
 CONFIG_RZN1_DMAMUX=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
+CONFIG_RZ_DMAC=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_ARCH_EMEV2=y
 CONFIG_ARCH_R8A7794=y
-- 
2.34.1


