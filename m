Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D40EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxFinXb9YvZUiIgVpRxee772ltO1Myr9cSSG0suD+vE=; b=EZX7LyjPSqiThNqkZRmLTkg70C
	m5Ds7Ss9kHiTuiD/94u8pqneFDOotsvDGSTx5H3b5ITFe0bMmps/foxVNrdeiA2FQ7mGjn2uJNQbk
	iXQ0vRILXLRlTlZKERRCpwJNCihk8+9mYzcKlIyt/gcArdcayPmYdKyoFgiKOWKX+uanXp6d6HqgJ
	vcFU4AXICXvJv6Qzmw4loo4fhs74rPLa+I91PUMKxSACzy8sr6ZjE0OpYBWLI3nMf/xYkzhIiTSI3
	SEr98ttzLi3hrIRgDJ7zwN/YH2ZJumqyWVPZgW/qSOFWjsm84Dran63BSpg/uT1Uv3lLPDF9PVdUr
	M0TgPkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DCT-00000007CyB-0dp5;
	Tue, 22 Apr 2025 12:58:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C6d-000000070WP-1ePq;
	Tue, 22 Apr 2025 11:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 757D5A4B962;
	Tue, 22 Apr 2025 11:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B256EC4CEEA;
	Tue, 22 Apr 2025 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745322482;
	bh=SZ8P4ntOmJ6xAh7cT6ZK7CKYPq0r/WrQHbODqpRB9eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRDzEyMldtGbO5SWm1dZjfG4oaLyAwAmKGNnHOMl4KG2HzB6lvgFr/K2m7vOIVyuU
	 wsM5aivTeQLj++TyDw2WdAzw1sjWypyPaJl/fhyjOl+H9qsN//D0jKpLvpLvagmEgo
	 bvY6KJdUkCMl9g2fqD4QcfPxC/kdv0yuNR3ODOFn142YIIvpdSTwu+TMqhhEjexl/4
	 PyNVgwAgxP3TBEFhRA1P6MhW/RL+oeTdUmRp51YAMwD8TLiZcDWpZcluYrqsDH1477
	 Ons0Wmxl1vK8y4gMrmELPRZ/iiPFfyi1DKOSJ6BqsOeH+h5MbcWJq67E6VcBYHe/gw
	 69UKzeXakmmEQ==
Date: Tue, 22 Apr 2025 13:47:57 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3] PCI: dw-rockchip: Reorganize register and bitfield
 definitions
Message-ID: <aAeB7fO_LCzi-xCh@ryzen>
References: <20250422112830.204374-1-18255117159@163.com>
 <20250422112830.204374-3-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422112830.204374-3-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_044803_573784_AF5C52B0 
X-CRM114-Status: GOOD (  14.23  )
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

On Tue, Apr 22, 2025 at 07:28:29PM +0800, Hans Zhang wrote:
> Register definitions were scattered with ambiguous names (e.g.,
> PCIE_RDLH_LINK_UP_CHGED in PCIE_CLIENT_INTR_STATUS_MISC) and lacked
> hierarchical grouping. Magic values for bit operations reduced code
> clarity.
> 
> Group registers and their associated bitfields logically. This improves
> maintainability and aligns the code with hardware documentation.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 42 +++++++++++--------
>  1 file changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index fd5827bbfae3..cdc8afc6cfc1 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -8,6 +8,7 @@
>   * Author: Simon Xue <xxm@rock-chips.com>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/irqchip/chained_irq.h>
> @@ -34,30 +35,35 @@
>  
>  #define to_rockchip_pcie(x) dev_get_drvdata((x)->dev)
>  
> -#define PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> -#define PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> -#define PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> -#define PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> -#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
> +#define PCIE_CLIENT_GENERAL_CONTROL	0x0
> +#define  PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> +#define  PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> +#define  PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> +#define  PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> +
> +#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x4
> +#define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> +
>  #define PCIE_CLIENT_INTR_STATUS_MISC	0x10
> +#define  PCIE_RDLH_LINK_UP_CHGED	BIT(1)
> +#define  PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
> +
> +#define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
>  #define PCIE_CLIENT_INTR_MASK_MISC	0x24
> +
>  #define PCIE_CLIENT_POWER		0x2c
> +#define  PME_READY_ENTER_L23		BIT(3)
> +
>  #define PCIE_CLIENT_MSG_GEN		0x34
> -#define PME_READY_ENTER_L23		BIT(3)
> -#define PME_TURN_OFF			(BIT(4) | BIT(20))
> -#define PME_TO_ACK			(BIT(9) | BIT(25))
> -#define PCIE_SMLH_LINKUP		BIT(16)
> -#define PCIE_RDLH_LINKUP		BIT(17)
> -#define PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
> -#define PCIE_RDLH_LINK_UP_CHGED		BIT(1)
> -#define PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
> -#define PCIE_CLIENT_GENERAL_CONTROL	0x0
> -#define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> -#define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
> +#define  PME_TURN_OFF			HIWORD_UPDATE_BIT(BIT(4))
> +#define  PME_TO_ACK			HIWORD_UPDATE_BIT(BIT(9))
> +
>  #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
> +#define  PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
> +
>  #define PCIE_CLIENT_LTSSM_STATUS	0x300
> -#define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
> -#define PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
> +#define  PCIE_LINKUP_MASK		GENMASK(17, 16)

Here you are adding a macro (PCIE_LINKUP_MASK) that is not used.

I suggest that you move the addition to the patch where it is actually used.


Kind regards,
Niklas

