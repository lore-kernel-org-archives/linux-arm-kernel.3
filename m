Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E83C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DZw/9RVEsH3JR9w9sqeBYbH8w52//MKi02fJBJY0xe4=; b=NmKZHYGns6Ih1e
	u9qcl7B9ntQ0BYlvfBzuBBQplmb2NrJeWwsRAhAxMd/l+UK/sTyPQAUlIy8xAJ6e0nFzwFYfQftQI
	IGB9UNtdynpQ5rewbCFPfjjI5aNANbnRc1vNFNXF6epvXUyuIS1I5/WWz3sAun6oHYclKfXMAGvsP
	Ehua90lft67t8n/YNW3dz9VpISe/M41In2R/t3nlnugIxkXP9iHWNq73TESeRcSJFwzpJbhgNer7E
	8r07MkvpI3Uefwq+eNOsGf0kDhuxUJIA1b1ANUjIekgY8a68kd3gmMPFByK+A2LAUZ2pSonttqGpX
	HdWcRAEhZTtvYekk7IaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzkY-00000000xPb-2vQp;
	Tue, 25 Feb 2025 18:33:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmz1Q-00000000jcc-0Cjg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:47:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FE7F5C4870;
	Tue, 25 Feb 2025 17:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6EFC4CEDD;
	Tue, 25 Feb 2025 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740505626;
	bh=yJ9AFWppODyVrEr9uR6wXcH0kti09dQZ8V0up06BTsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nN957pH2SprSYJYtzecqNvmYr1xfpKShwYCQ2XRLS6+UM4JCpBi0befIteGe+92se
	 ctjouRWIqnpO9MFEpR8MBFtFRSoIXzG9DSWngiNb8OIhatYB0SYCAspA61xY5GxO9e
	 CPG3Et/RWGbCY2LaLcANCkNojaxC/vbmPToWYzcruc9RR6eHqPsp1BDZD+otkeM4Al
	 43tXKWg9COmTRrn+OgoK1iGCOsSBVKbNmvaVqhreyxg2T2o5/4uqEXgxdK+GYKWF1r
	 0V30/Gezrav9lTAiCAVZjiTAEMzz/ea0d6PHMz3HF1wBiHMnC03JFLnNargzkrrf7X
	 O40w2GbccO4pg==
Date: Tue, 25 Feb 2025 11:47:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 3/3] arm64: dts: mba8xx: Remove invalid propert
Message-ID: <20250225174705.GA511096@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225102726.654070-4-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_094708_130092_F38232B9 
X-CRM114-Status: GOOD (  16.64  )
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

Subject line could include 'disable-gpio'

And s/propert/property/

On Tue, Feb 25, 2025 at 11:27:23AM +0100, Alexander Stein wrote:
> disable-gpio is an (old) downstream kernel property, which slipped into
> DT. Remove it.

I guess the implication is that the driver has never used this.

> Fixes: c01a26b8897a ("arm64: dts: mba8xx: Add PCIe support")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/mba8xx.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> index 117f657283191..c4b5663949ade 100644
> --- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> @@ -328,7 +328,6 @@ &pcieb {
>  	pinctrl-0 = <&pinctrl_pcieb>;
>  	pinctrl-names = "default";
>  	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> -	disable-gpio = <&expander 7 GPIO_ACTIVE_LOW>;
>  	vpcie-supply = <&reg_pcie_1v5>;
>  	status = "okay";
>  };
> -- 
> 2.43.0
> 

