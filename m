Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A316C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBio1PPPpJVLzZUll1bxnb1TdvQipCHJF9EEAuawoOM=; b=gdKtANKazb16pz7TPkIJvynC9M
	6JuzjwegtNrZ9XdGEKfCRvEpjOL8vvG79szbtozQtAso5wnOumIqDrFqS8pYdmSVk2AohXvnae2UG
	wiLUwaaQZonHz0zONKfZ6Cti+WrqZdrJhCHOvp9qyr2ntoPO/psW1mUQxYpETb6eqxIsNTg4q4VR2
	8MUX4Gadt1LSV1tybBeeGXeiDu+ZcJ5keOvW/aULWRQT4vvQ9CYT26LKoCUxkCxRCEbTaRFN0g1Z8
	KHRqr7JgrwqlnTXmXaRibwKBQ7ZuFeyj9usl1UupGlyP2yxU+AhmU0jlLs27g6xv3DBA7sUHZRsS0
	I57RU6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSegD-0000000G8si-2hmJ;
	Fri, 20 Jun 2025 16:33:29 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeFt-0000000G5br-12Qj;
	Fri, 20 Jun 2025 16:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=CBio1PPPpJVLzZUll1bxnb1TdvQipCHJF9EEAuawoOM=;
	b=PtNTfz7a6ceuzdIcvnaAMubBkFiQ2u9g5aqYZvwhQPvpte9cnGJUG2Pz52GtgB
	F3jFPwXAiyzEVbUeKQVIlPtExfcttXfJ/T/HKTmFvImpgC29ZL3sMV1NpmDCQPtM
	5DdEajKEoGL531e8baDlyvxpAJvlMHLl5rtp/qePJ/1a0=
Received: from [IPV6:240e:b8f:919b:3100:8440:da7c:be7e:927f] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnz_PXhlVoLljeAg--.60205S2;
	Sat, 21 Jun 2025 00:05:44 +0800 (CST)
Message-ID: <e9eeeeb4-77e6-48f1-bedc-15207f39d7b6@163.com>
Date: Sat, 21 Jun 2025 00:05:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Configure root port MPS during host probing
To: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
 heiko@sntech.de, mani@kernel.org, yue.wang@Amlogic.com
Cc: pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250620155507.1022099-1-18255117159@163.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250620155507.1022099-1-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnz_PXhlVoLljeAg--.60205S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4fCw13Kr45XFW3trWDArb_yoW5JF4fpF
	WfGws3Ar4xJF15GF9rWa1vkFyrZas7KrWUGrZrJ3sxZanxZFyUXF1xKw4rA347XrWxZ3WI
	gF1jqFy8uan8Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7pnQUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:8440:da7c:be7e:927f]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxlyo2hVgqSAEAAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_090617_650314_BA5338CC 
X-CRM114-Status: GOOD (  15.21  )
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

Hi all，

I'm very sorry. I forgot the review label of Niklas. If it can be 
merged, please ask the maintainer to help add this tag. Thank you very much.

Reviewed-by: Niklas Cassel <cassel@kernel.org>

Best regards,
Hans

On 2025/6/20 23:55, Hans Zhang wrote:
> Current PCIe initialization exhibits a key optimization gap: Root Ports
> may operate with non-optimal Maximum Payload Size (MPS) settings. While
> downstream device configuration is handled during bus enumeration, Root
> Port MPS values inherited from firmware or hardware defaults often fail
> to utilize the full capabilities supported by controller hardware. This
> results in suboptimal data transfer efficiency throughout the PCIe
> hierarchy.
> 
> This patch series addresses this by:
> 
> 1.  Core PCI enhancement (Patch 1):
> - Proactively configures Root Port MPS during host controller probing
> - Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
> - Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
> - Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
> - Preserves standard MPS negotiation during downstream enumeration
> 
> 2.  Driver cleanup (Patch 2):
> - Removes redundant MPS configuration from Meson PCIe controller driver
> - Functionality is now centralized in PCI core
> - Simplifies driver maintenance long-term
> 
> ---
> Changes for v5:
> - Use pcie_set_mps directly instead of pcie_write_mps.
> - The patch 1 commit message were modified.
> 
> Changes for v4:
> - The patch [v4 1/2] add a comment to explain why it was done this way.
> - The patch [v4 2/2] have not been modified.
> - Drop patch [v3 3/3]. The Maintainer of the pci-aardvark.c file suggests
>    that this patch cannot be submitted. In addition, Mani also suggests
>    dropping this patch until this series of issues is resolved.
> 
> Changes for v3:
> - The new split is patch 2/3 and 3/3.
> - Modify the patch 1/3 according to Niklas' suggestion.
> 
> Changes for v2:
> - According to the Maintainer's suggestion, limit the setting of MPS
>    changes to platforms with controller drivers.
> - Delete the MPS code set by the SOC manufacturer.
> ---
> 
> Hans Zhang (2):
>    PCI: Configure root port MPS during host probing
>    PCI: dwc: Remove redundant MPS configuration
> 
>   drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
>   drivers/pci/probe.c                    | 10 ++++++++++
>   2 files changed, 10 insertions(+), 17 deletions(-)
> 
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494


