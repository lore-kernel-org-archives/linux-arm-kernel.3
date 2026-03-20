Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B21099B25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcJW0sGo4i9FNDgdetdbLzZTx6ZoyfqEjDULFod9vVI=; b=MVAckGvadzAnuDD+FN2cko/F/k
	S6WM8BcI9YDjr5GF60U9iYggWqHmRgn8KxWx6GhaPXCsPuganvXLG+vK2oVTUU+yPzaZpL7PkiM4D
	84bw1QYHqZVIV9svhWstsxpE3vanqLQUrELftNyhjivKFkFKvD96M1pym5CEJwQb0HX74NCbU+w6u
	1u4hq3na0DY8ra6mtyAx6/SLggwxow3c8+L3lYconB0Bz/ChMuDHa7PDU9V+Z4UPOU8EPR+Ff2EJU
	LYNPgGjzGQNn7NBStYp0N7zlhnshN4k96COkjn2ILn1b9uGI24HJ2xPXjAMzSRfNWkEFkWpOc1pP5
	/uqZiJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dQC-0000000DDnK-2fqP;
	Fri, 20 Mar 2026 17:14:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dQB-0000000DDnA-3VuA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44D6D60141;
	Fri, 20 Mar 2026 17:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF59FC2BCAF;
	Fri, 20 Mar 2026 17:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774026842;
	bh=vobI6MvpdyQUFfdSmmnl5x1t9nnyeRXqQWzfvsmv698=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=K9YHWCZQjk599sV0bY51N6T6IyblkC82DZ52iT9aEU10iz29ikBnSv9+me6Lrqs7N
	 ITT4h1aEqpzdNmFVNNIGe0CMcr2alHJX4HDPCdJHYbYX6UNa/aqSfkN10ZCEY8h3lV
	 1AhuvWaUUhOFbrvv8qnoydYxlAsuFvZtXlIuOuB6ht+4smktAYC64Wq1EFJW3DdDdK
	 cuDgJPN2rQheIBM8KWU2nddNJLGPNba+zCcVSiW3wFX1Mztjw2zR4cB4lgJyIzPQTu
	 nDbJpvDWjN6YO3WmFsB/E94x9qjgf5VneM9/isNBzIh+hR7Xm+uX1V18BQxDYMzr7T
	 JIX621mP4dlsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE85380820D;
	Fri, 20 Mar 2026 17:13:53 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v7.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260320110521.2044803-1-ulf.hansson@linaro.org>
References: <20260320110521.2044803-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260320110521.2044803-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc1-2
X-PR-Tracked-Commit-Id: b826d2c0b0ecb844c84431ba6b502e744f5d919a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c715f13bb30f9f4d1bd8888667ef32e43b6fedc1
Message-Id: <177402683210.2580860.4459123395605968664.pr-tracker-bot@kernel.org>
Date: Fri, 20 Mar 2026 17:13:52 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Fri, 20 Mar 2026 12:05:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c715f13bb30f9f4d1bd8888667ef32e43b6fedc1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

