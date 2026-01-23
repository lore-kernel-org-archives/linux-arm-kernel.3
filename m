Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB90D778BD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 22:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2mpCO9JlhKqni0TfYjgdsxcs7R5ACWH6kA0kbTCQoQ=; b=BvofFc0fyYoS6PMYSR8BxtF7YQ
	xFqnJrL2i5bIWQNiRZQsADONUk81eLyF1ZNK9xQV5jBeEhNZIx8lEsviK/kJyOWrZVm0tGGiAFrJ1
	smJuatTH7oVl1n8zdLXojaWcmK9BOGS6BrDYpOLhmrKLKz98mMT/gOzwPIGylxMHnjDVTkLnVQFot
	C5pmm2pj1SmDO/uTz5VKka6dV6gAh4M8RbuN4/wWosw7XasPhj0RVbfAnOxLzLNmdgbm8CO5px8Nm
	t3dXVP0F/H+oV1oqS5bzcGV0NCbDO/QUKfcTz6HfLNlt1+l5M+VvEvNv3Wuq3TUKEpb2y4Q6xX0s+
	kaWqzLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjPGT-00000009XBl-3EPJ;
	Fri, 23 Jan 2026 22:04:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjPGS-00000009XBc-1ajG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 22:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 582F060128;
	Fri, 23 Jan 2026 22:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F4DC116D0;
	Fri, 23 Jan 2026 22:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769205833;
	bh=Ho8xfshsVSbQoZIVYaWDgYNUfedQj1qZA2B0BJX+LQY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qWITp95QAuplDbtz1uX5OUuLW20BRAYRj5Z0wZ3YU79C+637yK0T2Dn2m+KVqMSJd
	 Xeu2yIkH/+pddEa+YzLsWEENQYewEQW2U13fALJniufjvtrNOSo1+nkXzFghAhfOPF
	 XAqPuTGRFZyuz3epET3pvVk7HTxDkk1l/S0CAg1XzTFRusz4/j2gHpsp8u03IDFQtd
	 qlfj0TOfzNQ3TVPfteD/pV2mnB6PyMkGroUkrVMzZ5QVRzrmdyarvUCOigib5de0mt
	 mdNszdpiKnxdioRQkSmA3y1n7kJlryspubw6jwMRITt+Ml3DXWECm0pzUiFuAYWGl9
	 J2zMiu8510kkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 118E83808200;
	Fri, 23 Jan 2026 22:03:50 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <aXO_6oqyqGevo4XW@arm.com>
References: <aXO_6oqyqGevo4XW@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aXO_6oqyqGevo4XW@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: e2f8216ca2d8e61a23cb6ec355616339667e0ba6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e85d3e9d581eb6047a2a79f088b1934e30d81a9b
Message-Id: <176920582864.2729567.1245186046879666996.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jan 2026 22:03:48 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 23 Jan 2026 18:37:30 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e85d3e9d581eb6047a2a79f088b1934e30d81a9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

