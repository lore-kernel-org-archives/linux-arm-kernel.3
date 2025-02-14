Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F12C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSnKZ9pgEEZ6nNIIZ9dM7rFmu3IDFEefyD7U0e7a6so=; b=k3TgEmyy3znypGzqc6P498CuPn
	5v5R0ubkvL7rI/xf3mLNtnm5jlkdfqHH6z1KLMq+VZ2iFi4aRh8TgFZen9OAeRWtRwmjP6ojfVqu2
	8XhgEEYPE4lqIW94q1W9+8+anGjLAWSt4vBiaaD3dyiQmXIzJIqx/vfoRVQxC7fhChj+Z4mkJKjiL
	u43vyJVt+7frg1dj1M5eHMm3jIIrx6sx28NelpF4/gdNuspIDG5uw3CYOyQGlmPIvx1TurP3bd7GP
	mC5LdytRVm7QW0iCR2eiWYOLgRqOpu95DZLmuz2KDViFpT/5Tav7TWpi1VP81hd7GUW0dcu0oYisY
	9/+av5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4Kb-0000000GPJq-3EOa;
	Fri, 14 Feb 2025 22:38:45 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj4JA-0000000GP9T-0uBn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:37:17 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51EMb3Nc1043280
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 14 Feb 2025 16:37:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739572624;
	bh=PSnKZ9pgEEZ6nNIIZ9dM7rFmu3IDFEefyD7U0e7a6so=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hWbPBGNwNNtgiRAJOFdPM4u/GvQuf1BrvUi2N42/b7mUgj0g9ooN1VSt2mPP8O5P0
	 sjbSOkhSp3d/M34ei97ktwEYN9lzC7bFLfFByLT/ZS7g+63VzJpgyVdha3tOfgLT0Y
	 sV76BPCsP8lE+fF9E+uJ/eQmpGzKqV5qX7Z32z60=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EMb3Zd083376;
	Fri, 14 Feb 2025 16:37:03 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 16:37:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 16:37:03 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EMb3Ow035234;
	Fri, 14 Feb 2025 16:37:03 -0600
Message-ID: <b3e96184-e20c-4935-b86c-73c95b00b9fc@ti.com>
Date: Fri, 14 Feb 2025 16:37:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add alias for RTC
To: Dhruva Gole <d-gole@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <msp@baylibre.com>,
        <khilman@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250212210604.745175-1-k-willis@ti.com>
 <20250214062141.gdmkepuuyqb22xuh@lcpd911>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250214062141.gdmkepuuyqb22xuh@lcpd911>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_143716_516656_E591AF20 
X-CRM114-Status: GOOD (  20.92  )
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

On 2/14/25 00:21, Dhruva Gole wrote:
> On Feb 12, 2025 at 15:06:04 -0600, Kendall Willis wrote:
>> From: Vibhore Vardhan <vibhore@ti.com>
>>
>> Adds alias for SoC RTC so that it gets assigned rtc0. PMIC node is
>> assisgned rtc1 so that PMIC RTC gets probed as rtc1. This makes it
> 
> Nit: Fix the spelling of assigned please.
> 
>> consistent for testing rtcwake with other AM62 devices where rtc0
>> is SoC RTC.
>>
>> Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
>> [k-willis@ti.com: Reworded commit message]
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> ---
>> Tested with rtcwake on AM62A.
> 
> Any test logs you can provide would be great!
> 
>>
>> Original patch for AM62A existed in the TI Vendor tree with Vibhore's
>> authorship:
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.6.y&id=f745d9063212d1088dcfb068ecb4b16648b96487
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> index a6f0d87a50d8..51ea961f166e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -22,6 +22,8 @@ aliases {
>>   		serial3 = &main_uart1;
>>   		mmc0 = &sdhci0;
>>   		mmc1 = &sdhci1;
>> +		rtc0 = &wkup_rtc0;
>> +		rtc1 = &tps659312;
>>   	};
>>   
>>   	chosen {
>>
>> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> 
> It's nice that you've mentioned this, but it seems to be from Feb2.
> Can you please base it on latest linux-next when you send in future?
> This will avoid any merge conflicts in advance.
> 
> For this though, you may get away with it because nobody else may have
> touched this file so far...
> 
> If you do send a v2, feel free to pick:
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> 

Hi Dhruva,

Thanks for the feedback and the review. I will be adding the changes 
mentioned by you in v2 :)

Best,
Kendall Willis

