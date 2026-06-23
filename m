Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9351CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44hgnMGAfWABWYkfXn0p/fyqEc5LfQ3aB26sFC95Vzo=; b=oNJd2hFNTBDab9HlNO6umV9a+J
	c6zAh63gsst3fn5QXnxgB+dc3YuZo7OtghdAGj8WL8Ya0vtpldzZg22Rbd/kcPWIgkeykA+3OOg2M
	Q15yDYzqChRCnCBHaZOTjH6+PFOqAZ1dr7UaXrSicwcgVNlmn+G7b2xJeIJrX1NsFr5VsUsf/Ggkc
	oxTyIQWqKlYFDotPX/4Iaix80vu3jr7MvWGWykKn+M3idxUvEzyr3aIUOU6uRMYuExIGqL3RPL5Zx
	OULJpChKpwoNLwk579iokwof4RHNrGXiqud0LjcwY95gULhhTiC3AWkRCJTJQmzmPAPiIYUarijwL
	2ouE7mSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3F5-00000006YLp-1P5p;
	Tue, 23 Jun 2026 15:40:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3F4-00000006YLe-0lWM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:40:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E97E60120;
	Tue, 23 Jun 2026 15:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2991F000E9;
	Tue, 23 Jun 2026 15:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782229249;
	bh=44hgnMGAfWABWYkfXn0p/fyqEc5LfQ3aB26sFC95Vzo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BnvdpmQFJVmXnFPxE8dfAjRf4jUiCMIuMVAoBJIeyOeu4ALDolCC9y4mUeNzrToMh
	 RfrgXoAPL8bT5KMm1lQstgl3WMet/hNzHf4Kmvx3MFDt2QCCLZroRBAG0+Eb4fNENy
	 5HevYXNxj+K5T/pli9RDiczJysumo7Ab5znpzSUrEkkmwxNycOEdCP8Rlj73LDKu38
	 dUWGhcF65w2wc6lUs9Ygfuvw3fV6iC5OrV0hqrOchhB+S1ExD+V81FcLFVmzvVJm6l
	 vwz1GUbfHKrxRLFRWzxfy07TKH1sNnsRiHCN4VHigZHxrd1CovTPLOBQSCoNoYZrFA
	 zGQc2Zdd5leqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09CA3930E57;
	Tue, 23 Jun 2026 15:40:39 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY3Tns7SmNU+_iSKcnrg+Muy5eOTNHn49nj+uv73VHNgTw@mail.gmail.com>
References: <CABb+yY3Tns7SmNU+_iSKcnrg+Muy5eOTNHn49nj+uv73VHNgTw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CABb+yY3Tns7SmNU+_iSKcnrg+Muy5eOTNHn49nj+uv73VHNgTw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.2
X-PR-Tracked-Commit-Id: 36cac4b5101f8ecbc851356df175b99543c84ec6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 515db262143e48f09b5dce07bc0db67b8b4d6a73
Message-Id: <178222923843.2291728.9014015537938692297.pr-tracker-bot@kernel.org>
Date: Tue, 23 Jun 2026 15:40:38 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

The pull request you sent on Mon, 22 Jun 2026 13:37:57 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/515db262143e48f09b5dce07bc0db67b8b4d6a73

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

