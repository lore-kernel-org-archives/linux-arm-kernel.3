Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E160A6F6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FTUpD0mX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nZ4G2aMp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wgDvUWHtOpfwxy7l3pZ9EU/KdeVcAx3Bsh6BSQG3GyA=; b=FTUpD0mXawBwCb9hXkVrajE/Zd
	jyDGa4iFIz+f8dBDEcGTSU1eU2D5m77fEXct97nwjSH2Tpi5cPXIexukszF5JFWtvtiJuPOVfcQ42
	HnU8bf87fn0Z8dfOjzr4TwFbtHPsoEfyu6vt0TAPcKl1yNKMhyBfl4Perrjf+Go/Kyrw8w+ozdKfw
	9Dxfr+VN/7j5kis8KBjy8IKc/ajxKbGaNiz93NHHIdwCRgMySp7b5Wj9JxqjoBtVSEIOEPsSXY+Gc
	ZMOn46/pBiku/KJg0arj+wtUOUHqkcrrUCmguMw96KZlo4krlMj7GVVAUfkuaUKIh+YAwFYuk4ulj
	lhTpGH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZZ-0000000Ei02-2mHe;
	Thu, 22 Oct 2026 18:31:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZS-0000000EhsW-0hdn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF6C143FE2;
	Thu, 22 Oct 2026 18:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77CE1F031E4;
	Thu, 22 Oct 2026 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693881;
	bh=wgDvUWHtOpfwxy7l3pZ9EU/KdeVcAx3Bsh6BSQG3GyA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nZ4G2aMpXmk1oXkY8Pypof2Mu6hkhytqEVhK2OSVkigVDj2c7ml6RQTdtn1k1HCfS
	 LTQd8IblkD+H6FKWSLenbW8iORRmVJEVoDWHXOxJV8/ffv3nCgFz650XmOucUFpc19
	 hT5cIP5aq35L8Uys+C6gUwJ2tZNf3XUXMi1/D07DqY0r8DkGKvpBhpl71e68707cMH
	 kosBKhKfwOpi7WNxgiK0dJbKINEEjdudEDBevloRdMV+C0lKr96GJME6H5Lm/7jIJU
	 7CjuFR+POR3wWlYRxnaTi24IUF9UHTbQrmZsxvNh1atC3U3y6Z85T72T2smQ5VG5Yw
	 6HHbUPcCiASGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BFB2A380822E;
	Thu, 22 Oct 2026 18:31:21 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY2rFwmcxXvJSp9=QX5fwNSzhBvb-mz7Yu=4ddW6q_kpCQ@mail.gmail.com>
References: <CABb+yY2rFwmcxXvJSp9=QX5fwNSzhBvb-mz7Yu=4ddW6q_kpCQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CABb+yY2rFwmcxXvJSp9=QX5fwNSzhBvb-mz7Yu=4ddW6q_kpCQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.4
X-PR-Tracked-Commit-Id: 01a40ad5a9687ea5a837857d4b21ddd764be7aa3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6876634d0fc254362ed6cc4f475c16ddd5e2c0eb
Message-Id: <179269388065.87271.5732085592566179416.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:20 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

The pull request you sent on Thu, 22 Oct 2026 10:37:40 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6876634d0fc254362ed6cc4f475c16ddd5e2c0eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

