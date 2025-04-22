Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15302C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kc1HcyFadApejOKhHPMGEBRAlKE59o9rLPd0PpuBik=; b=S9gzFbONUd1aR8ENHy8j+JNX8N
	ogMcF5HTqEJ4aUNX9LpmI/dX19vKHAIZw//KND11/jXP7NX3Dr9SNHeudDe87hU+W+UhSkoLOlqqV
	ha8LQMeaa0jiDdhPFWgU/CXoKSXTulOLxGt5LcAcDVo1HEaScdID5FnrlLBV5Pz9Ebm1Os8EzUNI3
	tK91KLq0AMX2g94oBPo8upswpw/0XS3A5HSPWJoRcgWMQ4LCOAPIXnbzyfpDuAp4k7H8NMbctupLF
	KEuMQbkxZK/b7umJZd7pA34FDFT/S4vD7STivt+RY4QkhS0sWxPAlDv5QdKQkeihZ6vpEP66QtjQ4
	+mjDvuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IA0-0000000886l-1EoJ;
	Tue, 22 Apr 2025 18:15:56 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G6s-00000007pUv-3aRI;
	Tue, 22 Apr 2025 16:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=+kc1HcyFadApejOKhHPMGEBRAlKE59o9rLPd0PpuBik=;
	b=Y62cNb7hI8toORNjyNf+5+ifAGKiGWZC+DxV44iarNTU+P3wmYCOdcSMUqJ4TJ
	qheM/rW/DIXq1jeFHqp4vW2HGUYcKRjBRq6X9hHkwkawmJ8x+OwDqDnrSJiOioEh
	Ctl5CvYG/a0BM/M3ZlvjmbyWy+9IQbd0qX0grkK//nAtc=
Received: from [192.168.71.89] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCH5SrSvQdo6ojTBg--.18334S2;
	Wed, 23 Apr 2025 00:03:31 +0800 (CST)
Message-ID: <6c962047-c258-40f5-966b-ec1e985e6cb7@163.com>
Date: Wed, 23 Apr 2025 00:03:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI: dw-rockchip: Reorganize register and bitfield
 definitions
To: Niklas Cassel <cassel@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250422112830.204374-1-18255117159@163.com>
 <20250422112830.204374-3-18255117159@163.com> <aAeL_Wr42ETm7S96@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aAeL_Wr42ETm7S96@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wCH5SrSvQdo6ojTBg--.18334S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Wr13ZFy5Xr43Gr47Aw4rAFb_yoW7CrykpF
	WUJa4Skrs8t3yUC3sYg3Z8AFyIqr4fKFWYgr4SgrWUC3Z5A3W8Gr10qFW5WFy7Xr4kurWf
	uwn8Ww17WF90krJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3Oz3UUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwg3o2gHuI61MQAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_090435_332163_35237BED 
X-CRM114-Status: GOOD (  21.18  )
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



On 2025/4/22 20:30, Niklas Cassel wrote:
> On Tue, Apr 22, 2025 at 07:28:29PM +0800, Hans Zhang wrote:
>> Register definitions were scattered with ambiguous names (e.g.,
>> PCIE_RDLH_LINK_UP_CHGED in PCIE_CLIENT_INTR_STATUS_MISC) and lacked
>> hierarchical grouping. Magic values for bit operations reduced code
>> clarity.
>>
>> Group registers and their associated bitfields logically. This improves
>> maintainability and aligns the code with hardware documentation.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 42 +++++++++++--------
>>   1 file changed, 24 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> index fd5827bbfae3..cdc8afc6cfc1 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> @@ -8,6 +8,7 @@
>>    * Author: Simon Xue <xxm@rock-chips.com>
>>    */
>>   
>> +#include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/irqchip/chained_irq.h>
>> @@ -34,30 +35,35 @@
>>   
>>   #define to_rockchip_pcie(x) dev_get_drvdata((x)->dev)
>>   
>> -#define PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
>> -#define PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
>> -#define PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
>> -#define PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
>> -#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
>> +#define PCIE_CLIENT_GENERAL_CONTROL	0x0
>> +#define  PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
>> +#define  PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
>> +#define  PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
>> +#define  PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
>> +
>> +#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x4
>> +#define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
>> +
>>   #define PCIE_CLIENT_INTR_STATUS_MISC	0x10
>> +#define  PCIE_RDLH_LINK_UP_CHGED	BIT(1)
>> +#define  PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
>> +
>> +#define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
>>   #define PCIE_CLIENT_INTR_MASK_MISC	0x24
>> +
>>   #define PCIE_CLIENT_POWER		0x2c
>> +#define  PME_READY_ENTER_L23		BIT(3)
>> +
>>   #define PCIE_CLIENT_MSG_GEN		0x34
>> -#define PME_READY_ENTER_L23		BIT(3)
>> -#define PME_TURN_OFF			(BIT(4) | BIT(20))
>> -#define PME_TO_ACK			(BIT(9) | BIT(25))
>> -#define PCIE_SMLH_LINKUP		BIT(16)
>> -#define PCIE_RDLH_LINKUP		BIT(17)
>> -#define PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
> 
> This patch removes PCIE_LINKUP, without adding it somewhere else
> so I don't think this patch will compile.
> 
> I think the removal of this line has to be in patch 3/3.
> 
> 
> 
> Also, I think that Bjorn's primary concern:
> """
> The #defines for register offsets and bits are kind of a mess,
> e.g., PCIE_SMLH_LINKUP, PCIE_RDLH_LINKUP, PCIE_LINKUP,
> PCIE_L0S_ENTRY, and PCIE_LTSSM_STATUS_MASK are in
> PCIE_CLIENT_LTSSM_STATUS, but you couldn't tell that from the
> names, and they're not even defined together.
> """"
> 
> is that the fields are not prefixed with the register name.

Hi Niklas,

As per rk3588 TRM, section "11.4.2.1 PCIE_CLIENT Registers Summary 
Detail Registers Description"

The register names are as follows. I plan to add comments for each 
register in the next version, and the comments come from the register 
description of TRM.

/* General Control Register */
#define PCIE_CLIENT_GENERAL_CON		0x0
#define  PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
#define  PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
#define  PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
#define  PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)

/* Interrupt Status Register Related to Message Reception */
#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x4

/* Interrupt Status Register Related to Legacy Interrupt */
#define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8

/*  Interrupt Status Register Related to Miscellaneous Operation */
#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
#define  PCIE_RDLH_LINK_UP_CHGED	BIT(1)
#define  PCIE_LINK_REQ_RST_NOT_INT	BIT(2)

/* Interrupt Mask Register Related to Legacy Interrupt */
#define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c

/* Interrupt Mask Register Related to Miscellaneous Operation */
#define PCIE_CLIENT_INTR_MASK_MISC	0x24

/* Power Management Control Register */
#define PCIE_CLIENT_POWER_CON		0x2c
#define  PME_READY_ENTER_L23		BIT(3)

/*  Message Generation Control Register */
#define PCIE_CLIENT_MSG_GEN_CON		0x34
#define  PME_TURN_OFF			HIWORD_UPDATE_BIT(BIT(4))
#define  PME_TO_ACK			HIWORD_UPDATE_BIT(BIT(9))

/* Hot Reset Control Register */
#define PCIE_CLIENT_HOT_RESET_CTRL	0x180
#define  PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)

/* LTSSM Status Register */
#define PCIE_CLIENT_LTSSM_STATUS	0x300
#define  PCIE_SMLH_LINKUP		BIT(16)
#define  PCIE_RDLH_LINKUP		BIT(17)
#define  PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
#define  PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)

Best regards,
Hans

> 
> the secondary concern is that they are not grouped together.
> 
> This patch is just solving the secondary concern.
> 
> Since you are fixing his secondary concern, should you perhaps also
> address his primary concern?
> 
> 
> 
> Kind regards,
> Niklas


