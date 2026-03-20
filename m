Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294EB109316E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 04:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foBX3yL9C+DXC/pnM3aoDcdzbobCZrcNGVU/C15rbQk=; b=mglwhvmFavm5oHnNRbjCQAkwD7
	AKIJcuqUYdb3dejEqXcLoRY2ekuA9IQf314wIrVY1Guvg4uJGiSt26sBXF1biZIcrE++HiR1jkBBW
	Lq7LACvAvzcdcf/vrOhcIAbBDYe5GS4qsKPWtos/x6ZrHgEuPdCRDs8tMdFKis1jPhvD6tBgWPdxF
	OKguEPXlnet5tbb1jSVrCQ2EP7SzdDExqeg/1DVs67G3ZUzolLBFfa09kD2tUjspf17Z2PULnpCPy
	OTE13T1yAqwzdlnQ1YLiMRxoVadE3OminkMIEzsUEjjV9LjPLGWmniqrge9l6IIBAkmas4+DuHutG
	Kjr/fWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3R53-0000000C2gX-0FAT;
	Fri, 20 Mar 2026 04:03:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3R50-0000000C2gA-3NWt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 04:03:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68B7342DDE;
	Fri, 20 Mar 2026 04:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC96C4CEF7;
	Fri, 20 Mar 2026 04:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773979401;
	bh=IUDbM6XDNCy70JrHMaCMZlbsJfOWSMReU8YJ0ni2Gxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iGa4FbGzWzh4tJV775M6Vt5Vlq4P38gQC4wzHQAUaeP4bhcBzNcxQ3+GQbHTMxtU6
	 sAmOxYGZHvxS8xmcGQBCQtbS5WSnj+cB001ll/jL4BUmP3Y2KrjOjB/MgbbnGMQWBx
	 fBJ0NitrjLq7XiJAglIS6ip+dF9m6bsaW/Q3OwajC+PSw3ivrlGBNM5rwPk06PatMG
	 g+Slil478Nys07G1GL0QcXhAQWg8pMXmcATwoWg2zSNEPta5FT1G/5sSArA9h8el8u
	 FSLoZB6XpecV7Oq46+oEgQufT5QVTNOCe5lTzdhLOiQd4d1PdG/f9YCZlao5kUnnX0
	 Xq1KVHy6Vv+Jg==
Date: Fri, 20 Mar 2026 13:03:16 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: oss@malat.biz, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, paulmck@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: arm64: pseudo NMI bootconfig question
Message-Id: <20260320130316.5be6fc45f7860d5ac44c4de1@kernel.org>
In-Reply-To: <abwTJBj80oX_T8xt@gmail.com>
References: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
	<20251113133403.308046d2df1c97ba7dcd2388@kernel.org>
	<wqzhgeu5vlkeuomajvy7vf3x4gf3fsnzmczmkswvjo7xdyzzbo@6uqjqftbzgot>
	<abwTJBj80oX_T8xt@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_210322_866631_BF4B5C79 
X-CRM114-Status: GOOD (  16.39  )
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

On Thu, 19 Mar 2026 08:20:27 -0700
Breno Leitao <leitao@debian.org> wrote:

> hello Masami,
> 
> On Thu, Nov 13, 2025 at 02:37:22AM -0800, Breno Leitao wrote:
> > On Thu, Nov 13, 2025 at 01:34:03PM +0900, Masami Hiramatsu wrote:
> >
> > Another possible solution would be to load bootconfig earlier in the
> > boot process so that early parameters can be defined within bootconfig.
> > Petr suggested this approach some time back, but it doesn't appear to
> > have made it upstream.
> >
> > https://lore.kernel.org/all/20231123194106.08f5832f558fe806b1fd8098@kernel.org/
> >
> > I'm not fully up to speed on the details of this change, so I want to
> > ask directly: Would Petr's approach—allowing early parameters to be set
> > via bootconfig make sense from a bootconfig design perspective?
> 
> Would it be worthwhile for me to take Petr's patch, update it to the
> current codebase, address any issues, and verify that it resolves the
> problem described above? If so, would you be open to reviewing and
> potentially accepting such a patch?

Hmm, let me recheck it. But the thread seems suspended.
Can you or Petr continue to work on this?

Thank you,

> 
> Thanks,
> --breno


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

