Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66EF107BCEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 00:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeTNM73eJG2bfjd9nDsIG1KEwHSf055KAcNUHmRsD4U=; b=tX/rXlrNfNWKnm3QkPDHsklUY2
	cZeH3tCz+Idl1/+Aeqe3AnO2jBjEzqFxfbjOGJu6dtaCbkYPmR9gdERHn9ipRdOZj3SMFFqm9nngr
	M9HyszK84mtREHkCpbq/MycZb0bhNAvGWD9kwL+JRBBZxyJkSa1waaan2mMWvTKb4SSHcWp2tk/bd
	vV9xmwr1r7nGbFdKmHS4u/nrjS7hVbczjxhSM83JB5fSm6q4y5R+Y/TEROkVuAaaJ2jci0cSDo40z
	wfEUIzllwcU0ynkrulawHrcop1vpbQpnk+0+fXkMSbJw5H5vSRA2sD6bhhUUo4GtbncR+2oXekk29
	3L5lXIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1D4v-00000001Mi2-3wp1;
	Sat, 14 Mar 2026 00:42:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1D4t-00000001Mhh-0kwt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 00:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7514143E30;
	Sat, 14 Mar 2026 00:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB58C19421;
	Sat, 14 Mar 2026 00:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773448922;
	bh=NpIW6+avHUeuRL5rtNbePolkZmBWuaSfoHwrvmExauM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9OTGxeaHohHVeSl/HI1G5pG9InJARTa6fLCnM+HvoclYVbY0ghCbKLDj5ekxBYZY
	 Vl/c+R8DoIgII2TOasKBtXTERZ+yrZ+0oNSfSkWkRsDNTL0ZWtllbc89KL17swTP9E
	 IGS4nDsGOALcPexQkh37T36NZQqO/KLmM8+6wJ+1f8UZSWzV6nTfwlSwxUvC09FdoM
	 Lw6CRN1gOVQVJcUcK5bGHyywIYhRxY1U2fpqycrtOuk6R4p0PxFA5Xj/EtDCM64OxO
	 incLpA+kBb9eMP2d+zhriTP8uUOzrOe8e/WQhzAqaicWnN4EPASDVWPv7WzCZf9cBb
	 S6JOPOgC/NYGQ==
Date: Fri, 13 Mar 2026 19:42:01 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: PCI: snps,dw-pcie: Drop deprecated
 reset-gpio
Message-ID: <20260314004201.GA3741015-robh@kernel.org>
References: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260312184344.42337-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312184344.42337-4-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_174203_348338_EA0B04F0 
X-CRM114-Status: UNSURE (   9.85  )
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

On Thu, Mar 12, 2026 at 07:43:46PM +0100, Krzysztof Kozlowski wrote:
> GPIOs with "gpio" suffix were long time ago deprecated in favor of
> "gpios" and this particular property was documented explicitly as
> deprecated since commit 42694f9f6407 ("dt-bindings: PCI: add
> snps,dw-pcie.yaml") in 2021.
> 
> Linux kernel supports both variants for a long time, thus listing the
> deprecated one is redundant and instead legacy DTS should be updated.
> 
> Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I will fix DTS separately, so after applying this patch there will be
> bunch of dtbs_check warnings. That's expected and fine.

Not fine. I only want to see warnings decreasing.

The justification for dropping deprecated properties should be "there 
aren't any more known users (for some amount of time)".

Rob

