Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F45CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln8A9uYnUZkD5x3i3snIDklQyEVuLgzGaURMVNNeVmA=; b=c/2PYKd30ON4nVGydIZa3d6ior
	WAl6HdTyAtWfUByI7e7IS6iRFsiRvlZf0OY8XzPAGcCOooQseKRNpRuVeHLWojoXnYSK8nMf49hs9
	q6/vY02SYBYWssJ4WHPqPWZB6l1h1EFR7dcmr/mp+5DTowxoIbFdqzGjWkezSlfw9wt8Y0p97gU+G
	DmwTxWeZblubUyGbGhZxOn4PoBXD4FnToFj930cw65y3yqA8T7lFfgyhOv3gNgkt6KbJTTE+Teu9y
	zBGbovbOZ0muLRetvpFh4wMjfypsi9AVMmGaCGk4xKKDxryXgwmQ7U97NoW41o73RW0KEYvf4nYy9
	eugiz5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MT7-0000000E3JB-41yG;
	Mon, 13 Oct 2025 17:36:21 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MT4-0000000E3Gk-3IML
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 17:36:21 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E34FBC0003DE;
	Mon, 13 Oct 2025 10:36:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E34FBC0003DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1760376976;
	bh=YvvcExKYd1+apPlAedYXi8ch9fKDzLoyfkAmUvpTrn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEygW4fGY2B1MxdQyeYpasJEaWD4mlIVIn5n+HgIcKAn/SkEns1WbLEcyFIm8FHuv
	 W3o41d2qcROP/Jak0K/5/ntDl/EozGXbjWwJUsd2cx/gHVPjP0Z9GOhWl4E+7XLUGw
	 ONTKW2TP6xf5tbibihokHgpxr6+MR600cPMZ07Vo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 299F118000944;
	Mon, 13 Oct 2025 10:35:46 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom devicetree-arm64 fixes for 6.18
Date: Mon, 13 Oct 2025 10:35:43 -0700
Message-ID: <20251013173543.2489346-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
References: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_103618_892135_9C7B8F91 
X-CRM114-Status: UNSURE (   8.21  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-arm64-fixes

for you to fetch changes up to aa960b597600bed80fe171729057dd6aa188b5b5:

  arm64: dts: broadcom: bcm2712: Define VGIC interrupt (2025-10-13 10:31:04 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree fixes
for 6.18, please pull the following:

- Peter describes the VGIC interrupt line such that KVM can be used on
  Raspberry Pi 5 systems.

----------------------------------------------------------------
Peter Robinson (1):
      arm64: dts: broadcom: bcm2712: Define VGIC interrupt

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 ++
 1 file changed, 2 insertions(+)

