Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7233ACD98FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXDPYV6FaGofHC5e3LeKXG3SaYnogPbrvQqTOsV8EVw=; b=rmFi+jVThxEGVDa0VF5wVySo1P
	txaVfyZGeXAzmjz5xxshoWEtQz6xdVW1TONhhWbYLcQ/FI+ty27YSbvoxlp0qTGfmhFvxvqQIMfbn
	ebkIKVwnlY2lHaK3Flppou4+hQIvLnxoxnLqC1LhYQkPAd73HOE0LDA9uFrJRmYo1bue36x1UYnCh
	CpVzUVUpLY6ADoQhrrxDz2jGF/q6Os95a8KEET9Xbgh2N8P376jSv3yG8VXmMQhr5td4v8z+rnbh0
	j3s/zn+MUaK3cYsfl7n/DvppB+H4NuqJ6ZylMfI6grOswZatPhSw4DnGTrPd8pWJ2obLj023Z9cIm
	r3KyWnxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waMo0-00000001sqC-18zQ;
	Fri, 19 Jun 2026 00:09:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waMnz-00000001sq6-1HK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 00:09:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5E05439D4;
	Fri, 19 Jun 2026 00:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8909D1F000E9;
	Fri, 19 Jun 2026 00:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781827794;
	bh=RXDPYV6FaGofHC5e3LeKXG3SaYnogPbrvQqTOsV8EVw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ip+C5K6Ch/g4Mtfp4Eq5IlR9fYhfadgwbM43Ay6buwirtd3X1jKkGyvIPS2vIrs71
	 JlGQNiK92Mw8ne2G5nwVWtdht5xqSdNNOvKvQU4mpj+y1itXZX/gb9DHTzENIEC2Tb
	 4GKOc9Kgk3RHS5RBDnv+3V1Pwk1rdCKh7YPyE40K0vlhxed3MPRav5tgAiU9DGruqK
	 VDSxqwOzG0S32G2HlReMJEsBBiHlIQYWKxQ0IbGuvpDc7Ss+EhNjhJrClQgyw64gTA
	 Brrb3Q94u+XJEwAniy23Bj8PKF3ox4qpTQsI5GwK5agZvBa8XmYfzMDnlpMrcR3bKF
	 Ta7WEQjewP5hg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198693A5676C;
	Fri, 19 Jun 2026 00:09:49 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260617090546.18688-1-ulf.hansson@oss.qualcomm.com>
References: <20260617090546.18688-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260617090546.18688-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2
X-PR-Tracked-Commit-Id: 528ad521a433cf873724893bda339df95d8ac1e0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7849ce38717e64213bf9cbb166d1cda14e05143f
Message-Id: <178182778768.3120511.5297628949177706525.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jun 2026 00:09:47 +0000
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Wed, 17 Jun 2026 11:05:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7849ce38717e64213bf9cbb166d1cda14e05143f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

