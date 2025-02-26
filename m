Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC86C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+6I+3A1b4iKmWuAFLCEc6Cxy/RwiNoKQINkgAxYW+s=; b=YlaCUIpvxNqUVDlrUd2rEhxQxk
	6cREjKBrinUmv+FNJSLXf77JDT9q1YMIpTbHvFugZ+0yBzhHclCI2Ukc9sdbxCqonlnzRomr7IDTa
	ygyQGYoe1envqljKqPTcNBAvB5cZ/xObsJXv3uLWsyCdMHZPn1yNiBPt3s5bitIKlb6D3qBb2IziT
	EZLAqW0wWpmdMHWjVPSj8eLvAA1thRaYr0zJOv8byo73ALoacnONssx+EFnWoqrR8Gv79baWM4dJc
	0kRZkLk934f6Pn85PNmb90QWI6YR3hNHYs3a10SaSq7SgHybPNXeb7cxEl91snrPT2GS+8+GV+3tl
	weUlTRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRD4-00000005kUs-2Los;
	Wed, 26 Feb 2025 23:53:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRBW-00000005kLG-1iNn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:51:28 +0000
Received: from skinsburskii. (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id C853F210EACD;
	Wed, 26 Feb 2025 15:51:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C853F210EACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740613884;
	bh=d+6I+3A1b4iKmWuAFLCEc6Cxy/RwiNoKQINkgAxYW+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n+MWT2OfBjANgztlGDriEEM11l+NAjEHrobcrCxCnPibzMo12xR4JKZRSGtO0sf4w
	 3RzDqrRxyFlELGGpbpBsyaGm5ADrPpt55c8GJbd1TQx3u+LIJHojqvAByoYbTphfI2
	 0PnHNwffW+IeWKXwvZTUTq9JqJ8upPvhZlec5Gn4=
Date: Wed, 26 Feb 2025 15:51:21 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com, apais@linux.microsoft.com,
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org, vkuznets@redhat.com,
	prapal@linux.microsoft.com, muislam@microsoft.com,
	anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v5 09/10] hyperv: Add definitions for root partition
 driver to hv headers
Message-ID: <Z7-o-VnE6iffOi7Z@skinsburskii.>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-10-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740611284-27506-10-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_155126_498078_6FB8F1FC 
X-CRM114-Status: GOOD (  20.21  )
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

On Wed, Feb 26, 2025 at 03:08:03PM -0800, Nuno Das Neves wrote:
> A few additional definitions are required for the mshv driver code
> (to follow). Introduce those here and clean up a little bit while
> at it.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  include/hyperv/hvgdk_mini.h |  64 ++++++++++++++++-
>  include/hyperv/hvhdk.h      | 132 ++++++++++++++++++++++++++++++++++--
>  include/hyperv/hvhdk_mini.h |  91 +++++++++++++++++++++++++
>  3 files changed, 280 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hyperv/hvgdk_mini.h b/include/hyperv/hvgdk_mini.h
> index 58895883f636..e4a3cca0cbce 100644
> --- a/include/hyperv/hvgdk_mini.h
> +++ b/include/hyperv/hvgdk_mini.h
 @@ -1325,6 +1344,49 @@ struct hv_retarget_device_interrupt {	 /* HV_INPUT_RETARGET_DEVICE_INTERRUPT */
>  	struct hv_device_interrupt_target int_target;
>  } __packed __aligned(8);
>  
> +enum hv_intercept_type {
> +#if defined(CONFIG_X86_64)

Prehaps it would be nice to have per-arch headers for such structures
instead.

> +	HV_INTERCEPT_TYPE_X64_IO_PORT			= 0x00000000,
> +	HV_INTERCEPT_TYPE_X64_MSR			= 0x00000001,
> +	HV_INTERCEPT_TYPE_X64_CPUID			= 0x00000002,
> +#endif
> +	HV_INTERCEPT_TYPE_EXCEPTION			= 0x00000003,
> +	/* Used to be HV_INTERCEPT_TYPE_REGISTER */
> +	HV_INTERCEPT_TYPE_RESERVED0			= 0x00000004,
> +	HV_INTERCEPT_TYPE_MMIO				= 0x00000005,
> +#if defined(CONFIG_X86_64)
> +	HV_INTERCEPT_TYPE_X64_GLOBAL_CPUID		= 0x00000006,
> +	HV_INTERCEPT_TYPE_X64_APIC_SMI			= 0x00000007,
> +#endif
> +	HV_INTERCEPT_TYPE_HYPERCALL			= 0x00000008,
> +#if defined(CONFIG_X86_64)
> +	HV_INTERCEPT_TYPE_X64_APIC_INIT_SIPI		= 0x00000009,
> +	HV_INTERCEPT_MC_UPDATE_PATCH_LEVEL_MSR_READ	= 0x0000000A,
> +	HV_INTERCEPT_TYPE_X64_APIC_WRITE		= 0x0000000B,
> +	HV_INTERCEPT_TYPE_X64_MSR_INDEX			= 0x0000000C,
> +#endif
> +	HV_INTERCEPT_TYPE_MAX,
> +	HV_INTERCEPT_TYPE_INVALID			= 0xFFFFFFFF,
> +};
> +
> +union hv_intercept_parameters {
> +	/*  HV_INTERCEPT_PARAMETERS is defined to be an 8-byte field. */
> +	__u64 as_uint64;

Should this one be "u64" instead of "__u64" (here and below) ?

> +#if defined(CONFIG_X86_64)
> +	/* HV_INTERCEPT_TYPE_X64_IO_PORT */
> +	__u16 io_port;
> +	/* HV_INTERCEPT_TYPE_X64_CPUID */
> +	__u32 cpuid_index;
> +	/* HV_INTERCEPT_TYPE_X64_APIC_WRITE */
> +	__u32 apic_write_mask;
> +	/* HV_INTERCEPT_TYPE_EXCEPTION */
> +	__u16 exception_vector;
> +	/* HV_INTERCEPT_TYPE_X64_MSR_INDEX */
> +	__u32 msr_index;
> +#endif
> +	/* N.B. Other intercept types do not have any parameters. */
> +};
> +
>  /* Data structures for HVCALL_MMIO_READ and HVCALL_MMIO_WRITE */
>  #define HV_HYPERCALL_MMIO_MAX_DATA_LENGTH 64
>  
> diff --git a/include/hyperv/hvhdk.h b/include/hyperv/hvhdk.h
> index 64407c2a3809..1b447155c338 100644
> --- a/include/hyperv/hvhdk.h
> +++ b/include/hyperv/hvhdk.h
> @@ -19,11 +19,24 @@
>  
>  #define HV_VP_REGISTER_PAGE_VERSION_1	1u
>  
> +#define HV_VP_REGISTER_PAGE_MAX_VECTOR_COUNT		7
> +
> +union hv_vp_register_page_interrupt_vectors {
> +	u64 as_uint64;
> +	struct {
> +		u8 vector_count;
> +		u8 vector[HV_VP_REGISTER_PAGE_MAX_VECTOR_COUNT];
> +	} __packed;
> +} __packed;

Packed attribute for the union looks redundant.

Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

