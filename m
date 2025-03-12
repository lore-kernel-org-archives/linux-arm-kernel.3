Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4140C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIP94RdIzcPShqhb5Ttz2y0m5JI3DqpSY2PdMNKJqh0=; b=SncqQXHh9B/oLj6IBlIjOCB91U
	WN//nWTG8n8e2tgyjOlrqjmLcKlLABgqvExIvtmhtRV6DRRBkRvuZ7onOqoNP1ZeB964TvYZIh4Xk
	sQ21HIreEI8Tlx3p0FdvEO2pwziuxV7PhKpxE9u3bQ+DM7opwVpiZnJp6zKgRjMaX65wbaetvbjIX
	hfIES9S3VUqA/+XFl+TmhH/aqedhkWW+AdU2L8ZLmrmF+7q6L4RJZdnQPp8yf67/ifTcR+aSwJ8kF
	m7vVADTJ1L1yJ/E4O8uEfgbBUXqPlgUPPWt8Qmk+0UDUjpuMeE1Uo+QvO0BhhasTq8tVCMa0CgX8u
	OOyU+DQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSYk-00000009Pni-1gdb;
	Wed, 12 Mar 2025 20:20:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSX3-00000009Pbf-30K4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 20:18:26 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 27F73210B158;
	Wed, 12 Mar 2025 13:18:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 27F73210B158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741810704;
	bh=JIP94RdIzcPShqhb5Ttz2y0m5JI3DqpSY2PdMNKJqh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=opVjwjHW1DYaqZGWtQyH7EhxeIM3Kho3KwKBgx7n/6GH/XYtwElfY1e7qAHlPhqHC
	 sgS0P6cCSzwKt+aJ8KSdu9rflLngi86lSxWbISh3/KwxJMnrHg2raKMXakc5M9OQKY
	 oVsV+EJUhLR5AuapTRuL9NI44ASp+MlPJRHraDNk=
Message-ID: <dba492d0-8640-43c1-80b5-aa8bd1cd618f@linux.microsoft.com>
Date: Wed, 12 Mar 2025 13:17:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/10] hyperv: Add definitions for root partition
 driver to hv headers
To: Tianyu Lan <ltykernel@gmail.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 <1740611284-27506-10-git-send-email-nunodasneves@linux.microsoft.com>
 <CAMvTesB5dCD5Cx+CE8oPQ35OHC+C=tyXbHQ0BNxSABEFVK53Tg@mail.gmail.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <CAMvTesB5dCD5Cx+CE8oPQ35OHC+C=tyXbHQ0BNxSABEFVK53Tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_131825_773601_87226B15 
X-CRM114-Status: GOOD (  10.90  )
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

On 3/10/2025 5:40 AM, Tianyu Lan wrote:
> On Thu, Feb 27, 2025 at 7:11 AM Nuno Das Neves
> <nunodasneves@linux.microsoft.com> wrote:
>>
>> A few additional definitions are required for the mshv driver code
>> (to follow). Introduce those here and clean up a little bit while
>> at it.
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
> 
> It may be better to unify data type u8, u16, u32, u64 or __u8, __u16,
> __u32, __u64 in the hvhdk.h.
> 
Agreed, this was an oversight. They should all be the kernel types
without the __ prefix.

Thanks
Nuno

> Others like good.
> 
> Reviewed-by: Tianyu Lan <tiala@microsoft.com>
> 


