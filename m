Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982FCCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLjNq3xGexi6hHuje2pZSSEVpO87sjjlxI3YsPJaXJs=; b=sFPp14e7Yn6h/Y/5UGN9s6rRrC
	qfOWB+mVV61Lcdzy1nuf2F70DjcBgyCdr9Ch8CBNJlt2tPCNA42IbB5Y/4YxiE9fUqRSlKiZcIFFc
	tLwlgjLeqAES914oh+hVbdBdnT3patyRFo37o0YAluHBHD8NdcFtbiKmw122S6fKt7se1O49BTlr3
	8bjEGpzUMWkCCK/86WaYfbj6E2OUBfHRVfMi4f76rU+QAia+H4NyAR0rFkFaExOOLylTfZv4bJRzJ
	nfDbL56SiROp+tdXiBsG+Qb4fR7VR5akFpw520tEPWEArzLGDqPwWouCeMb5TeaoBwkbCeR6tt6iq
	vtTQhg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabAx-00000002fqL-2faF;
	Fri, 19 Jun 2026 15:30:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabAw-00000002fox-2Y76;
	Fri, 19 Jun 2026 15:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mLjNq3xGexi6hHuje2pZSSEVpO87sjjlxI3YsPJaXJs=; b=AqWpTud5BjRUS92qPwk7YAOr1R
	szVIaX3PaBCUuiHCASwj2HxTwYnnZyhjhL6Wy7UjSUHTfQ0TugGHSPp0Wxn6fbOxPbY0OtqVYMtgo
	i7xh3Y5eCFmJ1QEaXZUo6bl1FcGM73cJS4xPPUWRy5MuoZbdfeYfvlGL/eNz6z8HYvRj2sT9AeeCD
	JwZic95Iu7dfi5Tnut+G+tDLmhm5ZHk1vpEi+pZknLDYcIcsVcozt3bQA/7QWbl7SkCXIVbm2M0Mo
	9AC9mAHlwm+9o2Sv/ppESVKRwj6mFCrvC4fhUs6VLo+B2ZUhqB06i7EOPnT8P/AXc7yWNU01D1bK2
	Etkctj7g==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wabAs-0000000Egaw-2uLI;
	Fri, 19 Jun 2026 15:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=mLjNq3xGexi6hHuje2pZSSEVpO87sjjlxI3YsPJaXJs=;
	b=WWZwTY0t6sGMtDRzCftyLiJoSnbU3TkUe4NHi7ZG3KIrX8KolrdkPh0UAL3K1W
	lW6AQf0LMkjP0peGCZyAjFljpOTBkWy1sIO8MNWwQM7fezWKNvRZu7Dk2lDOUa2i
	nFwBqidIOU2kkgDrAYeEUIh4YY6siwKDDGEwz2iBMqgA0=
Received: from [IPV6:240e:b8f:91b3:d000:a264:4237:512f:7b1] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD317VjYDVqjyOoEA--.54216S2;
	Fri, 19 Jun 2026 23:29:40 +0800 (CST)
Message-ID: <dae17d36-c7d2-467b-a621-3c55e08a67a8@163.com>
Date: Fri, 19 Jun 2026 23:29:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
To: bhelgaas@google.com, Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, heiko@sntech.de,
 yue.wang@amlogic.com, pali@kernel.org, neil.armstrong@linaro.org,
 robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, cassel@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20251127170908.14850-1-18255117159@163.com>
 <vpuzlzry7uulctur7kwtlogniuhogd5ybmrwjtos2v7yryf47v@yj2ocobbog6s>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <vpuzlzry7uulctur7kwtlogniuhogd5ybmrwjtos2v7yryf47v@yj2ocobbog6s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD317VjYDVqjyOoEA--.54216S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFWxurWrZw1xCrWrXF4DXFb_yoWrGw4rpF
	WFganakF4xGr1fCa9Fgw1jkFyYqas7GF47JrW5GwnxZanxZF15XFZ29w1rZr9rXrWfC3WS
	vFy2qa4xW3Wqva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIjgsUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:a264:4237:512f:7b1]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwwUZvGo1YGWHawAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_163031_349360_9AE8E8D5 
X-CRM114-Status: GOOD (  17.73  )
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



On 5/6/26 22:00, Manivannan Sadhasivam wrote:
> On Fri, Nov 28, 2025 at 01:09:06AM +0800, Hans Zhang wrote:
>> Current PCIe initialization exhibits a key optimization gap: Root Ports
>> may operate with non-optimal Maximum Payload Size (MPS) settings. While
>> downstream device configuration is handled during bus enumeration, Root
>> Port MPS values inherited from firmware or hardware defaults often fail
>> to utilize the full capabilities supported by controller hardware. This
>> results in suboptimal data transfer efficiency throughout the PCIe
>> hierarchy.
>>
>> This patch series addresses this by:
>>
>> 1. Core PCI enhancement (Patch 1):
>> - Proactively configures Root Port MPS during host controller probing
>> - Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
>> - Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
>>    and not in PCIE_BUS_PEER2PEER mode (which requires default 128 bytes)
>> - Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
>> - Preserves standard MPS negotiation during downstream enumeration
>>
>> 2. Driver cleanup (Patch 2):
>> - Removes redundant MPS configuration from Meson PCIe controller driver
>> - Functionality is now centralized in PCI core
>> - Simplifies driver maintenance long-term
>>
> 
> For the series,
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> Bjorn: Could you please take a look? This series has been floating for a
> while...

Hello Bjorn,

Any chance for this series to be applied?

Best regards,
Hans


> 
> - Mani
> 
>> ---
>> Changes in v7:
>> - Exclude PCIE_BUS_PEER2PEER mode from Root Port MPS configuration
>> - Remove redundant check for upstream bridge (Root Ports don't have one)
>> - Improve commit message and code comments as per Bjorn.
>>
>> Changes for v6:
>> https://patchwork.kernel.org/project/linux-pci/patch/20251104165125.174168-1-18255117159@163.com/
>>
>> - Modify the commit message and comments. (Bjorn)
>> - Patch 1/2 code logic: Add !bridge check to configure MPS only for Root Ports
>>    without an upstream bridge (root bridges), avoiding incorrect handling of
>>    non-root-bridge Root Ports (Niklas).
>>
>> Changes for v5:
>> https://patchwork.kernel.org/project/linux-pci/patch/20250620155507.1022099-1-18255117159@163.com/
>>
>> - Use pcie_set_mps directly instead of pcie_write_mps.
>> - The patch 1 commit message were modified.
>>
>> Changes for v4:
>> https://patchwork.kernel.org/project/linux-pci/patch/20250510155607.390687-1-18255117159@163.com/
>>
>> - The patch [v4 1/2] add a comment to explain why it was done this way.
>> - The patch [v4 2/2] have not been modified.
>> - Drop patch [v3 3/3]. The Maintainer of the pci-aardvark.c file suggests
>>    that this patch cannot be submitted. In addition, Mani also suggests
>>    dropping this patch until this series of issues is resolved.
>>
>> Changes for v3:
>> https://patchwork.kernel.org/project/linux-pci/patch/20250506173439.292460-1-18255117159@163.com/
>>
>> - The new split is patch 2/3 and 3/3.
>> - Modify the patch 1/3 according to Niklas' suggestion.
>>
>> Changes for v2:
>> https://patchwork.kernel.org/project/linux-pci/patch/20250425095708.32662-1-18255117159@163.com/
>>
>> - According to the Maintainer's suggestion, limit the setting of MPS
>>    changes to platforms with controller drivers.
>> - Delete the MPS code set by the SOC manufacturer.
>> ---
>>
>> Hans Zhang (2):
>>    PCI: Configure Root Port MPS during host probing
>>    PCI: dwc: Remove redundant MPS configuration
>>
>>   drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
>>   drivers/pci/probe.c                    | 12 ++++++++++++
>>   2 files changed, 12 insertions(+), 17 deletions(-)
>>
>>
>> base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
>> -- 
>> 2.34.1
>>
> 


