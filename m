Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FD1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xbZYXykMjgKMSpp52ywZEBlzjIEow9Ok6NjY0siqUc=; b=UflsCroBtQcgEhWbayP2UaA57E
	FeGLZopr7v/RePmV7ACXD9qE3scra1DXpyK3Cq9BD1hkHm6+rmHKuX2PtNXmdB7tEKcayFmLuTW0+
	o0Uk/1B6FGyD3dVImfSxJVERnWnkq1XG8l5rq3BOEFf3J73CnGMP2MyLMDLczDbV4Te30vCCdCU9I
	M194ABS9C9Y88kmZ4ok9nnGnwjEB11EFLB57cdgWRUW9hhj6eFZdIdAZc7tCPVEuruJL2u9WekQ8W
	XHj4TJW1N58c/X0MG8Onsfvpko9jt/tlCpjGKWriyCCrmnA8ljhEj52JIJxjGsn0uCBN/Vn8ZcJfL
	r4GXnK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5Q-0000000BIQW-2M2O;
	Wed, 23 Apr 2025 17:40:40 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ast-0000000AnAA-308k;
	Wed, 23 Apr 2025 14:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=6xbZYXykMjgKMSpp52ywZEBlzjIEow9Ok6NjY0siqUc=;
	b=OhudICscJ21Kt98vX6rUiv4cDB7SwN1mK2jKC53EgKi7bz9iuBd6o/OE+zMLPn
	h22rs/khVJeHuPHZ0OA+edvEA6E1n/cPPN9+Y3cU6bJa/Yn28bnAYQPf0J8DGPQe
	Q3WkU7dElgsQe6x4t39U2vpOY5z5mL0muVjmEway1Grho=
Received: from [192.168.71.89] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDHnCTi9QhoY7rzBQ--.27617S2;
	Wed, 23 Apr 2025 22:14:59 +0800 (CST)
Message-ID: <352e40a0-65e2-499f-a7dd-904a4a7b19da@163.com>
Date: Wed, 23 Apr 2025 22:14:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] PCI: dw-rockchip: Reorganize register and bitfield
 definitions
To: Niklas Cassel <cassel@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250423105415.305556-1-18255117159@163.com>
 <20250423105415.305556-3-18255117159@163.com> <aAjufPQnBsR6ysAH@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aAjufPQnBsR6ysAH@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PSgvCgDHnCTi9QhoY7rzBQ--.27617S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Wr1xGry5KryDKF4ktr1xAFb_yoWxur1fp3
	4DAFyIyr45tay7Z3s5uFs8XFWIqrnxKFWUWrsagrWUZ3WkAw48Gw1j9FyrWFy3Jr4kCrWf
	uwn8C34SgFWakrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBq2_UUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDxg4o2gI7X36cgAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_071532_261106_59E61C8D 
X-CRM114-Status: GOOD (  17.49  )
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



On 2025/4/23 21:43, Niklas Cassel wrote:
> On Wed, Apr 23, 2025 at 06:54:14PM +0800, Hans Zhang wrote:
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
>>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 71 ++++++++++++-------
>>   1 file changed, 45 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> index fd5827bbfae3..6cf75160fb1c 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> @@ -34,30 +34,49 @@
>>   
>>   #define to_rockchip_pcie(x) dev_get_drvdata((x)->dev)
>>   
>> -#define PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
>> -#define PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
>> -#define PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
>> -#define PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
>> -#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
>> -#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
>> -#define PCIE_CLIENT_INTR_MASK_MISC	0x24
>> -#define PCIE_CLIENT_POWER		0x2c
>> -#define PCIE_CLIENT_MSG_GEN		0x34
>> -#define PME_READY_ENTER_L23		BIT(3)
>> -#define PME_TURN_OFF			(BIT(4) | BIT(20))
>> -#define PME_TO_ACK			(BIT(9) | BIT(25))
>> -#define PCIE_SMLH_LINKUP		BIT(16)
>> -#define PCIE_RDLH_LINKUP		BIT(17)
>> -#define PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
>> -#define PCIE_RDLH_LINK_UP_CHGED		BIT(1)
>> -#define PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
>> -#define PCIE_CLIENT_GENERAL_CONTROL	0x0
>> +/* General Control Register */
>> +#define PCIE_CLIENT_GENERAL_CON		0x0
>> +#define  PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
>> +#define  PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
>> +#define  PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
>> +#define  PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
>> +
>> +/* Interrupt Status Register Related to Message Reception */
>> +#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x4
>> +
>> +/* Interrupt Status Register Related to Legacy Interrupt */
>>   #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
>> +
>> +/*  Interrupt Status Register Related to Miscellaneous Operation */
> 
> double spaces, other comments just have one space.
> 

Hi Niklas,

Thank you very much for your reply. Will change.

> 
>> +#define PCIE_CLIENT_INTR_STATUS_MISC	0x10
>> +#define  PCIE_RDLH_LINK_UP_CHGED	BIT(1)
>> +#define  PCIE_LINK_REQ_RST_NOT_INT	BIT(2)
>> +
>> +/* Interrupt Mask Register Related to Legacy Interrupt */
>>   #define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
>> +
>> +/* Interrupt Mask Register Related to Miscellaneous Operation */
>> +#define PCIE_CLIENT_INTR_MASK_MISC	0x24
>> +
>> +/* Power Management Control Register */
>> +#define PCIE_CLIENT_POWER_CON		0x2c
>> +#define  PME_READY_ENTER_L23		BIT(3)
>> +
>> +/*  Message Generation Control Register */
> 
> double spaces, other comments just have one space.
> 

Will change.

> 
>> +#define PCIE_CLIENT_MSG_GEN_CON		0x34
>> +#define  PME_TURN_OFF			HIWORD_UPDATE_BIT(BIT(4))
>> +#define  PME_TO_ACK			HIWORD_UPDATE_BIT(BIT(9))
>> +
>> +/* Hot Reset Control Register */
>>   #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
>> +#define  PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
>> +
>> +/* LTSSM Status Register */
>>   #define PCIE_CLIENT_LTSSM_STATUS	0x300
>> -#define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
>> -#define PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
>> +#define  PCIE_SMLH_LINKUP		BIT(16)
>> +#define  PCIE_RDLH_LINKUP		BIT(17)
>> +#define  PCIE_LINKUP			(PCIE_SMLH_LINKUP | PCIE_RDLH_LINKUP)
>> +#define  PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
>>   
>>   struct rockchip_pcie {
>>   	struct dw_pcie pci;
>> @@ -176,13 +195,13 @@ static u32 rockchip_pcie_get_pure_ltssm(struct dw_pcie *pci)
>>   static void rockchip_pcie_enable_ltssm(struct rockchip_pcie *rockchip)
>>   {
>>   	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_ENABLE_LTSSM,
>> -				 PCIE_CLIENT_GENERAL_CONTROL);
>> +				 PCIE_CLIENT_GENERAL_CON);
>>   }
>>   
>>   static void rockchip_pcie_disable_ltssm(struct rockchip_pcie *rockchip)
>>   {
>>   	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_DISABLE_LTSSM,
>> -				 PCIE_CLIENT_GENERAL_CONTROL);
>> +				 PCIE_CLIENT_GENERAL_CON);
>>   }
>>   
>>   static int rockchip_pcie_link_up(struct dw_pcie *pci)
>> @@ -274,8 +293,8 @@ static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
>>   	u32 status;
>>   
>>   	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
>> -	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
>> -	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
>> +	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN_CON);
>> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN_CON,
>>   				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
>>   				 PCIE_PME_TO_L2_TIMEOUT_US);
>>   	if (ret) {
>> @@ -294,7 +313,7 @@ static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
>>   
>>   	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
>>   	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATUS_MSG_RX);
>> -	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER,
>> +	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER_CON,
>>   				 status, status & PME_READY_ENTER_L23,
>>   				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
>>   				 PCIE_PME_TO_L2_TIMEOUT_US);
>> @@ -552,7 +571,7 @@ static void rockchip_pcie_ltssm_enable_control_mode(struct rockchip_pcie *rockch
>>   	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
>>   	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>>   
>> -	rockchip_pcie_writel_apb(rockchip, mode, PCIE_CLIENT_GENERAL_CONTROL);
>> +	rockchip_pcie_writel_apb(rockchip, mode, PCIE_CLIENT_GENERAL_CON);
> 
> I can see why you renamed PCIE_CLIENT_GENERAL_CONTROL to PCIE_CLIENT_GENERAL_CON
> (to match PCIE_CLIENT_MSG_GEN_CON).
> 
> But now we have PCIE_CLIENT_MSG_GEN_CON / PCIE_CLIENT_GENERAL_CON and
> PCIE_CLIENT_HOT_RESET_CTRL.
> 
> _CTRL seems like a more common shortening. How about renaming all three to
> end with _CTRL ?

I saw that TRM is named like this.

PCIE_CLIENT_GENERAL_CON / PCIE_CLIENT_MSG_GEN_CON / 
PCIE_CLIENT_HOT_RESET_CTRL

Shall we take TRM as the standard or your suggestion?

Best regards,
Hans




