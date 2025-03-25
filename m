Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CB5C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CycWdeGqT4++gVYif+8cgd5eG9/RYKKyOdgYVLuyRhk=; b=BUk4/6B7bubwyzdW2uvTGB/YKo
	Yvkzkxx4lap8TvcSEF11kLEmSMWhaeQTHLlK89TybP8CsOVJC+xxaxGJCcFtXqeunris/4QTbf44Q
	SihZw5lqbBJjVKJJA49UUCY4K3GkcHNNc7H4qLO1Xdc+kbSh6DqVpBT7FOQ5PQbDS4Y0oMK3vlw7W
	Ymq6gdvolIplVe22GC8fNz0EzSVR5pS30kN0GCVtFTTGhY4bzOttvbBPhvW2DPD/J3UPe2sJRX1UI
	nhmiUIvWFqVSdENaOT2G6rF21Ro9PavhbOP8dj5v1nOaL5nwN2yDYkS/PpOETCwLnmPe/SRIN5AGz
	C3hOalsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1qZ-00000005Uf0-1zIr;
	Tue, 25 Mar 2025 10:49:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1UZ-00000005QtS-01qW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 10:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CycWdeGqT4++gVYif+8cgd5eG9/RYKKyOdgYVLuyRhk=; b=IPe1yblJWqT0kwgkqoCrCj1U8X
	GJLQvOVJNDM9KuNdeMKqgW0K+oJs8oxzhlOtNoy7BwrvEEmAasHTd7Gmh6YHgrNMkRHLiyWGwNpok
	fo/yHYAFcuOP1Z37b8PUM3nufhby3hsFoO5c0eWeIt49/nBAlXyb8V5g5bdb1P44BL8HmprSRHyct
	5lV2tklMW5FGAVCSwMN5iUS4co3dSYyra65mvVhbnsRgW05h29itVJzY6pyi7dqGZuqqFXF9VUMg3
	2g/lcLx80MkdN+uj3ddE/WX8bxSEL8lkSWrbZVcWdrWupXtpU44u+ymyxojpxjhmrJFItLA4XrcyL
	jApb/WUw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1UV-00000005Oj7-3ZfS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D16143C80;
	Tue, 25 Mar 2025 10:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D8CC4AF0B;
	Tue, 25 Mar 2025 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742898396;
	bh=1vQPJifRV9s/zzFihe691RAxq/RpVicRgI4tNMPv98s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUDBtS4PqAalbD9NTxNEjtGTz1mgJn+UuJYeXEjupg774VvxT5qJXUDprUqGBD6sD
	 2CtC/2jFQTOSj71Nxdg0iv7wlyddSk7pwbtmxJ/3N0JD8p4Fkp93D9g1kRV4aDXCeq
	 3kAzUzOXRE1bSdGl6e4DLEkQcmCudnsJms0YVGntHTAtYmwRa+iJDixrMNzLpT7FyB
	 Zs/PWjsUyWOnQvdgLqIItz0Z+iPuOEEjLKkqi7DY5Tsp0RoZa133Pv+e3o4W7EdfBK
	 1dbjqC3zsVh0e1BHl+HU40klcnR3liAdrJbHRNgMDmmL0YdjlUrYtFgthaxWIGvoUe
	 cd8JNab55Hjgw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tx1UQ-00GsRS-G8;
	Tue, 25 Mar 2025 10:26:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 10/13] PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
Date: Tue, 25 Mar 2025 10:26:07 +0000
Message-Id: <20250325102610.2073863-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_102640_119942_BB00E878 
X-CRM114-Status: GOOD (  11.29  )
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

From: Hector Martin <marcan@marcan.st>

This is checking a core refclk in per-port setup which doesn't make a
lot of sense, and the bootloader needs to have gone through this anyway.

It doesn't work on T602x, so just drop it across the board.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 94c49611b74df..c00ec0781fabc 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -475,12 +475,6 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
 	u32 stat;
 	int res;
 
-	res = readl_relaxed_poll_timeout(pcie->base + CORE_RC_PHYIF_STAT, stat,
-					 stat & CORE_RC_PHYIF_STAT_REFCLK,
-					 100, 50000);
-	if (res < 0)
-		return res;
-
 	rmw_set(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
 	rmw_set(PHY_LANE_CFG_REFCLK0REQ, port->phy + PHY_LANE_CFG);
 
-- 
2.39.2


