Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989E6E6BF04
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFSC4tLIKV6C0Jy2CKo8iOWIs9hxXPJubP/YArXe2QE=; b=SoS2DDyoD/6/CvWpycHl14WJNV
	ITFbnIA2w37+OhfJ9R3LL/yetYxr5S4/E3AYOLPzboBBpLRNFi+fhSDb/PguOa9KQuX5z5QFAm+aA
	iXydqmu1EpgHfmUHP0WBr8suQdOZoa5NLWPZ/+5ap3kdfSbnkJFAviCwofdp/O4SD5KW/IEyZnq9X
	ecLIuJyKDdmxLbv5SdpYdUuoTjVEClOkJjk8xmJANfixaVw/biv5icB1hoSCqMt43MU+bu4VOUhbq
	K/179ZEzOEZYcluIRp85GyhQKd612Yd7LEtpQSEL0qSff6ur6QK+e0FpMnoZ/EKpZ8iJzbqiMGZDg
	mq6MuSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnMo-00000001SrH-0SzJ;
	Fri, 30 Jan 2026 12:12:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlnMl-00000001Sqt-3DIk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 12:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C396743651
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 12:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B98FC4CEF7;
	Fri, 30 Jan 2026 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769775165;
	bh=xp4eTBr8ddeQsKKKuwnkL++/y0gEy1Zw2KOQCgvaTmc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=snjfWkhp2yX/vqJRSnyVxVeUnHSZEBPYCntB86Zn1QafQmChppi+l7ixYwDarsX2+
	 DFgTlqwyDwFXCecDzu19KjDTYeJDa4Vi+gAA2Sqbfvy39lyOm1bggsB7zpjPWMpWws
	 H3SH8McAgoQHuNgmMsUAQuzvJquq8tNDOsayN/nATzW5YNaGdqd3qNVcSwBhLqgAzS
	 7M5YiifHcCdyHrHxEx6YyuLpT8uPJgfkPopOd2NGHarGIawiSHTSoNLRK9XNKVdAas
	 0Ob0/DXgXOSmOydOmjgw/IUJIcvg6HsZRZlYGJJmU0HMEXvkzyacQJZlJBxQdunL8G
	 JQpQngfbFNslw==
Message-ID: <7c6de5dc-8396-4793-a4fa-184bfe4096f3@kernel.org>
Date: Fri, 30 Jan 2026 06:12:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] arm/arm64: dts: socfpga: updates for v6.20
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
References: <20260124200118.2789128-1-dinguyen@kernel.org>
 <2b81a667-adad-4960-bc48-f60fbf740620@kernel.org>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <2b81a667-adad-4960-bc48-f60fbf740620@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_041247_860018_843032F3 
X-CRM114-Status: GOOD (  16.33  )
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



On 1/28/26 12:48, Krzysztof Kozlowski wrote:
> On 24/01/2026 21:01, Dinh Nguyen wrote:
>> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>>
>>    Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.20
>>
>> for you to fetch changes up to 1a457681c075e1bd894df753087cb4268ce9f9e9:
>>
>>    arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node (2026-01-02 07:52:44 -0600)
>>
>> ----------------------------------------------------------------
>> SoCFPGA DTS updates for v6.20
>> - dt-bindings updates:
>> 	- Add dma-coherent for cdns,hp-nfc and snps,dw-axi-dmac
>> 	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
>> 	- Move entries in intel,socfpga.yaml into altera.yaml
>> 	- Add syscon as a fallback for sys-mgr
>>
>> - Add dma-cohrerent property for Agilex5 NAND and DMA
>> - Add support for the Agilex5 modular board
>> - Add IOMMUS property for ethernet nodes for Agilex5
>> - Use lowercase hex for dts files
>> - Add #address-cells and #size-cells for sram
>> - Fix dtbs_check warning for fpga-region
>> - Move dma controller node for Agilex5 under simple-bus
>>
>> ----------------------------------------------------------------
>> Dinh Nguyen (4):
>>        dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
>>        dt-bindings: altera: document syscon as fallback for sys-mgr
>>        ARM: dts: socfpga: add #address-cells and #size-cells for sram node
>>        ARM: dts: socfpga: fix dtbs_check warning for fpga-region
>>
>> Khairul Anuar Romli (4):
>>        dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
>>        dt-bindings: dma: snps,dw-axi-dmac: add dma-coherent property
> 
> 
> These are not SoC patches, unless maintainers are unresponsive which I
> believe is not a case here, so they should not be going via this tree.
> 
> None of this, merged on 15th Dec, was fed to linux-next, so you don't
> even know if this conflicts with maintainer trees thus pushing conflict
> discover unto soc tree.
> 
> Not being in the next is already a problem but gets more serious when
> taking other subsystem patches.
> 
> That's my comment, but Arnd was looking at these whether to merge.
> 

Apologies! I did not hear any feedback from those maintainers nor did I 
remind them, so that's my fault. Let me rework this PR and take those 
patches through the respective maintainer's tree.

DInh



