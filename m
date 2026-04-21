Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144EBF327C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8e93lI6ji5NMxHi3xRZft6ZzhHz9FmmUIi6OkuKmxHc=; b=UgCJWs9kqst3JHrSEtbSxrINAO
	gYRJa0ustTl2tm/FJWu03YJ61AoNGSAtZH3T89tFfqk9ejoMEAyz2yVa5QfeMTVkVTolpSDoUDlnw
	JRrARZiHDHp6rP6HNtejvlO0QBWx5mrarlfBWARW/3uEpd7D8WKDFx/CU4pccTeBZ9JUaCA//hbtm
	YprcrsW6RXZKVi6mXt1iCAaaaJqCdDlVb9ZQ/6w4S7YcIflXbEXirvvClofnT5DERStZnh3cwdmZP
	WNXuCf27S2C+AYhAlW9qcZXuH5lZPs8zQIfolUVRb0Sml+rHnKTBD2irI0YEGQ/qoxNn7PoDXu2+m
	1yCcXMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6us-00000008HzO-24yM;
	Tue, 21 Apr 2026 08:57:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6up-00000008Hz1-2V2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 08:57:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F06225E0;
	Tue, 21 Apr 2026 01:57:00 -0700 (PDT)
Received: from [10.57.17.241] (unknown [10.57.17.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FDBA3F915;
	Tue, 21 Apr 2026 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776761825; bh=YzXsmTk6+sj47O3aTuKHVkLOmVtcoX1WjbZAjbXxFEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sse1rosczzldQRUmugXX1KsoKRgsoUFkpat/bsOXjt61vLGQ/WXzOgA06irj3umSk
	 eMkKmeY71bDfDZhQmoModxUliH+aK/XMN+/rd31appzqEAFIHXJ8NbfqT/CbXRW60o
	 HqJa2/q10dtoRD7W7xwxp6KnbKImE83rRuqW9l9k=
Message-ID: <57dbea1b-670b-4b8f-a590-1d4239bc2c76@arm.com>
Date: Tue, 21 Apr 2026 09:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
 <20260416155118.GM356832@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260416155118.GM356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_015707_721536_0FF0602A 
X-CRM114-Status: GOOD (  19.32  )
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

On 16/04/2026 16:51, Leo Yan wrote:
> On Wed, Apr 15, 2026 at 05:55:20PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
>> @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>>   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>>   
>>   	for (i = 0; i < caps->nr_ss_cmp; i++) {
>> -		/* always clear status bit on restart if using single-shot */
>> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
>> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>>   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
>> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
>> +		/* always clear status and pending bits on restart if using single-shot */
>> +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));
> 
> In Arm ARM, D24.4.60 TRCSSCSR<n>, bits[0..3] are RO.  I think it is
> fine for directly clear the regiser with zero (means it will only
> clear status / pending bits).
> 
> [...]
> 
>> @@ -1841,10 +1839,11 @@ static ssize_t sshot_status_show(struct device *dev,
>>   {
>>   	unsigned long val;
>>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +	const struct etmv4_caps *caps = &drvdata->caps;
>>   	struct etmv4_config *config = &drvdata->config;
>>   
>>   	raw_spin_lock(&drvdata->spinlock);
>> -	val = config->ss_status[config->ss_idx];
>> +	val = caps->ss_cmp[config->ss_idx];
>>   	raw_spin_unlock(&drvdata->spinlock);
>>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>>   }
> 
> This sysfs knob never can print out a realtime status for sshot, I am

Won't it give the status, when the ETM was disabled (and saved back to
config), for as sysfs mode operation, where the user collects
information about the status via sysfs ? ( The question of if someone
actually makes use of this is a different question )


Cheers
Suzuki


> fine for only printing caps->ss_cmp, this can avoid any misleading.
> 
> @Suzuki, @Mike, do you agree with the change above?
> 
> If maintainers agree with this, as Jie suggested, it is good to add a
> comment in the code and update the document:
> 
>    Documentation/trace/coresight/coresight-etm4x-reference.rst
> 
> Thanks,
> Leo


