Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB03FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6NYNoH/2mZJW6j2yopFtsXyWHmoTZ7DD4GbZgS5oPk=; b=ZVU91ywMP+v/ApU0tq2UlTeLf5
	D1rerib2GOzvASFZk4Wxq6h48v6EXkHTZ19GG16DsoJ8yKFpucR3AL5bOU7gz5BLP14Bjv1XaBrAD
	7a5jpd7Ooo/+2cnm++l1S20Wd1k5U0Pujp2Pn+ADt2EpQTKZjzzWAp/pMCPp0ZTnMSCzEeiSfi02K
	KPiheqooT1nj2KSl2EnxysicyBxg2DUQ3Lexi/uuJ7MzUWUQ/5lM6jjEuKJsH26QnGvEzAm6jc/+P
	GZA6Bl3NCoga99bp6TUaabkjDwDn4PeswV6L6kf+RXb3Vg7pRn4yznrLhMqckbju+oZsLguF5uYGC
	s00KByUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6pD-0000000Crfs-2LaQ;
	Wed, 30 Apr 2025 12:46:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6nG-0000000CrMB-3JAw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:44:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D113106F;
	Wed, 30 Apr 2025 05:43:57 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 935FC3F673;
	Wed, 30 Apr 2025 05:44:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:43:55 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, johan@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBIbC15NiqUseZc7@pluto>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com>
 <aBHXHnXA95TwJths@pluto>
 <868qnhj2yf.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qnhj2yf.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_054406_869780_A4FA267D 
X-CRM114-Status: GOOD (  18.21  )
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

On Wed, Apr 30, 2025 at 12:36:40PM +0100, Marc Zyngier wrote:
> On Wed, 30 Apr 2025 08:54:06 +0100,
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> > 
> > On Tue, Apr 29, 2025 at 03:11:07PM +0100, Cristian Marussi wrote:
> > > Add a common framework to describe SCMI quirks and associate them with a
> > > specific platform or a specific set of SCMI firmware versions.
> > > 
> > > All the matching SCMI quirks will be enabled when the SCMI core stack
> > > probes and after all the needed SCMI firmware versioning information was
> > > retrieved using Base protocol.
> > > 
> > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > Hi
> > 
> > just a quick remarks that a bot spotted the usage of __VA_OPT__ which is
> > only available since GCC >= 8.0 :< ... so I will probably revert to use the
> > previous, less clean, mechanism to build the NULL terminated array in
> > which the compats array WILL HAVE to be explicitly NULL terminated when
> > provided (even the empty ones...)
> 
> See 20250407094116.1339199-1-arnd@kernel.org, which is slated for
> 6.16. The TL;DR is that GCC 8.1 and binutils 2.30 should be the
> minimal versions from 6.16 onwards.
> 
> So it's probably not worth using ugly hacks that will eventually be
> reverted.

Great news, thanks for the heads-up !

Thanks,
Cristian

