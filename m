Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XH+V1AOx;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ed/W9pMI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+2E6dr27WqMqCaaLamwNn6gQm66M2Zv099gvqTnexrw=; b=XH+V1AOxgf7oQj
	Kt86ifO9HqdF7A7dgpQHHmUXNx0nEa5NTbtKL/Trl/lLEZCokUApPI9UM+gmRPDlDBssSVQHZX6a1
	5csRAt8xCszs35qC4HS19krAAvx+B3ZDsRMAEpKuOTnez1xL/Y29Uc7QsseMT872VaPUGoIqtCpRm
	tomPSglV8u8GzSSDH+NpqIV3Mly8b7yYs/hPPglm61EQKD1NHnrrDuortsb3JaG0cGUtJH9UTXDqb
	rBwVgdFWNNHh+ixruVCl4kO7F40Pn1EUGNFahvIKW9SU3uDbdzPwZ+hsILKaAvLDXaFu2J/mlxDRx
	p+5D24pi9aftT1gWcoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlhW-00000007NgN-3tbb;
	Thu, 05 Nov 2026 00:51:34 +0000
Received: from mail-m12853.netease.com ([103.209.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlhT-00000007Nf9-1H8l;
	Thu, 05 Nov 2026 00:51:33 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53894dd57;
	Thu, 5 Nov 2026 08:51:18 +0800 (GMT+08:00)
Message-ID: <f047dcbe-efa2-4c60-8436-6d001c936467@rock-chips.com>
Date: Thu, 5 Nov 2026 08:51:14 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Alexey Charkov <alchark@flipper.net>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v8 7/9] PCI: dw-rockchip: Add pme_turn_off support
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v8-0-0434b4f373bc@collabora.com>
 <20261105-rockchip-pcie-system-suspend-v8-7-0434b4f373bc@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v8-7-0434b4f373bc@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a930507d03a4kunm7b7b2c6111ce48
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSBlJVkgaQkNKTR9MSR5CHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ed/W9pMIXtu5yRJRX83WEULDuzONtKh2KGDEcb97UklFlrvv5C3CMhCccjEFUhMlchyOLJAprM686mxfc7tWjHzWqBUhRRM8shTlsrCQnZUsxYIU1rtFwSDJojCUXPr6oPLLxEocusN0/jY3UmO7AmWWmEB0XONgEidRDNO+fjc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+2E6dr27WqMqCaaLamwNn6gQm66M2Zv099gvqTnexrw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_165132_063978_D52C4275 
X-CRM114-Status: GOOD (  21.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/11/05 星期四 7:47, Sebastian Reichel 写道:
> Prepare Rockchip PCIe controller for system suspend support by
> adding the PME turn off operation.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 47 +++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 0e26abc50920..7933c50df340 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -47,6 +47,10 @@
>   #define  PCIE_CLIENT_ENABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 1)
>   #define  PCIE_CLIENT_DISABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 0)
>   
> +/* Interrupt Status Register for Received Messages */
> +#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
> +#define  PME_TO_ACK			BIT(9)
> +
>   /* Interrupt Status Register Related to Legacy Interrupt */
>   #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
>   
> @@ -71,6 +75,11 @@
>   #define  PCIE_CLKREQ_READY		FIELD_PREP_WM16(BIT(0), 1)
>   #define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
>   #define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
> +#define  PME_READY_ENTER_L23		BIT(3)
> +
> +/* Message Request Register */
> +#define PCIE_CLIENT_MSG_GEN		0x34
> +#define  PME_TURN_OFF			FIELD_PREP_WM16(BIT(4), 1)
>   
>   /* RASDES TBA information */
>   #define PCIE_CLIENT_CDM_RASDES_TBA_INFO_CMN	0x154
> @@ -439,8 +448,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>   	return 0;
>   }
>   
> +static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
> +	struct device *dev = rockchip->pci.dev;
> +	u32 status;
> +	int ret;
> +
> +	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
> +	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
> +				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret) {
> +		dev_warn(dev, "Failed to send PME_Turn_Off\n");
> +		return;
> +	}
> +
> +	/* 2. Wait for PME_TO_Ack, bit 9 will be set once received */
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_INTR_STATUS_MSG_RX,
> +				 status, status & BIT(9), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret) {
> +		dev_warn(dev, "Failed to receive PME_TO_Ack\n");
> +		return;
> +	}
> +
> +	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
> +	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATUS_MSG_RX);
> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER_CON,
> +				 status, status & PME_READY_ENTER_L23,
> +				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
> +				 PCIE_PME_TO_L2_TIMEOUT_US);
> +	if (ret)
> +		dev_err(dev, "Failed to get ready to enter L23 message\n");
> +}


This is a question for the DWC core: should we change
dw_pcie_host_ops::pme_turn_off() to return a value instead of silently
ignoring a failure?

Looking at pcie-designware-host.c, we have:

if (pci->pp.ops->pme_turn_off) {
     pci->pp.ops->pme_turn_off(&pci->pp);
} else {
     ret = dw_pcie_pme_turn_off(pci);
     if (ret)
         return ret;
}

The handling feels asymmetric. If ->pme_turn_off fails, shouldn't we 
abort dw_pcie_suspend_noirq as well?

Other than that, this patch looks good to me in current shape,
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

We can further discuss the callback's return value issue on top.

> +
>   static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
>   	.init = rockchip_pcie_host_init,
> +	.pme_turn_off = rockchip_pcie_pme_turn_off,
>   };
>   
>   /*
> 


