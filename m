Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD7ACCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+HDiRgC5t4Ys8kCexpdAvL//Urk5g0DuwaI2Z/zH6k=; b=VRgGmuS/YmixFtEDNxSK0T1nPj
	gKjAPwgBiFen1xbyi0x7wNdfcm5BD3I9D/QESAvKBColTcNJYy6d4HYYvEkNxkxQI8CTWufR1GHCW
	ze6c3+Nc7xBU2mFIYFvpdqcGQb+gC4nZKpNmqAy0xTBG/0kikAVgUMF0n8tfxuNEKSAXbKlPNXDPm
	INeA1iNCZO5Z88CFm4QQSqGaBSmYPIcnrrlInBn1TYJPQ5O9UmxnRO5roFyHzA+WwKcC5nZIGRCcV
	V9NfAdUQaJjZ1NyHE/ZQu5d4XfyaOIDI29HTwklnpKArjejhWQAbxrTpLP8/q1ucj8xqzRpwfOmML
	J+YilReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXpM-0000000F14l-3u70;
	Tue, 28 Oct 2025 00:44:45 +0000
Received: from mail-m49246.qiye.163.com ([45.254.49.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXpJ-0000000F149-3O5H;
	Tue, 28 Oct 2025 00:44:43 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2764cdbd9;
	Tue, 28 Oct 2025 08:44:37 +0800 (GMT+08:00)
Message-ID: <cfaa4824-a59a-4106-b2c1-befce2af0324@rock-chips.com>
Date: Tue, 28 Oct 2025 08:44:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com
Subject: Re: [PATCH v1 2/2] PCI: dw-rockchip: Add runtime PM support to
 Rockchip PCIe driver
To: Anand Moon <linux.amoon@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-3-linux.amoon@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251027145602.199154-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a2846258d09cckunmfb2044f69bef6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxpJSVYfTE5DGRgZGk9MTEtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=aKPeZjdrPMbSfHYI71aE7ibLXgYuDZdEaanjrVCXkI88WLjfdtNNEkHyLOVQX4iP4ccGH9O87aczzz9yJgpt0qIvPf9vUNeBnOk5yYERMivQXertqgmAhYLcerqfPVC3t9fVqBs/V6CtNquFh6vxTcC1yCd6Obb6gD2aRfvr3FA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=A+HDiRgC5t4Ys8kCexpdAvL//Urk5g0DuwaI2Z/zH6k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_174442_060279_6BC2E46A 
X-CRM114-Status: GOOD (  18.76  )
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

在 2025/10/27 星期一 22:55, Anand Moon 写道:
> Add runtime power management support to the Rockchip DesignWare PCIe
> controller driver by enabling devm_pm_runtime() in the probe function.
> These changes allow the PCIe controller to suspend and resume dynamically,
> improving power efficiency on supported platforms.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index b878ae8e2b3e..5026598d09f8 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -20,6 +20,7 @@
>   #include <linux/of_irq.h>
>   #include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>   #include <linux/reset.h>
>   
> @@ -690,6 +691,20 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto deinit_phy;
>   
> +	ret = pm_runtime_set_suspended(dev);
> +	if (ret)
> +		goto disable_pm_runtime;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +		goto deinit_clk;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		goto disable_pm_runtime;
> +
>   	switch (data->mode) {
>   	case DW_PCIE_RC_TYPE:
>   		ret = rockchip_pcie_configure_rc(pdev, rockchip);
> @@ -709,7 +724,10 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +disable_pm_runtime:

We need to call reset_control_assert(rockchip->rst) before releasing the
the pm refcount. The problem we faced on vendor kernel is there might be 
still on-going transaction from IP to the AXI which blocks genpd to be
powered down.

> +	pm_runtime_disable(dev);
>   deinit_clk:
> +	pm_runtime_no_callbacks(dev);
>   	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
>   deinit_phy:
>   	rockchip_pcie_phy_deinit(rockchip);
> @@ -725,6 +743,9 @@ static void rockchip_pcie_remove(struct platform_device *pdev)
>   	/* Perform other cleanups as necessary */
>   	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
>   	rockchip_pcie_phy_deinit(rockchip);
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_no_callbacks(dev);
>   }
>   
>   static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {


