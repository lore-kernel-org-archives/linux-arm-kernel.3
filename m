Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D49AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dJB4XRowZmBjucJ2qGpzWQ/DySAT7Z1DcoSxmqRS4g=; b=o4FP7VNsb2DiM+sEQKQs/B6+0M
	bBNGEb/aFZgu25WW992VdFQFmo0t3fnjBYp5dpDhbz1yoHfvxRnDxRPibNn9mxIGJcqB6qVjRkAxT
	r3kJE2V0bSMPosRiTyiXs/+xrUuJs6A1o2e/2KmdmKhpZgIP5dUdg43jQ60gjbZYlBtEKjSsdBFgC
	a2jwa7q0AKy4mCsWINe6WeihsicFScmF/l+ikc/qed2rKbyUuj22I8BGRQBKnzr6UnurhPJVylvvS
	3kv5DBV7rjtKntIAYKrmxRYLlI0oZLGSpcvNaIgj1a2DopUvbIfg6DDHnUmKZ5SvxMxNxwNXCK0Yi
	EhoE8YPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DI0-00000007Dxf-0lhs;
	Tue, 22 Apr 2025 13:03:52 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CAd-000000071De-0zPf;
	Tue, 22 Apr 2025 11:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=4dJB4XRowZmBjucJ2qGpzWQ/DySAT7Z1DcoSxmqRS4g=;
	b=KDD7lAyc04ximgpITMQyK7AaoWbHS/IIhkl03AVIVWM7FaYb808qQxuBQLODRq
	HEXw4COiIHCbA/ZDb72EU0IntDVuPJngpqiQSPrjRYqCGrVkJVInePgGltmiEyET
	bD6L/E9gNuJbHBFQFQtsvr6VJxl8+s3wEhdtph5OuBXrA=
Received: from [192.168.142.52] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBn9mzXggdoHWyRBg--.12994S2;
	Tue, 22 Apr 2025 19:51:52 +0800 (CST)
Message-ID: <7c685f63-65ac-4817-9bd9-365e307eb965@163.com>
Date: Tue, 22 Apr 2025 19:51:51 +0800
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
 <20250422112830.204374-3-18255117159@163.com> <aAeB7fO_LCzi-xCh@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aAeB7fO_LCzi-xCh@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wBn9mzXggdoHWyRBg--.12994S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFW7ArW8CF18Xr4kuF4UArb_yoW5KFyrp3
	yUJFyayrs8tay7CwnYg3Z0yFy7tr4fKF4jgr4agrWUCan5Aw18Gr1jgF15Wry2qr4kWr1f
	u3s8Ww1IgF9IkrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVwZcUUUUU=
X-Originating-IP: [61.171.199.116]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWx43o2gHfn+RWwAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_045211_680733_704E4357 
X-CRM114-Status: GOOD (  12.23  )
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



On 2025/4/22 19:47, Niklas Cassel wrote:
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
>> -#define PCIE_RDLH_LINK_UP_CHGED		BIT(1)
>> -#define PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
>> -#define PCIE_CLIENT_GENERAL_CONTROL	0x0
>> -#define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
>> -#define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
>> +#define  PME_TURN_OFF			HIWORD_UPDATE_BIT(BIT(4))
>> +#define  PME_TO_ACK			HIWORD_UPDATE_BIT(BIT(9))
>> +
>>   #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
>> +#define  PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
>> +
>>   #define PCIE_CLIENT_LTSSM_STATUS	0x300
>> -#define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
>> -#define PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
>> +#define  PCIE_LINKUP_MASK		GENMASK(17, 16)
> 
> Here you are adding a macro (PCIE_LINKUP_MASK) that is not used.
> 
> I suggest that you move the addition to the patch where it is actually used.
> 


Hi Niklas,

Thank you very much for your reply. Will change.

Best regards,
Hans


