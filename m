Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B992C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 04:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DvSI50HiKGef1YUibfVt0rtJdAcZaAM9wyDZdjj/cc=; b=iXGEYP/5DI3PFTOmVk+lPWh87H
	G4HdtbiTbjzbnFHYjpDBNNJ2LLN0IAkknfTiSGqTus9HHanEuDVwiknB3+njKvZTFMO4yML8LmGj0
	8Stjo06N+mumVZaisCKj1fj96cBt4UmaRZ8OxrFPCpiejccYbi0OIt+9cX6zOlVHEg06CrG8NUT8d
	fx1cnrJIb9E4QtuwtnmdHbc3VlgMAt/Ty8z5XE6Xy8wnCC/CiBsO20u0us97MdXAqk9fdisJMbL7u
	fcpsWduUc3OP+E6zMvlgYeJDao0UlscyiVAhfHQ9VgzxbNXCTr/H1hgk9sSs/YXSAPQ2+U1e+2XMD
	dN/jlEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukhN-00000007wzr-0yoP;
	Wed, 19 Mar 2025 04:06:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukfg-00000007wpX-0OC0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 04:04:49 +0000
Received: from [100.65.32.26] (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id 09A992025371;
	Tue, 18 Mar 2025 21:04:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 09A992025371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742357086;
	bh=8DvSI50HiKGef1YUibfVt0rtJdAcZaAM9wyDZdjj/cc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=soiaoN3dlB8MxzFcORFWIbRZnkKHKt4BMBHge5TVI1y9gc/QdP77qZfiMfqhrzHZ3
	 PmFFmJX6xvzUSe8sIEsoGEt0YLL2X1ypuzPaMtXIQnFwmPw6jLQekOOVfAGAke8dC3
	 HqlThwdykTRWA4Pm30QTnSqysPzOcw3BbmzPp8cQ=
Message-ID: <d1da11e5-519c-4b8c-bff8-c266d984a950@linux.microsoft.com>
Date: Tue, 18 Mar 2025 21:04:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, mhklinux@outlook.com, ltykernel@gmail.com,
 stanislav.kinsburskiy@gmail.com, linux-acpi@vger.kernel.org,
 jeff.johnson@oss.qualcomm.com, eahariha@linux.microsoft.com,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
 corbet@lwn.net
Subject: Re: [PATCH v6 09/10] hyperv: Add definitions for root partition
 driver to hv headers
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1741980536-3865-10-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1741980536-3865-10-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_210448_163274_A9920FBD 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On 3/14/2025 12:28 PM, Nuno Das Neves wrote:
> A few additional definitions are required for the mshv driver code
> (to follow). Introduce those here and clean up a little bit while
> at it.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
> Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> Reviewed-by: Tianyu Lan <tiala@microsoft.com>
> ---
>  include/hyperv/hvgdk_mini.h |  72 ++++++++++++++++++--
>  include/hyperv/hvhdk.h      | 132 ++++++++++++++++++++++++++++++++++--
>  include/hyperv/hvhdk_mini.h |  91 +++++++++++++++++++++++++
>  3 files changed, 284 insertions(+), 11 deletions(-)

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

