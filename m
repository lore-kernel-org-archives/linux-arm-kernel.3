Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31A2D743D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01QASRuj/xFYuWiQsEF3Mk2Zo/VQ0VTANpDPdG0siUU=; b=cSpE6jFXC+Ced7n1v1/Db9pi3u
	qjFbTneOzRZlqQe0b2SsNOTyuclKxRzkeuU+O9xKIv6GB4gJZnYxwgxbke+8r2VVyoU5kLD3Q6Fgt
	pTeTmD0Gfti76bE14xysfK/td1ZxqvnlhVzEKS/qcf/q+51IEvv1dIB3YJEGg5ZKBzZrd9lVCHRuf
	10oH5n0yVBW+rPe9lkrPNo2jFzJwE+EBuYY9bFhpl2e1O5g6sx8nunQahZdwIsaNTKtXCR9EcD8Hv
	VTwSbfO3FiMbD8hx3kSjEKYJ/yhioJ8ON2K6+qsHyGGy2K3jDN/dyCWaL6l2ElbgnPX5FfMRWXbON
	emcnKFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDrp3-0000000GFJy-2MRK;
	Wed, 20 Nov 2024 21:01:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDro6-0000000GF8P-10p0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 21:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E668FA433E9;
	Wed, 20 Nov 2024 20:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF06C4CECD;
	Wed, 20 Nov 2024 21:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732136413;
	bh=y6HZq1ASKdRiQIiK9lhiC246T7SS/jKVyLkAt9HO3PE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Et6MnjgT+l9neKdY8QttN3V2HDyLawsxWDBLmv6gVfHikF2b+axtFqOtgcp+ZF0eb
	 zecJD34INrsJvoayfBMizt+OoANOd+kXy2pIUT6eqDIExZJj9HtoS9oZLnqAadBv9s
	 /Xzv3nKy5Da+7zYrcoT4Y267qfdyCskuzoheX27kgdOU35GsoTGWj4EHwQhkMs9KTg
	 L6gPU8dDiWqasIIJ6mE2UldJiZSF/HRI5w1EELT91qMMlsseF7DKp95qWuDlRb3hgi
	 xdNwi865H9VaDfLsYXKlRvlIRiZXgzHAzivGeT0biRDEi0iPOcMZ1pWfVtN2cbRfwo
	 T4TcQN5oowKqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB5683809A80;
	Wed, 20 Nov 2024 21:00:25 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain updates for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241118160444.161917-1-ulf.hansson@linaro.org>
References: <20241118160444.161917-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241118160444.161917-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13
X-PR-Tracked-Commit-Id: 5812b95b7ff47d2ccc07b8f050652604ac54cdcf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75f2b37dd0a0eab8e6b179d745d79824893f39fa
Message-Id: <173213642453.1349927.18421320316689819118.pr-tracker-bot@kernel.org>
Date: Wed, 20 Nov 2024 21:00:24 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_130014_348935_1DC527C2 
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

The pull request you sent on Mon, 18 Nov 2024 17:04:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75f2b37dd0a0eab8e6b179d745d79824893f39fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

