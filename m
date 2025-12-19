Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A024D767C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hc4cCfvyZ8lzU3yVWHZtcS4GsHL+KhTlZbsRHodaNG0=; b=oGvkKNP00HwAS8vHjyz6fDUUkf
	/bogM0E4WrZgi5DcTk4x18zrlwGJFd9w+Kc/mPWFMeGFg28d3ItZ6t2pUD098z0ms412oc1ksOexA
	6mOrcxEBWM34qqrYeEn7LuyYPQAZbun/0zBwE1IptZcz4gQHBlmdAA5WloxU7D/IHie4wGIlBUK0k
	bDO2C0b09UgssJFqKHOnEGFcXDAYDFINiNk3aRM3G76A3oFRYD1tRjuy0LAaYRBL6iqhQ8h947w4Y
	PsvI7gHaJKvBD2AbCujZbT+pd1G8hPEMbfON7AgSVc1y/BwSMO0fuCynoUQHNKe43iFJDpOjUC9wl
	HAETsQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXmu-0000000A4v7-3HDH;
	Fri, 19 Dec 2025 10:32:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXms-0000000A4u8-0rk6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:32:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B34AFEC;
	Fri, 19 Dec 2025 02:32:34 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14C353F5CA;
	Fri, 19 Dec 2025 02:32:38 -0800 (PST)
Date: Fri, 19 Dec 2025 10:32:36 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<mark.rutland@arm.com>, <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	<vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 0/5] Arm LFA: Improvements and interrupt support
Message-ID: <20251219-visionary-hissing-sidewinder-5e95c5@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251209-miniature-curassow-of-energy-b6a303@sudeepholla>
 <8bca8c4b-52b8-4a1d-9f21-176c994a58bb@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bca8c4b-52b8-4a1d-9f21-176c994a58bb@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_023242_368012_71DCA106 
X-CRM114-Status: GOOD (  30.08  )
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

On Fri, Dec 19, 2025 at 12:38:39AM -0800, Vedashree Vidwans wrote:
> 
> 
> On 12/9/25 03:39, Sudeep Holla wrote:
> > On Mon, Dec 08, 2025 at 10:13:10PM +0000, Vedashree Vidwans wrote:
> > > Hello,
> > > 
> > > The patches update the proposed Arm Live Firmware Activation (LFA)
> > > kernel driver [1] to incorporate review feedback [2] and refine the
> > > activation flow while remaining aligned with the LFA specification
> > > DEN0147 [3] and the SMCCC 1.2 calling convention. The series keeps
> > > the existing functionality but restructures and extends it to improve
> > > robustness, reviewability, and future extensibility.​
> > > 
> > > The SMCCC usage in the driver is updated to consistently use the
> > > SMCCC 1.2 register-based calling convention, consolidating arguments
> > > and results into a single struct to reduce stack usage and simplify
> > > the SMC interface. The patches also split the original changes into
> > > focused pieces and document the device node bindings in the commit
> > > messages, making it easier to follow and validate the implementation
> > > against the specification.​
> > > 
> > > The kernel driver is registered as a platform driver in accordence to
> > > the LFA device defined by the specification [3]. The driver now extends
> > > interface for interrupt-based enablement of LFA. During LFA, the
> > > interrupt
> > > thread refreshes firmware component details after each activation step
> > > and iterates over all activable components until no further activation
> > > is pending, matching the spec’s allowance for component detail changes
> > > after activation. This ensures that sysfs exposure of LFA components
> > > remains consistent with the authoritative information provided by the
> > > secure firmware.​
> > > 
> > > The handling of CPU rendezvous is adjusted so that the kernel now
> > > honors the rendezvous policy chosen by the firmware, instead of
> > > unconditionally forcing a rendezvous. This reflects experience with
> > > existing firmware deployments where mandatory rendezvous is not
> > > required, while still allowing the firmware to request it when
> > > needed.​
> > > 
> > > Thank you,
> > > Veda
> > > 
> > > [1] https://lore.kernel.org/lkml/20250926123145.268728-1-salman.nabi@arm.com/
> > > [2] https://lkml.org/lkml/2025/10/8/980
> > > [3] https://developer.arm.com/documentation/den0147/latest/
> > > 
> > > Vedashree Vidwans (5):
> > >    firmware: smccc: LFA: use smcc 1.2
> > >    firmware: smccc: LFA: refactor
> > >    firmware: smccc: add timeout, touch wdt
> > >    firmware: smccc: register as platform driver
> > >    firmware: smccc: lfa: refresh fw details
> > > 
> > >   drivers/firmware/smccc/Kconfig  |   3 +-
> > >   drivers/firmware/smccc/lfa_fw.c | 478 +++++++++++++++++++++++++-------
> > 
> > Same comment as before[1], looks like the feedback got ignored or missed.
> > 
> > -- 
> > Regards,
> > Sudeep
> > 
> > [1]https://lore.kernel.org/all/20251009-calculating-glorious-oriole-ceccf6@sudeepholla
> 
> Thank you for your comment.
> I did include DT binding in commit message of the patch. Please let me know
> if there's anything else I can elaborate.
> 

Sure. I meant I don't see any patch titled "dt-bindings: firmware: Add LFA...."
or something similar. I also checked the delta for the files under
Documentation/devicetree/bindings/ to rule out the possibility that the
patch title may not be following the DT binding upstreaming process.

-- 
Regards,
Sudeep

