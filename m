Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC12C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YScp3Q3iJC1Yd/usEUh3mHQDpi1rh3Zpmn/CI2lB1hc=; b=CDeR4tuydUWYB7pb3idzkBaGwS
	hmz7Owv33tKosj4BRD/LAXCL4RPYNb1AXUl9T3Q+pOa47/c4JUeOx/z17wPyt7u3/r4lWhgszCqK1
	zNsNHZsXg85kV/qoFV8aOVs9jJV+2s6M/8dIMAraXU19/foBoad5B66hrLSeW9Jl71BQBSGZC1xgI
	2Xc3XWLgjdI3pWHRsdycIm+n1DginNUH7IGgeiah5A3+5RN4LLbcZZwUE/Qhjx6wB0HLpJnmXii2a
	GONZdQ6ZN7AVQ0ips2A2aGwKMh7wkCNEcB6rcusEPaB7EScSgP+1u+lgDKs9CrqH2k3A/Y25xa3DC
	0e6nb5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUVo-00000004H9A-3A7Z;
	Fri, 23 May 2025 15:40:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUCX-00000004Egh-3q9M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5184E44D7F;
	Fri, 23 May 2025 15:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301EBC4CEE9;
	Fri, 23 May 2025 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748013649;
	bh=3Lpdxu2P1pQksYRfoU0u0T1LOQxcymB4tTW3NjdCxks=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tOby1dcs4I7pXdlHINc6jzHVW3wVS2qs+54bqx1bDzACGwqbW+cCFQO+XOHg8oH9I
	 itE9VM0xN+nVSXhNYAVrXQaFEF1/js3MSuQxqNa5PcdRK24jAhHZwmz716l4hlfbPz
	 QolH8YpiJbIXNkgMjiXffcMzhaLdl9kj1Ld4MWLMoNXVgyXao5pEM6uYIW2oUP+99p
	 XENDQl0I1hFRoCjuA7uptEiW/d3NCs6Dbip0kDnMsv5IswD4Ao3XfcKERHmB/JVln9
	 HN+W+SuUdJ7ULMIYlsMWZdrHKITC4KAyndQQ1TMbzgCc5S3FPr2LKcyl9GMZeKSlq/
	 Nr7yuNrMhQ5UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE43E3810902;
	Fri, 23 May 2025 15:21:25 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <de1a7a9e-7823-4f98-bf9e-99d8722c28b8@app.fastmail.com>
References: <de1a7a9e-7823-4f98-bf9e-99d8722c28b8@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <de1a7a9e-7823-4f98-bf9e-99d8722c28b8@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-3
X-PR-Tracked-Commit-Id: 070d04f002ddc308b053df4723e83cf43719fda0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d0ebc36b0b3e8486ceb6e08e8ae173aaa6d1221
Message-Id: <174801368435.3634038.13556567875278893073.pr-tracker-bot@kernel.org>
Date: Fri, 23 May 2025 15:21:24 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_082049_972980_6FF54F8A 
X-CRM114-Status: UNSURE (   4.82  )
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

The pull request you sent on Fri, 23 May 2025 15:31:03 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d0ebc36b0b3e8486ceb6e08e8ae173aaa6d1221

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

