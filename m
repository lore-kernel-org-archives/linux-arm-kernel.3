Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D67EA3F03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sv5eH+WIZMIzsOKs9GXsW12MBwqEfloYctcgLZQR1gs=; b=hZ2g+880EUnBQegzQiDaDM5GAe
	/Ay0UMOPnuuIBqIF/mQfEVklVOADW34gJWm8bfFyrU8eTrbD25lQRsIj9N0V7Mk4lRl09woJSpHzr
	jWb4FZsdiVO1Mn5oPjjSt9bOJlq1pjZbfKvozVFbmpLfZrOsxTQB55vBNAImo/3FLckO7gyHQU2aV
	FIVDe6axdSkWWxXZ76aeiFXTxXxNBlvmMmBoacsSWIDvLFUiUQBpJOzdPrkcc53rJGvh1y+uyUjD+
	z5NV7T9uSDaD6tOQ6XlXhJvL5OG2rfz2FUTMoVNSrmO36mGAAb5Evo5kXD9wnZjwkabjwjO1RgJmg
	tgryt3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfzW-0000000GRxC-2wa3;
	Tue, 10 Feb 2026 05:08:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfzU-0000000GRwk-1m7r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:08:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61B7544570;
	Tue, 10 Feb 2026 05:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45452C116C6;
	Tue, 10 Feb 2026 05:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770700127;
	bh=wqghKPXNzKXozCJGaH0X7FGUu2cS59tislhwKAESYa0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ihxuqtGEO+7UE1FKhVzc1OllYaw2zroXJYbSSSDgQ9XR/odaoplYFVDv8j5Eg7SpO
	 xNZ2x519W7rHrokH9QV6n/ePDlfCel7nll2n++mqHeT77dNthBz6L00ebT5Cx+Z444
	 RqZKjHVV5Ag3kOsn6r+965/Z1L7js/UCgFx6Iu/nr5qo1Kzda69g+jLutsVJi93sUq
	 sKUF0ltY/w5qdKap2n5NlqOkBzV5QxZPR9F01R01j1mWxlyMaHiiq9Jidl+ILjTB5Z
	 WRRx5koReQhtXeZbReiOsSQjhK/jXSYa7FlTJwHBi4iQjZZVdrJpAgLv2iR2mQ1Dt5
	 AeUox+6qJKXTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B106380AA5E;
	Tue, 10 Feb 2026 05:08:44 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <aYnwpy4umKY4A5wQ@willie-the-truck>
References: <aYnwpy4umKY4A5wQ@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aYnwpy4umKY4A5wQ@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream
X-PR-Tracked-Commit-Id: 36c0de02575ce59dfd879eb4ef63d53a68bbf9ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45bf4bc87c46856c5cf4ac39a0c25c83ccbf3209
Message-Id: <177070012253.3352335.3100753928290237845.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 05:08:42 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, maz@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_210848_475992_E261AEAC 
X-CRM114-Status: UNSURE (   4.83  )
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

The pull request you sent on Mon, 9 Feb 2026 14:35:19 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45bf4bc87c46856c5cf4ac39a0c25c83ccbf3209

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

