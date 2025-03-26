Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F5BC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eTXk0HkigRR1TxyAk+Gm60cvzBNZ+Zkqmh0DH4Knz4=; b=HajOwypze0f9TzjQLYpJXXpXSl
	mk7FtoVaAmRTRweeYQToeMiJPGzRtAq7DEFcJP4KC/x7NnX6u3h1JR6f0eyAwLziKz+SYVwgdfql/
	HXxSnP+p9EQP3+nJGOXzFG9g5MvnXrKC/2YBpIkbrPz6rCDdTCryAz9CU4hz5Y98u0MRlE7qjRHsR
	wQU+UIEPc8yrbpLuCwYjXvBj/8nnnwD5+H0pbAMEXao2+vocUdo3CSVrIgx/oSCjgbsOUDEdrqmtO
	Ir/tFYvXBfHfsbWgFwQkCBCtA/zqre8QjekkcyzwVfD90n9/Z4F+Uyx3nKOg7QCgmlGYLmEt/WGKH
	+jMxUevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTom-000000092Sl-2Zqu;
	Wed, 26 Mar 2025 16:41:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTn3-000000092Jv-149X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AF9F5C6725;
	Wed, 26 Mar 2025 16:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF624C4CEE2;
	Wed, 26 Mar 2025 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743007179;
	bh=RvjxL5DyvBDKCYG+UYSNeb2jpoQwYz2f1DmVuSY3uyQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=USV4xrsQk+Ul6Q7diqx19+Jg4TVC7aqBGeIc7vuB8DQR+IoXEk/Mo6Nn25KTWrRM5
	 wYfQ0+IqZcSJ04eX3LAMo/ILkcY8Trmp6/aqPBqPOU0bQ6uzf+G4fAagGAMfu3QjJI
	 A1tRYi8+VL/tn9EhF10S7eL7I1PuH/wB2K6YSWz3emaXfswXRN0sAB+Up1+oswFj5c
	 n+9l3qCDW2YJkuAlXB0xFYkyPLsDQDSwFV5M5RASRxppAIfde8bj3l5zhaxZEzZl85
	 w/UVx7s5pghDCM5DhTsid+OvibxYIU5/rkSX0583Qdd/lNt9q7o79AR9FcFQxmKfdG
	 IJIkk9j3OzPeQ==
Date: Wed, 26 Mar 2025 12:40:25 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Konstantin  Ryabitsev <mricon@kernel.org>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
Message-ID: <20250326124025.1966bf8a@gandalf.local.home>
In-Reply-To: <CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
	<CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
	<Z-NHugcLdLqkEHFR@arm.com>
	<CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_093941_342867_9D84AA11 
X-CRM114-Status: GOOD (  17.72  )
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

On Tue, 25 Mar 2025 17:48:12 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > This header left my machine but seems to have disappeared in the
> > lore archive. Not sure how much difference it would have made, IIUC
> > that's more for SPF than DKIM.  
> 
> I do see the
> 
>    Return-Path: <cmarinas@kernel.org>
> 
> but no, that shouldn't make any difference at all, because that's not
> what dkim matches.

Now I wonder if you see any of my emails that I have been sending?

I have my own email server which is on a dynamic IP which most ISPs will
simply drop because of that, so I route my email through kernel.org.

I just sent myself a few test emails and there's no DKIM signature, unless
I manually edit the From to use my kernel.org email (which I have never
used before).

> 
> The spf is fine, but honestly, spf on its own is kind of useless.
> 
> > If the envelope sender doesn't work, I may have to switch to using
> > cmarinas@kernel.org, at least for pull requests.  
> 
> That's fine, and is probably the easiest thing to do.

I may have to do the same if you can see this email (which I manually
updated the From address to be kernel.org), but not my previous pull
requests.

I wonder if there's a way I can work with Konstantin to allow kernel.org to
have a signature for goodmis.org ? Not sure if that's even possible.

In case you missed my previous pull requests, they are here:

  https://lore.kernel.org/all/20250325180527.5fc0a1fa@gandalf.local.home/
  https://lore.kernel.org/all/20250325193935.66020aa3@gandalf.local.home/
  https://lore.kernel.org/all/20250326115109.32b69701@gandalf.local.home/

-- Steve

