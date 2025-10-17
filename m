Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6EECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 23:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cf4WaspAp18ql+dnwf90t4d12Ax7yAl13vAM61YFYEY=; b=sEuIsTDhyrxf3NjmkvE0m9OTLf
	H+ME3wvnWdfYZ/LHd88SwMFnQ34/UnmePMsIVQ1NrmFxlatmF4YehAxkK5dtq5tZ6UMY/qEqXEt61
	EmKse3plQXgeQ/43/6Ld3sm3UEfv9ZTHG1Bwhpf6CynyzG1Lb7y2tGUdA7JZK6vpFPPs3Re+0epuJ
	0q2hNz4bZInB8QDzgC1AFkD8hnztrjyTARLR23jo7aOteQEJ1V8EPwALDmM0f5JbtPGT6a5DUADZ6
	/YPVWbZNWm0tKndsG0sDoQF0VnXdsbBR+VEX7W01iw/Xznta7FN6IJI1eMTGBhWCSmAiY4K7lDKcM
	hsD9dbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tXf-00000009ADC-2qbL;
	Fri, 17 Oct 2025 23:07:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tXd-00000009ACI-0QQs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 23:07:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 106D249B86;
	Fri, 17 Oct 2025 23:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E504CC4CEE7;
	Fri, 17 Oct 2025 23:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760742439;
	bh=dTr0x5o6E2zK63uyoPqIfXVySL32t5XiVOYd+YF5seM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nyu59d4/BfhNt8iXxdOGevqWE2AnBmpGC/d8vl9zBI4XWYnujOHW2o4Qit2h/xLVk
	 kK24zjwl23Fl1MhEXU/DKjNLsseV8VfCiQY8QWlp1HwA88duDGdPBAH/F8cmh/nMUB
	 BZaNAN24NfIfQ5MwteWMNKztBy3mWsQgatrjOVrdodNE6Gr5MErtxgwpmk+BU8VGOu
	 4izGtgR7sDojyDCbfSUnB5QcK7WieDAP4qa1NKHJAe+tl3cL9m9hHpqFcy9xElz540
	 lE9M8v43oJdlIKUys5vTaYRxv2MEWAa1wjMQDBXIsGU8V+LknGIhkRu4o0LK9rvLp+
	 j8we3QthJNqgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE7839EFA5D;
	Fri, 17 Oct 2025 23:07:04 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.18-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aPK5qkFphJvpJBkJ@arm.com>
References: <aPK5qkFphJvpJBkJ@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aPK5qkFphJvpJBkJ@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: ea0d55ae4b3207c33691a73da3443b1fd379f1d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f406055cb18c6e299c4a783fc1effeb16be41803
Message-Id: <176074242328.2817248.13754921087443545175.pr-tracker-bot@kernel.org>
Date: Fri, 17 Oct 2025 23:07:03 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_160721_159967_0BB0660B 
X-CRM114-Status: UNSURE (   4.29  )
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

The pull request you sent on Fri, 17 Oct 2025 22:48:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f406055cb18c6e299c4a783fc1effeb16be41803

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

