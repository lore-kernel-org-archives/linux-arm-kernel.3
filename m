Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7304CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1g26RV78Rng3XuYnLzNc8Ju+RD849l+2twOY5zFZwI=; b=wFc/VR7K6+uFimMuGS76hUMqzH
	CN8/U756+S4/kl/ZR8Ch2o1khh4nIYIH3YdC+g6W5fDD8AdqtWnE/6PKy7pJ+KXOoGNCt9yBoo4CT
	XyZ+3GEJXWjdJnDMTjcax5XxfQMofttvf1/1PnDN9uThHgXMUcDCnp6GkeHxBfNLDIJkLDLKoMUmI
	l+7EnOuMYutP3Y/qUk580R8c7wEiY0Cpqnifwr+JpnGRbF8E9RSkL1U8I/2HxEEZ7+eaxqQPeUhCV
	hlMp37J75G95ra/LmwwdGSInr36WNwrJl8NBYWWAfK7e8PY5oGCi7av0o78M4uZxhPgu0E32N+44P
	xsoTR2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfA6-00000001W98-1SVv;
	Wed, 06 May 2026 16:31:50 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfA4-00000001W8E-13BX;
	Wed, 06 May 2026 16:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=U1g26RV78Rng3XuYnLzNc8Ju+RD849l+2twOY5zFZwI=;
	b=QP/DKGq7jMUJ0kD+kguvbFOPu5EbxpO14OcDp1PaspF82m9bAxdvMKA/yCDIlU
	3has5EaJVQOfjReKcvNkx2f14NfpdLa0qFrpmTLeMeeMLTZfo171ydAKOnxfhDKt
	4Ldn4rTP1xn+J6Xe6Nwemll2jo8+NlOQw6aN3QaTyq8A8=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAHTrjKbPtp+2frCg--.297S2;
	Thu, 07 May 2026 00:31:09 +0800 (CST)
Message-ID: <ea108879-0e60-471d-be82-569eafa76c5d@163.com>
Date: Thu, 7 May 2026 00:31:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "pali@kernel.org" <pali@kernel.org>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "jianjun.wang@mediatek.com" <jianjun.wang@mediatek.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "mpillai@cadence.com" <mpillai@cadence.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "s-vadapalli@ti.com" <s-vadapalli@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-3-18255117159@163.com>
 <TY3PR01MB11346620B7637A16120FDED26863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <8932a3a4-ede9-464e-985b-f9b0ab90c830@163.com>
 <TY3PR01MB11346E35A6CFDE8460FAF107F863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <TY3PR01MB11346E35A6CFDE8460FAF107F863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PygvCgAHTrjKbPtp+2frCg--.297S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw43GF1fZry3CF4DXF18Xwb_yoWruF1rpa
	yUGF4fCF4xXrWYv3Z2v3W5Xryaqas8C348Xws3K34xXrnFkF13JF42gF1UuF9xKr1qvr12
	y3WUtF9rur1ayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMVb9UUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6w2nS2n7bM11qgAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_093148_705931_3A458CBC 
X-CRM114-Status: GOOD (  16.38  )
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



On 5/7/26 00:27, Biju Das wrote:
> Hi Hans,
> 
>> -----Original Message-----
>> From: Hans Zhang <18255117159@163.com>
>> Sent: 06 May 2026 17:21
>> Subject: Re: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and 100 ms delay after link
>> training
>>
>>
>>
>> On 5/6/26 23:31, Biju Das wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
>>>> On Behalf Of Hans Zhang
>>>> Sent: 06 May 2026 16:24
>>>> Subject: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field
>>>> and 100 ms delay after link training
>>>>
>>>> The Cadence LGA (Legacy Architecture IP) PCIe host controller
>>>> currently lacks the mandatory 100 ms delay after link training
>>>> completes for speeds
>>>>> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
>>>>
>>>> Add a 'max_link_speed' field to struct cdns_pcie to record the
>>>> maximum supported link speed (or the currently configured speed). In
>>>> the common host layer function cdns_pcie_host_start_link(), after the
>>>> link has been successfully established, call pcie_wait_after_link_train() to insert the required
>> delay if max_link_speed > 2.
>>>>
>>>> Glue drivers must set max_link_speed appropriately (e.g., from the
>>>> device tree property "max-link-
>>>> speed") to enable the delay.
>>>>
>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>> ---
>>>>    drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>>>>    drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>>>>    2 files changed, 6 insertions(+)
>>>>
>>>> diff --git
>>>> a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> index 2b0211870f02..51376f69d007 100644
>>>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>> @@ -14,6 +14,7 @@
>>>>
>>>>    #include "pcie-cadence.h"
>>>>    #include "pcie-cadence-host-common.h"
>>>> +#include "../../pci.h"
>>>>
>>>>    #define LINK_RETRAIN_TIMEOUT HZ
>>>>
>>>> @@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
>>>>    	if (!ret && rc->quirk_retrain_flag)
>>>>    		ret = cdns_pcie_retrain(pcie, pcie_link_up);
>>>>
>>>> +	if (!ret)
>>>> +		pcie_wait_after_link_train(pcie->max_link_speed);
>>>> +
>>>>    	return ret;
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
>>>> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h
>>>> b/drivers/pci/controller/cadence/pcie-
>>>> cadence.h
>>>> index 574e9cf4d003..e222b095d2b6 100644
>>>> --- a/drivers/pci/controller/cadence/pcie-cadence.h
>>>> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
>>>> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>>>>     * @ops: Platform-specific ops to control various inputs from Cadence PCIe
>>>>     *       wrapper
>>>>     * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
>>>> + * @max_link_speed: maximum supported link speed
>>>
>>> Maximum to make consistent with other comments?
>>
>> Hi Biju,
>>
>> The reference I used is:
>>
>> drivers/pci/controller/pcie-rzg3s-host.c
> 
> * @ops: Platform-specific ops to control various inputs from Cadence PCIe
> *       wrapper
> * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
> 
> Bute here drivers/pci/controller/cadence/pcie-cadence.h, all start with Capital letter.
> 

Hi Biju,

Thanks, will change.

> 
>>
>> drivers/pci/controller/pcie-rzg3s-host.c
>> /**
>>    ......
>>    * @max_link_speed: maximum supported link speed
>>    */
>> struct rzg3s_pcie_host {
>> ......
>>
>>
>>>
>>>
>>>>     */
>>>>    struct cdns_pcie {
>>>>    	void __iomem		             *reg_base;
>>>> @@ -98,6 +99,7 @@ struct cdns_pcie {
>>>>    	struct device_link	             **link;
>>>>    	const  struct cdns_pcie_ops          *ops;
>>>>    	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
>>>> +	int				     max_link_speed;
>>>
>>> unsigned int as speed cannot be negative??
>>
>> The following file referred to:
>>
>> drivers/pci/controller/dwc/pcie-designware.h
>> struct dw_pcie {
>>       ......
>>       int			max_link_speed;
> 
> Maybe that driver is using negative values.
> Is this driver using negative values for speed?

For speed, there are no negative values.

Best regards,
Hans

> 
> Cheers,
> Biju
> 
>>       ......
>> };
>>
>>
>> Best regards,
>> Hans
>>>
>>> Cheers,
>>> Biju
>>>
>>>>    };
>>>>
>>>>    /**
>>>> --
>>>> 2.34.1
>>>>
> 


