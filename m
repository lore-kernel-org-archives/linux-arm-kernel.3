Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF15D0EE13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 19:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=z8Bgbj3Y8CL5OG8TO7wntYqqsdNhIWTyh1BGi5By8V4=; b=dlu1hq08QryrTn
	zOrgb3HS4Oscr7dUkIBDfkPyfevN0y7U99cCHbD88VFKTsaR8uvNDLlJMutNwTQOTWPX7+rhVjLmM
	hTv+FXNq72s9JI0zgK3zDkYagIXYE/F/zwYGBdVOt2+axpdg2jRi3lRZfyOFO8X/GrCoTRWWdQt4J
	UI502q7aJ+wl8MOGWh1LCaoL6qsZ+lLFQQ4cJNJ/7cjGcHMwDM+HstWEz7rMP3LcglW+20dDZVfk3
	k3wvm+Szn/7A9/Gz//x1LZBo4//ItfG3NeD3k92+lKi9Dg3XPuA902RXBebmCFUiLRJiRzQhgb8DE
	poeKMTnxg50ld/NmqyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNybL-0000000DpRu-094K;
	Tue, 25 Nov 2025 19:21:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNybJ-0000000DpRU-3Gy8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 19:21:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC43B60121;
	Tue, 25 Nov 2025 19:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6871BC4CEF1;
	Tue, 25 Nov 2025 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764098480;
	bh=PXaLfSUsuiuasxe8ptDZqo4sRgBk2ZXuALsf7QVCuE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kG2/IxkADqb5FQMH0ZNvEne5eExlYkB9BxCdsLPKZ0R1x6U5p8Q+e/G99iz8R7gNb
	 rIjRCk5pklp168zSMPOh56TVmcGFDeoH+GTj8bnmY/awFj04R1/KK7C2aFxMd6vt+6
	 ALnCNr3KbtbzNp0iId/Bia4e8F2Izpgk53UsI6zHZP7ZYYAByceMDPDmQ+WnkuoKck
	 w4WLcMnmUJSWsDetaV/F6X3w5ISKZTIzGbAKmYkeKnXgDtpNICtEmemA0LtWSWUbe+
	 2reFteRwqJRoBVqILlw+MzmJSJM7wHn0Jb1iRJRughegNo7iqLDFOFEKS4KvrRd4zb
	 jx03grabuD6UQ==
Date: Tue, 25 Nov 2025 13:21:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org
Subject: Re: [PATCH 4/4 v6] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe
 driver
Message-ID: <20251125192119.GA2760316@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121164920.2008569-5-vincent.guittot@linaro.org>
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

On Fri, Nov 21, 2025 at 05:49:20PM +0100, Vincent Guittot wrote:
> Add a new entry for S32G PCIe driver.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64b94e6b5a9..bec5d5792a5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3137,6 +3137,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
>  F:	drivers/pinctrl/nxp/
>  F:	drivers/rtc/rtc-s32g.c
>  
> +ARM/NXP S32G PCIE CONTROLLER DRIVER
> +M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>

Would be good to have Ghennadi's ack here.  Don't want to sign people
up for work they're not expecting.

> +R:	NXP S32 Linux Team <s32@nxp.com>
> +L:	imx@lists.linux.dev
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> +F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
> +
>  ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
>  M:	Jan Petrous <jan.petrous@oss.nxp.com>
>  R:	s32@nxp.com
> -- 
> 2.43.0
> 

