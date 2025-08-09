Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2BDC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 05:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/qC9Dhpc881sX8Tb35LvC25tHRjhFCHXjtoVjk4SbE=; b=c1r8/arNkakYpPmvT+QFfuxkzB
	qbB1Q7XiUWbf8WSj02/VBER9ANK6rONu70ia5QRahb5OFB0LYGOxCLRRK/xPuTXnZJ68vApVjz+D5
	s8puvtYM0uLIaTz4W5zOVOMxydV76ZOor2iNUGMIJ9+cpIlY5vQBZyOHrROt1P7M/Xvstapyia1t4
	jDa7iBq0Cv0z57v1TA2VuYjPhF1MacGTkKhqaz5HO4Qb9wMz9W4dMasa4NHnOezoCf3XuEuuhsymZ
	Mh+/C+lqFtwsbcBKFFbQJrCEgXcVx+FL1YD2eH858mUpG95q/n/3daVIJDsvJLXgUPpGd1Kda3C5V
	Ix52d0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukcR0-000000049jc-0nSJ;
	Sat, 09 Aug 2025 05:48:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukcOV-000000049WF-09ay
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 05:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 244B5601EF;
	Sat,  9 Aug 2025 05:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3E1C4CEE7;
	Sat,  9 Aug 2025 05:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754718325;
	bh=bwRL3FVlYehbSADV5n4FEz08GnOQ/ZBLGjMwUPJa9hw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FdAdFTUH5Tn+l6IrNPGoEx4ceVeDpnQWgPW3yHG+JNYi/DdTwoCISG2GQ01vw87a6
	 LP/JrhoSS3KBITPnAqhL7E+RoGUNep4K+i4YSO6qFj19RKirlJK4pxuggV3Mlop08g
	 a38NmXz0XCg+9JzPdXkqa+ORg142VmXBu/glN64F7ecxmXgMMo+sqYo8vrcm15rRxz
	 KaFI4QMUoeMqQKNoOM1UBBhKqb6OSKd8GEFTk0nPGlRSzDC3qO4ntVFiYuVd0jdnYv
	 8UzampD/YQ6WSBpF/L929RBSlrQP8H0gCFQHi/qLv2sy20JzLLM2GQtYtkCSLfV+EN
	 0IuEqadSt91pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3407D383BF5A;
	Sat,  9 Aug 2025 05:45:40 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY0+oTn999iv=vy1npF1Bi9=GVqWXBh=iOocVoa2MwW5Vg@mail.gmail.com>
References: <CABb+yY0+oTn999iv=vy1npF1Bi9=GVqWXBh=iOocVoa2MwW5Vg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CABb+yY0+oTn999iv=vy1npF1Bi9=GVqWXBh=iOocVoa2MwW5Vg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.17
X-PR-Tracked-Commit-Id: 5378bdf6a611a32500fccf13d14156f219bb0c85
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b20b8538b310f5458bd7a08b7ff8a76cc3c28d24
Message-Id: <175471833890.387690.7361810232881130726.pr-tracker-bot@kernel.org>
Date: Sat, 09 Aug 2025 05:45:38 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

The pull request you sent on Fri, 8 Aug 2025 11:15:26 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b20b8538b310f5458bd7a08b7ff8a76cc3c28d24

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

