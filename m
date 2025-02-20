Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122A1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 22:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlJ9o1tnOHtBaPAGwZpy5EIMcQfR5rWT7Vt3LiKDITw=; b=4x9WnLckqBA7QEx5SXrMz81pMG
	Sds0KW/G7EOJ0/S1ZYuZpd8Yg6tHmP4JDeDpu481U75jCkjDutoVOoXjqcPvjxEl2AZtgsqFQ6we8
	azDtvFx8Th6a57h0Q0CjBcZxDKzpvkozjYscZbNa4gAYuwv3/lugbfiDIam7lZiz6FknRANWuE8mw
	tYwrImnkwZOqppFA7xSuHnGpbmmocYc+sStNz4OzHQ4di3Y1z38bjQbA8ZTYQJYRDOjIu8Z9Vt5OS
	mAoSCD22K8W2dJqTfnye08MF06r4d59dMQKHGbMDpw3hW/K1GWqZHbk8M3p2Sx6C0PmEjpOmQcxJG
	df7GSQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFUy-00000003Dpk-0hkr;
	Thu, 20 Feb 2025 22:58:28 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFTT-00000003Dcl-2yka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 22:56:57 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id B124E203E3BD;
	Thu, 20 Feb 2025 14:56:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B124E203E3BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740092214;
	bh=KlJ9o1tnOHtBaPAGwZpy5EIMcQfR5rWT7Vt3LiKDITw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Q2GieosC+3/oYYgrljt3B37PLvNhNYiMztvtqhlGOuRpi5Ru0KepULlpYPCdIUW+t
	 5+e1L9PeqJP6iAnpVjrYeNs22r1EIpjq34qfQXy5dNzHcjFJ1gIUWCrudkgl2ADUkN
	 Sat9JveKOeA4IyootCFsExr2mHOcF/a2WPNi4XKY=
Message-ID: <a29af204-e4a9-4ef2-b5b8-f99f2ac0a836@linux.microsoft.com>
Date: Thu, 20 Feb 2025 14:56:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "mhklinux@outlook.com" <mhklinux@outlook.com>, eahariha@linux.microsoft.com,
 KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>
Subject: Re: [PATCH v2 2/3] hyperv: Change hv_root_partition into a function
To: MUKESH RATHOR <mukeshrathor@microsoft.com>
References: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740076396-15086-3-git-send-email-nunodasneves@linux.microsoft.com>
 <5980eaf9-2e77-d0ec-e39b-b48913c8b72f@microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <5980eaf9-2e77-d0ec-e39b-b48913c8b72f@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_145655_800442_F2AEF41B 
X-CRM114-Status: GOOD (  19.20  )
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

On 2/20/2025 1:59 PM, MUKESH RATHOR wrote:
> 
> 
> On 2/20/25 10:33, Nuno Das Neves wrote:
>  > Introduce hv_current_partition_type to store the partition type
>  > as an enum.
>  >
>  > Right now this is limited to guest or root partition, but there will
>  > be other kinds in future and the enum is easily extensible.
>  >
>  > Set up hv_current_partition_type early in Hyper-V initialization with
>  > hv_identify_partition_type(). hv_root_partition() just queries this
>  > value, and shouldn't be called before that.
>  >
>  > Making this check into a function sets the stage for adding a config
>  > option to gate the compilation of root partition code. In particular,
>  > hv_root_partition() can be stubbed out always be false if root
>  > partition support isn't desired.
>  >
>  > Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>  > ---
>  >   arch/arm64/hyperv/mshyperv.c       |  2 ++
>  >   arch/x86/hyperv/hv_init.c          | 10 ++++-----
>  >   arch/x86/kernel/cpu/mshyperv.c     | 24 ++------------------
>  >   drivers/clocksource/hyperv_timer.c |  4 ++--
>  >   drivers/hv/hv.c                    | 10 ++++-----
>  >   drivers/hv/hv_common.c             | 35 +++++++++++++++++++++++++-----
>  >   drivers/hv/vmbus_drv.c             |  2 +-
>  >   drivers/iommu/hyperv-iommu.c       |  4 ++--
>  >   include/asm-generic/mshyperv.h     | 15 +++++++++++--
>  >   9 files changed, 61 insertions(+), 45 deletions(-)
>  >

<snip>

>  > @@ -34,8 +34,11 @@
>  >   u64 hv_current_partition_id = HV_PARTITION_ID_SELF;
>  >   EXPORT_SYMBOL_GPL(hv_current_partition_id);
>  >
>  > +enum hv_partition_type hv_current_partition_type;
>  > +EXPORT_SYMBOL_GPL(hv_current_partition_type);
>  > +
> 
> nit: if possible and not too late, can we please use more Unix
> style naming, eg, hv_curr_ptid and hv_curr_pt_type rather than this
> long windows style names that causes unnecessary line wraps/splits.
> 
> Thanks,
> -Mukesh
> 

Per https://docs.kernel.org/process/coding-style.html#naming

GLOBAL variables (to be used only if you really need them) need to have descriptive names,
as do global functions. If you have a function that counts the number of active users,
you should call that count_active_users() or similar, you should not call it cntusr().

Thanks,
Easwar (he/him)

