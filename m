Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77F9C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ug2PFfl1kVCa/AMMLBmAuQNsYDTChSLFPxolpp21vS0=; b=wj0X5r97iLD39TLBWTo+4NM4oP
	qSrQztdbm8/Tq6AiZKyOIhgfDG9PRmn/mR0b6i6aMZP2uQIyZtc6XpUgv3Ln09uE/7I4HRboLrENc
	hi0W8Bq0lSdBz6+WDk86fgY7eSnhc9iT+G0OuNUFh/yGAhsjJ+zw8Cem9C3hnlY7CZdOZwHxcSl77
	WNd9+Nx03bUBQZLR3zMDQt2GsCytyQ2+jxosdEAIz+Za4zp2DQEHSk2NB/GNhEeV91Ee814wb4YvH
	igcJ4ggur9w8uPGLP4zDygqetRb8Y/S9dGHvbxJhIyRKLqG5LQdTcG04EGr3Xi64k6cuN9aNk1H5B
	e1m/71fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa80-0000000BUbL-0bIV;
	Thu, 30 Jul 2026 23:25:28 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpa7x-0000000BUb0-1Emk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:25:26 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9C40DC0003EC;
	Thu, 30 Jul 2026 16:25:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9C40DC0003EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453922;
	bh=Uc+eyvzGbvvd3Oto45mr6JOPfvyYJt25U56/YBpbzmY=;
	h=From:To:Cc:Subject:Date:From;
	b=TQQ03YQFsvFtaxSNFTx2n6vyK2N+vyQYNXXQDzHA7mEzd7GjCNXWCpt07hiyFcDd0
	 qhmDqPOdSC9xNAaGMm7JIpP7YCwAz+hq9uhyfX7YrhiGOg8kIkgNnDZ4cBQnXb/j9c
	 qf1Y5beAPqzKwMpbU/a61fB2j0ubW5w0Xp2KKKsg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 520ADAD9;
	Thu, 30 Jul 2026 16:25:22 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rosen Penev <rosenp@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL v2] Broadcom devicetree fixes for 7.2
Date: Thu, 30 Jul 2026 16:25:19 -0700
Message-ID: <20260730232519.2706487-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_162525_460049_3ED9DCAB 
X-CRM114-Status: UNSURE (   8.91  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-fixes-v2

for you to fetch changes up to 6de6732c4c784ce64e2457630ca800dfe5efb774:

  ARM: dts: BCM5301X: EA9200: fix NVRAM size (2026-07-29 15:42:57 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
7.2, please pull the following:

- Rosen fixes the Linksys EA9200 NVRAM DT size, the 2nd PCIe controller
  interrupt that was duplicated

----------------------------------------------------------------
Rosen Penev (2):
      ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
      ARM: dts: BCM5301X: EA9200: fix NVRAM size

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi                | 2 +-
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

