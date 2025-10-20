Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4A0CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrMsntJdBjNKYb1mWe2SF5k/js6aucDKBErnYEaqPnc=; b=yn5CuxpKfVCGICDTQdGjD0N+yG
	ft4gaWQcmQvAtGfZ+6RiFkik13KcrO6FfWDyI4MfH8FMKzmN1pccs69+/zFI/BGv5G7fleiqu3JQt
	sPWd7d5n6v93VtXhtD57ytcuMbLAnoZUrTcOKRKG6RB9z4Zvi+3ZwlvCLnvg5NFCXBewSotI7E6cV
	/85DpZjezOKj8bvdQDi5HiM+DJ4apP6QT6hBmW6SE3+j6ztFc9pEQsGhPy825yhDQJWmDv/fBcR50
	toz3XNhG8+uwh03N/qCn42T6a2ie+I+T950LZMPyq8QcQYxv0t93E7YLLGH1zcEAEz2D4zgkdT1gB
	4GTQy+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAiqd-0000000BxNO-2mdg;
	Mon, 20 Oct 2025 05:54:23 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAiqa-0000000BxLW-332s;
	Mon, 20 Oct 2025 05:54:22 +0000
X-QQ-mid: zesmtpip4t1760939614t5c453bdf
X-QQ-Originating-IP: U5j3Bti5rsZtBzG/p7qq78o6KBS1qijssVWI0mMLFLs=
Received: from [IPV6:240f:10b:7440:1:9bef:b2b: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 13:53:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14762818756063502707
Message-ID: <6EF8998620B7739C+ae4bf629-2d0a-4adb-b724-1f0964283d5a@radxa.com>
Date: Mon, 20 Oct 2025 14:53:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
To: Niklas Cassel <cassel@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Lin <shawn.lin@rock-chips.com>, Kever Yang
 <kever.yang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <diederik@cknow-tech.com>, stable@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20251017163252.598812-2-cassel@kernel.org>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20251017163252.598812-2-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N6KQ8tvoTFZftboViCXanWFTW1/6mxHhyG+NIeZJkRfbAaKVvsAMbk7K
	1O71kFsTaX5mXick2q7qLpp4YiEIygKLkcgx6iK/nYteupcHJb5dnkHNfAywc4dwEcKrj9C
	2jm/SRFkq9ZvjSNMQ6UitwH0LLww3Xy/xGEAKUx6SmabIHJNQPaqUAJZMlGjTiYXCQo8LLM
	Jq89veEynl1d4Y9tGMlbFTF5JNzfrmaXf4GOvoR3rZtgzmZXXt1hq30da+Q5ljpcsKU9C9N
	t3p/ObKr/R+yUXZ5KNAYJ2Pgkk/jM6+qgrBnBuR0r9sO0jm/jS3ZI0D5/Mho6ZtreQDq79O
	EWoPExw1DxAwe+YI67GOQmzagceDfYboxU0HnoKts/nbG9RMISxPGESwLkRUmejkF+e6rri
	IXr7meNQLv+pJmAx7Muja6rUSQBItg5uWzhNLuQ+dhMKJ0iLea+6lDP66GaqkqmaE4k4dbo
	eOMuTe20Oc8ucjxFDVSuSWHWLZMWZL6V31P0MyznBQ6oNfoe2p+99B/LHjUpySZaBkqYF1N
	77LnDT/7l6wNLrcDYiKbv9J8DUoRm8BLiO9jkEtOqPpjbrT8MTlXYm4K7Y3sEkt3HwLHULJ
	ffsb2Y527NN4vATEXq1Xf/jmtPDDKgsHQeNT5QY2wYAQG1B82BIiP5Ije9Pxa236Y2C4BE1
	UR8YDbFQcFdbjhUqK52p+pT5UIJjc8sL7WTW8nMApsLcOdb3wy5mI6rpL641l/p62jWnbUJ
	Iq/IjK/1g52l40ohup3xgnqgTVjTNTwmxA3H+rU+5dwM2rSlJgMrLNrffwsv0uFH8pOD3tl
	votQ5wENQvzL2KvedC6VpAPV2hAIzOmC2IQXHtLyX8yGEqGBNKpY8OLfizlHRRpR4etnZLk
	vAguBovfGyH8YPngDkSgwsj9+J5ZIqz3/3BUqqV7WoCDCYM49r5/d/w3cr0W56QaPjbtkRv
	bUQQSYY6w+dO/5Q==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_225421_193086_F95949D4 
X-CRM114-Status: GOOD (  28.57  )
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

Hi Niklas,

Thank you for your work.

On 10/18/25 01:32, Niklas Cassel wrote:
> The L1 substates support requires additional steps to work, namely:
> -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
>   hardware, but software still needs to set the clkreq fields in the
>   PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
> -Program the frequency of the aux clock into the
>   DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
>   is turned off and the aux_clk is used instead.)
> 
> These steps are currently missing from the driver.
> 
> For more details, see section '18.6.6.4 L1 Substate' in the RK3658 TRM 1.1
> Part 2, or section '11.6.6.4 L1 Substate' in the RK3588 TRM 1.0 Part2.
> 
> While this has always been a problem when using e.g.
> CONFIG_PCIEASPM_POWER_SUPERSAVE=y, or when modifying
> /sys/bus/pci/devices/.../link/l1_2_aspm, the lacking driver support for L1
> substates became more apparent after commit f3ac2ff14834 ("PCI/ASPM:
> Enable all ClockPM and ASPM states for devicetree platforms"), which
> enabled ASPM also for CONFIG_PCIEASPM_DEFAULT=y.
> 
> When using e.g. an NVMe drive connected to the PCIe controller, the
> problem will be seen as:
> nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
> nvme nvme0: Does your device have a faulty power saving mode enabled?
> nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
> 
> Thus, prevent advertising L1 Substates support until proper driver support
> is added.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

I've confirmed this patch resolves the issue in v6.18-rc1 using the 
following configuration:

  ROCK 5A & M.2 RTL8852BE
  ROCK 5B & M.2 MT7921E, NVMe SSD
  ROCK 5T & on-board AX210, NVMe SSD x2
  ROCK 5 ITX+ & M.2 MT7922E, NVMe SSD x2

Therefore,

  Tested-by: FUKAUMI Naoki <naoki@radxa.com>

Best regards,

(P.S. I couldn't test on the ROCK 5B & M.2 RTL8852BE, ROCK 5B+ & 
on-board RTL8852BE, and ROCK 5C & ASM2806 due to separate issues.)

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> ---
> Changes since v2:
> -Improve commit message (Bjorn)
> 
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 3e2752c7dd09..84f882abbca5 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -200,6 +200,25 @@ static bool rockchip_pcie_link_up(struct dw_pcie *pci)
>   	return FIELD_GET(PCIE_LINKUP_MASK, val) == PCIE_LINKUP;
>   }
>   
> +/*
> + * See e.g. section '11.6.6.4 L1 Substate' in the RK3588 TRM V1.0 for the steps
> + * needed to support L1 substates. Currently, not a single rockchip platform
> + * performs these steps, so disable L1 substates until there is proper support.
> + */
> +static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
> +{
> +	u32 cap, l1subcap;
> +
> +	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> +	if (cap) {
> +		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
> +		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
> +			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
> +			      PCI_L1SS_CAP_PCIPM_L1_2);
> +		dw_pcie_writel_dbi(pci, cap + PCI_L1SS_CAP, l1subcap);
> +	}
> +}
> +
>   static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
>   {
>   	u32 cap, lnkcap;
> @@ -264,6 +283,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
>   	irq_set_chained_handler_and_data(irq, rockchip_pcie_intx_handler,
>   					 rockchip);
>   
> +	rockchip_pcie_disable_l1sub(pci);
>   	rockchip_pcie_enable_l0s(pci);
>   
>   	return 0;
> @@ -301,6 +321,7 @@ static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
>   	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>   	enum pci_barno bar;
>   
> +	rockchip_pcie_disable_l1sub(pci);
>   	rockchip_pcie_enable_l0s(pci);
>   	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
>   


