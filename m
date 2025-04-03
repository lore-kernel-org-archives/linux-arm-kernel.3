Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29252C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcyyW8n2nXXz5TDbV0rP4CRwU9QzhCUN75UJaK14+ik=; b=3Kz0n+BDvmby+jTFF92uxFDpHs
	EykOig3wXqyxmNLnKI4K7D5VXS6ce1QTs5l/I1RNLKd2I0G6kkzlrtCHOr5nrWluw3wsjCqzpMNM2
	0KqIf92RO9SPCoiif7vFfzO0azYwWmEFc+AMK4Bh/skCLsPIP1jGhQj7Ev1jHUL6Nhf3dovWGpHMU
	JaYfjYhIOoTwF4F84WXeMkGXf3ni1W/GuKghTG/pctwiif1v56rjctX8JGDQWiXSPoL5hK+HEHV1u
	W7O08X6IItl5Z/OaZ3HA6a8SDVvEd3fw4r7H8CAiyeFRiLrzswsCezm1Ex6fOcDU6w8g4G/lX4A05
	7cmZELPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Qlx-00000009sLL-2RlI;
	Thu, 03 Apr 2025 20:02:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QJS-00000009lfD-2AXc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 19:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8516CA4256F;
	Thu,  3 Apr 2025 19:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A421C4CEE3;
	Thu,  3 Apr 2025 19:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743708797;
	bh=Z+NPFKyR/BWMNNcuzNft9Hlawsjf1oqc2930OXUKl8Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ArkuhQYpCO8im1IvYIzZ0Vlnk/Au5w3UoF8D5YeLh96VcXyWUu4geTHRY8Dlt98VI
	 YvrAy9Wi1/Evms802FGWgv/xxEHf5J0iam62nVjnQZsBC86troOS5ylrHPktdsOAKY
	 ISLaAJPGJduNYzoMzKLZBjeFk1VpK1pLgHmHpyMbo3GsLKK0Vtv07nXfCY+8fNlEoP
	 oPOEWEETcC/gNT81vzlNFkiIi0STItzlgIe1fLTez3g607g4sbtrCyi49DhL4PnPWz
	 gcF3a+2QbDVDTK4J59mU9rDmVeM/nXBCrGBVCndCMBCY7V41SnTqnhiMnl+WjpPDXF
	 tuxBaH1x7drOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BEE380664C;
	Thu,  3 Apr 2025 19:33:55 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-5c6hCqQb3s5GxI@arm.com>
References: <Z-5c6hCqQb3s5GxI@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <Z-5c6hCqQb3s5GxI@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: c28f31deeacda307acfee2f18c0ad904e5123aac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aa18761a447fac41287a5c3c41f26b9380bc72b7
Message-Id: <174370883384.2657822.3324006319698061766.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 19:33:53 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_123318_618758_E24A772E 
X-CRM114-Status: UNSURE (   4.78  )
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

The pull request you sent on Thu, 3 Apr 2025 11:03:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aa18761a447fac41287a5c3c41f26b9380bc72b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

