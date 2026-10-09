Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF03CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 23:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEWX4e8zd/mLrXWK/FDCgDIzsdNChaE8hK9xJmgQOXM=; b=x6rWcuJt8+NxWGEMU1tMw+p4Uc
	Yc78ChMjUaqm+vf5Wo9wnMVF24ip1NIKpdP/XfGuhD2BIZIM9aIovHGVSpVuDaCRm92SXghdRZl5J
	O3MHByXuQDsx74n5Mf8W+3z/pu3EKfjs5QAL/1jAUR/bkJ+1edEotuCxMAoSiaNhqydXqM2n2hQ4s
	N/oMNgJ3HaTYvh5WKcJoWpCRtKfzz0nijTj9ajuXUlYJuABGfC8BwOY6BYbfiEfDTew9plH8as0f0
	blI+xVLWIi1wjdzm+bl9bTbQoGv9SuM1iECfcWyh86r0aycbq0/UYSCrOqLZUftqMrpfwmrFUmFTN
	qPEc2WIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFJZe-00000007Joa-3s01;
	Fri, 09 Oct 2026 23:00:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFJZd-00000007JoS-2UFj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 23:00:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D56860211;
	Fri,  9 Oct 2026 23:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422AA1F000FF;
	Fri,  9 Oct 2026 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791586820;
	bh=pEWX4e8zd/mLrXWK/FDCgDIzsdNChaE8hK9xJmgQOXM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=B67TDyDi7QNy4CDRi3NpIlRrnEVQDVkabd9hi2nQAsbiW0GlU/Vw1gFxCV4AeUWR0
	 ZZ+5h+bWi09cF+Ccw2R3rWSodaNgQjNjdRa4bq0WQUy73eKUtEgAec1c50U0h6vduG
	 YsUqVtZn62P3iA1iJCeuLYC/uXaZykoMRMFbulbB1z2OgdaYaPOU344wMUqe/l85zn
	 6I4ubJ8HF5M6jCMEZbe2L+5sd7Ui7izd9hzWlCXzsy/0ymFtPa0CSa6n4TYwqFj6FU
	 NWDp8tYx1qPfez1zHPs8EN6PDjnQHB376QUKK8Frm0oBW5Z4g5IttzxyzG+Kp++MPP
	 fT1hQJwebGMnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A62E39263A7;
	Fri,  9 Oct 2026 23:00:20 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261009115317.14472-1-ulf.hansson@oss.qualcomm.com>
References: <20261009115317.14472-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261009115317.14472-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3-rc2
X-PR-Tracked-Commit-Id: 4c66c423593e26273ea0d644906ed007630c6f6d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9a06d4b7c5feedea819a00af0db1629e43f3def4
Message-Id: <179158681880.1037300.16066360754983974305.pr-tracker-bot@kernel.org>
Date: Fri, 09 Oct 2026 23:00:18 +0000
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

The pull request you sent on Fri,  9 Oct 2026 13:53:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9a06d4b7c5feedea819a00af0db1629e43f3def4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

