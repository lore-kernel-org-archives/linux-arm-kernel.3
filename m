Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55CAC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iqcd96nlY106fhrvsfy5HJhejARjxmdgxf5MpsYVaGw=; b=dzrlcIjGEpqrxsHdOVh9sjdlKg
	mJbnKI4SJVVtHK2aHnyN4W6QRpy2S4dNG0KhrQkCrad8ycI8gBX+UThz5fO82xlHRI7j1SqqCGTVG
	PiLWztJkNc5PKC5JFnwcFqBHI2VCyJi6JCDMdaaTQlyhQ7/T+TRz0AbxjTL7Yuv0Ly1l7rHQ42F2M
	tjpd4DKCuKeO2Q6DwNCj4+5FdcO3AemPRpO7e6cRuEinExE6HeybhNdc2oeYii0PTCx64cnyzY0Gk
	kKSPQnwj4qdfk0kOlCsmotYs3z0DCfCYHJAmSdxjc8Tch6bhNzAxqD2boobcaPj6AHT2rDe18k6zg
	joT9jtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lOG-0000000ErPs-0aN7;
	Wed, 02 Sep 2026 13:52:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lOE-0000000ErPR-0KdI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:52:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0B2C600C8;
	Wed,  2 Sep 2026 13:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DEA1F00A3A;
	Wed,  2 Sep 2026 13:52:27 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sekhar Nori <nsekhar@ti.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
References: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
Subject: Re: [PATCH 0/3] PCI: dra7xx: fix resource leaks in probe error
 paths
Message-Id: <178835714722.82225.11480476424664369256.b4-ty@b4>
Date: Wed, 02 Sep 2026 15:52:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Sat, 22 Aug 2026 23:07:46 +0800, Felix Gu wrote:
> 


Applied, thanks!

[1/3] PCI: dra7xx: Fix clock enable leak on probe failure
      commit: 06c32f3b16ce892f6a64a60be630408fbae84912
[2/3] PCI: dra7xx: Fix device link leak when devm_phy_get() fails
      commit: 2b9a036b568c94921af376f87dd394a325da7a02
[3/3] PCI: dra7xx: Fix device links leak when dra7xx_pcie_enable_phy() fails
      commit: bdfdf654b4b2762b5ae48325d6dd8e0f3529cab3

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



