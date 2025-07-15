Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84099C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7bNWSVRBT2jFbJpKvwrD8v36GlHW1VJg4PNPsWhEm4=; b=uxc557w7pa3R2IFBGskSB+iwfv
	9fuqHXB+gFlvRQWSnxtqSwKADIEF+liBj5Y4SE48ecq2+jSlmGlkAmAXKbW1ho+mr/edJt26Cx2u2
	pbdoTqyBd04MkRogcuT7taLDzBfeJkOQv3oRpaABTOKCCU5QVDQOry0mQpNwjKMxTxFf+dN436d/p
	/IPoJ+K/++hUWshQwQF1w9I/EfavRx1nmMvMMrli5qNGM+rcJcO1vQBM56YIV9bwBbkUOmIy9OIpJ
	zsS2cFgpAv8bggVdheBu9hCkOHBerVHVgF4MM0D+EjoU88zn/1Kx0se134g3GG94zXAVgTF49Ai3a
	X17HdP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTcZ-00000003efe-0WcA;
	Tue, 15 Jul 2025 00:34:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTYj-00000003dqK-25Yg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 00:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3465F5C5DBF;
	Tue, 15 Jul 2025 00:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BDDC4CEED;
	Tue, 15 Jul 2025 00:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752539406;
	bh=9Vz+b5iFtjY5dEJRe0302Zp/g1f0YHUeToEdiuiiTLU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=svnbboMjqHQDhzc45b2IpFsLnGtQfBHvSZPDqLfepYUmyZr3E1LVrQYO6sSB7jaT0
	 ES4eRrWSDZ7rXKQNNpWn5/n7YIgxToori2YXcZmkDGdH3Lo45YQyulSll/8xvaPNSE
	 L2KhW6hHgAI/lFYuGlJ7Fqx7lPsisXG5ijadWCQl+iT1kJoZuo4OffYFvFtqggRcTS
	 pGHKWui1Ror/LTxjM7LKBaOfNV9F3b+lTHSvU8EczucvJDBFME8bZFqKcaWsR5Ko2R
	 TwnH9o/I2ljAIvumS5HrEn7TP0JPm0h1TfFPesYly/9vIyURtHULGsart+2YWId1+X
	 oAw4fyBB7JDEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEC1383B276;
	Tue, 15 Jul 2025 00:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: thunderx: Fix format-truncation warning
 in
 bgx_acpi_match_id()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175253942775.4037397.6464344303980348898.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jul 2025 00:30:27 +0000
References: <20250711140532.2463602-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250711140532.2463602-1-alok.a.tiwari@oracle.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 darren.kenny@oracle.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_173013_764697_D0AC6B4A 
X-CRM114-Status: UNSURE (   9.57  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 11 Jul 2025 07:05:30 -0700 you wrote:
> The buffer bgx_sel used in snprintf() was too small to safely hold
> the formatted string "BGX%d" for all valid bgx_id values. This caused
> a -Wformat-truncation warning with `Werror` enabled during build.
> 
> Increase the buffer size from 5 to 7 and use `sizeof(bgx_sel)` in
> snprintf() to ensure safety and suppress the warning.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: thunderx: Fix format-truncation warning in bgx_acpi_match_id()
    https://git.kernel.org/netdev/net-next/c/53d20606c406

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



