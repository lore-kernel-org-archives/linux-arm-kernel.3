Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AA8D29C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY++9H5YhEncqY+NUwpTHuq15hMyFe7im/Rma8d2ws8=; b=kCKSizFeUiVMb9iNuUhmHSGGEv
	iI2MuZsbhSxuTRUet43Hw2gpO8js3hqzTp60WGm+6cenTPq6QUflLXYV2yFzUxCLdN1lMrND2jrjo
	qCKfDYmZ4BWU/5CluA1LK9Wrip948F8Ca71Idn426gEDzNySlARl2nMVaEXPS9HmScMbwS9T80dvt
	dyqlsOAt/BUddptkCZiNjQM/Lt6cnFL7iRca1Ws0mevmGhvCAvn6NZpnuLL0HzT5orifcOosdl3DF
	Xao/V8elDr5pqBLpbrydGcC9DyRsWO5Ni7tjiMQ16OdGJFhY75QAqS6DwEWSVKXEjvZkQ5YO2fhvi
	9tNATfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpky-00000002CDZ-2nOy;
	Mon, 19 Jan 2026 13:57:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpkw-00000002CD2-0VSM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8947E60054;
	Mon, 19 Jan 2026 13:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B61EC116C6;
	Mon, 19 Jan 2026 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831041;
	bh=AgYj0wAnzwu3fqWBPIIVayK+mwjatYx7EuCQ1+45v40=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BdwX7KpaBkEHTEIzLGsN6JlGxwhP+NfdZFTkT9LAEq623e8QP5Ylbx7f2OB2Ekrt1
	 4y+Y/ra/i7PpKSjvXfGc6pmwdHsef0+b6/d1rmJtrVUtKuzdBKCl4OZANMyM5iQPL7
	 Tz1I9Ct8OqiIA2hP9X+g57R+84oMM3HNJ11MGa8eQjX/r8mNTKhLo/ievpAPuFlj8A
	 mKH4Dec0Gw8EMTWjIs/jPh6wJ4MxPYm65iym9qIHYOcbLrEwKR8JWWzBoj26tvdmfc
	 Ybrq5IZ47xfNGo9DWx1dcMLZglux0puzYOeobh209ibX0vVOx5gaIYmQBijGlq2Yvo
	 gevfdJ2IOEvKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BD1A3A54A38;
	Mon, 19 Jan 2026 13:53:52 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.19-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aWuXMab4BxnbUbOG@arm.com>
References: <aWuXMab4BxnbUbOG@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aWuXMab4BxnbUbOG@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: b9f5c38e4af1a094384650d2fc79fb992d6d5e64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d12453c7e281d236f77b5c7d7cccbf9e5dfadfe5
Message-Id: <176883083082.1423140.4193507582074784459.pr-tracker-bot@kernel.org>
Date: Mon, 19 Jan 2026 13:53:50 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Sat, 17 Jan 2026 14:05:37 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d12453c7e281d236f77b5c7d7cccbf9e5dfadfe5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

