Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4179FD11194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 00:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDxnX2J4T+U+iA6sDTSwGsTKu96CqYZMHgACm90bO8E=; b=kRGe1FDmLq9jvGM50Hh6AHEXfP
	Qcn2LGLZERm163vdawI0xteB0wOcp6LzAsnn7vgnv6C4aWvEzZdHFAH3wy0/EhWmfbByoPunndhcu
	8iXrxbA3Vp2JSndkRCRColdZi9nkFWqeOzlXC/Cfkv01JJsRRIf9LZZFBp3hjpokgu/imm9xwAk25
	Sxcrzis+ragbTRjZysFk6B2GF92IL6Wmh+jAfzZob2iyDlEF8sjCNYWydJ23MwYVmostkRm1Zca0k
	CH1HJLPPcN6bpmIwQN+RdGwFJCY0aaanvgOKrjlsxTpyfCjoWigPZEFveJLKi67ZyvIYjClauogs2
	406bVuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7klH-0000000CIKd-1vcs;
	Mon, 04 Nov 2024 00:16:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7jQL-0000000CCJP-3oLW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 22:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD5205C4CA3;
	Sun,  3 Nov 2024 22:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4289AC4CECD;
	Sun,  3 Nov 2024 22:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730674220;
	bh=0SkRTSGIsqiHs5Dh71zvHWv9TulxU8fWVKzt6rhmO3I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BPCMWFHaP3Z8NTmYEyOHOkT/3VHxcCmtgnh91Z3tLN2Nr5AOl1UypTmkHX3jJ2HTh
	 lhxDE71KEBBoEdMrO2GVLBFzOP/+t22y6RPHhvjU3oof3hepLHcmr8F4Hwkosh2AK0
	 GOsQ0gKVwXWd+blPBzRPVjYORcdJL8L+WueQmDzBw6Hp8TkYK7SocYv+2OECnqe8uN
	 QaKosYae+yrLtg5XFueEDZh9HAdyCSA6mstmI0zQgtWCb7FdAyggIPai0/rdFq2SCm
	 jdB/ihBkaw4OtVfXXb3813O8oL36cDsDc3Etpy7UikU7zD22Blj1NhwvhDFCmfQsAs
	 Ai9rimwXOf8ZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF8538363C3;
	Sun,  3 Nov 2024 22:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] net: xilinx: axienet: Fix kernel crash in dmaengine
 transmit path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173067422875.3271988.4124250768668395576.git-patchwork-notify@kernel.org>
Date: Sun, 03 Nov 2024 22:50:28 +0000
References: <20241030062533.2527042-1-suraj.gupta2@amd.com>
In-Reply-To: <20241030062533.2527042-1-suraj.gupta2@amd.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com, harini.katakam@amd.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_145022_015853_1E1E14FC 
X-CRM114-Status: UNSURE (   8.26  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 30 Oct 2024 11:55:31 +0530 you wrote:
> This series fixes kernel crash in dmaengine transmit path. To fix it,
> enqueue Tx packets in dql before starting dmaengine and check if queue is
> not stopped.
> 
> Suraj Gupta (2):
>   net: xilinx: axienet: Enqueue Tx packets in dql before dmaengine
>     starts
>   net: xilinx: axienet: Check if Tx queue enabled
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: xilinx: axienet: Enqueue Tx packets in dql before dmaengine starts
    https://git.kernel.org/netdev/net/c/5ccdcdf186ae
  - [net,2/2] net: xilinx: axienet: Check if Tx queue enabled
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



