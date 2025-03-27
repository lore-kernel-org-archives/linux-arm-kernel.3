Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91429C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtPQl+eLuO2Ac2Lg/3UnOZvCGFX/eXnKWsBH6KzlMBA=; b=xnXLJmlYGmPh1re67m1bDlixk3
	iB4bUL1IlvNItH3TlKTnIpJZuRfiypkyNytJkuQ0vbQVHXiE3B2z49YXGOP+OJlXMnzTyqt/wHFfC
	MyIzF55WFWcZTXubUthxrfNljtjaTy/vGKlJCNhViwgnHO61i4Xe6o1FG7AWY21GnffrmV7L45mHb
	sDQkeJUPDthVky0/JXpq4u1nsyi29OAf6exQCs5047AIu3K9D40lY4xWyriHBthuh1oJ8LOUd173q
	3flXemPSg89m7nesaTylNLHzCk8GHcR4aXmYi5eonnHs9Ca5e0lc5lK+H5BAC67cbkNdEiD1tCwtp
	xIF0ihNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsjd-0000000BoKy-3TrY;
	Thu, 27 Mar 2025 19:17:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txscH-0000000BnT0-3DRq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06D3AA42E52;
	Thu, 27 Mar 2025 19:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FF3C4CEDD;
	Thu, 27 Mar 2025 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743102612;
	bh=oIkeI2nu+rYMrOqcqasUHBP1QTKIQUNmf2tbBOB+x7g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bzyxDvVe9/r2ZRAJhdCqhrIkO3mBSeW26HnKOUvCNy7wL34cSMe9IgaYWO6L120sL
	 GGCZg1GYeaR9q2VUMZWQ0eF0EUgj4i+km5BPsGQlNdfDL+YV8+qgZG3WXUtJM7RSJn
	 Qdn2AWeKV5D/QWRz5HUt+mZok7tL38S7O+tQnwgxjOSjhc+L3qP8E5j3MSqzuKa3G/
	 OdlQ+j58Rd0/mOyvRm4kzeCxr8Mna4mTUA4SwvZpB2kkE91MM2djE3qtIdqttP8Z3j
	 SlyKQp2n2LfA4aW8iEisejEjJVZ9xJtqrEpp55TqjzpaeCm50nKUprADXbUdgbaX30
	 IOltKf3DyH47w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34A75380AAFD;
	Thu, 27 Mar 2025 19:10:50 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <9a65c188-56a7-4e0a-ad3f-350d67d854b9@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com> <9a65c188-56a7-4e0a-ad3f-350d67d854b9@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <9a65c188-56a7-4e0a-ad3f-350d67d854b9@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.15
X-PR-Tracked-Commit-Id: 8ce2a15b1e6464a8681fb2f787602fc78f8e2f39
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3bb3396d778816ac7618c522c4cd180273edeeaf
Message-Id: <174310264866.2176831.12484995763614596622.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 19:10:48 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_121013_865187_868262BA 
X-CRM114-Status: UNSURE (   4.64  )
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

The pull request you sent on Wed, 26 Mar 2025 19:03:04 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3bb3396d778816ac7618c522c4cd180273edeeaf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

