Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F6AC83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt9eGTZKuWe0Rt35OVakEgDRMolYv4DxFc8J0yQiKHQ=; b=Pt0sDtxOGsRkR7SOwoWz3nkrU1
	Lstc7bTXKy8hmqnDMaZ8srqKRwAeVasKksIdJkM/ubvVpGlrmblxOrBx4pp7OgSb1U3Po9pFyoRlt
	5/IYn+ylUhY0I6JyUVQxIPpbmF8HBYkJ4ZhSBhDIB0PZbxv+QHaFWw0/r6+c8fWANNNIqeYu4a45f
	dQy7EgS9qWyX5+6puPPShQ0m3xd5w8Zftp2Li6Loo9a2sU6Bjem/8lDQ1PDntxhX51ERpvCPt+I3v
	oLa3g+Ujke6LkO+YTN6hHDV7NmLOCAuYYYSal4MQNkZSvEkZQZGy5DkwCi5CrZMqXzcsO5cu+yhaa
	mtrH2Qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcof-00000009yGg-1dew;
	Wed, 09 Jul 2025 21:59:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZet-00000009Z8X-0XJE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 18:36:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A6F9A54723;
	Wed,  9 Jul 2025 18:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58CEC4CEEF;
	Wed,  9 Jul 2025 18:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752086202;
	bh=Hx2Z8LWsM4BgshqAi1E58fO9f58s3x7Ck2+xgNr26Mo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CJf4DHSkQu18uwAt8RJHROsrf5O5r80eM0Ic4O3qPdtwrNUTuqvOL2u7DtjiP6R1g
	 xDmUvN+kFdyKke9ZFY43TGA4RUAjO0EDYW4vMJY7fA4A5QZZ7qWfdPDV8k0d8rPLRb
	 uFm/A/dQw+XbPx/9Hqsmz2KyC3uGBlSlkHGdXTfFnqmJuwtHWzN1XuOWzdJRiTRfMH
	 e0pcg3fTMo2VyMNfQLK9H64MVWPx4PA4Nq+pT4pjEY3rn6U0+PuOXYhJIc5EuMptIK
	 uzTBo59yYzR/38ce9EpM1JWc5L6t+gens4ILrXg+1ihFJGNvz5XQ2ybXQ7pHJEPwXw
	 u4dbJs+z9D/kA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF13380DBEE;
	Wed,  9 Jul 2025 18:37:05 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aG6GAKc8EV0cERsn@willie-the-truck>
References: <aG6GAKc8EV0cERsn@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aG6GAKc8EV0cERsn@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 9dd1757493416310a5e71146a08bc228869f8dae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f69f5aab1fad379bbef9339f66bc8323daffe56e
Message-Id: <175208622434.814034.11084342849878217311.pr-tracker-bot@kernel.org>
Date: Wed, 09 Jul 2025 18:37:04 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_113643_228065_0389C282 
X-CRM114-Status: UNSURE (   4.74  )
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

The pull request you sent on Wed, 9 Jul 2025 16:08:48 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f69f5aab1fad379bbef9339f66bc8323daffe56e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

