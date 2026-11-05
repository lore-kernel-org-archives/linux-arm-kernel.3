Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C6606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WOB8W7Fc;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HBFO+UzD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fGSRYjsDRIPHde1RyCd2bqv9F6MK6hgC71FGb/Xh81E=; b=WOB8W7Fc+gUKb7
	+Jrm8XQVSoAI1qJKusMlhvh0PK41yurQptjrMwZV3l2XKuwbteUBXUrPqORUlddULshzaWOQfMt6L
	wvNikQBtGP0O75FMxfYI8b7xcnPXWoAzYIbka3lwIXOB+nzb1exonyGGqdnssZ/eUMG3Jhv2XwKVG
	ry0Y9bWgO/4DBP64Hx3eTVJUE4dxvBVdtRTfjV9ugkoDlujDedREIJN/YblFrb4+zl0Ovtc7kwkUz
	Ww8qWyeBhN86ccNVMXkO2gGYfm6CC9yQDqHAYRjtzfjGaGMa3r1a3NTeFPNgpD9/uEgqH18CbHhbw
	Dh08ejAjyD5dPNxjvx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyqF-00000009L8X-3ZJT;
	Thu, 05 Nov 2026 14:53:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyqC-00000009L7v-0Yh7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:53:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CED98168F;
	Thu,  5 Nov 2026 06:53:19 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0996E3F673;
	Thu,  5 Nov 2026 06:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793890402; bh=0pp+iOkW01SlRmFBGgUsE3T2F2TU+P0ZCidd5+2nbNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HBFO+UzD9u6FDVPqNq8nvE48ssjNEXul3ct0YSAw1XXlSXk5pL6TFy5aYawFRuJuZ
	 C7eu/6ecS7T7bhepEEZZUPs7mCBaW+pHdpK/j7WUbqwx7ETJswQe+Ys+RlZuCvRZ8S
	 OWod7O+v/hFP1ivwbsgM4JfWcXKMwJ+Q8qjdz36U=
Message-ID: <d4ee8d56-9ae9-4fb3-ab70-2deaba3a5d0c@arm.com>
Date: Thu, 5 Nov 2026 14:53:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260730080704.2903540-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_065324_279707_A77321A9 
X-CRM114-Status: GOOD (  28.17  )
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

On 30/07/2026 09:07, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 84 +++++++++++++++++++
>   2 files changed, 91 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index a0cad2f16310..5c928a5fa033 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -51,3 +51,10 @@ KernelVersion:	7.2
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		August 2026
> +KernelVersion:	7.2
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index ea83273a628c..d65a68faa741 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -228,6 +228,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   	int i, j, k, index = 0;
>   
>   	TGU_UNLOCK(drvdata->base);
> +
> +	/*
> +	 * Quiesce the detection engine before mutating any comparison input.
> +	 * This function is also reached from reset_tgu_store() while the TGU is
> +	 * already running (TGU_CONTROL == 1); rewriting the priority/condition/
> +	 * timer/counter registers register-by-register on a live engine could
> +	 * feed a transient, half-updated match into CTI/interrupt consumers.
> +	 * Programming with CONTROL == 0 and only re-enabling at the end keeps the
> +	 * program-then-enable ordering for every caller.
> +	 */
> +	writel(0, drvdata->base + TGU_CONTROL);
> +
>   	for (i = 0; i < drvdata->num_step; i++) {
>   		for (j = 0; j < MAX_PRIORITY; j++) {
>   			for (k = 0; k < drvdata->num_reg; k++) {
> @@ -459,8 +471,80 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	/*
> +	 * Hold the mutex across the whole sequence so it cannot race with
> +	 * enable_tgu_store()/tgu_dataset_store(): the enabled check and the
> +	 * hardware access stay consistent. No PM reference is taken or dropped
> +	 * here - the shadow tables are plain memory, and the hardware is only
> +	 * touched when the device is already resumed via the enable reference.
> +	 */
> +	guard(mutex)(&drvdata->lock);
> +
> +	if (vt->priority) {
> +		size_t bytes = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);

Please could you add a macro to compute "number" of each array ? 
Something like :

#define TGU_PRIORITY_SIZE(drvdata)	
	(MAX_PRIORITY * (drvdata)->num_step * (drvdata)->num_reg)

So that we use the same size calculation for allocation and reset ?
You may scale it by sizeof(*vt->priority)



> +		memset(vt->priority, 0, bytes);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t bytes = drvdata->num_condition_decode *
> +			       drvdata->num_step * sizeof(unsigned int);

Same as above

> +		memset(vt->condition_decode, 0, bytes);
> +
> +		/* Initialize all condition decode registers to NOT (0x1000000) */

then why do the memset above ?

> +		for (i = 0; i < drvdata->num_step; i++)
> +			for (j = 0; j < drvdata->num_condition_decode; j++)
> +				vt->condition_decode[calculate_array_location(
> +					drvdata, i, TGU_CONDITION_DECODE, j)] =
> +					TGU_CONDITION_DECODE_NOT;

Then, we could simplify the above to:

	for (i = 0; i < TGU_CONDITION_DECODE(drvdata); i++)
		vt->condition_decode[i] = TGU_CONDITION_DECODE_NOT;

Same for everything below.

Suzuki

> +	}
> +
> +	if (vt->condition_select) {
> +		size_t bytes = drvdata->num_condition_select *
> +			       drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, bytes);
> +	}
> +
> +	if (vt->timer) {
> +		size_t bytes = drvdata->num_step * drvdata->num_timer *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, bytes);
> +	}
> +
> +	if (vt->counter) {
> +		size_t bytes = drvdata->num_step * drvdata->num_counter *
> +			       sizeof(unsigned int);
> +		memset(vt->counter, 0, bytes);
> +	}
> +
> +	/* If the TGU is running, apply the cleared configuration immediately. */
> +	if (drvdata->enabled) {
> +		ret = tgu_write_all_hw_regs(drvdata);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   


