Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5F6CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+isSm0tESAECMiu4x/HWPUg/HqD5qUnglPjpGg08t4=; b=CVV/NvGNjw+Ilu74QtZVG1T3V3
	kbPX6ibJVThNzJaI/cGPFlBoHkIz8l1rdFrjFS+EwJF/wNkArD8yptkU7BoRyzjBx55AQbu8KYigd
	KWTj+HKd5T1ePKiJYiw4sNrFhbIfKelhxIBFXEobY+FZpwkbEySSlEjuMbA2wtEMJ916kRx5JCjPn
	qx3WZZw5uuOwk9sio0ee7jQCyMoDT+BCkWy1kiV3qc9MpqHCdhRwJIOsCEYgcM1MRI8Y/hSyHexcH
	fx/7SdK6plYdyF9sCjNZX3FszALaW/9XLChXP+C8p9He1IprTp5kJb5PZpsg1H6VTASsEOdKvva4Y
	TblKHGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkZf-00000005fBg-0esv;
	Fri, 31 Oct 2025 08:33:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkZa-00000005fAb-1w03
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:33:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE1B24E4142B;
	Fri, 31 Oct 2025 08:33:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 923CD60704;
	Fri, 31 Oct 2025 08:33:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A6C11180FE55;
	Fri, 31 Oct 2025 09:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761899600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=E+isSm0tESAECMiu4x/HWPUg/HqD5qUnglPjpGg08t4=;
	b=ZrmssfVqvhNe04qAMQHnanzo8UqXJm0eBpIBMo4B0K2KSgv3M6ae422uEQPY5+QOOrARAA
	DISItDSoi//vNkuJETrUDYbD194s/hTQpA/IYjgNVyil6qZc1zSYJdfr9Bm2IqqlBh+fhg
	SX7yOxKnR5+pWTZLADqProCI7CKc3bmE3/NywA7fp84frjGE1vgIGe+j3G5Gcacs8AF3xA
	NfDhvaauNITCEBu5L+cQ0WVygrpC+Fl9D/Y7ux7vH9ZK0Dz5yrTs/u1/rwJ8ie4dfkhmPw
	P0r33uZ+NWlfSlSLVWHh4LU22t7aJmVjPmhFn3u8uLCrwOdkCc9qp+Y5P0FCrw==
Message-ID: <da18cd22-9f9e-4166-8a91-d5b19470c693@bootlin.com>
Date: Fri, 31 Oct 2025 09:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: ti_sci: replace ifdeffery by pm_sleep_ptr()
 macro
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Richard Genoud <richard.genoud@bootlin.com>, Udit Kumar <u-kumar1@ti.com>,
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251014-ti-sci-pm-ops-cleanup-v1-1-70b50b73ac85@bootlin.com>
 <20251031041131.3qmqfitiertc7vdp@scotch>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251031041131.3qmqfitiertc7vdp@scotch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_013327_410143_2F43EB3C 
X-CRM114-Status: GOOD (  11.16  )
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

Hello Nishanth,

On 10/31/25 5:11 AM, Nishanth Menon wrote:
> On 10:35-20251014, Thomas Richard (TI.com) wrote:
>> Using pm_sleep_ptr() macro allows to remove ifdeffery and '__maybe_unused'
>> annotations.
>>
>> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
>> ---
>>  drivers/firmware/ti_sci.c | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index 49fd2ae01055d0f425062147422471f0fd49e4bd..99a2e0e2960f463918950fef8829409ec365ce70 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -3706,7 +3706,7 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
>>  	}
>>  }
>>  
>> -static int __maybe_unused ti_sci_suspend(struct device *dev)
>> +static int ti_sci_suspend(struct device *dev)
>>  {
>>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>>  	struct device *cpu_dev, *cpu_dev_max = NULL;
>> @@ -3746,7 +3746,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
>> +static int ti_sci_suspend_noirq(struct device *dev)
>>  {
>>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>>  	int ret = 0;
>> @@ -3758,7 +3758,7 @@ static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
>> +static int ti_sci_resume_noirq(struct device *dev)
>>  {
>>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>>  	int ret = 0;
>> @@ -3780,7 +3780,7 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static void __maybe_unused ti_sci_pm_complete(struct device *dev)
>> +static void ti_sci_pm_complete(struct device *dev)
> 
> PTR_IF when CONFIG_PM_SLEEP is disabled will result in these static
> functions unused, no? should we leave __maybe_unused as is?

PTR_IF is ((cond) ? ptr : NULL)

If CONFIG_PM_SLEEP is disabled, after preprocessor step you will have

	.suspend = 0 ? ti_sci_suspend : NULL,

So ti_sci_suspend() is still used. But as the condition is always false,
the compiler can do some optimization by removing ti_sci_suspend().

PTR_IF macro has a great documentation [1] which describes this use case.

[1]
https://elixir.bootlin.com/linux/v6.17.5/source/include/linux/util_macros.h#L85-L136

Best Regards,
Thomas

