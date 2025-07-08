Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07F5C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wk+Yev5AUqaTLQGaxQP20CVeQUgi9tHNsEQFivrrCEE=; b=SjDiZGrhYQtQmQIFHApJLTJD0M
	oUXU11t/g4SkjSd74Yos/YQ209bqwmlPgcQik3AS5FUmAn0xRHmEc+/KBcZQMrEnmcicE0qHlFS9l
	j4I5+9X6EZYgABMeJDV8bIgJXQww1jb1ELe5NVz9UXJZJsanyrSw6bVM8vlIMuJ41bjtTZoErC5uE
	blTfjT045Hn/2t7GutzmbottGiTseTKW5JP8hzQFRNs0rmCi5z6/GDlwdOJmKZqW7DEjIM04/JuR8
	2qrQUKsza3T9lo6J6fFKFl/D4JxgzP7R3GPD38gffLuJxTN6/UjmZuPIh/eox454Yvc8KVtzogJii
	GUStS1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2wh-00000004bnJ-0UNG;
	Tue, 08 Jul 2025 07:40:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2uB-00000004b5X-1JGM;
	Tue, 08 Jul 2025 07:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7A40A531E0;
	Tue,  8 Jul 2025 07:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6BAC4CEF0;
	Tue,  8 Jul 2025 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751960297;
	bh=BgLBeWI7Kkq8y/M+805ggWOqf/BrfPkUfyqfLs3mFsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1a0U0PSMSGGupuyRgulbgUXZLdDpjfrJLhgSPS5WwxsrCa0J8ONrmoM+pqFuMxqR
	 u2bONUFgKv6Rc4i2jrOzGaXJ1tDZR0MA1Qtke7UA/Xphqc4lc3mVRClNOxVJf/+4DB
	 as+KG0t0bqn2rRz8jxesekB9xKfhNUYNt/+EU4veraaEDxPZZFtqmqMv35wyuBKfwb
	 4VOjf6C61ruGEztM9CoiOtY5sHp5DXUFQjwM8zaX41ti7ZYQVfQT9zaCS/aB0A4agx
	 IyopwV8r4YnNEjaK3jHKHOcMtClKGxLWju5QQ5oD0Folr82fDLjuE4Aohjv1nJmd4z
	 7lSYEd/Mgf3XQ==
Date: Tue, 8 Jul 2025 13:08:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: brcmstb: Enable Broadcom Cable Modem SoCs
Message-ID: <jcrgjiaadle2vzeqxl556k773mz7bzzr3f26okwlhnal6dakxo@d7oio5p4kxkz>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
 <20250609221710.10315-4-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609221710.10315-4-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_003819_488551_1BB9C4E6 
X-CRM114-Status: GOOD (  24.65  )
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

On Mon, Jun 09, 2025 at 06:17:06PM GMT, Jim Quinlan wrote:
> Broadcom's Cable Modem (CM) group also uses this PCIe driver
> as it shares the PCIe HW core with the STB group.
> 
> Make the modifications to enable the CM SoCs.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 186 +++++++++++++++++++++-----
>  1 file changed, 152 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index db7872cda960..e25dbcdc56a7 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -51,6 +51,9 @@
>  #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
>  #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK	0xf8
>  
> +#define PCIE_RC_DL_PDL_CONTROL_4			0x1010
> +#define  PCIE_RC_DL_PDL_CONTROL_4_NPH_FC_INIT_MASK	0xff000000
> +
>  #define PCIE_RC_DL_MDIO_ADDR				0x1100
>  #define PCIE_RC_DL_MDIO_WR_DATA				0x1104
>  #define PCIE_RC_DL_MDIO_RD_DATA				0x1108
> @@ -60,6 +63,7 @@
>  #define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK	0xff
>  
>  #define PCIE_MISC_MISC_CTRL				0x4008
> +#define  PCIE_MISC_MISC_CTRL_PCIE_IN_CPL_RO_MASK	0x20
>  #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK	0x80
>  #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK	0x400
>  #define  PCIE_MISC_MISC_CTRL_SCB_ACCESS_EN_MASK		0x1000
> @@ -170,6 +174,7 @@
>  /* MSI target addresses */
>  #define BRCM_MSI_TARGET_ADDR_LT_4GB	0x0fffffffcULL
>  #define BRCM_MSI_TARGET_ADDR_GT_4GB	0xffffffffcULL
> +#define BRCM_MSI_TARGET_ADDR_FOR_CM	0xfffffffffcULL
>  
>  /* MDIO registers */
>  #define MDIO_PORT0			0x0
> @@ -223,13 +228,23 @@ enum {
>  enum pcie_soc_base {
>  	GENERIC,
>  	BCM2711,
> +	BCM3162,
> +	BCM3392,
> +	BCM3390,
>  	BCM4908,
>  	BCM7278,
>  	BCM7425,
>  	BCM7435,
>  	BCM7712,
> +	BCM33940,
>  };
>  
> +/*
> + * BCM3390 CM chip actually conforms to STB design, so it
> + * is not present in the macro below.
> + */
> +#define IS_CM_SOC(t) ((t) == BCM3162 || (t) == BCM33940 || (t) == BCM3392)
> +
>  struct inbound_win {
>  	u64 size;
>  	u64 pci_offset;
> @@ -757,6 +772,9 @@ static int brcm_pcie_bridge_sw_init_set_generic(struct brcm_pcie *pcie, u32 val)
>  	u32 shift = RGR1_SW_INIT_1_INIT_GENERIC_SHIFT;
>  	int ret = 0;
>  
> +	if (IS_CM_SOC(pcie->cfg->soc_base))
> +		return 0;
> +
>  	if (pcie->bridge_reset) {
>  		if (val)
>  			ret = reset_control_assert(pcie->bridge_reset);
> @@ -891,13 +909,13 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
>  	struct inbound_win *b = b_begin;
>  
>  	/*
> -	 * STB chips beside 7712 disable the first inbound window default.
> -	 * Rather being mapped to system memory it is mapped to the
> -	 * internal registers of the SoC.  This feature is deprecated, has
> -	 * security considerations, and is not implemented in our modern
> -	 * SoCs.
> +	 * STB chips beside CM chips and 7712 disable the first inbound
> +	 * window default.  Rather being mapped to system memory it is
> +	 * mapped to the internal registers of the SoC.  This feature is
> +	 * deprecated, has security considerations, and is not
> +	 * implemented in our modern SoCs.

May I know what is the purpose of allowing inbound access to these regions? TBH,
I'm not sure what is the usecase of 'inbound memory' for PCIe host.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

