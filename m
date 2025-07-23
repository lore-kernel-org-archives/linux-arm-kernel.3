Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A16C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGyeSp54Kgfi/2kKBHYf0cl9xJOQN/+wAmWoB0bLcDU=; b=0ZgENntrbA7GorMK7P+PGPxPwd
	FdTC6vj1MiWZqvZ2vgddYhiEgv9qZeAFVAIF1sGXZxi7KUZR/h+lB+T4lM80gs28k8YDZ1YVRHxFC
	oqFmgQnZc26KVmkn+fJSHNUuX6LrKyxYkvCiJfFDh0Gr4T2NsZI9bsb/F5B9/uX1aUaVPKQbP3SdQ
	vftI42cithhRSz7up8dFENsyBt/xAB/qrCWXY8Y4+g27nfB5yGCBhFC1stq9jNoVHiK7DkE7U95Un
	x3SvjC2hkVEHrvv1R9bAPWwG1MDoI2hpN7Z/ULstKrWDfXjYpeeU2DNipdy1vfUDoZYQU/9G4mdYU
	ylbpeLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued5N-00000005ZjY-1UHb;
	Wed, 23 Jul 2025 17:16:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued2w-00000005ZT8-1gaw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 17:14:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45DEA22C7;
	Wed, 23 Jul 2025 10:14:12 -0700 (PDT)
Received: from [192.168.20.57] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD85D3F66E;
	Wed, 23 Jul 2025 10:14:17 -0700 (PDT)
Message-ID: <2a6e1c4b-e8b0-49e2-896c-65c55103b017@arm.com>
Date: Wed, 23 Jul 2025 12:14:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] arm64: uaccess: Add additional userspace GCS
 accessors
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 thiago.bauermann@linaro.org, broonie@kernel.org, yury.khrustalev@arm.com,
 kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-5-jeremy.linton@arm.com> <aICwaQZxK5Spjj8G@arm.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <aICwaQZxK5Spjj8G@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_101426_522410_3096D56F 
X-CRM114-Status: GOOD (  18.82  )
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

Hi,


Thanks for looking at this.

On 7/23/25 4:50 AM, Catalin Marinas wrote:
> On Fri, Jul 18, 2025 at 11:37:36PM -0500, Jeremy Linton wrote:
>> +/*
>> + * Unlike put_user_gcs() above, the use of copy_from_user() may provide
>> + * an opening for non GCS pages to be used to source data. Therefore this
>> + * should only be used in contexts where that is acceptable.
>> + */
> 
> Even in user space, the GCS pages can be read with normal loads, so
> already usable as a data source if one wants to (not that it's of much
> use). So not sure the comment here is needed.

Right, but userspace isn't using it in a privileged context to emulate 
operations that have a permission check performed as part of the read 
when performed by the HW.

This comment was added in V2 following a number of conversations about 
whether this was an actual risk or something that is only a problem if a 
long set of pre-conditions hold true. Conditions which can be summarized 
as "it is too late anyway".

Hence the comment to remind people that this routine isn't assuring the 
page is correctly marked.

I will reword it a bit if that is ok.


> 
>> +static inline u64 load_user_gcs(unsigned long __user *addr, int *err)
> 
> Nitpick: name this get_user_gcs() for symmetry with put_user_gcs().
> 
>> +{
>> +	unsigned long ret;
>> +	u64 load = 0;
>> +
>> +	gcsb_dsync();
> 
> Might be worth a comment here, see the one in gcs_restore_signal().

Sure,

> 
>> +	ret = copy_from_user(&load, addr, sizeof(load));
>> +	if (ret != 0)
>> +		*err = ret;
>> +	return load;
>> +}
> 
> Otherwise the patch looks fine:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


