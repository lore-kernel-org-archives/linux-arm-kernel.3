Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EA6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHkdpvcvae+XlM9B1Tac9R/7CjGL7hglrxAd0qzIPes=; b=uBhvBpvKn2lq+l6kTL4UCmBMlq
	Mo3BqRufKLjJghUlD+D1R5LCrNW2h3egFCbhag6DdjYs5bQpkEnCzJQTy3DUpToH3wbk57qH9fpHo
	JiBXylvgVSC83F3h6MolZfm24gX+8p4pCykhKZ9H9V7oafqTNRegVDFFp8UBNlQn/eUpDhuJPEBlL
	8z+TblBXDztCNMMgKqlY8VYdA/aQWPFuHw4QGs1LcmqeqHwCKGwY3/l6f7ObYlZJkSwAx453oX3qi
	pZbTglmdnZqRQZbK51RA+Dz/faeIUGqoKhft09Op4HeMLTRtUNvSy2qZuLJPWWWFhN5/YsKA373l7
	IeRRa7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgzB-0000000FNbZ-25kx;
	Mon, 24 Feb 2025 22:31:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgxg-0000000FNGj-2wNp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 22:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF0435C6D4C;
	Mon, 24 Feb 2025 22:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC08C4AF09;
	Mon, 24 Feb 2025 22:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740436202;
	bh=o3/XUGQL0m+SzquU2ZDcO4lPV6KEAziuUL08AurUYbE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qGn/0RpawzHOsnFvI+rH6yVY8sEZBQ4Ru9LrvwomnSMOBM7gbURtsNY9Tltn1QPmO
	 7b4pV2JXHvEvlBzcG0GyAS17NEYI9ssMVLZdBocr77Hkrm5k7gQbEEVLaAu7SvxW1/
	 yTiGqcWzIszCb+0rVsvn4BrBdeONccFpI69Yk+rDPB05jmJNtAk0D43Z/pLcbaUdl4
	 Af6dWoKh9cva+nTOa6RA4ORrWVuwIJvsBa6ziNpmn9hL8tHtMdkI03cCT36xZ2lF9Y
	 4kfbRDe+YPyR1bd7yqQ7gbnk2MCWvLagTJkx0DATywvCPBs/muZq/qqLtMeaOBHncE
	 //vufIbOmc8fA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D6F380CEDD;
	Mon, 24 Feb 2025 22:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: Correct usage of maximum queue
 number macros
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174043623374.3631570.5317337904130972259.git-patchwork-notify@kernel.org>
Date: Mon, 24 Feb 2025 22:30:33 +0000
References: <20250221051818.4163678-1-hayashi.kunihiko@socionext.com>
In-Reply-To: <20250221051818.4163678-1-hayashi.kunihiko@socionext.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, chenhuacai@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_143004_783991_3A67A830 
X-CRM114-Status: GOOD (  10.41  )
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

On Fri, 21 Feb 2025 14:18:18 +0900 you wrote:
> The maximum numbers of each Rx and Tx queues are defined by
> MTL_MAX_RX_QUEUES and MTL_MAX_TX_QUEUES respectively.
> 
> There are some places where Rx and Tx are used in reverse. There is no
> issue when the Tx and Rx macros have the same value, but should correct
> usage of macros for maximum queue number to keep consistency and prevent
> unexpected mistakes.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Correct usage of maximum queue number macros
    https://git.kernel.org/netdev/net-next/c/352bc4513ec3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



