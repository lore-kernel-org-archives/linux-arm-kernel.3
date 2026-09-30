Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D06CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 01:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4LgJcxG58FFth/hB4/i7KbJf2H3darIqdWGj6YwQ/s=; b=D70MwHDgH3Bu3Q/73bjGji7qjk
	fUOpyjAmk8NhuSBrmPC9SBuyTIKxNLP2XOBJcxqpl/kWfLd37d1doFpDwxrt1rV/XYjkksa/Yi9e9
	OOTHWDwHMoQdsHYpiFpMnhy6G6YaqOlD6udSGlaIwWuhg0C9JQYJviXCOCCX1VkonFgZJ47ZJSWcL
	4sV7OEuY0iOw/1WBRUkfDuDc7M8CUMJKzM4dyBku6gha/3wWmGJnRJ7qCEzNcfzZIucl7nI81z7ng
	OOco3SfUrliYq3Wv440RjHkdbqwBdpw68Od4iLDPiOv7ak0jlwVSBTH6LKQFtpdW5QPWfe+fQiH5g
	bj6P8ofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBj7M-00000004reC-2ulV;
	Wed, 30 Sep 2026 01:28:20 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBj7J-00000004rde-3R2A;
	Wed, 30 Sep 2026 01:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=y4LgJcxG58FFth/hB4/i7KbJf2H3darIqdWGj6YwQ/s=;
	b=jjxRzqGTAYcYRKiHAHIVCbgcrTAW/dqGYAbEjBqLST5e81bz9cyk0EZOljUVwv
	YiJa/Qmillt5urd1n7wlLmwWLeZsQ1fa4RAfaXMcwGZ/bPW/TLSwG1u5fDjNQeps
	hUs5bBmyQ9VD2y8ZPgKQuBMw6abZAk8KFv2VpQlN1AmQw=
Message-ID: <e8a9863f-d4ea-4796-8dfe-c59f5e379687@163.com>
Date: Wed, 30 Sep 2026 09:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: dwc: Align register macros with Synopsys
 documentation
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
 heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com, pali@kernel.org,
 neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, cassel@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Feizhou Yu <yufeizhou201@163.com>
References: <20260928215110.GA2266447@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260928215110.GA2266447@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3B4aDZbxq7D5eBg--.58103S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWkWw1fJFy3Ary3Wr17Jrb_yoW8urWxpa
	1xJF4rtw4DXF4aqw4Ig3WrX3W7Xrn3JrZ8X3yvqw18tan5Xr93Gr40grWjkFWkZrn3Kr1j
	qr4jq3yxWry3Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UC2NNUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwwRE52q8ZYQf4QAA3t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_182818_287426_0AF53BF5 
X-CRM114-Status: GOOD (  11.46  )
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



On 9/29/26 05:51, Bjorn Helgaas wrote:
> On Mon, Sep 28, 2026 at 04:50:09PM -0500, Bjorn Helgaas wrote:
>> On Sat, Sep 12, 2026 at 12:25:36AM +0800, Hans Zhang wrote:
>>> The DWC PCIe register and field macros are inconsistently named and
>>> often do not match the Synopsys DesignWare PCIe Controller Reference
>>> Manual.  This makes it harder to cross-reference the code with the
>>> documentation when debugging or maintaining the driver.
>>
>>> +#define  PORT_AFAC_L0S_ELS		24		/* L0s Entrance Latency shift */
>>> +#define  PORT_AFAC_L0S_ELM		GENMASK(26, 24)	/* L0s Entrance Latency mask */
>>> +#define  PORT_AFAC_L1_ELS		27		/* L1 Entrance Latency shift */
>>> +#define  PORT_AFAC_L1_ELM		GENMASK(29, 27)	/* L1 Entrance Latency mask */
>>
>> Surely we don't need both the shift and the mask?  Maybe a separate
>> patch convert to FIELD_PREP()?
> 
> Oops, sorry, didn't notice that Mani had already applied these.  This
> could be material for follow-on patches.

Hi Bjorn,

I will send a patch separately based on the branch controller/dwc.


Best regards,
Hans


> 
>>> +#define  GEN3_CTRL_RATE_SHADOW_SEL_SHIFT 24		/* Rate Shadow Select shift */
>>> +#define  GEN3_CTRL_RATE_SHADOW_SEL_MASK	GENMASK(25, 24)	/* Rate Shadow Select mask */
>>
>> Ditto.
>>
>>> +#define MSIX_DOORBELL			0x948
>>> +#define  MSIX_DOORBELL_PF_SHIFT		24
>>
>> Probably would be better to define a mask so we have the position
>> *and* the width.
>>
>>> @@ -621,15 +621,15 @@ static inline u32 event_counter_prog(struct tegra_pcie_dw *pcie, u32 event)
>>>   	u32 val;
>>>   
>>>   	val = dw_pcie_readl_dbi(&pcie->pci, pcie->ras_des_cap +
>>> -				PCIE_RAS_DES_EVENT_COUNTER_CONTROL);
>>> +				RAS_DES_EVENT_COUNTER_CONTROL);
>>>   	val &= ~(EVENT_COUNTER_EVENT_SEL_MASK << EVENT_COUNTER_EVENT_SEL_SHIFT);
>>>   	val |= EVENT_COUNTER_GROUP_5 << EVENT_COUNTER_GROUP_SEL_SHIFT;
>>>   	val |= event << EVENT_COUNTER_EVENT_SEL_SHIFT;
>>>   	val |= EVENT_COUNTER_ENABLE_ALL << EVENT_COUNTER_ENABLE_SHIFT;
>>
>> Probably a good chance to convert these to FIELD_PREP() etc. as well,
>> maybe in a separate patch.


