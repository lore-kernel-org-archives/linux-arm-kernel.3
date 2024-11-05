Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5B6D1CA0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 01:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3X6H2yWvjoxEZQk4S9UNqoGXZzKBiBUFGlISM0DDB9A=; b=bssze+e52aFvTpDnBF0iD4WUv/
	BFmqaAzW4FhWAKFSk5oCHTQm+/qZDjsr3KvRT6Ftdt2AEr5kgwgQYGyjENIZEfyF4SI7x7kwiSdJ1
	7sjy6tQcXozMfLnsIRtjeHjaiZFJqqLXrlk5J9a7MGCIyoq9dSiMHeZ0DvTRYXHIyjQ5M1Y3QJt+0
	WoXduw3MtMXlWVqZ/2A3cXnO9xlL8ORk3D4+YZCEXUuLutLVrmBcJEtqM0FudT78EESkC6sUAIm4i
	fegJmwVg6tNHYw2vkeQ6cmBTl0xUygBj2Hazht4wxtaBASbuTvJB2nps1u79vyS5+5ABdpAtlTLhD
	GFsKUlEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t88Xm-0000000FabD-0SXs;
	Tue, 05 Nov 2024 01:39:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t88W3-0000000FaPy-3NO2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 01:37:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D84E5C10AE;
	Tue,  5 Nov 2024 01:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A55C4CECE;
	Tue,  5 Nov 2024 01:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730770673;
	bh=Ey24GEdH76YotImuVoSeUAcRFspWSTyDjvx/6Eh9bQ0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WNomAKIfH6Y1wh1TfZs+yK8WDuHbfs7DbAzJClHvj288uq/Uo66G7RcGfe5afKBrc
	 Cets2Vjo77hTG2kBz8Hl6Z54v71ruoe4o3fuYA1ReVTNAIiRY9Evpx2L0rGmb93azd
	 7iXqu7WPUiCN/ZQ9T0HQQu6JBznmi1Gs1OUA080dPuqbBxp0/TnDuY7zHZhwJ0fVUK
	 ds1OX4eoAyMFWociKYbAKWpilltaZ8Pf5Vzn2a2LqVqzT+rFl8VFtVVz3pLXiE9Ogc
	 ioYTor9lKtc7FmHOMKMKkiWR3TGboW8UX1FXdwzvXzuNM9yn5x5vnYObcVzTUGa29T
	 pd0Yh0/iN4/DQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1653809A80;
	Tue,  5 Nov 2024 01:38:03 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.12, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <89b2c3f7-2740-4d85-b17b-ff7cb30c38a6@app.fastmail.com>
References: <89b2c3f7-2740-4d85-b17b-ff7cb30c38a6@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <89b2c3f7-2740-4d85-b17b-ff7cb30c38a6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.12-2
X-PR-Tracked-Commit-Id: bbfbb57958635912ba472925622f2bb0bab5f06c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e1b3cc9d7f790145a80cb705b168f05dab65df2
Message-Id: <173077068232.79719.6602076160879176034.pr-tracker-bot@kernel.org>
Date: Tue, 05 Nov 2024 01:38:02 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_173755_907379_E42ADEE2 
X-CRM114-Status: UNSURE (   5.42  )
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

The pull request you sent on Mon, 04 Nov 2024 23:18:26 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e1b3cc9d7f790145a80cb705b168f05dab65df2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

