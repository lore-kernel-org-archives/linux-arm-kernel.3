Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62CBCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buxs2p/Ur3yC6zCDQ+jx+sOs8cJ0//vLfMFj3XACJbM=; b=K8d56pm9ICPOsTviez5iwvjbOa
	X255vUBlzfc/NlHtqO5f01Ap6Z0yxTW8y1knb2cDJnk4N4zitd41e2nXuuxNYZ7El4gaQYjr5XQFW
	scmiKXtWS0EWAU9rrM0wvtV0x8tPuHdXEYl1b63WW+Mkp0+TO+QemlxpvbXlzlufIlvaAW9mlTNiD
	+lZqf0jEMf5qVNYsBM2rLPOhDZPt/PLekj2Y3FPpJuDpnC1HwevhX0oiu3PnxXtguZ4/mKn7ceg4Z
	o6+C1lqy82BuX5h6X13GLXZq2JfUjdrOBXszA43MyDQ/9XN/P0nijO3Jw57s9rhz25WAfI1EtnDUL
	jg7nif/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHkZ-0000000F1Ai-1ZNo;
	Tue, 16 Jun 2026 00:33:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHkY-0000000F1Ac-1GKT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:33:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C374600AB;
	Tue, 16 Jun 2026 00:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206431F000E9;
	Tue, 16 Jun 2026 00:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781570033;
	bh=buxs2p/Ur3yC6zCDQ+jx+sOs8cJ0//vLfMFj3XACJbM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FwUbhod3AiK1VF0Law26X8p1TWnVevs3T7TcPpO2ObU1Tk1135/Rl3/1lOTTpFOzw
	 0g8YS/UdDXq6bNaj7bMLroS22y2qp+gUMcq6htosK5JPDrE4PIRbGdY4sYBlbbLS8Q
	 FHYJ0iNKuwTSit/jtCm8AeCGjb7d7Z7XR4vl8/0SmOFhAkKkrL9Yo4rXpcYC5lQLBy
	 G/1ZVDFVpi62t9hu/VJSLNU9rb1lGwwWOiL7sewumzR/AJxi2qBZIbwzF8vu3/4fl9
	 euRZQwCpMU9ZxkCQqv7wOsetd73EkbSFaby7lW4MbBv0zElJVQzhp6y3o3gkA/aFrx
	 bRpGgL7ApJVNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4FAF13839A26;
	Tue, 16 Jun 2026 00:33:49 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ai_PGPYpLyFr2Vyb@willie-the-truck>
References: <ai_PGPYpLyFr2Vyb@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <ai_PGPYpLyFr2Vyb@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream
X-PR-Tracked-Commit-Id: 61c19a9feb1d87156e46e38d7759f3ad23710e24
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 80476f22b8b7e193b26f285a7c9f9e4b63abca16
Message-Id: <178157002783.358810.8206806281627742561.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 00:33:47 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, maz@kernel.org
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

The pull request you sent on Mon, 15 Jun 2026 11:08:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/80476f22b8b7e193b26f285a7c9f9e4b63abca16

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

