Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91BC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5lAbQnPcXApM8835iE9HIiKmxCrViQ7fRtEowToby0=; b=CKBNg9RTnKQmFJbjl+oW3IEBaH
	pDln2vwSSMQZXRi/locUJTRI+AzdRWL6YDpp+0Shj+7hR2EQwiJA88elob0fZbDW7vDrii+GxDubo
	X7Hw6Gjsih9kLZyv43t9Wqf1DWo0iF2gIhFQv3aHfvW7vDn+4hew+droBaOPzFOah336E4twsVEf6
	RgAaifPo4SJr2feePmlayiRXgy30nOozivt3x4A01KJHkuxukirTpmYA45J1DZclavCSHqpg4gPaP
	4HeS9O9EdbiPSw6/w0Cu15ukyqMZyohyaCRrMQNmu17WK3/gbVT62IpWL9vF57blMG7Z5r04n5Kh3
	+ACTRtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvGoX-00000003vkY-0GsW;
	Sat, 15 Aug 2026 16:00:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvGoW-00000003vkR-12jp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 16:00:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F6A54085A;
	Sat, 15 Aug 2026 16:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4491F000E9;
	Sat, 15 Aug 2026 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786809651;
	bh=c5lAbQnPcXApM8835iE9HIiKmxCrViQ7fRtEowToby0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kv2mv3/6809FcHe9aNwO0UuIfOyh58KCgtqdAZF3bT04vYCKorAH24bUm5az22AZM
	 cYdz5pYqbqFFxAjVbsBOHcj4BEMbdicP+XlkDfNZknKZmpgniXDQBCGlTMC98H8+Db
	 7uJbFA/tW+9DrQIs5qF6gyqNFzseSo18oNixeQWvmunUslepDbRCf7MG0//qUOzooH
	 bh1XVQkjAMlMcpnRW5aKC7d0PnE29hyksAMIfSmSc9UYpOg3/XjxruRetMPBrG7jXR
	 HjX1Ly3shcsJW8/PXx7V5QRFleQvzvAud6LXrcnG5vK4HIwvHcRATFTWJmUf8dAfEz
	 9HqWjgO25UrSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id DDD863924A48;
	Sat, 15 Aug 2026 16:00:05 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 7.2, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <308796e0-962b-4e8f-bd2a-af5be9cf15a9@app.fastmail.com>
References: <308796e0-962b-4e8f-bd2a-af5be9cf15a9@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <308796e0-962b-4e8f-bd2a-af5be9cf15a9@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-3
X-PR-Tracked-Commit-Id: e36c0670d5ebebd7dba493f14966051f354fbb34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
Message-Id: <178680960474.22095.2957894126110984585.pr-tracker-bot@kernel.org>
Date: Sat, 15 Aug 2026 16:00:04 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Sat, 15 Aug 2026 10:15:49 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3eb40771c00a8488fa6ed2cc1fe203477908bf38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

