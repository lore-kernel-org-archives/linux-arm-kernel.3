Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A579C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fsXY7GQhVKpp9JHHFcAytrsqL2EDApAYI7lPAx7EvQ=; b=SonE3VLbQmQfSJwJCt9AfJ70hn
	Z+a+OG0vFogYAiamI3u8FNWcb5kTp6oZiViAvnjPeFe0pFyPyfqu+p82xnO6rJxX8GrLX2GhW1nww
	Dpx5yA6SwSWK6AXuD2KMviP4m/zCT5a20udI/AMacdqp53JObLMSryKDkgk/yJP0VszlWyNLUo9Q2
	GDgH4IjLdwjoLYAZHt3sdgLfhq48XwUy6lvKI2bQOH7MSUVeg7dZpOPHrV9KE6tHAJHznRPcavk2Z
	tSRvuW8xC+8hcH6OX6+EEkHEoTNU0kYy5gmJhtHDhflepJdFHqEgxi+pXbznAMC0IFg8PATjBDf/Z
	OGuw/hTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUnC-00000009FDZ-0vte;
	Wed, 26 Mar 2025 17:43:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUlP-00000009Ee7-0knK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 959C05C68DA;
	Wed, 26 Mar 2025 17:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764B1C4CEE2;
	Wed, 26 Mar 2025 17:42:01 +0000 (UTC)
Date: Wed, 26 Mar 2025 13:42:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
Message-ID: <20250326134247.675f8d1c@gandalf.local.home>
In-Reply-To: <CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
	<CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
	<Z-NHugcLdLqkEHFR@arm.com>
	<CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
	<20250326124025.1966bf8a@gandalf.local.home>
	<CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
	<20250326131200.1c86c657@gandalf.local.home>
	<CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_104203_277396_8EE90442 
X-CRM114-Status: GOOD (  10.90  )
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

On Wed, 26 Mar 2025 10:25:22 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 26 Mar 2025 at 10:11, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > So it definitely goes through kernel.org.
> >
> > But it has no DKIM headers.  
> 
> Funky.
> 
> There's definitely something strange going on, because your *previous*
> email to me did have the DKIM signature:

That's because I had manually changed my "From:" from "rostedt@goodmis.org"
to "rostedt@kernel.org", which in my test emails, added the DKIM signatures.

-- Steve

