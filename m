Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AACCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2jplSy+GXzRtjpLj2FMjFCvQnOkaUadlSDAvtA9n7s=; b=tVCAu01P4mJfvc6PMd+0dA5Vlq
	7j/HCndvcjfnu9prZrm9/WqHywNag0Dlo6nB1Xsgdo/4fbtJle1azZenFJKaITlMDMFBdrF2N87wk
	EUB+5NlASOxxMRJEo8WNt6wMu7mAsc6deR3cupYRTRIVUcdxYoJ6pP7Qi5qW8bc8KGGLosuod6ean
	O1kwqz4KyTCq5O9Zia+GN5NQRGJRfVI2ILh2szHIIEOAwRFR7imwqINAidQpQX/WYNoz0veSBeIXw
	wxDZjQoxkkvvFPI3VniZs+3q4kt6DzUsVFrWsHUI5NCvKsCCwF7b4XaVp2q8hLcz5zdURyTZtLmVQ
	Tmw+9evg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Ne-00000004RuM-44kk;
	Thu, 07 May 2026 17:19:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Nc-00000004Rth-1LX1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 17:19:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAFB420E3;
	Thu,  7 May 2026 10:19:11 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0823FAF5;
	Thu,  7 May 2026 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778174357; bh=5AaAEGg9g3NJNH7UN+sDLT8EHx2QlLDXaLy/XBCBomo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XI+exdVtowhbI4AlhwR+MK1JXvhUMm7/38ERor3uTi69slZuzhlwkoQ2H8w/Qmcrc
	 gGGXFwnJvWHoJnwzNMGnYWm7ka4culfzOX2wAe/f7VyBRL4akrZ3dbR1caV+FB4efE
	 AWa6n2kiFecItiEgaGoPcMdHDsHqiomH2KBjkA5s=
Message-ID: <affdf7a3-d864-48aa-948f-81b55e0d41cd@arm.com>
Date: Thu, 7 May 2026 18:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm_mpam: NRDY fixes
To: Ben Horgan <ben.horgan@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com, dave.martin@arm.com,
 andre.przywara@arm.com,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
References: <20260507152814.4056413-1-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260507152814.4056413-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_101920_562663_7C5A53BE 
X-CRM114-Status: GOOD (  11.36  )
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

(CC: +Catalin, and the arm list - as this is the route the original code went)

On 07/05/2026 16:28, Ben Horgan wrote:
> The detection of whether or not NRDY is hardware or software managed is
> unreliable. Fix this a bit but don't rely on it.
> 
> Based on v7.1-rc2
> 
> Ben Horgan (3):
>   arm_mpam: Fix monitor instance selection when checking for hardware
>     NRDY
>   arm_mpam: Pretend that NRDY is always hardware managed
>   arm_mpam: Improve check for whether or not NRDY is hardware managed
> 
>  drivers/resctrl/mpam_devices.c  | 68 ++++++++++++++-------------------
>  drivers/resctrl/mpam_internal.h |  2 -
>  2 files changed, 29 insertions(+), 41 deletions(-)
> 

For the series:
Reviewed-by: James Morse <james.morse@arm.com>

Catalin, could you pick this up for rc3?

There is another series of fixes that touches cpufeature to add v0.1 MPAM support.
I'm testing testing that before reposting it.


Thanks,

James

