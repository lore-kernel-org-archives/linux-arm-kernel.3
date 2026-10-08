Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB676CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 04:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+V99tD0dAB278UZdrVVbEhFXi9UBbQWSwdIYxhfq3M=; b=kydJ1y1qpi+nYpqv/Qs3Oi638V
	06akeDKvRRwwjTdQfZ/PeOk7P4N3qpAin/MPvA+HqsIMfRPBgCIt5Y4hueQjCn2H08EcR5NuEK6pt
	nOcOxpM19aw6uYGUf3FXuYTg4xixQ62GLqRGc/34FmriydzYtaH76Vld7uE+5fTgre4rsHo5bHZI4
	NeEhLhzKDzYDHnQksBCYAtMQLwY7Gq28o36deRXUjlvswnKbc7SH/KAV9HvDzJr8Kb3oBfraDyLop
	L9LayyQZkjBLm1AuCsAXmjutY+ZIVLIfmmzUCoOafpQFC8rUoMwMi5E90pB0xDzdoSs/m/EtXJz6m
	nuELE2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEg2H-00000003WVS-2fbS;
	Thu, 08 Oct 2026 04:47:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEg2G-00000003WV7-2gsz;
	Thu, 08 Oct 2026 04:47:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C87A26025A;
	Thu,  8 Oct 2026 04:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8091D1F00893;
	Thu,  8 Oct 2026 04:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791434835;
	bh=K+V99tD0dAB278UZdrVVbEhFXi9UBbQWSwdIYxhfq3M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IIHlcj3qVjsUm7oj8dvns9xXQgqD2bQT6b+hNHON0IWGsxjKkZyzOHKwaDEdwGaos
	 npkdtJHw3/v01cjPPFzrOumYM0Yqu5jhnlPXG+5ZLLuKUawW5eSxwUvgTTHrB1pvI4
	 mROFAJCNP/uu1FT89jSFd9VXg3f+P2b5gS2FvjaODfBT2s2CK1654GJA/SRlWjmWxA
	 bkh1z4BCjZ4Iga75ybslYMazM5ZCc3FNfSPHKwfQJ3wQ9MkT07dDwdbvQDc+Boqc5J
	 dFv1e7JDVw1weya93j/59joa5fvDqTlg7ImVaVtryaJgsb91xKjBh6ZQjZ1MyQMr3/
	 BNhIYaIzTl1Ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773EB3809A13;
	Thu,  8 Oct 2026 04:47:15 +0000 (UTC)
Subject: Re: [GIT RFC PULL] Fix double dereference in TP_printk() in usb mtu3
From: pr-tracker-bot@kernel.org
In-Reply-To: <84064d39-6f44-4b4b-98f8-895a0294a3cf@paulmck-laptop>
References: <84064d39-6f44-4b4b-98f8-895a0294a3cf@paulmck-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <84064d39-6f44-4b4b-98f8-895a0294a3cf@paulmck-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/usb-mtu3.2026.10.06a
X-PR-Tracked-Commit-Id: cfb3293c4573289f11f913611f530ea6b1926d67
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8fc6e594884a65ec99c78ad05e7fae110ad714d9
Message-Id: <179143483406.3815904.5949191380648245003.pr-tracker-bot@kernel.org>
Date: Thu, 08 Oct 2026 04:47:14 +0000
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, Vladimir Murzin <vladimir.murzin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

The pull request you sent on Wed, 7 Oct 2026 13:23:39 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/usb-mtu3.2026.10.06a

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8fc6e594884a65ec99c78ad05e7fae110ad714d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

