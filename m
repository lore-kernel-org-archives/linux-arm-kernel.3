Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8BCCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrntyxENooj6wbeRVkJOCbYDj96squyuxfsHscwtUdc=; b=5Deq8e35lTrx8Z4o/Gmv6zg7oK
	dPM+JqRqlwXfRPDdCgdJWmiy9Ls/N6oJVB8lkkaNC70+BoAwI0vqazF9AVCiNHaWQulcsGsZb7cIV
	F+/YnrmDE/tSDagCkJ7AlZazw1HTxz8Dr35NvzP4N4j359LRwiZWeyZbd/cLoApDSmFSOza9UH3yZ
	B6xSCwaQJFrCdABXhngim2DnUz5UjNHze/JYBmXD1/3z+1RzcJ/NM9s7Y2d074eAdy15cUHB41yU4
	kDrzR45r1W//4DpS8T6mHhQs9RcYwVFDvLJMzUWrMBOuLOTESdK7pNXslAmuHas0vqSjy0l4IdxaD
	JxEsweMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOz1-00000002gri-37tI;
	Mon, 08 Jun 2026 01:40:55 +0000
Received: from mail-m12878.netease.com ([103.209.128.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOyy-00000002grD-0yX6;
	Mon, 08 Jun 2026 01:40:54 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 416b76aca;
	Mon, 8 Jun 2026 09:40:38 +0800 (GMT+08:00)
Message-ID: <e5058919-9485-4de5-8eea-331ebfc2987c@rock-chips.com>
Date: Mon, 8 Jun 2026 09:40:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/9] accel: rocket: Add RK3568 NPU support
To: Midgy Balon <midgy971@gmail.com>
Cc: tomeu@tomeuvizoso.net, ogabbay@kernel.org, heiko@sntech.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Simon Xue <xxm@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
 <3d99569e-9c3a-49d1-93fb-1335382523e9@rock-chips.com>
 <CA+GS1Y1s78PwN63X2YJoS8VEGp7CpTERo_K65yKs00U4VRAw4Q@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CA+GS1Y1s78PwN63X2YJoS8VEGp7CpTERo_K65yKs00U4VRAw4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ea4e3928003a7kunm2dc5485516737a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRhMVk8eQxpNQxkaSkIYTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=fd9Fgd70jQYunloQSZc2Sw1ViLh44FaOLEhh8/tp6FuCuEqh+zQpvglmCBICWSNY4eMQ2EG3F6nYIRDMlWBfyr07TaYpQAnqsDsnK7+my9QhXHjn1qw65oOnV0stueIXxBjcZ5b29o9ukMPv35PD2ONVCXGOSRJMTHrJjXosvds=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=UrntyxENooj6wbeRVkJOCbYDj96squyuxfsHscwtUdc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_184052_837798_2C7A9C45 
X-CRM114-Status: GOOD (  30.62  )
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

Hi Midgy,

On 6/8/2026 5:03 AM, Midgy Balon wrote:
> Hi Chaoyi,
> 
> Thanks a lot for looking at this -- input from Rockchip is exactly what this
> series needs.
> 
>> Hmmm. If I understand correctly, the NPU IOMMU should be v2 rather than v1,
>> implying it should support 40-bit PAs. Nevertheless, please note that the
>> upper limit for DTE is 32 bits.
> 
> Understood, and that 32-bit-DTE note is the crux of the trouble I had, so let
> me lay out what I see and ask how you'd prefer to solve it.
> 
> The mainline node is already v2 (rockchip,rk3568-iommu in rk356x-base.dtsi).
> The problem on this 8 GiB board: with the v2 ops the page-table allocations
> (gfp_flags == 0) can land above 4 GiB, so the DTE ends up > 32 bits and the
> NPU's first translation faults with DMA_READ_ERROR. To work around that I had
> switched the NPU MMU to the v1 compatible (rockchip,iommu), whose ops set
> GFP_DMA32 and keep the DTE sub-4 GiB. That works in isolation, but because the
> driver keeps a single global rk_ops, a v1 NPU MMU then trips
> WARN_ON(rk_ops != ops) against the SoC's v2 instances (VOP/VDEC), which is why
> I based the series on Simon's per-device-ops work.
> 
> So my question: with per-device ops in place, what's the intended way to keep
> the NPU MMU on v2 *and* cap its DTE at 32 bits on boards with >4 GiB of RAM?
> A v2 ops variant carrying GFP_DMA32 for this device, or is there a register/
> config bit that constrains the DTE address? I'd rather follow the Rockchip
> intent here than carry the v1 workaround. (Simon, cc'd -- this is right next to
> your per-device-ops series.)
>

If Simon's method works, please use it :)

>> Can these operations not be completed via the pmdomain driver?
>> If some operations are controlled by TF-A, are you using open source TF-A?
> 
> Most of it is in pmdomain already. Power-on and NoC de-idle are done by the
> RK3568 NPU power domain (genpd) at power-on -- the driver no longer pokes the
> PMU directly. Two things remain outside it:
> 
>  - vdd_npu: I mark it regulator-always-on in DT rather than wiring it as the
>    domain's domain-supply, because as a domain-supply it created a device-link
>    to the I2C PMIC (rk809) and genpd's power-off QoS-save path then hung
>    reading the NPU QoS registers behind the (gated) NoC. If there's a clean way
>    to let genpd own vdd_npu without that I2C ordering deadlock I'd much prefer
>    that -- pointers welcome.
>

Please refer to the patch below regarding the RK3588 NPU pmdomain.
In short, you need to set a "need_regulator" for the RK3568 NPU pmdomain.

https://lore.kernel.org/all/20251216055247.13150-1-rmxpzlb@gmail.com/

>  - the NPU compute clock (PVTPLL): set from the driver via SCMI, and only
>    needed for actual compute, not for bring-up.
> 
> One more pmdomain observation from testing, possibly relevant to how the NPU
> domain should be modelled: the domain's power-off/on cycle doesn't reliably
> re-de-idle the NoC. If the NPU is probed after genpd has already powered the
> (unused) domain off, the power-on de-idle fails ("failed to set idle on domain
> 'npu'") and the NPU IOMMU then takes an external abort on its first MMIO access.
> Probing the NPU before the unused-domain power-off, or marking the domain
> always-on, both avoid it. Is the NoC de-idle expected to work on a genpd
> re-power here, or should this domain effectively stay on?
>

Not quite sure what's going on with PVTPLL and NOC.
Maybe @Finley knows about this?

> On TF-A: yes -- bl31 is built from upstream arm-trusted-firmware
> (github.com/ARM-software/arm-trusted-firmware, RK3568 platform), providing PSCI
> and the SCMI clock service. The only closed blob in the boot chain is Rockchip's
> DDR init (rkbin), which is the standard situation for mainline RK356x.

-- 
Best, 
Chaoyi

