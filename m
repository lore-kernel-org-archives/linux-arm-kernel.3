Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7DFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvSIES6IEyQ/+pzS4Vivv82VkSKb23yhyX3OfxWb/bY=; b=HafWTHgAZhBKRFWnzLdjzlSGHe
	o886atNOyJDEqBCkxDezcC/yyn8Uw7Vy7Dau0aovFRnC3MoM6iqBPk+iF2+OIfKS5qJ604YZoJepk
	kGECZEAdFshL4ph1sVM+LWUuKoD5kbUDQDgopOdHGP3rBP4veEmpVcfYcPe3zsvIGFhvA8G8md5/F
	aNXb/yR4OE129NqG2sRSm33VBiFpEbt4oaHDlXbL2eLKXY6ter8P5kwg6ZP9JlF7mVNPd8rOFtN0a
	FeQErY6uTm34prTOeUjKOEHMqajzimmmRxPypZbNfQoRUtqpPRTjWU5cssibGtKowpGdcscWqGDwx
	vGbiMTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1g5-00000001OfC-2ijL;
	Tue, 25 Feb 2025 20:37:17 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0nM-00000001CSV-1WEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:40:46 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3EB5CC0000D7;
	Tue, 25 Feb 2025 11:40:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3EB5CC0000D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1740512443;
	bh=EnhW1Aazxx9SYQvF9U5ei/EmrqxOHYY3a++ZSu6gHXM=;
	h=From:To:Cc:Subject:Date:From;
	b=lkPUVgfANb5ofNw0KuHM374WRaWg1ZduWJez/vwbp/8d2UqKnEg0cs9vFhU05HmX9
	 Sn0DJacCjr+T3FJLxonaSx+p7wJrkhP9xiEPivI5tu5q/FDuw9/+3IYyOaWnpqHBgM
	 Ud91VKmAj3zlVapldU7vqgr4RBm99Gl9QZJrUlD4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 1FD5318041CCB8;
	Tue, 25 Feb 2025 11:40:43 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree fixes for 6.14
Date: Tue, 25 Feb 2025 11:40:40 -0800
Message-ID: <20250225194041.1063762-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_114044_451517_0EAAF633 
X-CRM114-Status: UNSURE (   8.75  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-fixes

for you to fetch changes up to 0de09025f161f67c07978c4742e221243d070d41:

  ARM: dts: bcm2711: PL011 UARTs are actually r1p5 (2025-02-25 11:18:41 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.14:

- Stefan fixes the xHCI power domain on the Raspberry Pi 4
- Phil fixes the Raspberry Pi 4 PL011 UART primecell ID to indicate they are
  r1p5 and thus have a 32-byte FIFO

----------------------------------------------------------------
Phil Elwell (1):
      ARM: dts: bcm2711: PL011 UARTs are actually r1p5

Stefan Wahren (1):
      ARM: dts: bcm2711: Fix xHCI power-domain

 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi |  5 -----
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 10 ++++++----
 2 files changed, 6 insertions(+), 9 deletions(-)

