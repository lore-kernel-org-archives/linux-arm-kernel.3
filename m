Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CC1C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLCG74LOhJQiX3HM0JiZUURKZFlNy9nvIZeBF7qaR40=; b=YL1ffbl+AcXAalJiNjbWDRIsl3
	+COpbpYSya5bsEIFg6b56/Yu3dxHtgjqVunv3hNyw1b6qwnj+RiQQMv9ucB56ixJaOSnekaRwK9+p
	6CS1/6Wp407t2Acq+PB9rIDju+VOeEEYfte99gSm3ECRjjFADd0Un9738+B/so6U1+BOnbNoAUrKt
	LaGMVBlyQnaG92oAZcGT4NSc4mj5ZlWBkKsKS3WxnNfsRmWPTGcPkqxX00hGEEVa3mQbTL0e/UjLm
	dMrutsyzgjB63Sc+tFL7Bno6BWjptSB63rY2+9lJfM+XUwDE4PJ7XkZHJwucy1fuo032z5Yc+8YXu
	+HgCcxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHQM-00000003rN6-1bzB;
	Wed, 26 Feb 2025 13:26:06 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFzh-00000003YeT-45En
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:54:31 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QBsKws2071608
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Feb 2025 05:54:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740570860;
	bh=aLCG74LOhJQiX3HM0JiZUURKZFlNy9nvIZeBF7qaR40=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k8RTRBU1v9VJO8Ld2qJAQak4jAsE52QApdA93KCknRKu349aHgduUBXs59kL48uoj
	 YUjdVrqxgJLIcbDU17BvzC42NTyvNvahd8eT6ZtMKWdcHizpdMo/ENkknMcKE00HU3
	 kZZq4oj6EiWLFcteIWElmof3m5zuGBIE/ytK0jP4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QBsKW0025757;
	Wed, 26 Feb 2025 05:54:20 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 05:54:19 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 05:54:19 -0600
Received: from [172.24.18.117] (lt9560gk3.dhcp.ti.com [172.24.18.117])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QBsGrn129011;
	Wed, 26 Feb 2025 05:54:17 -0600
Message-ID: <1982291f-4a02-4ed2-b4bf-778a2fe0ad9e@ti.com>
Date: Wed, 26 Feb 2025 17:24:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH] arm64: defconfig: Enable HSR driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann
	<arnd@arndb.de>
CC: <quic_bjorande@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        "Anwar, Md Danish"
	<danishanwar@ti.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
 <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
 <d4954e5e-e51f-41c0-bca5-6e14b4640022@linaro.org>
 <0d33dea6-c021-4f2a-bb3f-92efd6eebd18@ti.com>
 <6081917c-9c20-48fc-baaf-7ac9a9679a72@linaro.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <6081917c-9c20-48fc-baaf-7ac9a9679a72@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_035430_143684_196E5DC6 
X-CRM114-Status: GOOD (  20.36  )
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

Hi Krzysztof,

On 2/26/2025 4:18 PM, Krzysztof Kozlowski wrote:
> On 26/02/2025 11: 44, Malladi, Meghana wrote: > > > On 2/26/2025 1: 35 
> PM, Krzysztof Kozlowski wrote: >> On 26/02/2025 07: 18, Malladi, Meghana 
> wrote: > Hi all, > > Apologies in >> case you are receiving this email
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> updq3RaPV007wGXFFrPD30z5a3GGYjpJweyhUcIfUTTaUs-8q0QpC4Yk9azBiFp7cBAf2Knk6fnVs4Fs-zRjTMEn8kmpiGo$>
> ZjQcmQRYFpfptBannerEnd
> 
> On 26/02/2025 11:44, Malladi, Meghana wrote:
>> 
>> 
>> On 2/26/2025 1:35 PM, Krzysztof Kozlowski wrote:
>>> On 26/02/2025 07: 18, Malladi, Meghana wrote: > Hi all, > > Apologies in 
>>> case you are receiving this email for the second time. > Any reason why 
>>> this patch hasn't been merged yet. Other than re-basing > this to the 
>>> tip, anything
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the source 
>>> of this email and know the content is safe.
>>> Report Suspicious
>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
>>> updgnZav1ue7gKXOnHOpH5hg8gLmw9Osqsqh- 
>>> KTLRTnBEurV_VetrG7mzU898vB_5xFrYgbRkkuuFMBobM-uhFAmUgccRSk$>
>>> ZjQcmQRYFpfptBannerEnd
>>>
>>> On 26/02/2025 07:18, Malladi, Meghana wrote:
>>>> Hi all,
>>>>
>>>> Apologies in case you are receiving this email for the second time.
> 
> BTW, Arnd when responded with Ack described the process.
> 

Yes, I wanted to re-confirm before posting it again (just in case).

>>>> Any reason why this patch hasn't been merged yet. Other than re-basing 
>>>> this to the tip, anything else which needs to be addressed to get this 
>>>> merged?
>>>
>>> I don't think you sent it to your platform maintainers, so no one would
>>> apply it. Usually people ignore emails they did not receive, although I
>>> am here an exception tracking missing-DT-patchwork things... :)
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> 
>> Hello Arnd/Krzysztof,
>> 
>> Thank you for the replies :)
>> Was having ambiguity since this is not TI specific change. Wanted to 
>> confirm before re-posting. Will post v2 patch including TI platform 
>> maintainers.
> 
> It is not TI specific? Then which upstream boards benefit from this if
> not TI?
> 

This change enables generic HSR protocol support in the kernel which is 
required for HSR driver support in TI boards. When I said "not TI 
specific" - I meant this change is not internal to TI driver. Hope this 
clarifies the miscommunication from my earlier mail.

Best Regards,
Meghana

> 
> 
> Best regards,
> Krzysztof
> 


