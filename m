Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C241C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwnTHZKkfxEnp/Ss1vXJUtlWc7EFWd8bXzp0BCH6DE4=; b=PEcAQkaqbjB8asS5Na0WHpT9Hr
	vsH9oUzHgCp1cYczPmG58TyKd0IsCvUcD2SZnr4TV57UbDP6so2EIukrneezmjZ35N1d40gP6Wu6j
	ve7fsdp46BfUdyNabgJ7IeOx/LX3Q6YTzYeLcSa7/HiXZCoMcZF52kOUMg//WUwNj0V03vO2xcHdm
	SnnlDxQl03BJIFKtkZgqCaSZ89bUztmEeEdno3yODM7nU++kfpK1qJg8apJVliM17iUIvZeVM2OvA
	GRw5wNhK6yHJPXwm7LNZ5d0/iTEBX3mVmE9WCBazcrJ/TyXUNpn721SbTGSZBU3dt2a0K7P1lyM2I
	IdkJeJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhq9-00000001vxP-2GP8;
	Mon, 07 Jul 2025 09:08:45 +0000
Received: from proxy25215.mail.163.com ([103.129.252.15] helo=proxy41135.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgsV-00000001o95-08er
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VwnTHZKkfxEnp/Ss1vXJUtlWc7EFWd8bXzp0BCH6DE4=;
	b=BbL1vs6bgrfXA5oer3T3euuo1ru71ZQhna5Ez6l37/zsnzehv65QHggSz5CZEh
	50ITyzDsyTxJFWeerdBL0BjHoBHJ9BJC1v5PpkcC5zMcPmGDg7U5wooY/KbZXry2
	km9L1+KIljbYgKP9PixWKdPPnEZUQD9BbbJaBakQx+xyM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnlanpf2toiac8AA--.9068S3;
	Mon, 07 Jul 2025 16:06:03 +0800 (CST)
Date: Mon, 7 Jul 2025 16:06:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Add
 watchdog ext-reset-output pin
Message-ID: <aGt_6Kfe4IJ0XeVc@dragon>
References: <20250626071629.3380656-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626071629.3380656-1-primoz.fiser@norik.com>
X-CM-TRANSID: Mc8vCgBnlanpf2toiac8AA--.9068S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOmhFUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQsPdGhrf+tXygAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_010707_518185_3D68431F 
X-CRM114-Status: UNSURE (   8.90  )
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

On Thu, Jun 26, 2025 at 09:16:29AM +0200, Primoz Fiser wrote:
> On phyCORE-i.MX93 SoM, the SoC WDOG_ANY output line is connected to the
> external pca9451a PMIC WDOG_B input. Apply pinctrl and set the property
> "fsl,ext-reset-output" for watchdog to trigger board reset via PMIC on
> timeout/reset.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied, thanks!


