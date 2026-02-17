Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C517EE83848
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 00:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRsP5HR2a0zAIgfaGgQyoiXAP0vfVu+/fqrKxMVOnIo=; b=WCCRz1efnn2TFMwN3O6OMYXGV4
	gcAUfCv83Bavv4kq/IJcTlxEokE5CF68oe2ggtDVMAHmESuaCTtOO3s8FP0LRMu1U/ptTWstv6luS
	RZRVeODbbGXk2r4EZahXIuT+T/yRUgYCI/wfM4tJ/5H8mhdGtU9sl3PkEgTYYn6d0cZGcZIrDz1pQ
	C0lYiACaG4urFtBINN7sGwEiO8EmqFFEvMVfJ1qVE2lnOTqGADswBsMl1cxM5DdI/PA5+lsghDFFX
	niO9gDuSOLKvw5PUeDPRgEY4CeFNcZYync40EukxBHOsV9PW6EdbtXzpXrjrDt51r4PrPjl68ed7c
	N9FtygCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs8wS-00000007QzT-3aDl;
	Tue, 17 Feb 2026 00:27:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs8wQ-00000007Qz5-19Nq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 00:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DCEC40B2B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 00:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3455C116C6;
	Tue, 17 Feb 2026 00:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771288067;
	bh=miH1HOpckvuMUtbowPwhwMGcskk67oyMGA3dDmxBoBw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Suy4n9P3m1e4VefBZUGeo4z1+Fz6iQ/5kCZ6Ht0Vo+RnL5PSdwNZMwlQelsO1iXqG
	 BEoRKkWfaoLp6IcqP199Fm6UGcysVRpbU+XiK4XPYsuG4PvqyOiO23+pHCYkbmniHu
	 NLH7jbdHaDlJGdSQt0u1W1Et+WKlUJLgI781Faq099YAaRHLiaQ1f8ZWlPhnNJjKwJ
	 IZptX91D0btxN+mAZxCQglgVn4298M9zIkKH05idT6ZthiR1ez06jSyRiDqWbY25BD
	 HJiSAblulel8CDOWi03DAWOzwzApmkGbuZGRYKC6YqLf/wPY7aKvdqn23aQ2/Hc/d+
	 PPr07GluVFi2w==
Message-ID: <c31efa4e-28b8-4b7d-80c0-0082702dd996@kernel.org>
Date: Mon, 16 Feb 2026 18:27:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v3] arm/arm64: dts: socfpga: updates for v6.20, version
 3
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
References: <20260203033211.149355-1-dinguyen@kernel.org>
 <dab3bfc2-adfc-44c8-a1f6-7f02acfe8cfc@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <dab3bfc2-adfc-44c8-a1f6-7f02acfe8cfc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_162750_343452_C46B672F 
X-CRM114-Status: GOOD (  16.29  )
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



On 2/13/26 10:03, Krzysztof Kozlowski wrote:
> On 03/02/2026 04:32, Dinh Nguyen wrote:
>> SoCFPGA DTS updates for v6.20, version 3
>> - dt-bindings updates:
>> 	- Add intel,socfpga-agilex5-socdk-modular for the Agilex5 mod board
>> 	- Add intel,socfpga-agilex-emmc for the Agilex eMMC daughter board
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
>> - Add support for the Agilex eMMC daughter board
>>
>> ----------------------------------------------------------------
>> Dinh Nguyen (4):
>>        dt-bindings: arm: altera: combine Intel's SoCFPGA into altera.yaml
>>        dt-bindings: altera: document syscon as fallback for sys-mgr
>>        ARM: dts: socfpga: add #address-cells and #size-cells for sram node
>>        ARM: dts: socfpga: fix dtbs_check warning for fpga-region
>>
>> Khairul Anuar Romli (2):
>>        arm64: dts: socfpga: agilex5: Add dma-coherent property
>>        arm64: dts: intel: agilex5: Add simple-bus node on top of dma controller node
>>
>> Krzysztof Kozlowski (1):
>>        arm64: dts: altera: Use lowercase hex
>>
>> Nazim Amirul (1):
>>        arm64: dts: socfpga: agilex5: Add IOMMUS property for ethernet nodes
>>
>> Ng Tze Yee (2):
>>        arm64: dts: socfpga: agilex: add emmc support
>>        dt-bindings: intel: Add Agilex eMMC support
>>
>> Niravkumar L Rabara (2):
>>        dt-bindings: intel: Add Agilex5 SoCFPGA modular board
>>        arm64: dts: socfpga: agilex5: add support for modular board
>>
> 
> I checked few of here and none of them were in the next at the time you
> sent pull request, even though some were sent and applied long time ago.
> 
> Like this one - applied on 24th Dec:
> https://lore.kernel.org/all/4bd0643c-b9d4-49fa-92a5-f8878f75d1e1@kernel.org/
> 
> but never in the next.
> 
> In case if something is not clear: there must be in the linux-next at
> shortest interval after you apply the patches, so the NEXT linux-next
> after you apply.
> 

Sorry, I will make sure my branch gets pulled into linux-next in the future.

THanks,
Dinh

