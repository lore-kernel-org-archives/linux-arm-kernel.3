Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C05CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJLe84Gk4h6y8PoVQ/eoWWYBLTFetFxQ4/izT5KcC/Q=; b=PVUAENua/7ui9hnObKOE+uKWt7
	s9JtOhBLLPn14a3DIwMfkfjuidyBJauZILWeHsv4dA/uuT02fW9DECuNfX+Sey6oLiPBqw5RbO1vg
	E4byNjOWXKp02QWQfLvWiv3YkXsrwOhctc60D8gEtOFbZBWNI5DP2AeId/Bh1klZbiFEM9Z+wic0U
	rZKVJgEMyQLfbhlpudNNDCcRp3gc9+xmFhifQjZo7lA9y9q+huxZDt8gcBv/LKegfGC76b5HH+41x
	+w4HsZRdTiaIxJtlFOepdIAVOjgptpj/fshg6ipeBkGNepxKMAB6jKaj0lNYfpyf9ikjqC2vPoqt2
	YuW6H2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKf0h-00000001Uv8-29xe;
	Wed, 06 May 2026 16:22:07 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKf0f-00000001UuQ-1e8F;
	Wed, 06 May 2026 16:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=LJLe84Gk4h6y8PoVQ/eoWWYBLTFetFxQ4/izT5KcC/Q=;
	b=Ou3/SwMOI3j2gFHY3Qlhek+FocO4RBkhi+1MIn32FhKCwaaT2XnG53a7ekI/d3
	Qq1XrSrh/lVToWyzq62Qjp9jwk+uF+HoIvAwkX/f+WMBY7OfGXXXhzAP7Q4xxsWG
	AQYtmN6ytbVaATEhhHDKwKz7TPD1BEVqngaPe0Zv28ILQ=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBnO1xyavtpJhIDDw--.14523S2;
	Thu, 07 May 2026 00:21:07 +0800 (CST)
Message-ID: <8932a3a4-ede9-464e-985b-f9b0ab90c830@163.com>
Date: Thu, 7 May 2026 00:21:06 +0800
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
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <TY3PR01MB11346620B7637A16120FDED26863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wBnO1xyavtpJhIDDw--.14523S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw4Utw1DJr4UAr15trW8WFg_yoW5tF1xpa
	ykGFWfGF1xXrWY93WkZ3W5XryYqas8C347Jws3Ka4xWr12kr43JF1IgF1fXF9xKrZFvr17
	AF1DtF9rCr4ayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UN18QUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxMQs2n7anOSxwAA3t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_092205_894021_DC14A68E 
X-CRM114-Status: GOOD (  15.67  )
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



On 5/6/26 23:31, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Hans Zhang
>> Sent: 06 May 2026 16:24
>> Subject: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and 100 ms delay after link
>> training
>>
>> The Cadence LGA (Legacy Architecture IP) PCIe host controller currently lacks the mandatory 100 ms
>> delay after link training completes for speeds
>>> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
>>
>> Add a 'max_link_speed' field to struct cdns_pcie to record the maximum supported link speed (or the
>> currently configured speed). In the common host layer function cdns_pcie_host_start_link(), after the
>> link has been successfully established, call pcie_wait_after_link_train() to insert the required delay
>> if max_link_speed > 2.
>>
>> Glue drivers must set max_link_speed appropriately (e.g., from the device tree property "max-link-
>> speed") to enable the delay.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>>   drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> index 2b0211870f02..51376f69d007 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>> @@ -14,6 +14,7 @@
>>
>>   #include "pcie-cadence.h"
>>   #include "pcie-cadence-host-common.h"
>> +#include "../../pci.h"
>>
>>   #define LINK_RETRAIN_TIMEOUT HZ
>>
>> @@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
>>   	if (!ret && rc->quirk_retrain_flag)
>>   		ret = cdns_pcie_retrain(pcie, pcie_link_up);
>>
>> +	if (!ret)
>> +		pcie_wait_after_link_train(pcie->max_link_speed);
>> +
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
>> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-
>> cadence.h
>> index 574e9cf4d003..e222b095d2b6 100644
>> --- a/drivers/pci/controller/cadence/pcie-cadence.h
>> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
>> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>>    * @ops: Platform-specific ops to control various inputs from Cadence PCIe
>>    *       wrapper
>>    * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
>> + * @max_link_speed: maximum supported link speed
> 
> Maximum to make consistent with other comments?

Hi Biju,

The reference I used is:

drivers/pci/controller/pcie-rzg3s-host.c
/**
  ......
  * @max_link_speed: maximum supported link speed
  */
struct rzg3s_pcie_host {
......


> 
> 
>>    */
>>   struct cdns_pcie {
>>   	void __iomem		             *reg_base;
>> @@ -98,6 +99,7 @@ struct cdns_pcie {
>>   	struct device_link	             **link;
>>   	const  struct cdns_pcie_ops          *ops;
>>   	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
>> +	int				     max_link_speed;
> 
> unsigned int as speed cannot be negative??

The following file referred to:

drivers/pci/controller/dwc/pcie-designware.h
struct dw_pcie {
     ......
     int			max_link_speed;
     ......
};


Best regards,
Hans
> 
> Cheers,
> Biju
> 
>>   };
>>
>>   /**
>> --
>> 2.34.1
>>


