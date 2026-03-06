Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38DDFCC05A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 18:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSuVjF63a5MAFUk0hf9vyAy///W/mSPUlqEwnpB+oW4=; b=oNmjsWkJ61bCZIQlAd5QxhhNh8
	Tit7C87XsqbXHNG4QOhA4sa3ViG57+rxmNfsT9WVOIopx4S5w0wUygFI+7DFfK+jhRyMKhRwyDppy
	2vK6dBaM7fuLdzYNYYdwLBh1sqj0i7S+Vb/p/0JpKVhdhVpM1awa+9dC//TTHUJm/OEkv+31oaEbo
	EgPb2zC9MY4uzpBnrQzlLThtQOKAQVcfMrmJua3LfKznS1HbxTiJrhMk1ONHZdH4wiOWCd1CqIuXx
	n3Cu59V4imNH5o5hRXSip3SBrrbr3kVEWEp1093ZCwIGWgKr+c+seYuZrzhrTYuLyhURFLTz86o0h
	glfbfSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya3w-00000004LOs-3ghl;
	Fri, 06 Mar 2026 18:38:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya3u-00000004LO5-2ULf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 18:38:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94CF9444BC;
	Fri,  6 Mar 2026 18:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7245DC4CEF7;
	Fri,  6 Mar 2026 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772822289;
	bh=ZmoqSWZUjUvRcBPuXLNW9lpM1fsrJZIyolwlWt6ye1I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EW+EGpSM2RhTcLyymSlb6qV2H3KkbXxoOXvF0d/35wwSHckxbGFztnneHfEQScJcQ
	 z5lcrA0RqfxRSclaBpLv7BfHlS/9Av2xYZz1Jeuf9B2hif7LJ6ykbm3bkQoL6i6qk0
	 KgAGRQkJIBWKUSNvmBdBAS6ja12TaNLtPvduXK7YrlCeda5OI18yEcki5fF5Z6OCAF
	 9lRvYp3J9HIen/fJdVMHJ2fNwDTYQpHKuBVXrYLgeVhpaBYBijEMUVmvpJnGR72qAm
	 pM42K3KjVUWJ1QBhFMqCxdeu9X4GxPd27XAaoEEXhrIL8gI2k1EHhsAB6kOvsPk/Vs
	 MIaqNJHJcJTSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02F3B3808200;
	Fri,  6 Mar 2026 18:38:10 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260306104356.60885-1-ulf.hansson@linaro.org>
References: <20260306104356.60885-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20260306104356.60885-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc1
X-PR-Tracked-Commit-Id: 0fb59eaca18f1254ecdce34354eec3cb1b3b5e10
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 345dfaaf9f8b8dd0fc563e6f48586922b38ed11c
Message-Id: <177282228863.7628.6753035738379589462.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2026 18:38:08 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_103810_652081_26D84ED8 
X-CRM114-Status: UNSURE (   3.90  )
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

The pull request you sent on Fri,  6 Mar 2026 11:43:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/345dfaaf9f8b8dd0fc563e6f48586922b38ed11c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

