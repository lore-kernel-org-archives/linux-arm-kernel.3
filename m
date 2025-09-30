Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC4DCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 02:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiL9myMZFd8YcuCubKDNNTCh5ir7/MCph5v3ICRUp+4=; b=pKGFQIDwHpk0rPgr5SiZqHJfAe
	pFH6xL8Ym01pPBVGvjJ0c++EnNnxba+HNv5oOpgaHEcdZ26g3g6mMfjWGu2vUK8EvBgFd/Bxh+21v
	zg3oMJHqwIQMSrtbEJh+X5uXLSTfNT4pp7SkJj4CGTlzfxcLjd88axTpN3W49i6b3yp1MQ6ixhQFd
	44aU/V+hqN4hPfDqnlee1SLXidyBI/mFf/p37CtprViG3ywZSpJOlSJtQdlFj1UIpsKXdVTmzY4yL
	IoCp7K3VxmJCHVh6DuX5ex0PTFtePtAgIBXbuU365UKXCg9SAu9aSD+bNtRelfUTJD9RYQH80HvRV
	Jz8vjHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QVm-00000003yjd-4AxU;
	Tue, 30 Sep 2025 02:54:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QVl-00000003yiv-00Qr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 02:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6ECF16033D;
	Tue, 30 Sep 2025 02:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C19EC4CEF4;
	Tue, 30 Sep 2025 02:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759200880;
	bh=oehZohf/K7J5eHCEI8+BxZ4Qae9BeXnKZEFyQhmY0lw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Gkozg6RNvruMxGaAtx4iAUYUyCVQbH4/wbBfeF8w6RvFVxmyD2SHIBFV/jXJSSfcp
	 8WC8Xc5VVKUzQ5qroUUe+9dDkcRw3LsVe/YVoR6NLdwMG42yHGLrYRBZB/nIi46jXA
	 4y2foJbLhj7iLYfG1N/B6GRS3E0zq+M++Frgl2FXFXOipdG9GNXMBcZUt0+6GBoUb9
	 e+57GDaZTlMnvbChDaL7swnUMFM+D3B7Qx19SsPvgnF3uOSjGbMVO/SVjQx67Y5O2J
	 dotzo8BV4bEF8uotq2LY9kgHqOIUl6vV1Dx+ddKZJ84HyZ4Q/W5ZkzVKdlpyKtQqYo
	 u+gKlqkefkRlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEDA39D0C1A;
	Tue, 30 Sep 2025 02:54:34 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <aNbJ0YiL7Us_eicz@willie-the-truck>
References: <aNbJ0YiL7Us_eicz@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aNbJ0YiL7Us_eicz@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream
X-PR-Tracked-Commit-Id: ea0b39168d3a2313eabd145fb3440c946ccff4d1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: feafee284579d29537a5a56ba8f23894f0463f3d
Message-Id: <175920087330.1805104.2171094738678723423.pr-tracker-bot@kernel.org>
Date: Tue, 30 Sep 2025 02:54:33 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, brauner@kernel.org
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

The pull request you sent on Fri, 26 Sep 2025 18:13:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/feafee284579d29537a5a56ba8f23894f0463f3d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

