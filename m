Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4625C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVsSu2JQlkuMay902nxoX0MpAL4pe0AraHz4EjlfA/4=; b=jPcpcc7j5HffR4/1VInjO1b3UH
	AE+g7jbU6jNv5moRu1loTPaUgNAZJTlWCVGaj+d2f/gtuI3sexv9DH61fSAibyw6tDBrV8AFTk4Za
	wOGguEWo85keiiNWJMTHlUj0WPhKCiIrmAmu88kZlJ8izaWrmgHTJg4v7cMY6Teuk+qmCXqDtmFy+
	wjp1nyVUG0zZt0NkQXOOGbjztiP+cn88YTEXDOxOpw9mTzKgqEWiJoZEXO2GMdc8/iR42Urs0/IpG
	hQOc4ny0jI1N70aqQOeO+uL7URWwWeLcYHdTzlRE0t6rYXFUwkdJWN+Go6CTQSTf3/YITcEu70ihe
	l6W7Lsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzDh-00000000Rm7-16fo;
	Thu, 07 Aug 2025 11:55:41 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz9S-00000000R2p-0tgK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:51:19 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577BcO0H029331;
	Thu, 7 Aug 2025 13:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	HVsSu2JQlkuMay902nxoX0MpAL4pe0AraHz4EjlfA/4=; b=1eupmTdait8w75Di
	rmc14oVpRPxnbd94Q+JTpKhZInez4rF4BakuCzwkhYQ5xJrv0nphT8jusphCOV99
	d+FC8Ki805e4PM2bbnIV5nDXr9mkd+pBtznEMX/g7+2H2nbT62V8neuAfek4X5lk
	9K7QxqiGZJU2GaMlbYlrb9fOBiqLMFVFyZBYGthQhpCzzDKq6geeCWOwHMBP1usD
	Mp5mq4H8OvsiOeK4QqEaH2x+9FTMkMS56NH9PfVAvDgJV0bbIfSW+0gdiHXZMeDS
	50nmE+6JxsyyT8OX8dUksu7zFsmsqDEwMhaXt57+O9/2sAj4nA6HvtKQjq6oL/3r
	9zqW8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48c7pvuxqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 48F9D4004A;
	Thu,  7 Aug 2025 13:50:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 769D671FDA0;
	Thu,  7 Aug 2025 13:49:30 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 13:49:29 +0200
Message-ID: <48d20fc0-3212-499f-881f-9546607b250d@foss.st.com>
Date: Thu, 7 Aug 2025 13:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: Add memory-region-names property for
 stm32mp257f-ev1
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
 <9e0c5453-b8f4-4d0a-8e8d-82014aac67dd@kernel.org>
 <832fb088-8862-4bd7-82a4-0e7ad58efe76@foss.st.com>
 <5924a691-2533-4856-a169-d16c3e577c42@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <5924a691-2533-4856-a169-d16c3e577c42@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_045118_550056_1962D76B 
X-CRM114-Status: GOOD (  11.85  )
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



On 8/6/25 14:44, Krzysztof Kozlowski wrote:
> On 06/08/2025 14:36, Patrice CHOTARD wrote:
>>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>> ---
>>>>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
>>>> index 2f561ad4066544445e93db78557bc4be1c27095a..16309029758cf24834f406f5203046ded371a8f9 100644
>>>> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
>>>> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
>>>> @@ -197,6 +197,7 @@ &i2c8 {
>>>>  
>>>>  &ommanager {
>>>>  	memory-region = <&mm_ospi1>;
>>>> +	memory-region-names = "mm_ospi1";
>>>
>>> It does not look like you tested the DTS against bindings. Please run
>>> `make dtbs_check W=1` (see
>>
>> My bad, i am preparing the v2.
> Why? I claim this is not needed according to your description. You said
> it is necessary to identify "memory-map area's configuration." but
> memory-region already tells that. What exactly is not identified?

Sorry but memory-region doesn't tell if this area is dedicated to ospi1 or ospi2.

In order to set the AMCR register, which configure the memory-region split
between ospi1 and ospi2, we need to identify the ospi instance.

By using memory-region-names, it allows to identify the ospi instance it belongs to.

Thanks
Patrice

> 
> Best regards,
> Krzysztof

