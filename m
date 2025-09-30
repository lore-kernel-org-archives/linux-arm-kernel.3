Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B89CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 01:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0j0vAl3eRLGN4/I30I3xv86bV0vXQW3ijiublsdFFPk=; b=4T6Nm7lR9xR/Qftbceu5nofG33
	Appn7pTwD6Ia6oqkIshm3Jo/BmvdF5nMi5axfqI1NKh8UvyixjzkBTU1TsgGCTWlE/Hh4PjpL24yS
	0RfjKJq4NSJe9RsHTka0WbtrucuAc1oYjOZQ+BAo4B9U0sgFbabxgUJNnBnv3sPG72NZyowXTPJlH
	CBUGD7hY2IJadRp2ZooX18hEPS93kkZ5Ue6vjVCtH/OlGjqYNz/GGy5HChVU/et7m4Je346tpmF4T
	ZUp2MIIDHA4BB9BZAjpI+es5d6HQkhW3723rb23cWlsDnrLQgN3U0YQvvFoimJobrnIermC95oo4I
	2aCJcjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3P32-00000003mAN-3PSZ;
	Tue, 30 Sep 2025 01:20:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3P31-00000003mAC-1xn0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 01:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDAF2602DC;
	Tue, 30 Sep 2025 01:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81021C4CEF4;
	Tue, 30 Sep 2025 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759195254;
	bh=X22pEFpCAgMRW1UK5UodG0zf7Y6uxPShDgKLYOKw3ZI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lZXEQkeO2EVxyntPgxq6Gql93fRNspkOZNZtbl+lq1HcCX92H2oyukLagXeNja6BX
	 4DDkkDTh73oK4NoG01u8DTfeIjtW62B/F3nHksUOqYE0Ikz0jyXEHFEAVgFZU5Ryi9
	 ACauuux9ZdMqfLx0/QTD9HyfbDKCEE3uCtnnSeEk1qBglr9aJc/BSpZNQlSEsJf68U
	 tlIfrR5E//B4cHQJko8c+fR6qhncw/ghsPML0WHBQ1d3RypmPoK4d6Bcq6jq4AjPje
	 Ud1xR/NDusWUt73DHEwJFJQNzWE2j3b9VKO4O0aypsg+oCLCXkG41Aq1Z8p25T70Fi
	 4AfClI+xAaAVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 346C139D0C1A;
	Tue, 30 Sep 2025 01:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: Drop frames causing HLBS
 error
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175919524773.1775912.3053137579146685906.git-patchwork-notify@kernel.org>
Date: Tue, 30 Sep 2025 01:20:47 +0000
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
In-Reply-To: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
To: G@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Thomas@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Rohan <rohan.g.thomas@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthew.gerlach@altera.com
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 25 Sep 2025 22:06:12 +0800 you wrote:
> This patchset consists of following patchset to avoid netdev watchdog
> reset due to Head-of-Line Blocking due to EST scheduling error.
>  1. Drop those frames causing HLBS error
>  2. Add HLBS frame drops to taprio stats
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: stmmac: est: Drop frames causing HLBS error
    https://git.kernel.org/netdev/net-next/c/7ce48d497475
  - [net-next,v3,2/2] net: stmmac: tc: Add HLBS drop count to taprio stats
    https://git.kernel.org/netdev/net-next/c/de17376cad97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



