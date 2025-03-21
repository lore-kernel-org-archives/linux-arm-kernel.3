Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89846C36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpBlJrTh2SiAQ7XsqitwZTpLQOS2kEOUFkxFqjobLOc=; b=SPH3uMYuFdE4mrUysrXFd71m9Q
	5fDFC7xgh5kDlMf7fPYnE+6HOexOP2+sm3HZklJVbascivF98h7k+DxzddAlhL23xIYu55dNo1cxc
	amTIi7LJttIDsLOVxTJyHNKEBa9FjrpnWLqdmK0KOnL0yu2jz1jFQTZH0id73nRcUtM9/0E0/IGdr
	jdc/L5bWhzABYpHOJWG873bGhIRxe8ypnFjHpPWWPTN4B6T2U98Ua3rnJWSLX43CHqqM4644CSF8K
	lDirG44MeTNwRKsGonf9ZTx1pgpYNC6JbABvpaDp5xbhXwQ74VbRdqfLEeNdQ40ZzYVjtr/Hxc5BT
	ErxHhk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhp6-0000000FzQn-0762;
	Fri, 21 Mar 2025 19:14:28 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhnP-0000000FzAF-1XqR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 19:12:44 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id CF4992025382;
	Fri, 21 Mar 2025 12:12:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CF4992025382
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742584361;
	bh=RpBlJrTh2SiAQ7XsqitwZTpLQOS2kEOUFkxFqjobLOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hkOKtvIis368GA/nBLiPIbVRZnLqR4lZuZfuJK5omjdr4orl62qBol7YKN0jDJT1F
	 Ej+n9pHTJ20rq+9UpKtUghqYc4p5HqagBt1wmktxPJbXnqz1Q9a0vY9gsg7I+VFmFo
	 08qTYLhhG9NKHnxoDyfrpqKvTXEcIJWSlmUpelQk=
Message-ID: <7bc80505-686e-40db-b3bf-dd2f846ea66c@linux.microsoft.com>
Date: Fri, 21 Mar 2025 12:12:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] hyperv: Log hypercall status codes as strings
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "ltykernel@gmail.com" <ltykernel@gmail.com>,
 "stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "eahariha@linux.microsoft.com" <eahariha@linux.microsoft.com>,
 "jeff.johnson@oss.qualcomm.com" <jeff.johnson@oss.qualcomm.com>
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
 "anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1741980536-3865-2-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157E630EC520DC487139372D4DE2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157E630EC520DC487139372D4DE2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_121243_461925_D7822FAC 
X-CRM114-Status: GOOD (  39.43  )
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

On 3/18/2025 11:01 AM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Friday, March 14, 2025 12:29 PM
>>
>> Introduce hv_status_printk() macros as a convenience to log hypercall
>> errors, formatting them with the status code (HV_STATUS_*) as a raw hex
>> value and also as a string, which saves some time while debugging.
>>
>> Create a table of HV_STATUS_ codes with strings and mapped errnos, and
>> use it for hv_result_to_string() and hv_result_to_errno().
>>
>> Use the new hv_status_printk()s in hv_proc.c, hyperv-iommu.c, and
>> irqdomain.c hypercalls to aid debugging in the root partition.
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>> ---
>>  arch/x86/hyperv/irqdomain.c    |   6 +-
>>  drivers/hv/hv_common.c         | 129 ++++++++++++++++++++++++---------
>>  drivers/hv/hv_proc.c           |  10 +--
>>  drivers/iommu/hyperv-iommu.c   |   4 +-
>>  include/asm-generic/mshyperv.h |  13 ++++
>>  5 files changed, 118 insertions(+), 44 deletions(-)
>>
> 
> [snip]
>  
>> +
>> +struct hv_status_info {
>> +	char *string;
>> +	int errno;
>> +	u16 code;
>> +};
>> +
>> +/*
>> + * Note on the errno mappings:
>> + * A failed hypercall is usually only recoverable (or loggable) near
>> + * the call site where the HV_STATUS_* code is known. So the errno
>> + * it gets converted to is not too useful further up the stack.
>> + * Provide a few mappings that could be useful, and revert to -EIO
>> + * as a fallback.
>> + */
>> +static const struct hv_status_info hv_status_infos[] = {
>> +#define _STATUS_INFO(status, errno) { #status, (errno), (status) }
>> +	_STATUS_INFO(HV_STATUS_SUCCESS,				0),
>> +	_STATUS_INFO(HV_STATUS_INVALID_HYPERCALL_CODE,		-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_INVALID_HYPERCALL_INPUT,		-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_INVALID_ALIGNMENT,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_INVALID_PARAMETER,		-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_ACCESS_DENIED,			-EIO),
>> +	_STATUS_INFO(HV_STATUS_INVALID_PARTITION_STATE,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_OPERATION_DENIED,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_UNKNOWN_PROPERTY,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_PROPERTY_VALUE_OUT_OF_RANGE,	-EIO),
>> +	_STATUS_INFO(HV_STATUS_INSUFFICIENT_MEMORY,		-ENOMEM),
>> +	_STATUS_INFO(HV_STATUS_INVALID_PARTITION_ID,		-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_INVALID_VP_INDEX,		-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_NOT_FOUND,			-EIO),
>> +	_STATUS_INFO(HV_STATUS_INVALID_PORT_ID,			-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_INVALID_CONNECTION_ID,		-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_INSUFFICIENT_BUFFERS,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_NOT_ACKNOWLEDGED,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_INVALID_VP_STATE,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_NO_RESOURCES,			-EIO),
>> +	_STATUS_INFO(HV_STATUS_PROCESSOR_FEATURE_NOT_SUPPORTED,	-EIO),
>> +	_STATUS_INFO(HV_STATUS_INVALID_LP_INDEX,		-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_INVALID_REGISTER_VALUE,		-EINVAL),
>> +	_STATUS_INFO(HV_STATUS_INVALID_LP_INDEX,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_INVALID_REGISTER_VALUE,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_OPERATION_FAILED,		-EIO),
>> +	_STATUS_INFO(HV_STATUS_TIME_OUT,			-EIO),
>> +	_STATUS_INFO(HV_STATUS_CALL_PENDING,			-EIO),
>> +	_STATUS_INFO(HV_STATUS_VTL_ALREADY_ENABLED,		-EIO),
>> +#undef _STATUS_INFO
>> +};
>> +
>> +static inline const struct hv_status_info *find_hv_status_info(u64 hv_status)
>> +{
>> +	int i;
>> +	u16 code = hv_result(hv_status);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(hv_status_infos); ++i) {
>> +		const struct hv_status_info *info = &hv_status_infos[i];
>> +
>> +		if (info->code == code)
>> +			return info;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +/* Convert a hypercall result into a linux-friendly error code. */
>> +int hv_result_to_errno(u64 status)
>> +{
>> +	const struct hv_status_info *info;
>> +
>> +	/* hv_do_hypercall() may return U64_MAX, hypercalls aren't possible */
>> +	if (unlikely(status == U64_MAX))
>> +		return -EOPNOTSUPP;
>> +
>> +	info = find_hv_status_info(status);
>> +	if (info)
>> +		return info->errno;
>> +
>> +	return -EIO;
>> +}
>> +EXPORT_SYMBOL_GPL(hv_result_to_errno);
>> +
>> +const char *hv_result_to_string(u64 status)
>> +{
>> +	const struct hv_status_info *info;
>> +
>> +	if (unlikely(status == U64_MAX))
>> +		return "Hypercall page missing!";
>> +
>> +	info = find_hv_status_info(status);
>> +	if (info)
>> +		return info->string;
>> +
>> +	return "Unknown";
>> +}
>> +EXPORT_SYMBOL_GPL(hv_result_to_string);
> 
> I think the table-driven approach worked out pretty well. But here's a version that
> is even more compact, and avoids the duplicate testing for U64_MAX and having
> to special case both U64_MAX and not finding a match:
> 
> +
> +struct hv_status_info {
> +	char *string;
> +	int errno;
> +	int code;
> +};
> +
> +/*
> + * Note on the errno mappings:
> + * A failed hypercall is usually only recoverable (or loggable) near
> + * the call site where the HV_STATUS_* code is known. So the errno
> + * it gets converted to is not too useful further up the stack.
> + * Provide a few mappings that could be useful, and revert to -EIO
> + * as a fallback.
> + */
> +static const struct hv_status_info hv_status_infos[] = {
> +#define _STATUS_INFO(status, errno) { #status, (errno), (status) }
> +	_STATUS_INFO(HV_STATUS_SUCCESS,				0),
> +	_STATUS_INFO(HV_STATUS_INVALID_HYPERCALL_CODE,		-EINVAL),
> +	_STATUS_INFO(HV_STATUS_INVALID_HYPERCALL_INPUT,		-EINVAL),
> +	_STATUS_INFO(HV_STATUS_INVALID_ALIGNMENT,		-EIO),
> +	_STATUS_INFO(HV_STATUS_INVALID_PARAMETER,		-EINVAL),
> +	_STATUS_INFO(HV_STATUS_ACCESS_DENIED,			-EIO),
> +	_STATUS_INFO(HV_STATUS_INVALID_PARTITION_STATE,		-EIO),
> +	_STATUS_INFO(HV_STATUS_OPERATION_DENIED,		-EIO),
> +	_STATUS_INFO(HV_STATUS_UNKNOWN_PROPERTY,		-EIO),
> +	_STATUS_INFO(HV_STATUS_PROPERTY_VALUE_OUT_OF_RANGE,	-EIO),
> +	_STATUS_INFO(HV_STATUS_INSUFFICIENT_MEMORY,		-ENOMEM),
> +	_STATUS_INFO(HV_STATUS_INVALID_PARTITION_ID,		-EINVAL),
> +	_STATUS_INFO(HV_STATUS_INVALID_VP_INDEX,		-EINVAL),
> +	_STATUS_INFO(HV_STATUS_NOT_FOUND,			-EIO),
> +	_STATUS_INFO(HV_STATUS_INVALID_PORT_ID,			-EINVAL),
> +	_STATUS_INFO(HV_STATUS_INVALID_CONNECTION_ID,		-EINVAL),
> +	_STATUS_INFO(HV_STATUS_INSUFFICIENT_BUFFERS,		-EIO),
> +	_STATUS_INFO(HV_STATUS_NOT_ACKNOWLEDGED,		-EIO),
> +	_STATUS_INFO(HV_STATUS_INVALID_VP_STATE,		-EIO),
> +	_STATUS_INFO(HV_STATUS_NO_RESOURCES,			-EIO),
> +	_STATUS_INFO(HV_STATUS_PROCESSOR_FEATURE_NOT_SUPPORTED,	-EIO),
> +	_STATUS_INFO(HV_STATUS_INVALID_LP_INDEX,		-EINVAL),
> +	_STATUS_INFO(HV_STATUS_INVALID_REGISTER_VALUE,		-EINVAL),
> +	_STATUS_INFO(HV_STATUS_INVALID_LP_INDEX,		-EIO),
> +	_STATUS_INFO(HV_STATUS_INVALID_REGISTER_VALUE,		-EIO),
> +	_STATUS_INFO(HV_STATUS_OPERATION_FAILED,		-EIO),
> +	_STATUS_INFO(HV_STATUS_TIME_OUT,			-EIO),
> +	_STATUS_INFO(HV_STATUS_CALL_PENDING,			-EIO),
> +	_STATUS_INFO(HV_STATUS_VTL_ALREADY_ENABLED,		-EIO),
> +	{"Hypercall page missing!", -EOPNOTSUPP, -1}, /* code -1 is "no hypercall page" */
> +	{"Unknown", -EIO, -2},  /* code -2 is "Not found" entry; must be last */
> +#undef _STATUS_INFO
> +};
> +
> +static inline const struct hv_status_info *find_hv_status_info(u64 hv_status)
> +{
> +	int i, code;
> +	const struct hv_status_info *info;
> +
> +	/* hv_do_hypercall() may return U64_MAX, hypercalls aren't possible */
> +	if (unlikely(hv_status == U64_MAX))
> +		code = -1;
> +	else
> +		code = hv_result(hv_status);
> +
> +	for (i = 0; i < ARRAY_SIZE(hv_status_infos); ++i) {
> +		info = &hv_status_infos[i];
> +		if (info->code == code || info->code == -2)
> +			break;
> +	}
> +
> +	return info;
> +}
> +
> +/* Convert a hypercall result into a linux-friendly error code. */
> +int hv_result_to_errno(u64 status)
> +{
> +	return find_hv_status_info(status)->errno;
> +}
> +EXPORT_SYMBOL_GPL(hv_result_to_errno);
> +
> +const char *hv_result_to_string(u64 status)
> +{
> +	return find_hv_status_info(status)->string;
> +}
> +EXPORT_SYMBOL_GPL(hv_result_to_string);
> 
> It could be even more compact by exporting find_hv_status_info() and
> letting  hv_result_to_errno() and hv_result_to_string() be #defines to
> find_hv_status_info()->errno and find_hv_status_info()->string,
> respectively.
> 
> Note that in struct hv_status_info, the "code" field is defined as "int"
> instead of "u16" so that it can contain sentinel values -1 and -2 that
> won't overlap with HV_STATUS_* values.
> 
Played around with this some more.

I like your idea of making it more compact by dealing with U64_MAX and
unknown in find_hv_status_info(), however I'm not as keen on putting
these cases in the array and iterating over the whole array when they
could just be static constants or inline struct initializers. See below.

I also like the idea of making hv_result_to_*() functions into simple
macros and exporting find_hv_status_info(). However, if it gets used
elsewhere it makes more sense if the returned hv_status_info for the
"Unknown" case contains the actual status code instead of replacing
that information with -2, so then I'd want to return it by value
instead of pointer:

+static const struct hv_status_info hv_status_infos[] = {
+#define _STATUS_INFO(status, errno) { #status, (status), (errno) }
+       _STATUS_INFO(HV_STATUS_SUCCESS,                         0),
<snip>
+       _STATUS_INFO(HV_STATUS_VTL_ALREADY_ENABLED,             -EIO),
+#undef _STATUS_INFO
+};
+
+struct hv_status_info hv_get_status_info(u64 hv_status)
+{
+       int i;
+       const struct hv_status_info *info;
+       u16 code = hv_result(hv_status);
+       struct hv_status_info ret = {"Unknown", code, -EIO};
+
+       if (hv_status == U64_MAX)
+               ret = (struct hv_status_info){"Hypercall page missing!", -1,
+                                             -EOPNOTSUPP};
+       else
+               for (i = 0; i < ARRAY_SIZE(hv_status_infos); ++i) {
+                       info = &hv_status_infos[i];
+                       if (info->code == code) {
+                               ret = *info;
+                               break;
+                       }
+               }
+
+       return ret;
+}
+EXPORT_SYMBOL_GPL(hv_get_status_info);

and in mshyperv.h:

+#define hv_result_to_string(hv_status) hv_get_status_info(hv_status).string
+#define hv_result_to_errno(hv_status) hv_get_status_info(hv_status).errno
+
+struct hv_status_info {
+       char *string;
+       int code;
+       int errno;
+};
+
+struct hv_status_info hv_get_status_info(u64 hv_status);

Note also I switched the order of code and errno in hv_status_info,
mainly because I think the struct initializers for "Unknown" and
"Hypercall page missing!" are more readable with that order:
{string, code, errno}

Do you see any problems with the above?

> Anyway, just a suggestion. The current code works from what I can
> see.
Thanks, it's not a bad idea at all to make it as compact and readable
as possible on the first try, but not a big loss either way.

Thanks
Nuno

> 
> Michael


