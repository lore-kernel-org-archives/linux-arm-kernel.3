Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527A1CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRFFqQOcyYa8SYcuThyFS6mpUDGAJZgovKMt0+uSYFs=; b=QC8sZQu2Ix+RIbG0hN84NBBAU8
	hjXxciOaFoBvxFY9BrbTjGcEYQj+NWLoNWb7eNOjgqFyqqh2FUMk1HyCIfpDBqwZJ055drSk/qAs7
	15XiRr3TD941bqiYajzjy5HfqxtdnFw2t5E+uW26A3PpD1avEFNEUtAX/HbxT18KUy3Gs8e4Fr9Y7
	XXT3EdojBDWOwKRUzHgTujmfWy9E7/Za0S6RG0p7gpDuomUAdzp1cLAeNNAzaMI9bGaIfT0parg0S
	EBAmKZEmiZ4SBDItIU0Pmhwl2l7XM3e1NzCMd/E+IHrirMITHVbXFcUB/hN1s/srx0DbCYcpghZbZ
	qEPhR7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz7e-0000000Fbrm-3y1v;
	Wed, 14 Oct 2026 13:34:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz7Y-0000000Fbpo-2jSv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:34:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5419441FE9;
	Wed, 14 Oct 2026 13:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38741F000FF;
	Wed, 14 Oct 2026 13:34:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 0/2] PCI: iproc-bcma: Use EROM instead of devicetree
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Semih Baskan <strst.gs@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>, 
 Rani Hod <rani.hod@gmail.com>, bcm-kernel-feedback-list@broadcom.com, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
In-Reply-To: <20261013220421.1588051-1-bhelgaas@google.com>
References: <20261013220421.1588051-1-bhelgaas@google.com>
Date: Wed, 14 Oct 2026 19:04:01 +0530
Message-Id: <179198484126.63727.459652495621312738.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=oQT/vFq4L2+1ykzH4bcsj6Dl0qjssokYfXpiBYK9RgQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqz4TMGL/YtFvclINMLC37pDBET+uU5MewK8ZwK
 mLcXFFcMzyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas+EzAAKCRBVnxHm/pHO
 9TFJCACEdnC2gLjnShD19IBYYT/ZlRWSBBIhCLaM36uZM/D9ApdLK3k+oGIg+xcBjIAp7RR5DO+
 9+gSYdovqZ1bGIxwNVoZ9NedvDKPNp6am9yjm2xMC1pz93S9Yvr8HYjoj+jyEXLlnLwEYChm8vZ
 CTC+dm++dijdj7VQvPuc59vCNvhuIo2FwykeHMH3T2fN7T1Tc+xX30QhqVI5mf7VtcRQjLJ9G6Q
 zpBA39E2NGkeGNrzDx2YYkonv21lA4xVXXwAVbL7wX35mIPYl9rWpDoZHFEADh4gSH75D9UAJyZ
 29ysRxwEFWC+zTGbxEQkTDhlAYagIqt61/1cX4MEca85rKTM
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-10-13 17:04 -0500, Bjorn Helgaas wrote:
> This is a combination of these two patches:
> 
>   [PATCH v3] PCI: iproc: Use the EROM outbound window on BCMA
>   https://lore.kernel.org/all/20260807160526.379-1-strst.gs@gmail.com
> 
>   [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
>   https://lore.kernel.org/all/20260912043626.437-1-strst.gs@gmail.com
> 
> I think it's a little simpler because it keeps the use of devm and it
> doesn't require two pcie-iproc-bcma.c patches.  I didn't sign off on the
> pcie-iproc-bcma.c patch because it's Semih's work except for the minor devm
> adaptation.  And the commit log probably needs some work, but I don't know
> enough to describe the platform/bcma driver issues.
> 

Applied this series to controller/iproc-bcma. Note that I changed the authorship
of patch 2/2 to Semih and collected his tags. But I didn't add your s-o-b. Feel
free to do it yourself, if you seem fit.

- Mani


