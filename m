Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706AAD74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK6NofuHZ8QmsFtcB43z2kevyKw0Ry2FdXYYQNoTprI=; b=xzjoafduU8ShU3nXTzXHD6rLZz
	VaVjjvjqRGb8KcHQWNjLGWOF0JGwA3fnFxwL/6DRh7joeEeaqemqB7LG8Nymev+Tg4/GzoOKZDDV7
	JNR8pHDMVkQvewIm22K2cKh42vL0JEgbtC+zUG+giBo3C0ebGlf8pRtcaIWaB12o5wYgd88JfxzPH
	+eVSNdB8/NifRQLEhLA1vTldpre/QETE0Gf3r7jjsaXLB6tHFl2F6UYqZBngAkFN9PMwEy+Dr5kUA
	+GFTK1IBfwOQNYCz0O0CJvVi0ELPF3ORjhfowJvyH0eCkqcpwjZVbKVPegFQYQjQNsCtwDTvzJ13C
	CNH/IpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXO4-0000000A149-2mtY;
	Fri, 19 Dec 2025 10:07:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXO2-0000000A13Y-0x3d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:07:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44F8CFEC;
	Fri, 19 Dec 2025 02:06:52 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F7E3F5CA;
	Fri, 19 Dec 2025 02:06:55 -0800 (PST)
Date: Fri, 19 Dec 2025 10:06:52 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, <kernel@oss.qualcomm.com>,
	<coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <maulik.shah@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster
 funnel/replicator/tmc support
Message-ID: <20251219-rugged-hamster-of-force-63bdc6@sudeepholla>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
 <8cb8fad9-c54e-43a3-a769-5452119cc2a1@oss.qualcomm.com>
 <3d4dd3d0-fca0-45ac-a833-e8f7f5d1aa95@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d4dd3d0-fca0-45ac-a833-e8f7f5d1aa95@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020702_310103_0F7EA456 
X-CRM114-Status: GOOD (  22.69  )
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

On Thu, Dec 18, 2025 at 05:04:07PM +0000, Suzuki K Poulose wrote:
> On 18/12/2025 16:18, yuanfang zhang wrote:
> > 
> > On 12/18/2025 5:32 PM, Suzuki K Poulose wrote:
> > > Cc: Sudeep
> > > 
> > > On 18/12/2025 08:09, Yuanfang Zhang wrote:
> > > > This patch series adds support for CoreSight components local to CPU clusters,
> > > > including funnel, replicator, and TMC, which reside within CPU cluster power
> > > > domains. These components require special handling due to power domain
> > > > constraints.
> > > > 
> > > > Unlike system-level CoreSight devices, these components share the CPU cluster's
> > > > power domain. When the cluster enters low-power mode (LPM), their registers
> > > > become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
> > > > out of LPM, making standard register access unreliable.
> > > 
> > > Why ? AFAIU, we have ways to tie the power-domain to that of the cluster
> > > and that can auto-magically keep the cluster power ON as long as you
> > > want to use them.
> > > 
> > > Suzuki
> > > 
> > Hi Suzuki
> > 
> > Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
> > CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
> > cluster.
> > It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
> > implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
> > the upstream Kernel.
> 
> Why does it need to wake up the CPU ? The firmware can power up the
> cluster right? Anyways, to me this all looks like working around a
> firmware issue. I will let you sort this out with Sudeep's response
> , as I am not an expert on the cluster powermanagement and standards.
> 

Indeed smells like a some workaround, will respond in another email in the
thread to capture other points as well.

-- 
Regards,
Sudeep

