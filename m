Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77863CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA1GKMauLKODOLxEgLnFc/cYl3dUz1jz1+pgZGGyx5U=; b=YXmHyauhscWyKHQztF8zQ2ybVi
	tHEyGf0QqzSjLQGEId+xOLNXGgP79ZZBwrzJi0ahwbt//+tdD7lU9Ze3z73KjpRA5yQ8mtQ1YZNYg
	8n+wnCSB1kaXIpOt0WnGcqE+EEFFv1CKNW8Xl3Vu1O+eevQS63gWOPEBRS/UMsK9iLvGoJfj1T+Ne
	89HNOEYzw3ccBoqU3R8e9lwJqbGyuWitDw9V1e0A0nxMDZrxU3jNNY+lxHZjICTTxStJx8mQvmIKT
	lVMiDhDY+OpjQYfq3odKddArYtQ2rg5Yh9Zw+WPjjfdHhYPmXKlAbwdlG/f+dK/8xOziNtSDn/+Pp
	z4E8VwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGf9Y-0000000DtXL-0FNN;
	Wed, 05 Nov 2025 15:10:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGf9W-0000000DtWw-0m7n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76EDC40710;
	Wed,  5 Nov 2025 15:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDF2C4CEF5;
	Wed,  5 Nov 2025 15:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762355425;
	bh=oaPdlpBofdsmKuByKa4GxzGVplmxokinAJprGu/nEE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEhS4opnOWrntlWlcJU82PLlbQQ/6tnpU+NzNmKhC0h5KycxiLh3uPmz+j+S7Oak+
	 9HMSGfKvUG2jxyJQvQ6tVrxMkKVwfiDBi6ak6PO5AQBuiCd7A9DAbHxYvrMlypeQZE
	 nmwhWAbupCJw4ySM8W+YJWeTZyCaki+WUki31WRNqQIWS14sdI+12oRqNSDhW9NPcH
	 VQmMnIN0k3sLPwpQgdNkq7nyHvGwoppWmJxi/T79RuH7om/+6dYcgT2KS6y1hg19G3
	 H9GAm0SKuqhyp6eG2ADnuHVl6zZ1o5IS2awGpV9r9hXIjTOmWmw8jbPuME8EhD33Jb
	 CyHkULgyD+cFw==
Date: Wed, 5 Nov 2025 20:40:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, kishon@kernel.org, 18255117159@163.com, unicorn_wang@outlook.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2] PCI: cadence: Enable support for applying lane
 equalization presets
Message-ID: <57nw5lae3ev7krf3dtrllxaq2wvoajijq62ac5uttvajxjvpor@cmahebflp37x>
References: <20251028134601.3688030-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028134601.3688030-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_071026_267801_14030186 
X-CRM114-Status: GOOD (  26.03  )
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

On Tue, Oct 28, 2025 at 07:15:58PM +0530, Siddharth Vadapalli wrote:
> The PCIe Link Equalization procedure allows peers on a PCIe Link to
> improve the signal quality by exchanging transmitter presets and
> receiver preset hints in the form of Ordered Sets.
> 
> For link speeds of 8.0 GT/s and above, the transmitter presets and the
> receiver preset hints are configurable parameters which can be tuned to
> establish a stable link. This allows setting up a stable link that is
> specific to the peers across a Link.
> 
> The device-tree property 'eq-presets-Ngts' (eq-presets-8gts,
> eq-presets-16gts, ...) specifies the transmitter presets and receiver
> preset hints to be applied to every lane of the link for every supported
> link speed that is greater than or equal to 8.0 GT/s.
> 
> Hence, enable support for applying the 'optional' lane equalization
> presets when operating in the Root-Port (Root-Complex / Host) mode.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on linux-next tagged next-20251028.

Just rebase on top of pci/main or any topic branches in pci tree if there are
any dependency.

> It also applies cleanly on v6.18-rc1.
> 
> Link to v1 patch:
> https://lore.kernel.org/r/20251027133013.2589119-1-s-vadapalli@ti.com/
> Changes since v1:
> - Implemented Bjorn's suggestion of adding 'fallthrough' keyword in
>   switch-case to avoid compilation warnings, since 'fallthrough' is
>   intentional.
> 
> Regards,
> Siddharth.
> 
>  .../controller/cadence/pcie-cadence-host.c    | 85 +++++++++++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h |  5 ++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index fffd63d6665e..ae85ad8cce82 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -168,6 +168,90 @@ static void cdns_pcie_host_enable_ptm_response(struct cdns_pcie *pcie)
>  	cdns_pcie_writel(pcie, CDNS_PCIE_LM_PTM_CTRL, val | CDNS_PCIE_LM_TPM_CTRL_PTMRSEN);
>  }
>  
> +static void cdns_pcie_setup_lane_equalization_presets(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	struct device *dev = pcie->dev;
> +	struct device_node *np = dev->of_node;
> +	int max_link_speed, max_lanes, ret;
> +	u32 lane_eq_ctrl_reg;
> +	u16 cap;
> +	u16 *presets_8gts;
> +	u8 *presets_ngts;
> +	u8 i, j;
> +
> +	ret = of_property_read_u32(np, "num-lanes", &max_lanes);
> +	if (ret)
> +		return;
> +
> +	/* Lane Equalization presets are optional, so error message is not necessary */
> +	ret = of_pci_get_equalization_presets(dev, &rc->eq_presets, max_lanes);
> +	if (ret)
> +		return;
> +
> +	max_link_speed = of_pci_get_max_link_speed(np);

'max-link-speed' property is used to *limit* the max link speed of the
controller, in case the hardware default value is wrong or to workaround the
hardware defect. If you goal is to find the actual max link speed of the Root
Port, you should read the Link Capabilities register.

Unfortunately, the ti,j721e-pci-host.yaml binding has marked this property as
'required'. It should've been optional instead.

> +	if (max_link_speed < 0) {
> +		dev_err(dev, "%s: link-speed unknown, skipping preset setup\n", __func__);

Don't print the function names in error log.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

