Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027FBC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGg0k6siYa6ZSIVgo5SD6iu9EKp7AtLaUnHfY9l895Q=; b=BSoCo22VJ8fVSg7P4P+nrhVp2n
	7Ug/blJLMfl1P07n4nuARm2pebFo2ZGWR0Hqg6NcF5O037nQti9Mgvxdal8HutJNMsOSvUEbmRdwE
	ckI0f9OWKFkHTGMVP1xkzNV4Wdv/dw7wi16n1ZE2BTnuhjBrj+5w8Fv3YuH7FVkqxgW7iNcxs3f4s
	0TzjGyP2FawLAFi3Gs3yx8AZinMTnG+T8RCl5jVyEd2067o1kXCe0n81pMXjUIEfUIh4cAxqRRH/L
	NUg19RZ47Ad+jhjy6DBeFpQy8zBf8lNf3XafWwQaDOExNFFZJMfvHM4COzLTf0dO2NF5eQZtMqq9J
	ku7U4qwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk99c-00000001dAd-2uQz;
	Thu, 07 Aug 2025 22:32:08 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk974-00000001d0S-3oKG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 22:29:32 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 577MTP5M902301;
	Thu, 7 Aug 2025 17:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754605765;
	bh=vGg0k6siYa6ZSIVgo5SD6iu9EKp7AtLaUnHfY9l895Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ERzNQZ3mdvKb80aeNo3DpUYphXfZLnY45zeAjNzQIjUxTUwrc75Oa4QAj/fd0ShHF
	 gcgx/100x5BIM33bsFEIeSv/wOct/nxx/09J4SHjf1sToUE1Nn3uUr106e3L9H70Sc
	 WBDpPZb8bAjICh0NDARBBS9unBN+iMFAkA9Musag=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 577MTPak465544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 17:29:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 17:29:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 17:29:24 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 577MTOBE1764481;
	Thu, 7 Aug 2025 17:29:24 -0500
Message-ID: <da9c4afb-84ce-49ee-86b3-b7f50457a067@ti.com>
Date: Thu, 7 Aug 2025 17:29:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: ti: k3-socinfo: Add support for AM62P variants
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
References: <20250805234950.3781367-1-jm@ti.com>
 <20250805234950.3781367-3-jm@ti.com>
 <37f73812-be0c-43b2-a5bc-a41e09db85ea@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <37f73812-be0c-43b2-a5bc-a41e09db85ea@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_152931_040529_DEA7F86A 
X-CRM114-Status: GOOD (  15.03  )
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

Hi Andrew,

On 8/7/25 12:24 PM, Andrew Davis wrote:
> On 8/5/25 6:49 PM, Judith Mendez wrote:
>> This adds a support for detecting AM62P SR1.0, SR1.1, SR1.2.
>>
>> On AM62P, silicon revision is discovered with GP_SW1 instead of JTAGID
>> register, so introduce GP_SW register range to determine SoC revision.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   drivers/soc/ti/k3-socinfo.c | 82 +++++++++++++++++++++++++++++++++----
>>   1 file changed, 74 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
>> index d716be113c84..9daeced656d6 100644
>> --- a/drivers/soc/ti/k3-socinfo.c
>> +++ b/drivers/soc/ti/k3-socinfo.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/sys_soc.h>
>>   #define CTRLMMR_WKUP_JTAGID_REG        0
>> +#define CTRLMMR_WKUP_GP_SW1_REG        4
>>   /*
>>    * Bits:
>>    *  31-28 VARIANT    Device variant
>> @@ -62,10 +63,63 @@ static const struct k3_soc_id {
>>       { JTAG_ID_PARTNO_AM62LX, "AM62LX" },
>>   };
>> +static const struct regmap_config k3_chipinfo_regmap_cfg = {
>> +    .reg_bits = 32,
>> +    .val_bits = 32,
>> +    .reg_stride = 4,
>> +};
>> +
>>   static const char * const j721e_rev_string_map[] = {
>>       "1.0", "1.1", "2.0",
>>   };
>> +static const char * const am62p_gpsw_rev_string_map[] = {
>> +    "1.0", "1.1", "1.2",
>> +};
>> +
>> +static int
>> +k3_chipinfo_get_variant_alternate(struct platform_device *pdev, 
>> unsigned int partno, u32 *variant)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct regmap *regmap;
>> +    void __iomem *base;
>> +    u32 offset;
>> +    int ret;
>> +
>> +    base = devm_platform_ioremap_resource(pdev, 1);
>> +    if (IS_ERR(base))
>> +        return PTR_ERR(base);
>> +
>> +    regmap = regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
> 
> devm_regmap_init_mmio()
> 
> Otherwise this regmap never gets freed up in the error paths.

Thanks for reviewing, but....

I have completely changed this patch in v2, feel free to review v2
though (:


..


