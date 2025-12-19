Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B95D767C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xs5RDT2yd8o6b47ThvW6mbwdxHHDocyNiDIU/w2rxTQ=; b=MOhSy0nlFFKEL34L3R3+Y9Ki2w
	VXVmk/DIMjFzt6iJEbe37N4t1X8ivH47tT9utMyHcswO/L5NXPtL6HvnFjVrHfpQzCfPwQPMcTUCY
	QiMfGjYYnHrVWhUPpr3LXrWX/U2l0tmcUrloUmwQb4PWeJD6MgyZsFSD2jO/aWEh80YUFvLmjvC6S
	7GvEp5BjrBv3+p6CpEhtX2EnEVDuGqadmWP9NbdRscVFFt+ciW4bhSVEVNGx045f2O9rTIBNl75Db
	kAUcM6pAMeIdw1RqqBFxq2BQmfaN80GhQmF90MyQWucdkE0Qudef48SZRWcqhNykzh5lyEbtH3iSL
	Pej/6b1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXcC-0000000A3t8-3tx8;
	Fri, 19 Dec 2025 10:21:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXcB-0000000A3t1-3gI0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 10:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xs5RDT2yd8o6b47ThvW6mbwdxHHDocyNiDIU/w2rxTQ=; b=BS223jir1/pPBmiHS6ggIn+RCp
	6f9GLZyQBmS8mzAS1QIUaWvriEyTxT0RJotu4R+DkG/eY9KA3kbW3D1QCLE9okEDhI+5tBF4xNpjf
	TQFLdnUaMNwAW6rRFZ4SdypYapvtkkYy/wswlFwjUqVOWeBXaVBtAdQDvqN4+YpRGlOilR2wBxzyH
	ZOXqJkMSAv1QPXBWpTrGzyXPfsn6W4JPNwDQZ2d+D98aJjwmrgHEicp0yxEW0P/XHmXzsb82HqUHz
	SRnsFDAnpIG3y8xDzcsKby+734N+ws/XuNzSiNUHS/Qotuq7R38bSkzk8K2KpKwOZXcA+WrCzlgVG
	v+mootEQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkf-0000000AZgO-3Ntd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:26:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF53DFEC;
	Fri, 19 Dec 2025 02:21:23 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55BAD3F5CA;
	Fri, 19 Dec 2025 02:21:27 -0800 (PST)
Date: Fri, 19 Dec 2025 10:21:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster
 funnel/replicator/tmc support
Message-ID: <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_092622_400320_68DC4C9F 
X-CRM114-Status: GOOD (  36.20  )
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

On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
> 
> 
> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
> > On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
> >> This patch series adds support for CoreSight components local to CPU clusters,
> >> including funnel, replicator, and TMC, which reside within CPU cluster power
> >> domains. These components require special handling due to power domain
> >> constraints.
> >>
> > 
> > Could you clarify why PSCI-based power domains associated with clusters in
> > domain-idle-states cannot address these requirements, given that PSCI CPU-idle
> > OSI mode was originally intended to support them? My understanding of this
> > patch series is that OSI mode is unable to do so, which, if accurate, appears
> > to be a flaw that should be corrected.
> 
> It is due to the particular characteristics of the CPU cluster power
> domain.Runtime PM for CPU devices works little different, it is mostly used
> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
> framework to manage the last CPU handling in cluster.

That is indeed the intended design. Could you clarify which specific
characteristics differentiate it here?

> It doesn’t really send IPI to wakeup CPU device (It don’t have
> .power_on/.power_off) callback implemented which gets invoked from
> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
> 

I am quite lost here. Why is it necessary to wake up the CPU? If I understand
correctly, all of this complexity is meant to ensure that the cluster power
domain is enabled before any of the funnel registers are accessed. Is that
correct?

If so, and if the cluster domains are already defined as the power domains for
these funnel devices, then they should be requested to power on automatically
before any register access occurs. Is that not the case?

What am I missing in this reasoning?

The only explanation I can see is that the firmware does not properly honor
power-domain requests coming directly from the OS. I believe that may be the
case, but I would be glad to be proven wrong.

> > 
> >> Unlike system-level CoreSight devices, these components share the CPU cluster's
> >> power domain. When the cluster enters low-power mode (LPM), their registers
> >> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
> >> out of LPM, making standard register access unreliable.
> >>
> > 
> > Are these devices the only ones on the system that are uniquely bound to
> > cluster-level power domains? If not, what additional devices share this
> > dependency so that we can understand how they are managed in comparison?
> > 
> 
> Yes, devices like ETM and TRBE also share this power domain and access constraint.
> Their drivers naturally handle enablement/disablement on the specific CPU they
> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).

I understand many things are possible to implement, but the key question
remains: why doesn’t the existing OSI mechanism - added specifically to cover
cases like this solve the problem today?

Especially on platforms with OSI enabled, what concrete limitation forces us
into this additional “wake-up” path instead of relying on OSI to manage the
dependency/power sequencing?

> >> To address this, the series introduces:
> >> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
> >>   device tree property.
> > 
> > Really, no please.
> > 
> 
> Our objective is to determine which CoreSight components are physically locate
> within the CPU cluster power domain.
>
> Would it be acceptable to derive this relationship from the existing
> power-domains binding?

In my opinion, this is not merely a possibility but an explicit expectation.

> For example, if a Funnel or Replicator node is linked to a power-domains
> entry that specifies a cpumask, the driver could recognize this shared
> dependency and automatically apply the appropriate cluster-aware behavior.
> 

Sure, but for the driver to use that information, we need clear explanation
for all the questions above. In short, why it is not working with the existing
PSCI domain idle support.

-- 
Regards,
Sudeep

