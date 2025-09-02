Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2DACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUBfwYxW1nvvuYNEneDVf7LTWstMzBFY9pFFojOedXo=; b=q7IHKA802dqMeENhqv+sZEPTqD
	ccqgLvz2sI1w1A3r2y+J1/xmC2/32H4/Bgzb5edhtO3TXS5ZKPylYtG/V6ASn12YflBmm8xAEFBHr
	DNMtBc0clgD7iyVf2x/Umedy91C40SuF4eDB8Csemr842gTQtKUXKpfL3fJtkU1BX3hWrQt66B95y
	0EyRDioBKmb8mIDz5NszzaBO5AvopuFFKUkka8hTs27rnG+01TRf0hOkST1zGsgGeNz4jbMkDGlAc
	mW3Qff7Gy5a21C525Vq2dcPr+px3soQ4QD8qcUF/A1r53TlH/LB+cwOKck7Arv4FPAUKLESQX7ufZ
	qyjxtovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbdi-00000002s1g-1v88;
	Wed, 03 Sep 2025 00:46:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYEJ-000000022xL-2RXw;
	Tue, 02 Sep 2025 21:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3996600AA;
	Tue,  2 Sep 2025 21:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7E9C4CEED;
	Tue,  2 Sep 2025 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756847270;
	bh=9luCV5wJ7yhlC3yg/FU3fC2wBmgdOhCw1dNsvVhR9Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxnXewTTWw6LCguvMQAYfSS+fRbXyCatwmElT4fUFOzGF9/BkV1YqpVOHxT39Zudo
	 WaQV5PYFVZk9ZEs82zoBxj0Cj82h3+QEKCineK7pc2x4k/WzfPeNazBLRPoUv+EmXH
	 aWzxTAcZ1mR67eAFwippzDSsDhT3ylhGLa8naxoD22lYW/xW9hWt1i4p6l5tulTvZS
	 ugBXu9ZYIBH04U+RSzsJNFz/m7L01NueVWKbq+8Um5eDhtvJlBRAWEScWr8QYgkCfR
	 LTu161GIoOH+wtN06Tn0z1zoYEqWEXjwRHTflkCH5c3oAaSz7GtYZ5ukXvVpBVXuXd
	 wsYCz+LwBo3/w==
Date: Tue, 2 Sep 2025 16:07:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, linux-kernel@vger.kernel.org, joel@jms.id.au,
	linux-aspeed@lists.ozlabs.org, conor+dt@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, mani@kernel.org, kishon@kernel.org,
	lpieralisi@kernel.org, openbmc@lists.ozlabs.org,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	kwilczynski@kernel.org, vkoul@kernel.org, linus.walleij@linaro.org,
	andrew@codeconstruct.com.au, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 02/10] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
Message-ID: <175684726867.1179507.1325689582067833868.robh@kernel.org>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-3-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901055922.1553550-3-jacky_chou@aspeedtech.com>
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


On Mon, 01 Sep 2025 13:59:14 +0800, Jacky Chou wrote:
> Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
> The PCIe PHY is used for PCIe RC to configure as RC mode.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/phy/aspeed,ast2600-pcie-phy.yaml | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


