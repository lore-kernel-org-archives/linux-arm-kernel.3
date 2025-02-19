Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D44C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 02:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TGWnNIISO2lgDfEvLrQ60jvEyD6AghmWBvzC/AoL/s=; b=eAphDT2gK8Rvfbl3VuCoM05tGd
	EqFQhTWEA4N1Sx7Gk6Amox0B1vot2nCbxangWYze/lzmHjYOAuWaSqOa69KTsCWrQf7g1wyl1Ntqv
	cOI8MshbJBXPxlF8fkiy4qzywS7PxG2i99SdH+HBVG3yAB4jpq333meO6uclNJGVPRAbGypSpy8E3
	4L+YquYpGvMamtl/ww/Oy3ybOfiP8VxQvO4qzjWfFvwCSg/U62BJIwJvYKlB2EvrHE01iKnr954rm
	KjSLS7MR0B4zIQ9cmc/bgqGXvUhDhNK3ETVaup/KVqIXaG/VcmUbeRjRf77QH4m0FVXQv/hlaqIav
	v7kxDuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZYt-0000000Aca0-0cye;
	Wed, 19 Feb 2025 02:11:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZXP-0000000AcJB-2mg0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 02:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A04F5C639E;
	Wed, 19 Feb 2025 02:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159EAC4CEE2;
	Wed, 19 Feb 2025 02:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739931010;
	bh=Z0WAYTP5t5HoX8DqmVERIVdaskAAhcdNe0AiiDINO6U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TxkmnY31IkOQmOZM+aH+OldrAC6mQieZ1fHxgLvACg3liDAAQDdZQNPWRcGxpwD5m
	 d5V3OeZ3G9Nn6u7vaObZ9PcQ7V5weX3eJqC3lVI62/vbkF7wYgSUi9X+x1KlphjnkO
	 Awm/XydliMGpWvyKM5C1tR7eN77ImL4Pkd/rS9UV87uarIvI2S1uXHyMIF+8BjiSCX
	 InHLKSkHHI10vrrWdP3YYoVdTqzn9WXfl9aj/NTTA0yz4uCOPw5Ielg1yH5BlI7UXp
	 FaRHmsgy2OEUIa+pkFl1xVedG0DwTym2QR3p52kdB5CA+aqlCS8dabtqcFQR2FSFVO
	 fp+813Xsmx0lw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE420380AAE9;
	Wed, 19 Feb 2025 02:10:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: xilinx: axienet: Implement BQL
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173993104029.103969.8111544121026009764.git-patchwork-notify@kernel.org>
Date: Wed, 19 Feb 2025 02:10:40 +0000
References: <20250214211252.2615573-1-sean.anderson@linux.dev>
In-Reply-To: <20250214211252.2615573-1-sean.anderson@linux.dev>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 kuba@kernel.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 edumazet@google.com, andrew+netdev@lunn.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_181011_758750_94709EE2 
X-CRM114-Status: UNSURE (   9.37  )
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

On Fri, 14 Feb 2025 16:12:52 -0500 you wrote:
> Implement byte queue limits to allow queueing disciplines to account for
> packets enqueued in the ring buffers but not yet transmitted.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - [net-next] net: xilinx: axienet: Implement BQL
    https://git.kernel.org/netdev/net-next/c/c900e49d58eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



