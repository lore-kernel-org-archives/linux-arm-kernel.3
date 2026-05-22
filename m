Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511F2CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=di5a17Qwl17+E5IyQHMXQffhjNV+UEL6n1vstUmq+sA=; b=W7mCGB5kBgk3d18bg9zMFJHV+I
	rBAtNac3q65MKg3dnb0aGveiwg2kzz4Ps3FXoPthkj3Vte3VtuZVMAIiWUOFleX8Fuk7F7lNTdVzF
	niwv3STj1OuQrV7+D6PtdN/UhgcBRFYzyr+Stug8BgcdzO9e/LY37AB0QTNkNaLodCHycI700k070
	nqv+iAZNWb7MqBWSOXy6r44TxaA//bf86uHu+kGZrsMIXevU/HA57VJ8S1hTAvK1OrTySIN7MrKgn
	btMDTHaWKQfchKJpJIP+wQ74CG+UGd+SY6e/IgJROeV+YZDECPb4Zw6WpWKSVFStC3CO4o49g73te
	mNtnnctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQom-0000000B7vv-1pSQ;
	Fri, 22 May 2026 14:25:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQoj-0000000B7v9-39ej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 14:25:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DBDF44171;
	Fri, 22 May 2026 14:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B1F1F00A3F;
	Fri, 22 May 2026 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779459937;
	bh=di5a17Qwl17+E5IyQHMXQffhjNV+UEL6n1vstUmq+sA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lqg8KkEchg+m+AXmoyAWQzpf3witDd+rrQigMHyn7uUnxYY5hUWUHEyvTN4SRqzKa
	 ztyatD7TRaYBzOjZV+xU8mTrlwe+q3xkBYYEZ+2V5PDRGYPgFLtqCPocPxVXiZ3QIv
	 KFcK/JI3ZJite5P58/7mrTh/YYGDTNZevm0aBWh6nnM/5GlHk5iTsZqrmTNogOUJd6
	 vfMkKx/ypWXhrYw/JvQNWyl/27skrDRlUZVzZW3M3kwOzs1qiqFaRtzHGPp9WcXD//
	 xN+X6OKPFkscsr2fsESaavYJ4/uH9/S+uQUehuWTuGS5ymeYfdV3EJpEB2BX7PpRGO
	 B97z7amgQw34g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93981392E9B4;
	Fri, 22 May 2026 14:25:47 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.1-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ahBVUtmWJue3HmV8@arm.com>
References: <ahBVUtmWJue3HmV8@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <ahBVUtmWJue3HmV8@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: c2ff4764e03e7a8d758352f4aceb8fe1be6ac971
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef7f594f5d291a98a4da2cc95e7713d3971bedaa
Message-Id: <177945994620.1238704.5240180336142869047.pr-tracker-bot@kernel.org>
Date: Fri, 22 May 2026 14:25:46 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_072537_805240_0554CB7C 
X-CRM114-Status: UNSURE (   4.34  )
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

The pull request you sent on Fri, 22 May 2026 14:08:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef7f594f5d291a98a4da2cc95e7713d3971bedaa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

