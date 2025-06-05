Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986BAC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 18:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blhjvVvZQ8/hgnbS+VbYk48dY/Y2Vin3A5Tug2Y5Hg4=; b=gmTu0PVLmviilXFl2srX8WWIEi
	FsYcRh+MHTZy4o9uLMd3NM8kwqtOK1oCbKPShMW+pPPfJQQkbxosGrAJTTpW16PMYgl0Z6xHw6n+R
	YGP231fJXTAg8aQZGzovvkMQprs9APDRcg4S69Ig+viBOJl/PczLaGGoMlQtwFsng2ED3HKNISjAi
	W/rl//BKVrKq+a+4rlaGZVqdKDpCgW1ygIpRxCxpB7vGDTJS+UT3LQ38XWZ8rvYO9i701O9IO95jt
	h8+l10bA1N7tdxOBmEfhLgPgE0Fhx8Ci6HA6Nquj99fL2MelGePkkBdK5Efn2by+AuNIi7T6FCNPW
	mo6rAbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFk1-0000000GQf0-20jh;
	Thu, 05 Jun 2025 18:55:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFhv-0000000GQS0-2mmM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 18:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 083CF629F0;
	Thu,  5 Jun 2025 18:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C926DC4CEF0;
	Thu,  5 Jun 2025 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749149574;
	bh=iCyo66y7KzaBRsI5MU8/2D4b7hqOA8eptf3r1MPwYMg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ir7Mk0hAbanohXJ/1FGMbWVnuEac80Tn9ldesRHP9L7MNhzasovMnad2aiFvLIHkl
	 ndVzUivi+VFXiqrhOhzY0YKuc2oWZHnxMBJBckD+fQ29yE1KBhIAlIER9+37VsAokI
	 gw3GzGpuPMLy+trGYv9Y6MNZavk3Evg2y60hiZc5Ob3itoXyttcRPlHtpZMfnO113S
	 pVMLgSrs34pJWbUs5zTb732y3Yjt0p7bwvJPFWJ2N+MaY83h2JZ5/8rQdYyDVO/N5k
	 ZZAnA9O9KgudZrnkpDxVjKNEA40RWGWO8KWtPSKuz6kTzEWYbuUs6osSxOdHMQ4Jxx
	 x26Rr7W3UsJrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE6639D60B4;
	Thu,  5 Jun 2025 18:53:27 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250605134126.GA4845@willie-the-truck>
References: <20250605134126.GA4845@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250605134126.GA4845@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 10f885d63a0efd50b0d22bf27eb3cf727838e99e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9e668cd2756c1300f3bf84eba1d6711b886b531
Message-Id: <174914960662.3197273.5561686147742355044.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jun 2025 18:53:26 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Thu, 5 Jun 2025 14:41:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9e668cd2756c1300f3bf84eba1d6711b886b531

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

