Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED01C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZP1hGg+vIIZLmINM9b5Wbzal6moErgQ6R3p9ljUzhvk=; b=24GmBBMwcLZWrWboPa3UMfOeFX
	HTFRJKuzOTeKRH6rejrIS4Djt3DK5bIVsSN8EwRzwhEsfLXKNuG+dQukcXjkotIDxY4Czr2s7Dn2F
	5bwd08eebVOTeRBJohT+4H4v2utP0x/UmF05LEc5SecOciDj1q7Wxm0PCAd6DlM66a9skuWHTtYiA
	B8lcm1MI3eYUOvZbvC7XWaZXRFk5cBlMaO1Sy8S43ERbFgvESDChJOfd+I97wVtYsZXSqW6wdhtdC
	wCr+K6k9FU1NV0AWwc76UGKOSWziC4oO3iMdN8Duljvs0qM7xHr5vWQzd/HivAAj54hlJHIbJrYoI
	UB6h+S6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMS9-0000000HPbg-32r2;
	Thu, 16 Jul 2026 13:48:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMS9-0000000HPbU-0AZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:48:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5ED3D61380;
	Thu, 16 Jul 2026 13:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329CC1F00A3E;
	Thu, 16 Jul 2026 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784209720;
	bh=ZP1hGg+vIIZLmINM9b5Wbzal6moErgQ6R3p9ljUzhvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AXiT7EYBGUtAKPQIsEDZ3yvYdsWbEUSJsTlzGYcte/DG9sd0byPCX6P767Ymd5JMG
	 RZAyhktYoUNzuvjLtSD6q7T+cumPyGtDJe6fd44aKCihfdpLbiZU21WpnS59luW0RJ
	 aMe5OvMQMIT/TFTqHQxaa98hYF6ENwQKq5cxziDeqEsIhlDTLPc3+ldNUdzeoPs3Io
	 QyEBCIlAAUD+TLd5AWFS98qakpIFy1SHA5RJdLoptcQBHFFP3kz1D/gEtnM7KhtB3s
	 fuuHwP7+267C4fuo1R5aLaenRO69ZC43UZx/+LG0md/JVlm0u2ZqFdtMf7Bn1lq/ar
	 d6Xo0HLg3+2gw==
Date: Thu, 16 Jul 2026 14:48:34 +0100
From: Will Deacon <will@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: "james.morse@arm.com" <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [GIT PULL] arm_mpam fixes for v7.2-rc2
Message-ID: <aljhMiv9j1Ae8-yo@willie-the-truck>
References: <1d22f80d-34c0-4e8f-a9a7-3c527fb97232@arm.com>
 <d39e20fe-e4ab-4bbb-8e97-b68400ece11a@arm.com>
 <aleEkbcWsYdZPgtW@willie-the-truck>
 <7119d552-f686-4467-a572-11d1616b4c79@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7119d552-f686-4467-a572-11d1616b4c79@arm.com>
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

On Wed, Jul 15, 2026 at 02:10:11PM +0100, Ben Horgan wrote:
> On 7/15/26 14:01, Will Deacon wrote:
> > On Thu, Jul 09, 2026 at 05:23:38PM +0100, Ben Horgan wrote:
> >> On 7/9/26 16:48, Ben Horgan wrote:
> >>> I hope this method works for sending you MPAM changes but please let me know if
> >>> you would like them some other way or I've made a mistake. It's not a signed tag
> >>> as I still need to sort out my GPG key. The change authored by be me hasn't got
> >>> an Reviewed-by's or Tested-by's but it's been on the list since the middle of
> >>> May and James is on leave.
> >>>
> >>> Fix the reset values for two MPAM controls that are not known to exist in
> >>> silicon. Fix a NULL pointer dereference on the driver teardown path.
> >>>
> >> Sorry, this is a retake. I forgot to add my Sob on the patches.
> >>
> >> The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:
> >>
> >>   Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)
> >>
> >> are available in the Git repository at:
> >>
> >>   git@git.gitlab.arm.com:linux-arm/linux-bh.git tags/mpam-fixes-7.2-rc2-RETAKE
> > 
> > Thanks, but I'll probably just pick these from the list given that your
> > key isn't sorted out yet.
> 
> Ok, thank you, is there anything that you need from me for this iteration?

Please just yell if you get any critical fixes come in. Otherwise, I'm
assuming you'll send a series around -rc5 with the MPAM updates for 7.3?

Cheers,

Will

