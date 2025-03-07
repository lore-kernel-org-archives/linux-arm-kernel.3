Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE219C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 21:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PErTl8OjCmr+pXwdzsQjeewJzsWEtdQvnkkFx+B+7d4=; b=ehNGQ/a/Zv6hn1XxCue8Ptp4Bc
	IeRkVoavdorqx0a8PfAl4EMWCwakE8wV871x+YtHds3gpa935T72tnDGUWPVO5B/mo6ozJk5b94Mz
	d0IOf2EFnpl1znHPEUPZp3RhvNxdCP/o91SNvVljGAld7OyBYJILTocsS1VX3oJFF5BUcYC5ZAnUT
	knFCccNKOarp3flwF+VUOgLfm/tGekEsYVzDnqVl2r55WQQK6baY8f9aA4ObLvpOKdnDgTMQCMZ5B
	aLjW11AwO0Dtk1efxOT4tQePTHwnkptKymzmHkN9njReSn4R1HxvJaSGN/+RBG+DtGcBNRuAj3B+n
	+Zu/TUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfSI-0000000FbM2-2d9o;
	Fri, 07 Mar 2025 21:42:06 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfPJ-0000000Fakt-0bFN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 21:39:02 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5141B2038F3B;
	Fri,  7 Mar 2025 13:38:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5141B2038F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741383540;
	bh=PErTl8OjCmr+pXwdzsQjeewJzsWEtdQvnkkFx+B+7d4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I19wXnmtMTh5TKUlGJZ1jrhcfilqlen7AEI9d0oLMxbG8/LUNvkfP6s7gePdSXzP4
	 atNUJWmjNO40FAQcmyGeeiz6CUyVP5t/l6f4UyWBLO8gk2CkeZnnor3kJ8YVqEjKMd
	 6KM77EOO72WSaKZMIexUsot5lon5rj3stvV+gx/c=
Message-ID: <bed778c5-4642-4429-914d-7ef2e6ecccc6@linux.microsoft.com>
Date: Fri, 7 Mar 2025 13:38:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] Drivers/hv: Export some functions for use by
 root partition module
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "apais@linux.microsoft.com" <apais@linux.microsoft.com>,
 "Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
 "stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
 "muislam@microsoft.com" <muislam@microsoft.com>,
 "anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-7-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB415706E75693B821FAF0A231D4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB415706E75693B821FAF0A231D4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_133901_235681_DF047F66 
X-CRM114-Status: GOOD (  14.72  )
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

On 3/6/2025 11:23 AM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Wednesday, February 26, 2025 3:08 PM
>>
> 
> Nit: For the patch Subject line, use prefix "Drivers: hv:" instead of with a slash.
> That's what we usually use and what you have used for other patches in this
> series.
> 
Thanks, I thought I checked these but I guess I missed this! I'll update for v6.

>> get_hypervisor_version, hv_call_deposit_pages, hv_call_create_vp,
>> hv_call_deposit_pages, and hv_call_create_vp are all needed in module
>> with CONFIG_MSHV_ROOT=m.
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> 
> Modulo the nit:
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> 
>> ---
>>  arch/arm64/hyperv/mshyperv.c   | 1 +
>>  arch/x86/kernel/cpu/mshyperv.c | 1 +
>>  drivers/hv/hv_common.c         | 1 +
>>  drivers/hv/hv_proc.c           | 3 ++-
>>  4 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
>> index 2265ea5ce5ad..4e27cc29c79e 100644
>> --- a/arch/arm64/hyperv/mshyperv.c
>> +++ b/arch/arm64/hyperv/mshyperv.c
>> @@ -26,6 +26,7 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info
>> *info)
>>
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(hv_get_hypervisor_version);
>>
>>  static int __init hyperv_init(void)
>>  {
>> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
>> index 2c29dfd6de19..0116d0e96ef9 100644
>> --- a/arch/x86/kernel/cpu/mshyperv.c
>> +++ b/arch/x86/kernel/cpu/mshyperv.c
>> @@ -420,6 +420,7 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info
>> *info)
>>
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(hv_get_hypervisor_version);
>>
>>  static void __init ms_hyperv_init_platform(void)
>>  {
>> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
>> index ce20818688fe..252fd66ad4db 100644
>> --- a/drivers/hv/hv_common.c
>> +++ b/drivers/hv/hv_common.c
>> @@ -717,6 +717,7 @@ int hv_result_to_errno(u64 status)
>>  	}
>>  	return -EIO;
>>  }
>> +EXPORT_SYMBOL_GPL(hv_result_to_errno);
>>
>>  void hv_identify_partition_type(void)
>>  {
>> diff --git a/drivers/hv/hv_proc.c b/drivers/hv/hv_proc.c
>> index 8fc30f509fa7..20c8cee81e2b 100644
>> --- a/drivers/hv/hv_proc.c
>> +++ b/drivers/hv/hv_proc.c
>> @@ -108,6 +108,7 @@ int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
>>  	kfree(counts);
>>  	return ret;
>>  }
>> +EXPORT_SYMBOL_GPL(hv_call_deposit_pages);
>>
>>  int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
>>  {
>> @@ -194,4 +195,4 @@ int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
>>
>>  	return ret;
>>  }
>> -
>> +EXPORT_SYMBOL_GPL(hv_call_create_vp);
>> --
>> 2.34.1


