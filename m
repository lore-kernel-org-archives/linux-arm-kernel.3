Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D9EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkBsw0nlNKffF346uy8TG9H988zPUKGCrYeJMzVpF88=; b=ilkeRBfjcTUq6EIE5wk5bgaoWz
	FqMmycPtSqw6LVQ5Ooej0gulHt1RZ2J8+zzJXTvpoZLiNlCbruFMQKTZi6s2n27VtHjWpzz0vEr1b
	a5HZEBQpmvt3di14yR34pLTWG4bKxST46ocICPgG+Al85RVV/sHSzmv/HSxWr+zoGIqf+kKadvsd4
	Iji6dzfawDRqVC9VexfXdWrgQFGSe5O6bqoBhaxL9Q/Wu763BDjDWPviPmy0en3gs96nr1xTURNXu
	SoLqEOVwCljuPBhWPavkNdInIVE17bEg/e6/7xgYRmbMHyXFCjU7FitWL1hRwRfWw9r02YzzSJ2eJ
	M5849ZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnk9-0000000EFIW-266Q;
	Tue, 11 Aug 2026 14:46:20 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnk5-0000000EFI0-1mdq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:46:15 +0000
X-Forwarded-Encrypted: i=1; AHgh+RooL0Bi8r2UwiLV/rCZNFpSEeXv2E2SyR8h8C+1ABzErg0u4qO+I7k+ow/riOCCDwDJTI/DW+JPIaJpMuPHlqgg@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786459568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bkBsw0nlNKffF346uy8TG9H988zPUKGCrYeJMzVpF88=;
	b=ClW7kwPPsFdvWPR0w4rXuU1q71lk4ndY7trSLe1hh8OMP2bVZIqpR1brf562OPKwkL+Da/
	4/oGH6N6794BotkAwwLqd0ocejuCMM3YIePg0eXvbc7aWbcTgLbOCwtLDlhmPHVRJ1XP7N
	fetTQrSEfynLcXWoL4+xID50p66oIrc=
X-Gm-Message-State: AOJu0Yz9Ir8ysvkrv79SA74IuKEBryW/gu+ostZ00maAxP+Izn8jeHkp
	hmQ8ZfXR6Z9SVQ9wSedXI5V2ZNRVgE4c0jl1ESvCxl31FsIAkeheO2DeZx1Pi/UmTHT/u82UXx4
	vRnuepjd4wkVOh172VM3ig0BZpOaY4hn+lkOvNfgl
X-Received: by 2002:ac8:7fc5:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52d5805b682mr10634971cf.1.1786459525915; Tue, 11 Aug 2026
 07:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
 <20260804112317.1937387-2-fuad.tabba@linux.dev> <20260810183017.32db8b80@gandalf.local.home>
In-Reply-To: <20260810183017.32db8b80@gandalf.local.home>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 11 Aug 2026 16:44:48 +0200
X-Gmail-Original-Message-ID: <CA+EHjTxge9X+XyNPpJwrpK5wiO4cHRHJrCPMPgo0iZBXHSLPxQ@mail.gmail.com>
X-Gm-Features: AUfX_mxjTGmsQJDiPjF8-9rvIAUMM_O2scFaxYRWXLqNn62taG1aJ6Vh3ON23CE
Message-ID: <CA+EHjTxge9X+XyNPpJwrpK5wiO4cHRHJrCPMPgo0iZBXHSLPxQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] tracing: Include linux/types.h in trace_remote_event.h
To: Steven Rostedt <rostedt@goodmis.org>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, 
	mhiramat@kernel.org, alexandru.elisei@arm.com, vdonnefort@google.com, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_074613_609426_EAC41570 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Steve,

On Tue, 11 Aug 2026 at 00:30, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue,  4 Aug 2026 12:23:07 +0100
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> > trace_remote_event.h uses bool without including linux/types.h, so a
> > translation unit that includes it ahead of anything else that pulls
> > types.h in fails to build, as with nvhe/trace.h at EL2.
> >
> > Fixes: 072529158e60 ("tracing: Add events to trace remotes")
>
> Is there a config that already fails the build without this change? Or is
> it that new code will fail without it?
>
> If it is the former, please drop the fixes tag, as nothing is currently
> broken. If it is the latter, then sure, keep it, but you should mention
> what config options break with it.

I checked the include graph and tested by building with configurations
that could potentially fail. Nothing does. I dropped the fixes tag in
the branch I have based on kvmarm/next in case Oliver/Marc want to go
that route [1], or I'll respin it on the latest tag once kvmarm/next
has gone in to the next tag.

Cheers,
/fuad

[1] https://android-kvm.googlesource.com/linux/+/refs/heads/tabba/pkvm-hostva-kvmarm-next




>
> -- Steve
>
>
> > Acked-by: Steven Rostedt <rostedt@goodmis.org>
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  include/linux/trace_remote_event.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
> > index c8ae1e1f5e721..e4cc2d4497bcf 100644
> > --- a/include/linux/trace_remote_event.h
> > +++ b/include/linux/trace_remote_event.h
> > @@ -3,6 +3,8 @@
> >  #ifndef _LINUX_TRACE_REMOTE_EVENTS_H
> >  #define _LINUX_TRACE_REMOTE_EVENTS_H
> >
> > +#include <linux/types.h>
> > +
> >  struct trace_remote;
> >  struct trace_event_fields;
> >  struct trace_seq;
>

