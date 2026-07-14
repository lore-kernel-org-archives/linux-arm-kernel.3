Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6D4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S323XPQAVbXMMiJRm+Dg+pgQry7Wic4cXHZLSGEJw+0=; b=2i01egrIDtzO1jceA+mJnoMNtD
	/YaGsL5QW6MXW7XRETJ3/NtsjHsKq54v/An3XRRl3sk99ZhPblS1xRihzcVs5+N+jjhWrkRj20Ed4
	nS/ZZ7ulGwXz22nIVDalT5lmqWIZ6aott0LanE2EbOww+vQd8ty2pPWPpTl6fsio1O4EdcODQkfDg
	GRFKWPKSaX4yf9vXBMQpBHhFlTQCJmmXLRyEEhkmkbvU9WeDwl6pwA8fM0yLDBfvbKEzQuub4G6v1
	GuS5mnNMZbuy1NHuxbMzlzKZEwsUf/OH0nnV6o6H+yMjDEAtyjSUjClBAiY88qjRYO6yGa/c16jaK
	r9vxi4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjayT-0000000Bdx5-0E4h;
	Tue, 14 Jul 2026 11:06:53 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjayP-0000000BdvE-2zOi;
	Tue, 14 Jul 2026 11:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=S323XPQAVbXMMiJRm+Dg+pgQry7Wic4cXHZLSGEJw+0=;
	b=ZG/28Z9YW8+8O+S7agcsiaFV1MwoBUU+msb83Q9py4oWPZgTpjLvhYUhaQLaC7
	BXqhypUV8U2IPJ0lkxgb6mWSThzlCykBtyKXpKjOUYmn3nyX32EKhxlC1kehCh8Q
	UJJlhIMZSEiy9uGsFcTK2R8wxpOGY+4MEN9GGkYZesuEc=
Received: from [10.111.8.51] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDXna8fGFZqlFnYJQ--.22967S2;
	Tue, 14 Jul 2026 19:06:08 +0800 (CST)
Message-ID: <72a058fd-5781-43bc-9148-180140929ecd@163.com>
Date: Tue, 14 Jul 2026 19:06:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, Manivannan Sadhasivam <mani@kernel.org>,
 lpieralisi@kernel.org, kwilczynski@kernel.org, heiko@sntech.de,
 yue.wang@amlogic.com, pali@kernel.org, neil.armstrong@linaro.org,
 robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, cassel@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260622171448.GA678675@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260622171448.GA678675@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wDXna8fGFZqlFnYJQ--.22967S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWUZryDtF43XF4kJFW7CFg_yoW8CFWkpF
	W5XanayF4xKFyfCF4qqwsYkryYqa48ta43Xr1DtryayFn09rn8XFWjgws5Gwn7Xr1xCr1S
	9r1qqa4xXwn0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4UDXUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AA+4WpWGCAV3gAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_040650_198483_36BA333F 
X-CRM114-Status: GOOD (  11.01  )
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



On 6/23/26 01:14, Bjorn Helgaas wrote:
> On Fri, Jun 19, 2026 at 11:29:39PM +0800, Hans Zhang wrote:
>> On 5/6/26 22:00, Manivannan Sadhasivam wrote:
>>> On Fri, Nov 28, 2025 at 01:09:06AM +0800, Hans Zhang wrote:
>>>> Current PCIe initialization exhibits a key optimization gap: Root Ports
>>>> may operate with non-optimal Maximum Payload Size (MPS) settings. While
>>>> downstream device configuration is handled during bus enumeration, Root
>>>> Port MPS values inherited from firmware or hardware defaults often fail
>>>> to utilize the full capabilities supported by controller hardware. This
>>>> results in suboptimal data transfer efficiency throughout the PCIe
>>>> hierarchy.
>>>>
>>>> This patch series addresses this by:
>>>>
>>>> 1. Core PCI enhancement (Patch 1):
>>>> - Proactively configures Root Port MPS during host controller probing
>>>> - Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
>>>> - Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
>>>>     and not in PCIE_BUS_PEER2PEER mode (which requires default 128 bytes)
>>>> - Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
>>>> - Preserves standard MPS negotiation during downstream enumeration
>>>>
>>>> 2. Driver cleanup (Patch 2):
>>>> - Removes redundant MPS configuration from Meson PCIe controller driver
>>>> - Functionality is now centralized in PCI core
>>>> - Simplifies driver maintenance long-term
>>>>
>>>
>>> For the series,
>>>
>>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>>>
>>> Bjorn: Could you please take a look? This series has been floating for a
>>> while...
>>
>> Hello Bjorn,
>>
>> Any chance for this series to be applied?
> 
> It's too late for v7.2; we're already more than halfway through the
> merge window.  We can look again for v7.3 after v7.2-rc1.

Hello Bjorn,

Gentle ping on this series.

Best regards,
Hans


