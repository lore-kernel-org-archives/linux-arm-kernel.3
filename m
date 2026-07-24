Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D631DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGPPJHzrnAomcUNucnHVbPgBtZVy7uagHIXI3mTUEGI=; b=cwzYIu2BB0Wm+bmce1FUpmcq1b
	tK9ehDKxJklgAK89kG737CYm6vxkMXP3vtcVSJHBqtjvIBWkp/6P8IBC2KeYtRZcLyVo5CK9RLT1f
	Z/6O6A9xFri0F8kbQD6hUBToMUAwr9kYQtQ4qG21L1SiRn5fH8QLhRGmDwYkmO/xlXFleDz5rH/Az
	qTiEPJu5PGnYUPnuFvt+kNE5Vt51eb3qRJ6VFggGJX8O2KL/O2h+mIT1h0++2Frxgy8qBhU+v+maA
	last9IEEondAqxSTJDZp9J/P3bAqhlRSR95SjeqrZ7Elv7tNcerLbF34XL0BTv7T1IFees2g5S2K5
	8CTqtMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDqA-0000000GGDg-3ypY;
	Fri, 24 Jul 2026 11:13:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDq9-0000000GGDA-3REi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 11:13:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49C00600AD;
	Fri, 24 Jul 2026 11:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA53C1F01833;
	Fri, 24 Jul 2026 11:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784891597;
	bh=mGPPJHzrnAomcUNucnHVbPgBtZVy7uagHIXI3mTUEGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=csD0TrBVL5HpThSUes+OxIsvA5EcozPEOO5rKW+RUYd6yOYaZDjNFwJzhhXVWlBHV
	 FQ3cKUV0WlOW+ff3tSjCZ7fGfn6D6kuSEAB5KUoFAfRuHFw/PcPOEdyAWIIc0h1Bun
	 nQAryAF7wY69u4BiinA9qCCMC1eu21a8rj5cYbLwC7RV7bxJQQhPlIbuL7A06Z+oOV
	 +Jw7B8dd1Tel1h5p2OVgO8DnQXT/5U3YYB4PfwYs12D516E6oNDCQSSN27ybWo+/p8
	 SWGjmcjHwlMVWa2/wYJNDufsiAivIXmXZTr3/cmKQ3jn/mIJuN/OscNghmzwwyLVVi
	 VfaZW2Hr6fcrg==
Date: Fri, 24 Jul 2026 12:13:08 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, ptsm@linux.microsoft.com,
	radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v3 1/3] firmware: xilinx: Add support to clear TF-A PM
 state
Message-ID: <20260724-stirring-bloodhound-of-sufficiency-5bedff@sudeepholla>
References: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
 <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
 <20260724101948.2895263-2-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724101948.2895263-2-jay.buddhabhatti@amd.com>
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

On Fri, Jul 24, 2026 at 03:19:46AM -0700, Jay Buddhabhatti wrote:
> Currently, during a kexec restart, only the kernel is reloaded, while the
> TF-A specific data remain unchanged. This leads to a mismatch between the
> kernel state and the TF-A firmware state like SGI number and shutdown
> scope variable.
> 

Avoid using TF-A in general as it can be any other firmware as well.
You can always generalise as PSCI or EL3 firmware.

> For example, the kernel registers an SGI number with TF-A so that TF-A can
> notify the kernel of events via that SGI. TF-A stores this SGI number in
> its internal state. After a kexec, the newly loaded kernel re-registers
> and may request a different SGI number, but the stale value programmed in
> TF-A remains, so event notifications are delivered on the old SGI and are
> missed by the new kernel. The shutdown scope variable has a similar stale
> state problem.
>

Doesn't it reset it every time CPU_OFF or CPU_ON is called ?

> To resolve this, the TF_A_CLEAR_PM_STATE PM API is introduced to clear
> TF-A-specific state during kexec. On a graceful reboot, this API is
> triggered by zynqmp_firmware_shutdown(), while in a crash kernel scenario,
> it is invoked by zynqmp_firmware_probe() in the reloaded kernel.
> 

I don't see the need for such an API just for kexec needs. You must deal
with it as part of CPU_ON as it should start with clean slate as SGIs are
per CPU, no ?

-- 
Regards,
Sudeep

