Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E52A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OJZpnudl;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HTtx2Z5m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cNjLxshjbldmtVi7ezW8lx2AJPpiQwNaAFoiNC9ElWA=; b=OJZpnudl8IqmQq
	yGeREZsgZ3hqzSmkpZ5M0cvb+Meb9N0542yWifyXelrRduB6GOzMi5Xlyt7y3n80cQUyZx9HFtxBr
	sr7lwg6snBci4vSaU4864cK4X0UYMInsfxX17DhwN509mXdAoH7axKipyEdCOshSrbGoccSNkAWlP
	wxdcX6uEa5ycmLDi0gY07MHWITDHEXrlFVIm0nl2+079OX6q/CByGcySRleqaGz5yuViRNUBp+Gcs
	NRh/SBraIScAyH6r/i5Crh4JAbrEThCOlcYE64PniHqG58XeZaGm0DrpDNu5rwk3ojjI1ZQS9VWNs
	ftI3sfiz6zc6lgrdBPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwTq-00000008v7L-28WY;
	Thu, 05 Nov 2026 12:22:10 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwTk-00000008v4u-2wIm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:22:09 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261105122200epoutp049df28378c7b38ad94e9e23677f184f79~lJY5qt6X32564725647epoutp04f
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 12:22:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261105122200epoutp049df28378c7b38ad94e9e23677f184f79~lJY5qt6X32564725647epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793881320;
	bh=cNjLxshjbldmtVi7ezW8lx2AJPpiQwNaAFoiNC9ElWA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=HTtx2Z5mL5rvw12jKQfhGYsXeW0lv32F1V8xMP3ap5FBhTtpo3kuHw1+yZzRg1wZV
	 UwWZwe8TfhWpt3XO0P/UV0lTP43yhFt36z1VOjtPhD8H9td/Aus80y9xuD7TDgPfxt
	 b9ohh/fSY/FipVYMt8BU/Qaqtfkr+dZWa1X0babg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261105122158epcas5p41fe17543c8abcd4c86815bcdcfa554d8~lJY4Xi13h2387123871epcas5p40;
	Thu,  5 Nov 2026 12:21:58 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jL1dd5nMXz3hhTC; Thu,  5 Nov
	2026 12:21:57 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261105122157epcas5p1320966a69d34521faeaabda354501162~lJY2_W1Ae2240322403epcas5p1F;
	Thu,  5 Nov 2026 12:21:57 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261105122154epsmtip29c3fc114ce1213d5c87c233119230900~lJY0PNi8z0501305013epsmtip2l;
	Thu,  5 Nov 2026 12:21:54 +0000 (GMT)
Message-ID: <b68297b5-58cb-4dd6-ac2e-07d6bd408c1c@samsung.com>
Date: Thu, 5 Nov 2026 17:51:46 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Exynos8855 to the generic
 platform driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"peter.griffin@linaro.org" <peter.griffin@linaro.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jh0801.jung@samsung.com"
	<jh0801.jung@samsung.com>, "h10.kim@samsung.com" <h10.kim@samsung.com>,
	"dh10.jung@samsung.com" <dh10.jung@samsung.com>, "akash.m5@samsung.com"
	<akash.m5@samsung.com>, "hongpooh.kim@samsung.com"
	<hongpooh.kim@samsung.com>, "eomji.oh@samsung.com" <eomji.oh@samsung.com>,
	"shijie.cai@samsung.com" <shijie.cai@samsung.com>,
	"muhammed.ali@samsung.com" <muhammed.ali@samsung.com>,
	"thiagu.r@samsung.com" <thiagu.r@samsung.com>
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <auvcLYl-ZnagU-7H@vbox>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261105122157epcas5p1320966a69d34521faeaabda354501162
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
	<CGME20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d@epcas5p4.samsung.com>
	<20261026135715.33071-3-selvarasu.g@samsung.com> <auvcLYl-ZnagU-7H@vbox>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_042205_389985_89DB302D 
X-CRM114-Status: GOOD (  19.22  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/5/2026 7:04 AM, Thinh Nguyen wrote:
> On Mon, Oct 26, 2026, Selvarasu Ganesan wrote:
>> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
>> so the Exynos8855 DWC3 controller can probe through the generic DWC3
>> platform glue. While at it, alphabetically reorder the existing entries.
> Please split the reordering into a separate patch, or just add the new
> entry without it. There are other pending additions to this driver, and
> the reorder will likely cause conflicts.
>
> Thanks,
> Thinh


Hi Thinh,

Thanks for your feedback.

We posted new patchset with drop the alphabetical reorder of 
dwc3_generic_of_match and just add our new entry.

https://lore.kernel.org/all/20261105121401.1661711-1-selvarasu.g@samsung.com/


Thanks,
Selva
>
>> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
>> index ca69ac0eb07c..d57496716204 100644
>> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
>> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
>> @@ -232,10 +232,11 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
>>   };
>>   
>>   static const struct of_device_id dwc3_generic_of_match[] = {
>> +	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>> +	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>> +	{ .compatible = "samsung,exynos8855-dwc3", },
>>   	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
>>   	{ .compatible = "spacemit,k3-dwc3", },
>> -	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>> -	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>>   	{ .compatible = "starfive,jhb100-dwc3", },
>>   	{ /* sentinel */ }
>>   };
>> -- 
>> 2.17.1

