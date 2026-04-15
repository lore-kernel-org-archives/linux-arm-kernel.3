Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB26F9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 00:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atnuv4tzC48KWtEw+c22sVUGHOjvG9MjIERK9tutnUA=; b=22cRBYQPNBzCeYMCysL9iK8vSw
	ROJTPfDEaPz5Tb5MZUMcxxRSUbRH0/p/m9jp515K9k4m+PBjnTKgWBrmghyOu8DC0xJ1zYL+7h5dY
	LMBmzMtuu2sLAxsnBSlG7imfxccyeFHmAyMhrVspQmhli2rrns9WKAQLT+s8Le5q8FnDz+XDCE8c/
	+zrUlruB2+C2uL7GP6QMiFOzEtgLOAYi6p8QiodkRPDzSWIyhlM1tRRZXPqiwkz8v6uom30PJ/HOk
	nq+zOhTi75JrUGVrNT2ltevuw1PdgeRVk+5rLKT3x0q5Iy0evm1FLPfB9R+zYKv8lKu19f7gLFMyC
	kkeeT4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCnjv-00000000MCv-2AYG;
	Wed, 15 Apr 2026 00:04:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCnjt-00000000MCo-3ZWg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 00:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0FD360018;
	Wed, 15 Apr 2026 00:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CC1C19425;
	Wed, 15 Apr 2026 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776211456;
	bh=dsKDSFNhtLDUfZz/3PED/O6pwW8J3jpi6UO/aUemJ/k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tRixQxiyXg4rpSb9XQaPb+2EkUVbJP1cdCNMEzZylCAJqRXzL6+6aFzbaco3/s0am
	 NDL678siRSDmzT+vBNUSc51dDC/CeV5dY3wKdRMOG1/Yg1j4/yRkKJ0x1+jBt//F25
	 o6j0NKkK+mdFPrVRX+tFAmfsjNmVLA7ig1v99H/k+aP+l//WPJds62xsjPt9uZd6jN
	 9veqNXI87fGbC3vYKssil0hck2Z75NEtmSTmRdTLgG6IlvOHvVAoWUZImSJ8P468hC
	 szKWv8csEzkkdgyvYmhIDsNB4Qepv66Gq3qirsh5BcHzzRDnzzIu1eLWXUSys4GQZL
	 UHBJWRrbAr1LQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02FF13809A29;
	Wed, 15 Apr 2026 00:03:48 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ad5Fh5JUqptcYkrp@arm.com>
References: <ad5Fh5JUqptcYkrp@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ad5Fh5JUqptcYkrp@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
X-PR-Tracked-Commit-Id: 480a9e57cceaf42db6ff874dbfe91de201935035
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c43267e6794a36013fd495a4d81bf7f748fe4615
Message-Id: <177621142744.1523730.502155400080355207.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 00:03:47 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Tue, 14 Apr 2026 14:47:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c43267e6794a36013fd495a4d81bf7f748fe4615

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

