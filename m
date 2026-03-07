Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987E0FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 04:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCWTIliocq+cnavNQGcq0R7L29vwx1/y1HqPjG5UkCI=; b=lEpFQjEr+BYlSnw9TFfQAz0h1A
	cjzTXjhEAiER5ie1YxzOt0y21D9FVHTGQ+lbqoS7z3DtVFjaVJKL3xBjjK3Bxl6UJRGl2sR6S4c4k
	t4/WtWYqH+I4DIvvqlJc4V4LfRhuJu6vu32pAnYrbr5Kld3IvWRLYePbl+G/hWK2qID4b6z+/IKQ2
	Cx6o8B6X1oAixoVw8HoGZcdAKITMhGtmxzLvF3rF/KN3+DF4E3q9FLKuUb7q4SxTsqWwSQZwDHJrn
	U4QBrprhp2coRDlQYl9Nt50OEp36qs4mbHHp/RViPhRyJabflPn9BLj3DqfqJ409+aRuF00Viyx0H
	tPKSg2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyjMc-00000004t0W-0Txa;
	Sat, 07 Mar 2026 04:34:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyjMa-00000004t0B-0Efu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 04:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5997743B2A;
	Sat,  7 Mar 2026 04:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3893FC2BC9E;
	Sat,  7 Mar 2026 04:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772858043;
	bh=qE4hRHjDgOAgoR96jbQAMzVsQHRXSPsC5Nz4Oss1408=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nchYvXTnrpnD7PaMM7x7aUAkOqky/jknF9KZUvryb83BEsxsmgXw2N/Zv8/B1In2M
	 G7qAFQ9YwvqUatYAC0CwmDcS5OAB9POpFtyMnszxKvIP5mbvBjzrME5jVXNYnDf/HD
	 5ebDDFiZho1LfZDp/nMh7uFGTtHDdTYxlOoA5RoGUqQDskyU6fVjNgkbfQBm9k+Y6l
	 pae73K27v1NBR0dnrjVeIl6X7jFin3O24F5DR1ZL/sVxjtL8TanTzN1GODF3NWrATV
	 upTn2wPay598JYjy6bK5RxJTIP2f6LcKIyMFcuGc49esvLbGmAqnqQk96crRCedPB5
	 CDUHZwCrS6V+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE8E3808200;
	Sat,  7 Mar 2026 04:34:03 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aatZ4AQK7IRQEQo8@willie-the-truck>
References: <aatZ4AQK7IRQEQo8@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aatZ4AQK7IRQEQo8@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: d87c828daa7ead9763416f75cc416496969cf1dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4660e168c6fd0cd448315bd617c5df7bb21daaf1
Message-Id: <177285804221.165831.11620751644571414519.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2026 04:34:02 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_203404_116977_17B78E44 
X-CRM114-Status: UNSURE (   3.97  )
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

The pull request you sent on Fri, 6 Mar 2026 22:49:04 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4660e168c6fd0cd448315bd617c5df7bb21daaf1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

