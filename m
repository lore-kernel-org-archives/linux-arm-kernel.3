Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A93CCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JruC8k6kLzC2UYU4kmBoov1a18EmnFpopVAih4awSiM=; b=GhYkDDXHGekrRPDVicechV/Ef8
	iWC/4D/5VOTTsngppVMiXVv0/XFPSh0M0uKl1lgHk6/oHBVHtg38U/XeBDOd2OUPLBNtKUu/dVzHh
	BTZUibtf9zbijU9yQCXWxTGJ3lofsRj0e1xxyLBNfRPncHOV48PFQINS1CpTTOR724ZSihMVQKrOV
	QzVO0fK4f5bA9s5t6cMdkLGxfAoioK5Ofmgt0qr0+GMrWbeNOiBgWdlUwNDI3EH1F/WqJREHxtZsn
	UlFpigGI1SbdN+mFAuYoYMtrwRmh+JGKhVExHMRASL/+AsjWnuCHew0hw4Mz8cYd0lLHB4EAXJ6Tb
	bj8k7y0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsLR-000000058W9-0atO;
	Tue, 09 Jun 2026 09:02:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsLP-000000058Vi-1TmJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:01:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74A1E601E6;
	Tue,  9 Jun 2026 09:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C474D1F00899;
	Tue,  9 Jun 2026 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780995718;
	bh=JruC8k6kLzC2UYU4kmBoov1a18EmnFpopVAih4awSiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RC58WY+rqdjh3dLlpwNlPoxtSJuHf+z7jk57rPAF0YLT+rrxsw8XKgEKJdAkasjgj
	 91nYPFbrldPB7igJfG38kNG1qV2p0K3S01InxlL+bDxABh38CmVIYgUWVouRFHO4Mx
	 W9X07mfgbW+ekmVm4cBDDN572yxYBJdE677Zx56XZaOhjTaGKSnHO15vLJ0kgin40d
	 9z1ZQr1V6AnCV9wB2oSHmlJCzUJizdHqZFhbFGigc+meQQQ+OeRUfrIl1tZwM1cqoP
	 QMg31Q1xSejdXYm9VeWdpLN+iicjUdX6uoWVHw52XCG/xZ6Jr58JLF6GarzyuoJy7e
	 RNjxnN+lgkcbw==
Date: Tue, 9 Jun 2026 10:01:54 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	guomin_chen@sina.com, linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com, quic_xinqzhan@quicinc.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org>
 <aibzLcZiVwtUHAgV@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibzLcZiVwtUHAgV@pluto>
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

On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:
> On Mon, Jun 08, 2026 at 04:51:03PM +0200, Daniel Lezcano wrote:
> > On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
> > > Emit proper MODALIAS uevents when SCMI devices are created and make sure
> > > all the standard protocol devices are requested when the bus is
> > > initialized.
> > > 
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > ---
> > 
> > Hi Cristian,
> > 
> 
> Hi Daniel,
> 
> nice to hear from you in the SCMI land :P
> 
> > what is the status of this patch ?
> 
> ....I'd say forgotten/abandoned...I worked on that a bit when I realized
> only part of the stack was autoloaded...then it did NOT received much
> love and then I forgot it....buried by other prios....
> 
> Indeed I have still the local branch...but after a quick check I think
> is the same as the RFC posted.
> 
> bbd14b0f7733 firmware: arm_scmi: Add bus support for autoloading
> 8d982393b505 firmware: arm_scmi: Generate aliases for SCMI modules
> 383c127faa97 (scmi_vendors_autoload_V2) firmware: arm_scmi: Add aliases to transport modules
> 00caa894bce2 firmware: arm_scmi: Add module aliases to i.MX vendor protocols
> d900620c46bb firmware: arm_scmi: Support vendor protocol modules autoloading
> 4fe57bbeb6dc firmware: arm_scmi: Allow transport properties for multiple instances
> ad236e5a7f01 Linux 6.13-rc1
> 
> ...where scmi_vendors_autoload_V2 is merged already...
> 
> Thoughts ? Plans ?
> 

Just repost as non-rfc after next merge window and we will see if there is
much interest to get it merged for the following one and take it from there.

-- 
Regards,
Sudeep

