Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8C7C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 21:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=62J/dEyN/EwT8abgITW4qqx9cwe9pAiVlD/mAy/C0zE=; b=bZpWMozKuAcra6x/FFUuHcpMA/
	SXxA2NVgbhl7U5H9vXJPDHagPPUtR5CFC3AsCE/DWVcID1xMaBm4dcIZN3XqqsjZ1AQNMIrHr00ZI
	GZC83PSKtJpwaGKYKiBp1QiJf7JxhvKCvTJjqrCQgKho5PcwByapGBzGh5ZQMHVT3VDLMFQOU4n4e
	0KIQwEAYhEt37NMmQWUYu3JSTuLooO27b2PTQkjkqsSnlByENCr+ye9bKtDIb3VEHNyGigUo1+oTD
	QORd/ZSJTdNY6iJru2x23vjeA6eDqwf44mi+VQJI4l1QHULDQ5GCe7X5U4TC1todcVKxeQCQaWADK
	JmyhVvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrVa-0000000061Y-0mcL;
	Tue, 29 Jul 2025 21:05:14 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrNp-000000005EW-2e1Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 20:57:14 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id F2A86C0000E2;
	Tue, 29 Jul 2025 13:57:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com F2A86C0000E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753822633;
	bh=ckxxI0pEhUoNwFhENigVXMswGZJ3obdfkxnF7idf7f0=;
	h=From:To:Cc:Subject:Date:From;
	b=ZBXG1ZIp4dGKZ6WWka60on0NSyHGtz87i3UjF1qPsnoManPmBNTFZbOAGtOA5Icd/
	 OTxtjZ42b2e0SiXmpJCJ2zoGP1Y1+W+HS77lSzo8YFcwrPV3vo4qMiOm8PGAfwQCNe
	 6BcdifUimrhsuiGSSDdDKrUFpdqfTb8uv+P9PLAo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D6000180004FC;
	Tue, 29 Jul 2025 13:57:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 6.16
Date: Tue, 29 Jul 2025 13:57:11 -0700
Message-ID: <20250729205711.3393417-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_135713_690427_17008267 
X-CRM114-Status: UNSURE (   8.57  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree-fixes

for you to fetch changes up to 0c927d478486fbc96a225aeae6705e7152700c87:

  ARM: dts: broadcom: Fix bcm7445 memory controller compatible (2025-07-15 10:42:18 -0700)

----------------------------------------------------------------
This pull request contains Device Tree fixes for Broadcom ARM-based SoC
platforms, please pull the following:

- Florian fixes the bcm7445.dtsi file to conform to the
  brcm,brcm,brcmstb-memc-ddr.yaml binding after 501be7cecec9
  ("dt-bindings: memory-controller: Define fallback compatible")

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: dts: broadcom: Fix bcm7445 memory controller compatible

 arch/arm/boot/dts/broadcom/bcm7445.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

