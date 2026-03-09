Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1519EFCD80
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9rlpwf6dx7cMv0lMHIDO1EgeLcruGmo4Mkd0kolmJQ=; b=GA+m+H1960h1eXlful0ZQYNuY8
	RVwFrbiwBKhutH/Anxq2TCAE4J67l/c+EcGMfxwlyLDYNDr65l91UHhHZkSTiHt3DXoAXbJ0XXciB
	ohtyXyagQ0zg/3TJa1c+NgJ3nQ6pqa6gRixYjd48g4bXTTLyHikm3ApZMEI7O/drUhYbLj4Edkavg
	CARG6B5EmqzD0Max4LykV3A8duXSYt+F6EWDpb8EIGr8yH5z4giZ9SIjcwozrLNe4iNsALlLtrJEJ
	RjLcpaonIn8Otdz3dSj5TC4t6yzE31eeqQOQqp4CDdJc4Isdv3P5O4FoCOmPL5MycnO44kGo2roqH
	nKUocyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXoh-0000000759M-2pdo;
	Mon, 09 Mar 2026 10:26:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXoe-0000000758z-3glU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 038F54404D;
	Mon,  9 Mar 2026 10:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7883C4CEF7;
	Mon,  9 Mar 2026 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773051983;
	bh=uA3WpUSSabz5uS2JHGrLH5pFgNTVd2X+Xg/70x/ta6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLIDEp2PXEgWTfAUAH+yS1GySAYdz7iq7q5HCI6+SdRTQ2vKmvv88or9n7FEdbDdq
	 uxcMXbF1uQlnnNA88UdvqmX2VbM89Viyg0iMbz+qy+T3sEgZF/i6n3SANosHdpoJK5
	 MY+j79H43w1JttiybYWMBsXkKnPgjFuljACJ8BHFPggmjkius3pj2ZkK99pOwsGQXu
	 mWq364s8MoJTQWZfhJTRv3VEBPEm5GtZ+xtq92vgTapL+GtECpyyeaRtrqWGQ0GU6T
	 96Ufks2bRgs6BK7ZT67xmVG88JW0tPh/RPAJu/kvclIrTc/FswIjGBvWqGx11LOUvP
	 lnVooEdFvIvLQ==
Date: Mon, 9 Mar 2026 10:26:20 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/,
 s/currenly/currently/
Message-ID: <20260309-fierce-pastoral-otter-bdf2df@sudeepholla>
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
 <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
 <20260309-bold-space-ibis-fbff63@sudeepholla>
 <20260309-frisky-proficient-gecko-b8d7be@sudeepholla>
 <CAMuHMdUkJzSLiAO4cwCFSFg73q9hCYQ0fCM5_HEdwKxxgP8aoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUkJzSLiAO4cwCFSFg73q9hCYQ0fCM5_HEdwKxxgP8aoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_032624_958549_2BF474E1 
X-CRM114-Status: GOOD (  27.64  )
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

On Mon, Mar 09, 2026 at 10:53:27AM +0100, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Mon, 9 Mar 2026 at 10:38, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > On Mon, Mar 09, 2026 at 09:29:29AM +0000, Sudeep Holla wrote:
> > > On Mon, Mar 09, 2026 at 09:16:29AM +0100, Geert Uytterhoeven wrote:
> > > > BTW, I noticed some of your commits use the non-standard
> > > > "Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
> > > > with the lore.kernel.org instead of the recommended patch.msgid.link
> > > > domain) to record the origin of patches.  Do you have different git
> > > > setups on different machines?
> > >
> > > Not really. I used to use "Link:" and switched to "Message-Id" a while ago.
> > > I use only one setup and if you are observing something like above, I am
> > > doing something different. I need to check what is that, but the intention
> > > is to use "Message-Id". Let me have a look.
> >
> > OK, did a quick check and see last time I used "Link:" was an year ago and
> > that's when I saw some discussions about use of "Link:" for other purposes and
> > switched to "Message-Id". Let me know if I am messing up something still,
> > happy to look into it and fix it up.
> 
> There was indeed a fuzz about the Link:-tag[1].  In the end,
> it was agreed that the Link:-tags are fine, but please use the
> patch.msgid.link domain, to distinguish it from discussions (which
> should use lore.kernel.org).  Unfortunately I can't find a link to that
> (too many trees in the Google forest).
> 

Ah OK, I didn't follow up to the conclusion of that discussion for sure.

> About Message-Id: I totally agree with [2] ;-)
> 

Thanks, at least the setup is working as expected though it is not using
more common "Link:" format.

> Thanks!
> 
> [1] "A policy for Link tags"
>     https://lwn.net/Articles/1037069/
> 
> [2] https://lwn.net/Articles/1038003/
> 

Thanks for the pointers. Much appreciated! I will use "Message-Id" for this
(v7.1 cycle) and switch to Link as per the above format later as I see that
is more common than "Message-Id" in v7.0 cycle. I don't want to fix-up now 😄.

-- 
Regards,
Sudeep

