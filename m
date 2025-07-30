Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C77C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 03:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba/FOb6bY5WanQVf29S2/UJyl+gwJNuBRP96gIyj+Zc=; b=nBLvRJ+/MFbtBR6W6SepaCsbc9
	KH7aRpvDJAhmRhc+UicMwKT9ZHQ651XZIQe8pxvCpAduYm+CTronJJKKdeCv1qWzQq2pX1EAaDAUV
	bkEHKkkPKgEcNbOcqyC1aewP71rLxQ+v1VqMnyBQAu2m4pxlmocIkb6uA2wXWfOL9jL68bytZxrCE
	9YqsP+8NjwZq07Q7hUYfdjt1xUrADQbi9+TD7fbSba1AIPnLYObcN5f1V10w9XbIKdLkDQzn2Iwk7
	Eq8vtKGS+re8Hll/FnQxJUb8gdRmPmg+x5VzYozHbHDGeg0vFJ9d9QicTldw+2bp7cB/Na7t3VnVz
	0T7sgnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugxi5-00000000dXG-3B2w;
	Wed, 30 Jul 2025 03:42:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugxf2-00000000cv9-2oLI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 03:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C313A54EC0;
	Wed, 30 Jul 2025 03:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133EAC4CEE7;
	Wed, 30 Jul 2025 03:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753846763;
	bh=s0UqDdD2vcItUS++pbUmt9deNMP4R43V/iHPYRxJBWo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wb7KMtAZsVftdc8+nnFiTv+JoYboatXo5SYdcCR+c8p+IsJXWf1HRGKeZYXsBhMpM
	 BZP305arnpPFJqWRI0cR4inSLVH6eMDLuG+1nuxVjFjouu0aTiedSsg4tKYd3jyhJH
	 Jv0rhYjAtHv80cJQubSs0kKkwyVe8GdAJO39n52GNkWRPtSUuF31yGmhZ6cBDEXzZG
	 aYTg+AzntFW2jVhmLi/mYKL+o5NsYAgGUq2WlYFK6iJmV1MTSEYfA2WByAi1DCaQoL
	 H3nnvpL813TIIxZKpE5Y51zZfag4uQ2BZDKaMKbXSKR3eSKkAIzU4BoOQXecj3tSUO
	 QmFAQObU+fiUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BAA383BF5F;
	Wed, 30 Jul 2025 03:39:40 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250725143925.1674618-1-catalin.marinas@arm.com>
References: <20250725143925.1674618-1-catalin.marinas@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250725143925.1674618-1-catalin.marinas@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
X-PR-Tracked-Commit-Id: 5b1ae9de71335865d06ff0e60eadcf368a735edf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6fb44438a5e1897a72dd11139274735256be8069
Message-Id: <175384677911.1749338.2052974279366612113.pr-tracker-bot@kernel.org>
Date: Wed, 30 Jul 2025 03:39:39 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Catalin Marinas <cmarinas@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_203924_770657_904117CA 
X-CRM114-Status: UNSURE (   4.46  )
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

The pull request you sent on Fri, 25 Jul 2025 15:39:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6fb44438a5e1897a72dd11139274735256be8069

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

