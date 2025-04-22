Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43669C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcRt9ezSoUZXl+ybi8UTJwVtL/3rgcw0CTAfTjkR8vY=; b=FeZV4umoPO7bglk3WuRXxYGvN+
	hCOgtwAraDlkgBFIdutkGHRh7HH2iOVjKbewgytRxViEteZozC7a4caRXcRSRmndji0FIPs2oxT8d
	xgBhtRKt4L2wrGSYXk0rkQjdJN07zPZKtkXuerbysz7U9ZdZ+8G52tzGgDcvKS5wwufFFjhsjno90
	LaR0Sb4XXKI+CkYwwuqxfgVgZss9OC7CLjaoHrsWhMY2/9/BlOj+bh/cfiWjfm1gXP941rw/3pkMv
	khCa7vunuuNm3ltZuknKQrYghQ8qSWKFTIOUWfxhhKpMqxCs+5EjTVA5+w/Ojmj3uqJ0zlWhIizcX
	XUjBZzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DGA-00000007DeU-2InK;
	Tue, 22 Apr 2025 13:01:58 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C9p-0000000714G-3kqJ;
	Tue, 22 Apr 2025 11:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=gcRt9ezSoUZXl+ybi8UTJwVtL/3rgcw0CTAfTjkR8vY=;
	b=cQhyIgerv2t2OKWa813hjNs6p7T9rVSVSVozFET0uogARuoQqizRWoSbEXtofZ
	8AdjWXAYVdgOJ2L7dCvNDJ/eodZDcvcfdznwcTF3ZdYHsIf8t0mwen7QwoaqJ5AU
	xUyMz+DnmwgZ5Lo3PmSHbJmQFCkGjdUCB5e0wE9VmBudo=
Received: from [192.168.142.52] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnQ1Gaggdo6FbJAQ--.7526S2;
	Tue, 22 Apr 2025 19:50:52 +0800 (CST)
Message-ID: <7716b76f-be79-4ed1-b8d2-29258cb250ab@163.com>
Date: Tue, 22 Apr 2025 19:50:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: dw-rockchip: Unify link status checks with
 FIELD_GET
To: Niklas Cassel <cassel@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250422112830.204374-1-18255117159@163.com>
 <20250422112830.204374-4-18255117159@163.com> <aAeAAhb4R8ya_mBO@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aAeAAhb4R8ya_mBO@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: QCgvCgDnQ1Gaggdo6FbJAQ--.7526S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWUGr47GF4DAr4rJF43Jrb_yoW5trWxpa
	yDJFWqkF48GrWI9F1kCa98XFWFvFsI9ayUCrn7Ka4xWasFyr1DG3Wj9r9xtr1xAr47CFyS
	kw48ta47Xr43ZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U33ktUUUUU=
X-Originating-IP: [61.171.199.116]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwA3o2gHfn+KJwAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_045122_362999_B6863558 
X-CRM114-Status: GOOD (  16.73  )
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



On 2025/4/22 19:39, Niklas Cassel wrote:
> On Tue, Apr 22, 2025 at 07:28:30PM +0800, Hans Zhang wrote:
>> Link-up detection manually checked PCIE_LINKUP bits across RC/EP modes,
>> leading to code duplication. Centralize the logic using FIELD_GET. This
>> removes redundancy and abstracts hardware-specific bit masking, ensuring
>> consistent link state handling.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> index cdc8afc6cfc1..2b26060af5c2 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> @@ -196,10 +196,7 @@ static int rockchip_pcie_link_up(struct dw_pcie *pci)
>>   	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
>>   	u32 val = rockchip_pcie_get_ltssm(rockchip);
>>   
>> -	if ((val & PCIE_LINKUP) == PCIE_LINKUP)
>> -		return 1;
>> -
>> -	return 0;
>> +	return FIELD_GET(PCIE_LINKUP_MASK, val) == 3;
> 
> While I like the idea of your patch, here you are replacing something that
> is easy to read (PCIE_LINKUP) with a magic value, which IMO is a step in
> the wrong direction.
> 

Hi Niklas,

Thank you very much for your reply. How about I add another macro 
definition?

#define PCIE_LINKUP 3


If not, I'll restore it. At least the following can use the 
rockchip_pcie_get_ltssm function to avoid duplicate code.

Best regards,
Hans

> 
>>   }
>>   
>>   static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
>> @@ -499,7 +496,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>>   	struct dw_pcie *pci = &rockchip->pci;
>>   	struct dw_pcie_rp *pp = &pci->pp;
>>   	struct device *dev = pci->dev;
>> -	u32 reg, val;
>> +	u32 reg;
>>   
>>   	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
>>   	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
>> @@ -508,8 +505,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>>   	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
>>   
>>   	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
>> -		val = rockchip_pcie_get_ltssm(rockchip);
>> -		if ((val & PCIE_LINKUP) == PCIE_LINKUP) {
>> +		if (rockchip_pcie_link_up(pci)) {
>>   			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
>>   			/* Rescan the bus to enumerate endpoint devices */
>>   			pci_lock_rescan_remove();
>> @@ -526,7 +522,7 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>>   	struct rockchip_pcie *rockchip = arg;
>>   	struct dw_pcie *pci = &rockchip->pci;
>>   	struct device *dev = pci->dev;
>> -	u32 reg, val;
>> +	u32 reg;
>>   
>>   	reg = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_STATUS_MISC);
>>   	rockchip_pcie_writel_apb(rockchip, reg, PCIE_CLIENT_INTR_STATUS_MISC);
>> @@ -540,8 +536,7 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>>   	}
>>   
>>   	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
>> -		val = rockchip_pcie_get_ltssm(rockchip);
>> -		if ((val & PCIE_LINKUP) == PCIE_LINKUP) {
>> +		if (rockchip_pcie_link_up(pci)) {
>>   			dev_dbg(dev, "link up\n");
>>   			dw_pcie_ep_linkup(&pci->ep);
>>   		}
>> -- 
>> 2.25.1
>>


