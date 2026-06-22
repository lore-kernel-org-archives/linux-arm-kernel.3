Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242BBCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 15:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0E00buD9oFi1l3xPWxuJLb9QwIMsgt/Kp7Y9WZb8rM=; b=wYLIO9FoX2HdLZDdHD+dQ/Qrch
	16OZ6RB7Uj1cWCQj9jOQMbXTK9PIoaA6cZP2y1Qrj8LtdEQ+jTRyMJgIQOLhc+DbXf8bmIkm4s9st
	6xhDJYsG6K4Xvy8ibwS/CwyA5mpSPRP/gttWXjtPJhyTarQUxpW6VC0U9GlnSV8l5XHrAvRU5V68i
	WWCzdStpi+VgSUt60lWiZY04iX4KGSj7OQ5eLe1jB8rorh0qB9pwjJjBcrldcoUdSGmx9tsHs7y3e
	5K2apIHX+o8QCT+w+iOhRnSdT4CiUuY+JrPuvVagsFaJgziAycndGAIm/7wDIDcqTD0TxAL1D2NRW
	aefFe5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbgn2-0000000591I-1REB;
	Mon, 22 Jun 2026 15:42:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbgn1-00000005916-2LYv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 15:42:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A57DF601FE;
	Mon, 22 Jun 2026 15:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E631F000E9;
	Mon, 22 Jun 2026 15:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782142942;
	bh=h0E00buD9oFi1l3xPWxuJLb9QwIMsgt/Kp7Y9WZb8rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QpWZktXYyPViHwjudKgsTg97/fRthbwJv0/aE9xz87I0WB+0qZ0vwULG7Tfj4Yul6
	 3gJasZdeh5TGkhxrURJYtvHxLIZtV0Z+xSJfToUzbfQ+ubzAFQb1ala3gDj0cZyTJN
	 QFxruOvCX0OMIpTy10Yzy9h77zkShRtZ3Tg1J+k0j8cJfHAj8weJ2bhplVUdp4EPjN
	 zwlZkUbctMRDtYX7QvJPLurKJaIPu2ZrYTata5K9uSOufPxMZkDu4is6y1I+8HkJfa
	 3ufjkAyPkBRnCPxYfcvfZJSFTIk+S46VfJomoViLyeQpe9YFf8lm9uU7vvr88iicNb
	 fAIknGe2bI53A==
Date: Mon, 22 Jun 2026 17:42:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com, 
	marcel@holtmann.org, luiz.dentz@gmail.com, hongxing.zhu@nxp.com, 
	l.stach@pengutronix.de, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, sherry.sun@nxp.com
Subject: Re: [PATCH 2/8] power: sequencing: pcie-m2: Add PCI ID for NXP
 88W9098 and AW693 Bluetooth
Message-ID: <hpit5ljwbfui2dqnjzinrv5mteib3vmxkhwv3uyv3adcjlkljs@cl646qxhafcy>
References: <20260618101047.4185497-1-sherry.sun@oss.nxp.com>
 <20260618101047.4185497-3-sherry.sun@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260618101047.4185497-3-sherry.sun@oss.nxp.com>
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

On Thu, Jun 18, 2026 at 06:10:41PM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> 88W9098 is a NXP Wi-Fi/BT combo chip with PCI device ID 0x2b43 under
> Marvell Extended vendor ID. AW693 is a NXP Wi-Fi/BT combo chip with
> PCI device ID 0x3003 under NXP/Philips vendor ID.
> 
> Add both chips to pwrseq_m2_pci_ids[] so that the pwrseq-pcie-m2 driver
> can create the Bluetooth serdev device when these cards are inserted into
> a PCIe M.2 Key E connector.
> 
> Both chips use "nxp,88w8987-bt" as the serdev compatible string, which
> is the entry point for the btnxpuart driver. The driver identifies the
> actual chip variant at runtime via chip ID auto-detection and loads the
> appropriate firmware accordingly.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
> index 94c3f4b7ee36..9217ffcfa6e5 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -186,6 +186,10 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
>  }
>  
>  static const struct pci_device_id pwrseq_m2_pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL_EXT, 0x2b43),
> +	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, 0x3003),
> +	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
>  	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
> -- 
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

