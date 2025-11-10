Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0470CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OmxMhXzNh2IZFqHFZkK0d7kdrypMM6npOSmRs2Ag9s=; b=EqPFDoRZ/NKGE6ytdiXieVUsQ0
	/tgR2dlKIc0//2WPAip2V/GR9sjF+lV7GXn4OZWaeoncu8MnAfoullXEzZjAMaL+QvOnwQ0sCa/Z0
	+M8bKuh8sYP682sSy65UxGv1viVRYjj2Q5Zh57dgs2fxAKh4BW4q21m0gxEqw2FLVFyJAuT81g/DO
	Uej/5YanoosWHHUSy564yhYBXMvSUdUYWnYKv+jn0rmfs8GAXw2m9jCYza4OxoJeoDzM356jJDcPf
	Ic2R4kfTEsipj0IzC5xnVS0De3Pbd5/00yDKhTKeG3go8+yTync21vbTA+uoKvqPPTDM7LGk642Zx
	ZIOTUsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITiu-00000005gLN-0pdp;
	Mon, 10 Nov 2025 15:22:28 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITim-00000005gCX-2ILH;
	Mon, 10 Nov 2025 15:22:27 +0000
X-QQ-mid: zesmtpip4t1762788085t27e37098
X-QQ-Originating-IP: js3e0qfumeGjfavwQtgcJo4DX3v2AKIgEpfZkT7Tm78=
Received: from [IPV6:240f:10b:7440:1:64e0:6ba: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Nov 2025 23:21:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6773966002148824605
Message-ID: <7A613E8E5A3767C6+84d31db2-074e-49aa-8e82-bfb78632d2fa@radxa.com>
Date: Tue, 11 Nov 2025 00:21:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
To: Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 mani@kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>
References: <aQ9FWEuW47L8YOxC@ryzen>
 <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
 <aRCI5kG16_1erMME@ryzen>
 <F8B2B6FA2884D69A+b7da13f2-0ffb-4308-b1ba-0549bc461be8@radxa.com>
 <780a4209-f89f-43a9-9364-331d3b77e61e@rock-chips.com>
 <4487DA40249CC821+19232169-a096-4737-bc6a-5cec9592d65f@radxa.com>
 <363d6b4d-c999-43d4-866e-880ef7d0dec3@rock-chips.com>
 <0C31787C387488ED+fd39bfe6-0844-4a87-bf48-675dd6d6a2df@radxa.com>
 <dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com>
 <aRHb4S40a7ZUDop1@ryzen> <aRHdeVCY3rRmxe80@ryzen>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <aRHdeVCY3rRmxe80@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OJxrSQW+uqfyxql52C7oR+tp5UQBJBvNtaeYMhYm0OXLDK3Wp1lDfuEE
	rg32TegN79eSiI6ZzN/1QLXMe8nTR6VX8q+86eSMud8JKdRiSCGSzromgEsSgVJmvbrtzAr
	XqK490anJx0Yb3Azb1GcEjZkazhDoOo0KQtZYxIOj988LTGNOTvHobyF9GNW6WctdjkQtGv
	Syjkcieid67SRZK1cJ75jz3caeI1kTNhOy1UKlf2XoyLDWToKVBdqM9SvpVmUIWqAcZ56YC
	tbX3Q/msV48zXafFOHZicteYu6j4gP4j7gOZPSV8116ehd6k1uzvaFA3BRNR1V7ZMCrwCf+
	4JHo5SadplBFDZzkYqOXM4GDihGlq3iorp/tMj4Z186zN1aUy/aD8RZhyajHplBYDTk/ipc
	okzK6kBXOCn1UgkNLRJL16memONIAlVM1l3tW/UgGdeFI1puGBcZhdsIFSFAj2Bl6g5UJyW
	POJSUgy9M9w+Zjh66FvIiNLMy3arB6LrsV5wO8q/moC4Yozz2gYpUIyVLb6v7hbAbuJqV6h
	LSjTI1Le40WErvrkfcot7zR/jV99uQYCYsrLbVVHG42ALIePk7igxHjmea5AX3qwRqCam0u
	mOG2wrtsSqMcDPX8NfKwCUo/byrYS0lgk63+R/QNXH9zVQPcvP3+iAsGsYS96nlSQik22Ct
	20x8VOw7WN6XwEHaXAR3cOHPrCfX9nmi8q3jl4e9YZ80kfaALtHg8Z75iAcLJco6IUJilug
	EAsfwkceIGIDo49Y3xaaH1Wa7O/exL0ikGWOg8iAA+s1/nU0WcYx59vtf1EvALSBxzCyky5
	/EqW+lvMALGX6/cVebVeaVxsc/KaTvLTjUKzD9yrVXCWRtM4HJuzcFHglK3HInGSDO6ndPe
	Tpan0fnwzmlNQjmAxIWL2++oUt059NSW8vrhnoHJkKIRpUUHBcPvHR4PQc5djc9yTqugwjp
	ZUTzQNBY31xk5Me5NDMUV8heis2JnmbAY3E4V2WZmFuLGAw==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_072221_516062_C94F57B7 
X-CRM114-Status: GOOD (  26.28  )
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

Hi Shawn, Mani, Niklas,

I'm testing your patches on ROCK 5A/5C, but the behavior is 
inconsistent. Sometimes it works, sometimes it doesn't, and sometimes I 
get an oops. I'm a bit confused, so I'll try again tomorrow.

BTW, do you have any idea about this oops?

[    1.680251] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000080
[    1.681039] Mem abort info:
[    1.681294]   ESR = 0x0000000096000004
[    1.681627]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.682101]   SET = 0, FnV = 0
[    1.682382]   EA = 0, S1PTW = 0
[    1.682662]   FSC = 0x04: level 0 translation fault
[    1.683119] Data abort info:
[    1.683381]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    1.683869]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    1.684324]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    1.684798] user pgtable: 4k pages, 48-bit VAs, pgdp=000000005630d000
[    1.685374] [0000000000000080] pgd=0000000000000000, p4d=0000000000000000
[    1.685983] Internal error: Oops: 0000000096000004 [#1]  SMP
[    1.686483] Modules linked in: phy_rockchip_usbdp typec 
phy_rockchip_naneng_combphy phy_rockchip_samsung_hdptx dwmac_rk 
stmmac_platform stmmac pcs_xpcs rockchipdrm dw_hdmi_qp analogix_dp 
dw_hdmi dw_mipi_dsi drm_dp_aux_bus drm_display_helper cec drm_client_lib 
drm_dma_helper drm_kms_helper drm backlight
[    1.688881] CPU: 0 UID: 0 PID: 171 Comm: irq/87-pcie-sys Tainted: G 
      W           6.18.0-rc5-dirty #2 PREEMPT
[    1.689801] Tainted: [W]=WARN
[    1.690066] Hardware name: radxa Radxa ROCK 5C/Radxa ROCK 5C, BIOS 
2025.10-00012-g0c3aff620204-dirty 10/01/2025
[    1.690952] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    1.691567] pc : of_pci_add_properties+0x284/0x4c4
[    1.692000] lr : of_pci_add_properties+0x264/0x4c4
[    1.692426] sp : ffff8000813fbbf0
[    1.692722] x29: ffff8000813fbc40 x28: ffffcfffe906b3b8 x27: 
ffffcfffeb95b1d0
[    1.693358] x26: ffff000001236980 x25: ffff00007452ceac x24: 
ffff000008844600
[    1.693993] x23: ffff00007452ce00 x22: ffff0000073b3a00 x21: 
ffff00000045db10
[    1.694628] x20: ffff00000057c000 x19: 0000000000000000 x18: 
00000000ffffffff
[    1.695264] x17: 0000000000000000 x16: 0000000000000000 x15: 
ffff8000813fba70
[    1.695898] x14: ffff000000c355b8 x13: ffff000000c355b6 x12: 
0000000000000000
[    1.696533] x11: 00333634353d4d55 x10: 000000000000002c x9 : 
0000000000000000
[    1.697168] x8 : ffff00007479c800 x7 : 0000000000000000 x6 : 
0000000000696370
[    1.697803] x5 : 0000000000000000 x4 : 0000000000000002 x3 : 
ffff8000813fbc20
[    1.698439] x2 : ffffcfffeabc6ef0 x1 : ffff0000073b3a00 x0 : 
0000000000000000
[    1.699074] Call trace:
[    1.699293]  of_pci_add_properties+0x284/0x4c4 (P)
[    1.699723]  of_pci_make_dev_node+0xd8/0x150
[    1.700109]  pci_bus_add_device+0x138/0x168
[    1.700485]  pci_bus_add_devices+0x3c/0x88
[    1.700853]  pci_bus_add_devices+0x68/0x88
[    1.701220]  pci_rescan_bus+0x30/0x44
[    1.701551]  rockchip_pcie_rc_sys_irq_thread+0xb8/0xd0
[    1.702010]  irq_thread_fn+0x2c/0xa8
[    1.702333]  irq_thread+0x168/0x320
[    1.702648]  kthread+0x12c/0x204
[    1.702941]  ret_from_fork+0x10/0x20
[    1.703267] Code: aa1603e1 f000abc2 d2800044 913bc042 (f94040a0)

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 11/10/25 21:41, Niklas Cassel wrote:
> On Mon, Nov 10, 2025 at 01:34:41PM +0100, Niklas Cassel wrote:
>> @@ -672,15 +705,13 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>>   	if (!pp->use_linkup_irq)
>>   		/* Ignore errors, the link may come up later */
>>   		dw_pcie_wait_for_link(pci);
>> -
>> -	ret = pci_host_probe(bridge);
>> -	if (ret)
>> -		goto err_stop_link;
>> -
>> -	if (pp->ops->post_init)
>> -		pp->ops->post_init(pp);
>> -
>> -	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
>> +	else
>> +		/*
>> +		 * For platforms with Link Up IRQ, initial scan will be done
>> +		 * on first Link Up IRQ.
>> +		 */
>> +		if (dw_pcie_host_initial_scan(pp))
>> +			goto err_stop_link;
> 
> Oops.. this condition was inverted, what I meant was:
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index e92513c5bda5..0e04c1d6d260 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -565,6 +565,39 @@ static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
>   	return 0;
>   }
>   
> +static int dw_pcie_host_initial_scan(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct pci_host_bridge *bridge = pp->bridge;
> +	int ret;
> +
> +	ret = pci_host_probe(bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (pp->ops->post_init)
> +		pp->ops->post_init(pp);
> +
> +	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
> +
> +	return 0;
> +}
> +
> +void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp)
> +{
> +	if (!pp->initial_linkup_irq_done) {
> +		if (dw_pcie_host_initial_scan(pp)) {
> +			//TODO: cleanup
> +		}
> +		pp->initial_linkup_irq_done = true;
> +	} else {
> +		/* Rescan the bus to enumerate endpoint devices */
> +		pci_lock_rescan_remove();
> +		pci_rescan_bus(pp->bridge->bus);
> +		pci_unlock_rescan_remove();
> +	}
> +}
> +
>   int dw_pcie_host_init(struct dw_pcie_rp *pp)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -669,18 +702,17 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>   	 * If there is no Link Up IRQ, we should not bypass the delay
>   	 * because that would require users to manually rescan for devices.
>   	 */
> -	if (!pp->use_linkup_irq)
> +	if (!pp->use_linkup_irq) {
>   		/* Ignore errors, the link may come up later */
>   		dw_pcie_wait_for_link(pci);
>   
> -	ret = pci_host_probe(bridge);
> -	if (ret)
> -		goto err_stop_link;
> -
> -	if (pp->ops->post_init)
> -		pp->ops->post_init(pp);
> -
> -	dwc_pcie_debugfs_init(pci, DW_PCIE_RC_TYPE);
> +		/*
> +		 * For platforms with Link Up IRQ, initial scan will be done
> +		 * on first Link Up IRQ.
> +		 */
> +		if (dw_pcie_host_initial_scan(pp))
> +			goto err_stop_link;
> +	}
>   
>   	return 0;
>   
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index e995f692a1ec..a31bd93490dc 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -427,6 +427,7 @@ struct dw_pcie_rp {
>   	int			msg_atu_index;
>   	struct resource		*msg_res;
>   	bool			use_linkup_irq;
> +	bool			initial_linkup_irq_done;
>   	struct pci_eq_presets	presets;
>   	struct pci_config_window *cfg;
>   	bool			ecam_enabled;
> @@ -807,6 +808,7 @@ void dw_pcie_msi_init(struct dw_pcie_rp *pp);
>   int dw_pcie_msi_host_init(struct dw_pcie_rp *pp);
>   void dw_pcie_free_msi(struct dw_pcie_rp *pp);
>   int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
> +void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp);
>   int dw_pcie_host_init(struct dw_pcie_rp *pp);
>   void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
>   int dw_pcie_allocate_domains(struct dw_pcie_rp *pp);
> @@ -844,6 +846,9 @@ static inline int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>   	return 0;
>   }
>   
> +static inline void dw_pcie_handle_link_up_irq(struct dw_pcie_rp *pp)
> +{ }
> +
>   static inline int dw_pcie_host_init(struct dw_pcie_rp *pp)
>   {
>   	return 0;
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 8a882dcd1e4e..042e5845bdd6 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -468,10 +468,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>   		if (rockchip_pcie_link_up(pci)) {
>   			msleep(PCIE_RESET_CONFIG_WAIT_MS);
>   			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> -			/* Rescan the bus to enumerate endpoint devices */
> -			pci_lock_rescan_remove();
> -			pci_rescan_bus(pp->bridge->bus);
> -			pci_unlock_rescan_remove();
> +			dw_pcie_handle_link_up_irq(pp);
>   		}
>   	}
>   
> 


