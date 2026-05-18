Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6673CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzMPsyU3cTQF48tb6lC6yXy72kh3ESylZnKuLeinuiQ=; b=eqB3FqRcfDr53ft6K0xEp4xvrJ
	qUAtHCTSv1O3LbkisyDRGuxTIMMb8FnhN6AncKzMfbd2kGhCEzdeUXADpGjoJf7Cj3u03/Kk6Rj+J
	edkYhJCMnKkB5sjgn5SPoVXrXn/wxmZy5lr9cukl1N4Aph8bVdP63nqFqJIoy+H/WXKkJCsY+CbUJ
	KD5LecqifdXkQ/IPy8VxGONykO79TLAKk6wsQDdi6OoRBRHXdRfJibyB7pSHr0B+zxaX3QXmMwl5l
	t30wLd1rjwL9DwWp9iYRw6wMsNZrKDCvIqMKm4dbMvLYEUwOkGE1BAFLa77tWL6w1rKldbg0Mi0eq
	7NpLPSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnhk-0000000DwOZ-2wqp;
	Mon, 18 May 2026 02:27:40 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnhi-0000000DwND-0fN7;
	Mon, 18 May 2026 02:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bzMPsyU3cTQF48tb6lC6yXy72kh3ESylZnKuLeinuiQ=;
	b=RmLFt8cfKGwpfgTZYDiTvbYUOu6ZQaY0k0+ZZJ0RwUI/+VM8Nndkswo/vJNqq0
	4mmIe2dslN1Xiyg/u8q2n/rnwoz86j3ypEyKmz9YXPBw+DHIHr76SerhZPBT33aS
	+uZhuPfSt3rYtf/rb4IIivahFUAOiDo9ed4rxDhTMqz4A=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD35jX_eApqje7VBw--.34067S2;
	Mon, 18 May 2026 10:27:12 +0800 (CST)
Message-ID: <f7ca2fde-9f20-4a12-ae75-58ec3fda124a@163.com>
Date: Mon, 18 May 2026 10:27:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] PCI: cadence: HPA: Add post-link delay
To: Manikandan Karunakaran Pillai <mpillai@cadence.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "claudiu.beznea.uj@bp.renesas.com" <claudiu.beznea.uj@bp.renesas.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "s-vadapalli@ti.com" <s-vadapalli@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260518004246.1384532-1-18255117159@163.com>
 <20260518004246.1384532-4-18255117159@163.com>
 <DM6PR07MB671635EE7FF28BD2FA5DDE36A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <DM6PR07MB671635EE7FF28BD2FA5DDE36A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD35jX_eApqje7VBw--.34067S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFyxXr4fCry7GFWDCF1fXrb_yoW5XFyxpa
	4DWFWfGF18Xr45uan7Z3W5XFyavFn8A347t39a93W8XrnrCrsrtF9FgF1fuasxKFWqyr1x
	JF17tFsrWF1avF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2ZXOUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AB7H2oKeQDB1gAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_192738_565948_9E0706EE 
X-CRM114-Status: GOOD (  16.02  )
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



On 5/18/26 10:16, Manikandan Karunakaran Pillai wrote:
> 
> 
>> EXTERNAL MAIL
>>
>>
>> The Cadence HPA (High Performance Architecture IP) specific link setup
>> function cdns_pcie_hpa_host_link_setup() waits for the link to come up
>> but does not implement the required 100 ms delay after link training
>> completes for speeds > 5.0 GT/s (PCIe r6.0 sec 6.6.1).
>>
>> Add a call to pci_host_common_link_train_delay() immediately after the
>> link is confirmed to be up, using the max_link_speed field. Also, in the
>> HPA host setup function, read the device tree property "max-link-speed"
>> to initialize max_link_speed if not already set by a glue driver.
>>
>> This ensures compliance for HPA-based platforms.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>> drivers/pci/controller/cadence/pcie-cadence-host-hpa.c | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> index 0f540bed58e8..8ef58ed01daa 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>> @@ -15,6 +15,8 @@
>>
>> #include "pcie-cadence.h"
>> #include "pcie-cadence-host-common.h"
>> +#include "../pci-host-common.h"
>> +#include "../../pci.h"
>>
>> static u8 bar_aperture_mask[] = {
>> 	[RP_BAR0] = 0x3F,
>> @@ -304,6 +306,8 @@ int cdns_pcie_hpa_host_link_setup(struct cdns_pcie_rc
>> *rc)
>> 	ret = cdns_pcie_host_wait_for_link(pcie, cdns_pcie_hpa_link_up);
>> 	if (ret)
>> 		dev_dbg(dev, "PCIe link never came up\n");
>> +	else
>> +		pci_host_common_link_train_delay(pcie->max_link_speed);
>>
>> 	return ret;
>> }
>> @@ -313,6 +317,7 @@ int cdns_pcie_hpa_host_setup(struct cdns_pcie_rc *rc)
>> {
>> 	struct device *dev = rc->pcie.dev;
>> 	struct platform_device *pdev = to_platform_device(dev);
>> +	struct device_node *np = dev->of_node;
>> 	struct pci_host_bridge *bridge;
>> 	enum   cdns_pcie_rp_bar bar;
>> 	struct cdns_pcie *pcie;
>> @@ -343,6 +348,9 @@ int cdns_pcie_hpa_host_setup(struct cdns_pcie_rc *rc)
>> 		rc->cfg_res = res;
>> 	}
>>
>> +	if (pcie->max_link_speed < 1)
>> +		pcie->max_link_speed = of_pci_get_max_link_speed(np);
>> +
> 
> Similar queries as for Cadence LGA controllers. Why do you need the max_link_speed check for "<1" and
> What would be the consequences of not defining the max-link-speed in dts ?

Hi Manikandan,

It has been replied in patch 0002.

Best regards,
Hans

> 
>> 	/* Put EROM Bar aperture to 0 */
>> 	cdns_pcie_hpa_writel(pcie, REG_BANK_IP_CFG_CTRL_REG,
>> CDNS_PCIE_EROM, 0x0);
>>
>> --
>> 2.43.0


