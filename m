Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D1FC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 00:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePpDNLhgyrovpKhMe6XeNC3mdjvD/1M+ky5q+o2xglw=; b=C7UhXRr6um4EdkQTVm0172+Fw3
	0Z+Z3GhekM43R43oyM8fEjJb7JNqoPP56KtuvA6q+oW79vwNpz/+3pydQGPv7oTHV9G0I3uMy6Yk5
	DGZwJ2QrV3F7CRC/5Damo03sVmtvU/YCZ0INfI7cKEjyCba5L/QUrw1gB6UG3Uo57IgSUF22DUeyr
	LlGNdh+B5cgSPcGbsZNPZzUrA17yEKgT2M4UdbDGvFxWv8zAA+RHTaI9A21k685cfHFrMZBH53ShY
	75DSWOJXtS/118K8cICrsupWx/CExE+3LfIFDm0YgeHjhsxvkXFbjhOpcPX4PvSx/tYoNqtZmCuBc
	q+OAqEyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSPfi-0000000ET9L-1HMj;
	Fri, 20 Jun 2025 00:31:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSPdT-0000000ESxG-3DdA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 00:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91CEB5C68FF;
	Fri, 20 Jun 2025 00:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED43C4CEEA;
	Fri, 20 Jun 2025 00:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750379378;
	bh=N/gX/lWCEFFVFMQQ7VNG4vFBfHvEobL5B9N1XSTxf4M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HixbY1oqNPcCqNjxGWpm4tvHipUmhS0SLjJZ05lfdwT4b4aq3PJPaa49yyqUgzEeo
	 rGg5Fcpb7pOstveHIE1L/BW/suhRF047nDzkNuFDU7c5BgxkDNhYspBP9tdjpkMP3O
	 1Q8a6UUijaYShbxgpsQvA7xl+S1+qR8MCqyHMlfGp5rIoP3Y328m2rKwenE5UrGn/v
	 OE0jqAa4Gx+Feiv3qikzUt85pzRlit2MfjDkzpjsgCW04DKntqBJX3y9qmpuung4QC
	 rnpSow2TDGkjFRNA/yvpdUQSgju14xQ4EYnSov2vgVgrAl356pdwqNR4X5xNM5xeYF
	 vtbhnL8bfIuPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE538111DD;
	Fri, 20 Jun 2025 00:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: ti: icssg-prueth: Add prp offload
 support to
 ICSSG driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175037940675.1029963.6639645780461563048.git-patchwork-notify@kernel.org>
Date: Fri, 20 Jun 2025 00:30:06 +0000
References: <20250618175536.430568-1-h-mittal1@ti.com>
In-Reply-To: <20250618175536.430568-1-h-mittal1@ti.com>
To: Himanshu Mittal <h-mittal1@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 vigneshr@ti.com, rogerq@kernel.org, danishanwar@ti.com, m-malladi@ti.com,
 pratheesh@ti.com, prajith@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_172939_844151_67297A95 
X-CRM114-Status: UNSURE (   8.95  )
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
by David S. Miller <davem@davemloft.net>:

On Wed, 18 Jun 2025 23:25:36 +0530 you wrote:
> Add support for ICSSG PRP mode which supports offloading of:
>  - Packet duplication and PRP trailer insertion
>  - Packet duplicate discard and PRP trailer removal
> 
> Signed-off-by: Himanshu Mittal <h-mittal1@ti.com>
> ---
> v3-v2:
> - Addresses comment to fix structure documentation
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ti: icssg-prueth: Add prp offload support to ICSSG driver
    https://git.kernel.org/netdev/net-next/c/83010fd9225b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



