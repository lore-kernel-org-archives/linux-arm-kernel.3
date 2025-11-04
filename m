Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6FCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 22:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwX3J0ickBkFYv+967zOu+FA1VAKcVIsUcTaD7Zgs0E=; b=efMaAqGrpInnxiRUHEsgOHTpnP
	G0kx4vVdg/MLYHrAZnGLbCbdMdskpchNtPVRZiy1sR7cBNW+m5OSpVStGI/zw4pFKBVvBDAG3xmiO
	U9k35Wib303yc5nu4omE7+cUDv9RvaOXFbwl0M+dsPsI8KPYQM5vNykRCPbEh8pNmwUgk1XzCp3Ja
	okieclINBlt+ZHkq4maLmJFsgdxJCuBZXdSGBVaxL1BrExmMbvXWNlP7MdzPD6R9OJk0cFgSEmeAe
	CIbs+uxiApIcXGHYgB6kCrs6wfZkyXd4qrTBwRp/uUdkISksgvtynNJoG6gbIXSl+AvB0O8BHlA80
	cukxf2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGPVi-0000000CguS-2tXV;
	Tue, 04 Nov 2025 22:28:18 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGPVg-0000000CgtC-0i1O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 22:28:17 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 865E8C021961;
	Tue,  4 Nov 2025 14:28:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 865E8C021961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1762295293;
	bh=eMyJfYp9kZW290dl9Vblnq83aD+uquXJrXxp2Bnnug8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=syorIhIgSNBNPUlvrEtHR/NKnKUiJ1LLAuTTSkfKvdmgaNVl5OZpfWyqZcuxtzMM2
	 zABVWvWlXyMBOeh2haabV+klPgdpM/nVzdwHzeEQsqHh+XJLToMx5btB6ysiGQZLnk
	 TFBHze6FmBs6SasLDaoZ2gPgDWUFuiDwC+TjQQag=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 688661800084D;
	Tue,  4 Nov 2025 14:28:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree fixes for 6.18
Date: Tue,  4 Nov 2025 14:28:11 -0800
Message-ID: <20251104222811.3874608-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
References: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_142816_232499_4EB41F97 
X-CRM114-Status: UNSURE (   9.26  )
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

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-fixes-part2

for you to fetch changes up to 3d1c795bdef43363ed1ff71e3f476d86c22e059b:

  ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY (2025-11-04 14:23:39 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree files updates
for 6.18, please pull the following:

- Rafal fixes the Ethernet PHY address on the Luxul XAP-1440

----------------------------------------------------------------
Rafał Miłecki (1):
      ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY

 arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

