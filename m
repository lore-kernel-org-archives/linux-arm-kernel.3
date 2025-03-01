Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249C1C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 01:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwI2RPp0lc2nI+b9PwlTDvKqHyEE6M7HzsQHovIJa8k=; b=UHcTXAovbS86J/+Zkw6lwas+kp
	ekotoCbuyOG9DlxubAGKEvufvvoUHua3JfVM0Z90wqyGBrHPZObz1Z+CRxu5YV2V8Bmdt2bcHQr95
	shuw11BeYUunWLWx976zwLm4SibjI99okA7b8g+ZGWf+Us52JoYXxL+2ZO6dQdKGpd6z9ldNFBlOz
	ME0xYENkFcQv7uICYKtMa3L7BLqqdMjX3a2kp/oXol2ENG7gu9s5KeYqz3+EG/Adk1uXykpjohCoh
	1Cku5DfZLq+ybrG2pGR7g0UszRcsjvXnmRRwqOVYyMJ8i+ZT2rD1QMSp4jed9IOQwI3HwIndEPLsN
	xzqM3adA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toBpN-0000000DBPR-3w0R;
	Sat, 01 Mar 2025 01:39:41 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toBnq-0000000DB8h-0C1x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 01:38:07 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id EABF02038A20;
	Fri, 28 Feb 2025 17:38:03 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EABF02038A20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740793084;
	bh=SwI2RPp0lc2nI+b9PwlTDvKqHyEE6M7HzsQHovIJa8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VBJyQn4In+Z6OoD5b3tU9zACXIqUuuGyTy9YFEoBwVxvJ8gxMvk7GLb1YfVzwFMNa
	 MZ8P4/K9yMIFqxYCeT9cetKxvXCUpEfmrHCnZy1M1IRPhUWK6daGHv6lNZ/YA/J8gg
	 mlyLZ5ytzxYgjDEsIlhr6XLI37+XeT9ZA3oJ/ehw=
Message-ID: <bcb300dd-762f-495d-9d07-16b81ff70602@linux.microsoft.com>
Date: Fri, 28 Feb 2025 17:38:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] Drivers: hv: Introduce mshv_root module to
 expose /dev/mshv to VMMs
To: Roman Kisel <romank@linux.microsoft.com>, linux-hyperv@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-acpi@vger.kernel.org
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
 <f332b77a-940f-4007-a44a-de64878d5201@linux.microsoft.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <f332b77a-940f-4007-a44a-de64878d5201@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_173806_114050_1547F9EA 
X-CRM114-Status: GOOD (  18.64  )
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

On 2/27/2025 10:50 AM, Roman Kisel wrote:
> 
> 
> 
> On 2/26/2025 3:08 PM, Nuno Das Neves wrote:
>> Provide a set of IOCTLs for creating and managing child partitions when
>> running as root partition on Hyper-V. The new driver is enabled via
>> CONFIG_MSHV_ROOT.
>>
> 
> [...]
> 
> 
> As I understood, the changes fall into these buckets:
> 
> 1. Partition management (VPs and memory). Built of the top of fd's which
>    looks as the right approach. There is ref counting etc.
> 2. Scheduling. Here, there is the mature KVM and Xen code dto find
>    inspiration in. Xen being the Type 1 hypervisor should likely be
>    closer to MSHV in my understanding.
> 3. IOCTL code allocation. Not sure how this is allocated yet given that
>    the patch series has been through a multi-year review, that must be
>    settled by now.
> 4. IOCTLs themselves. The majority just marshals data to the
>    hypervisor.
> 
This is a good summary, thanks.

> Despite the rather large size of the patch, I spot-checked the places
> where I have the chance to make an informed decision, and could not find
> anything that'd stand out as suspicious to me. Going to extrapolate that
> the patch itself should be good enough. Given that this code has been in
> development and validation for a few years, I'd vote to merge it. That
> will also enable upstreaming the rest of the VTL mode code that powers
> Azure Boost (https://github.com/microsoft/OHCL-Linux-Kernel)
> 
> Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
> 


