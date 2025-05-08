Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E0BC3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THye/5bYZmChcrIK5sf+eL/p6Zwm2qrg8ugJPhGCTaQ=; b=wrp5Vz+AQSG28quUR028bzcSQf
	izKdHf0YzOxlBq90jJ8/+DcYRLq/sRFaSv9PqoeFRr/5N/17WpyOFkK3p+rMThHk/g1Nd5CXRBGLc
	DjWjzBzT4xj2Q4/IM+C3O2LYQCgo1OGGMhrtHt2pYn2y1AAxdXvJAkQ/xLjhsu3Lcx093sSZ467K8
	zmqbOWFceOZ7v19jpVuw0TCeafbcxurzSCkLd5+QJz71LplO/DSYL5/nojc15OSzB3Y0RDrpfcrWg
	WgU+X+Mmm+DMB0mmmPixNa1vRrdGOAvCFRAiAcLMt98MLd0F7QnULj3LBlifXshiy/XXZlDGnWT08
	vsU6ogfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vW-00000001Mja-1q7N;
	Thu, 08 May 2025 17:20:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3XX-00000001CCA-1CfV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:52:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A9081E2F;
	Thu,  8 May 2025 08:51:49 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC5353F5A1;
	Thu,  8 May 2025 08:51:58 -0700 (PDT)
Date: Thu, 8 May 2025 16:51:55 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH 1/3] arm64: dts: fvp: Add CPU idle states for Rev C model
Message-ID: <20250508-manipulative-positive-fossa-27dff8@sudeepholla>
References: <20250508103225.354925-1-sudeep.holla@arm.com>
 <9183535a-2866-4fa5-9ed4-96695f0437ee@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9183535a-2866-4fa5-9ed4-96695f0437ee@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_085203_364378_0D5FBBAE 
X-CRM114-Status: GOOD (  22.45  )
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

Hi Ben,

Thanks for taking a look at this.

On Thu, May 08, 2025 at 02:25:19PM +0100, Ben Horgan wrote:
> Hi,
> 
> On 5/8/25 11:32, Sudeep Holla wrote:
> > Add CPU idle state definitions to the FVP Rev C device tree to enable
> > support for CPU lower power modes. This allows the system to properly
> > enter low power states during idle. It is disabled by default as it is
> > know to impact performance on the models.
> > 
> > Note that the power_state parameter(arm,psci-suspend-param) doesn't use
> > the Extended StateID format for compatibility reasons on FVP.
> > 
> > Tested on the FVP Rev C model with PSCI support enabled firmware.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >   arch/arm64/boot/dts/arm/fvp-base-revc.dts | 32 +++++++++++++++++++++++
> >   1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> > index 9e10d7a6b5a2..ff4e6f4d8797 100644
> > --- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> > +++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
> > @@ -44,6 +44,30 @@ cpus {
> >   		#address-cells = <2>;
> >   		#size-cells = <0>;
> > +		idle-states {
> > +			entry-method = "arm,psci";
> > +
> > +			CPU_SLEEP_0: cpu-sleep-0 {
> > +				compatible = "arm,idle-state";
> > +				local-timer-stop;
> > +				arm,psci-suspend-param = <0x0010000>;
> > +				entry-latency-us = <40>;
> > +				exit-latency-us = <100>;
> > +				min-residency-us = <150>;
> > +				status = "disabled";
> > +			};
> > +
> > +			CLUSTER_SLEEP_0: cluster-sleep-0 {
> > +				compatible = "arm,idle-state";
> > +				local-timer-stop;
> > +				arm,psci-suspend-param = <0x1010000>;
> > +				entry-latency-us = <500>;
> > +				exit-latency-us = <1000>;
> > +				min-residency-us = <2500>;
> > +				status = "disabled";
> > +			};
> > +		};
> Do we need a cpu-map so we know which cpus the cluster idle affects?

Generally we only infer the CPU topology information from cpu-map.
We can reuse the cluster idle state node with CPUs on 2 different
clusters if they both has similar characteristics as each CPUs carry
this information independent of each other. On new DSU style clusters
with 3 different types of cpus within a single cluster, each type may
have different idle state characteristics and may need different nodes
for both cpu and cluster level idle states.

In short, the term cluster used here doesn't mean anything specific and
may not co-relate to the CPU topology.

-- 
Regards,
Sudeep

