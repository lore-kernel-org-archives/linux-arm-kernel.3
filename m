Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99644C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kN4eEWfq6WjOZLuUP1/ARr19GgVdcIcs0TXSNJQgbD8=; b=B0yq/9lqmdiqCq55SyQp9OnbRd
	fQn0SetPyjwL7QBRKKdfptelMKq42QkR36UNzAaNNoeAPNSgcX6llhNrwKUOh/P7rsYtoNLNyyLcZ
	Q+ETpcxNOQ/YFdkLrX5CIK+jP65YBKpbGFihwLfma2eBucuMgVwaCxE8wF2FomnOTkNXL9fYADEXh
	h95F1005HlV7PR8kb3/l1GWqvF/7SUwBorVHvL29Rx7Ya8xwZxYaIAGX/SSMumGd922He2OHFcPGC
	XgDwXd6GU3yFs40QmTXz5bvBooIPpG4uOf5jSSr0KJcv2GgcOgjMUXTPNzo30mrTXdc8Sq1DGA57Q
	FzeWHKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUXO-00000009BMh-069y;
	Wed, 26 Mar 2025 17:27:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUHc-000000097PO-1Otp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75ADC5C580D;
	Wed, 26 Mar 2025 17:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDA5C4CEE2;
	Wed, 26 Mar 2025 17:11:14 +0000 (UTC)
Date: Wed, 26 Mar 2025 13:12:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
Message-ID: <20250326131200.1c86c657@gandalf.local.home>
In-Reply-To: <CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
	<CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
	<Z-NHugcLdLqkEHFR@arm.com>
	<CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
	<20250326124025.1966bf8a@gandalf.local.home>
	<CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_101116_422194_D056FA0E 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

On Wed, 26 Mar 2025 09:51:06 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> If you don't see a DKIM signature, it's probably because when you send
> emails to yourself, they never actually go outside your own little
> smtp setup, and never go through kernel.org at all.

Using claws-mail it just uses kernel.org directly, where as my sendmail
scripts use my own server which goes through kernel.org.

When sending to another email of mine (rostedt@kihontech.com) the headers are:

Return-Path: <SRS0=fOit=WN=goodmis.org=rostedt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on mailmammoth
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DMARC_MISSING,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_VALIDITY_CERTIFIED,
 RCVD_IN_VALIDITY_RPBL,RCVD_IN_VALIDITY_SAFE,SPF_HELO_NONE,SPF_PASS
 autolearn=ham autolearn_force=no version=4.0.0
X-Original-To: rostedt@kihontech.com
Delivered-To: catchall@goodmis.org
Received: from rostedt.homelinux.com [172.100.189.27]
 by mailmammoth with IMAP (fetchmail-6.4.37)
 for <rostedt@localhost> (single-drop); Wed, 26 Mar 2025 12:13:10 -0400 (EDT)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mailmammoth.local.home (Postfix) with ESMTP id 8EE602014D
 for <rostedt@kihontech.com>; Wed, 26 Mar 2025 12:13:09 -0400 (EDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60B5A439EF
 for <rostedt@kihontech.com>; Wed, 26 Mar 2025 16:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5492CC4CEE2
 for <rostedt@kihontech.com>; Wed, 26 Mar 2025 16:13:08 +0000 (UTC)

So it definitely goes through kernel.org.

But it has no DKIM headers.

-- Steve

