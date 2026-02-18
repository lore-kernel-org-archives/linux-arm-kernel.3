Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80334E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCSq6UL82N8exS+qIirv0l8z88Hwa+9VP1VlBKuGCUo=; b=LYUFJG+/DGAyVjX8CpH1fQE4Yt
	GzhFt1ID56pxVKXRS48gt0cU8zmpOu3gAqhk2XdtM4hSC2p3u77RnlFWkppwnQaxuy+syYKKV/o2Q
	GdN0XRtkfIuPesUSfRy4Jk7vaJyah5C9ot1/QpWOPF0RSlzbbsfd+EAML/wier/fKl5IZ7jSoB96R
	Y5D1RElMgRu0JAxpHVsOGUqOGedPBvScYbxbB6MpTKsTAa6YdzW8slOWe0l5CdrEQx4HFAU2lEXCM
	mGxSrHB9DMQHokE/8Vp6RLuL0cIY60TAPe03yEuQOhHWUxm5cqhoZwj7qmo/yRBW+txrOGdsVIFlK
	LNiPoalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsl7a-0000000A9Lm-20cD;
	Wed, 18 Feb 2026 17:13:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsl7X-0000000A9LS-3gGT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 17:13:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A35A3339;
	Wed, 18 Feb 2026 09:13:44 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 659753F7F5;
	Wed, 18 Feb 2026 09:13:49 -0800 (PST)
Date: Wed, 18 Feb 2026 17:13:45 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: MAINTAINERS: Include resctrl MPAM driver
Message-ID: <aZXzSX7mR6do-xDB@arm.com>
References: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110240.159691-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aZXnbDZvzDnUKVoB@arm.com>
 <5e2f98c5-993b-417b-b27c-a683283d1587@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e2f98c5-993b-417b-b27c-a683283d1587@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_091351_980126_F52195CD 
X-CRM114-Status: GOOD (  21.14  )
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

On Wed, Feb 18, 2026 at 05:46:40PM +0100, Krzysztof Kozlowski wrote:
> On 18/02/2026 17:23, Catalin Marinas wrote:
> > On Mon, Feb 16, 2026 at 12:02:42PM +0100, Krzysztof Kozlowski wrote:
> >> No maintainers handling the code (so subsystem maintainers) are shown with
> >> scripts/get_maintainers.pl on MPAM drivers in drivers/resctrl/.  It
> >> seems that there is no dedicated subsystem for resctrl and existing
> >> drivers went through ARM64 port maintainers, so make that explicit to
> >> avoid patches being lost/ignored.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> ---
> >>  MAINTAINERS | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index faa914a5f34d..199058abc152 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -3822,6 +3822,8 @@ S:	Maintained
> >>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> >>  F:	Documentation/arch/arm64/
> >>  F:	arch/arm64/
> >> +F:	drivers/resctrl/*mpam_*
> >> +F:	include/linux/arm_mpam.h
> >>  F:	drivers/virt/coco/arm-cca-guest/
> >>  F:	drivers/virt/coco/pkvm-guest/
> >>  F:	tools/testing/selftests/arm64/
> > 
> > What's wrong with the current entry?
> 
> I explained in the commit msg:
> "No maintainers handling the code (so subsystem maintainers)"

Yeah, I realised what you meant after sending my reply ;).

> It does not list the maintainers picking up patches, so if you use
> standard tools (like b4, patman or scripted get_maintainers), you will
> never appear on To/Cc list (relying on git-fallback is wrong).

The arm64 maintainers won't proactively pick these patches up unless we
are asked by the MPAM maintainers. I don't mind whether the patches go
in via the arm64 or Greg's drivers tree. We just queued the first drop
as it touched arm64.

Let's see how it goes but I know little about MPAM, so just being on cc
won't make much difference. I rely on the current MPAM maintainers to
tell me what to merge.

Thanks.

-- 
Catalin

