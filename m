Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FDDC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0ttO5P2Ur/op1weMXyR5i5M6LbGLyi8IjIkl4AKvpg=; b=0F5blrWiDyRLcrau1AchWSOejK
	FWISzeWSayVpMN27q3xD12Xvk4wnO3fAqs/VRmftN8qc1znnohTZiPFnHRmvS/6Ci9YuvqDHg9A5h
	c/hB6MVLQTOoAlOdWGlcjYDDIPSlAki0IHU5vNVcDlCWZvUZCQMsLguVT6fnzKWqXDc+uwg6ajz/e
	9KhbRmnBLcbEU4HJBEP/zP08AKeTV55awnoLbaNOgA44nUoPFBj6ZIMj5YRALU685ksCuMYtmd5nO
	l5nOxSSg6py6bHEpbYsAJsaWWovjrfJ7KnBTnfOBYdBXjbLhY5nS9GKYBUexWW0MZEJ/hws8bYEQW
	Olp6rvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryU2-00000005w93-3RTW;
	Thu, 06 Aug 2026 13:50:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryTz-00000005w7q-27cz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:50:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE7C153B;
	Thu,  6 Aug 2026 06:49:56 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EE583F632;
	Thu,  6 Aug 2026 06:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786024200; bh=epLWzxUfiA5aL15jgabZ/q+9v3m6Ub8S0+AOtqRLyX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAge2rDop+RauO+OyKNGJ4a+yVhi1X7W9hJb/BO+HGUrg3T4aAY6VgWFd8TJa+7nu
	 q5dGCpFjQx0S1+QWrwEg8wzywCscDhFXikwV7SfEcShLKE0yh0LMAN+rJ8BKB8+5G5
	 RSmlEduHR2y1yspfbL0mkmZqRkfE5uUSy7UZ6pzo=
Date: Thu, 6 Aug 2026 14:49:56 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: (subset) [PATCH v9 00/13] fix several inconsistencies with sysfs
 configuration in etmX
Message-ID: <anSRBAQyszgiSfpm@e129823.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <178602286291.39110.11955703681463115404.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178602286291.39110.11955703681463115404.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_065003_866628_DD4840E1 
X-CRM114-Status: GOOD (  16.45  )
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

On Thu, Aug 06, 2026 at 02:29:31PM +0100, Suzuki K Poulose wrote:
> 
> On Sat, 25 Jul 2026 12:36:32 +0100, Yeoreum Yun wrote:
> > The current ETMx configuration via sysfs can lead to the following
> > inconsistencies:
> > 
> >   - If a configuration is modified via sysfs while a perf session is
> >     active, the running configuration may differ between before
> >     a sched-out and after a subsequent sched-in.
> > 
> > [...]
> 
> Hi Levi,
> 
> I have applied the fixes from this series to coresight/next. I won't be able to
> pick up the rest without the Acks from Mike/Leo and it is too late for this
> pull request. So, will pick the rest in the next cycle. Apologies.
> 
> thanks!
> 
> [01/13] coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
>         https://git.kernel.org/coresight/c/be090fdfd4a6
> [02/13] coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
>         https://git.kernel.org/coresight/c/bfe75e265efe
> [03/13] coresight: etm4x: fix leaked trace id
>         https://git.kernel.org/coresight/c/177a963da47e
> [05/13] coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
>         https://git.kernel.org/coresight/c/a1b49a640b19
> [12/13] coresight: etm4x: remove redundant fields in etmv4_save_state
>         https://git.kernel.org/coresight/c/b335d4ae1c73
> 
> Best regards,

Thanks Suzuki!

@Leo and @Mike, Could you ack for the others please?

-- 
Sincerely,
Yeoreum Yun

