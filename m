Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B5CC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGrOC/XiAePdkHPcaVqR+iDjUYY41tL4s/VCv9UHlgI=; b=e2kLE1EI3LddN/01+IyTWX0pZ4
	5Y4Xr+o6m8A0bu/SkdiBGPCOoodF0UFlsHgq9GvBmdByzm5bpCdgqdzw5JjrTZweHsfH7livs5+e+
	ojQPQqqN4okA2s5iX/flq3VhjiL0YcPEbz98cPSAxq8pi+U8bKWscbvYDT6o8sAEx9RSEU/4uvehv
	HgPpuUyogWrWOy5byY/eaiAs9n14d876OQJmwc12Y3jlD6gWFJdAobnFkMvmdgMt+m1gOlC3UKScw
	usnEP0y0deERTMHUWiZPCAMdsb3IQoZobTPWxkVzNLtKQYEzP/llwk62wMXWmUz+CTRWclyo3WVk/
	yqDGlILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vg-00000001Mt3-1sQC;
	Thu, 08 May 2025 17:21:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3rt-00000001FX1-3UlA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 16:13:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D65091E2F;
	Thu,  8 May 2025 09:12:54 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 382533F5A1;
	Thu,  8 May 2025 09:13:04 -0700 (PDT)
Date: Thu, 8 May 2025 17:13:01 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 1/3] arm64: dts: fvp: Add CPU idle states for Rev C model
Message-ID: <20250508-gregarious-marvellous-axolotl-b3fbe7@sudeepholla>
References: <20250508103225.354925-1-sudeep.holla@arm.com>
 <20250508160920.GF177796@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508160920.GF177796@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_091305_914609_7E6A106D 
X-CRM114-Status: GOOD (  18.12  )
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

On Thu, May 08, 2025 at 05:09:20PM +0100, Leo Yan wrote:
> Hi Sudeep,
> 
> On Thu, May 08, 2025 at 11:32:23AM +0100, Sudeep Holla wrote:
> > Add CPU idle state definitions to the FVP Rev C device tree to enable
> > support for CPU lower power modes. This allows the system to properly
> > enter low power states during idle. It is disabled by default as it is
> > know to impact performance on the models.
> > 
> > Note that the power_state parameter(arm,psci-suspend-param) doesn't use
> > the Extended StateID format for compatibility reasons on FVP.
> > 
> > Tested on the FVP Rev C model with PSCI support enabled firmware.
> 
> I verified this series and confirmed the CPUIdle states work well (I
> manually removed the status = "disabled" in idle state nodes).
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> 
> Just a nitpick, we should firstly add the timer node and then add the
> idle state nodes, as CPUIdle is dependent on broadcast timer.
> 
> As the idle states are disabled by default, current patch ordering
> would be fine as well.
>

Good point, I will reverse the order when applying. Thanks for the testing.

-- 
Regards,
Sudeep

