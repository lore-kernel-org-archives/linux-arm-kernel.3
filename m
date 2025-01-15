Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FADC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 22:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BHdTDE417XrXq4DqKC26VxDNPUCCCq6Ohtn62Kn7hw=; b=gMXagx4VnX8XNNqsP5Gutd4Y0q
	VRwjQMvvpv5tEH3SFYY/E1X1UII2pJt88PuPxZyTjrGonGb4i45vvVmCZKpa9U3CN6MYqFjaVokRp
	CX4krPPCicqazUq3haOGgpAagtuvUgclqSSkSIBT84XzuAl7zels7Yr9dNRnA0+BUJzdK4SkIu8Wa
	JT466Q/IzrFzw8auqNAhrD3V2ZFuXPDSBgE3KUuOqCifWXWLENBCuuK6CDoz2Eh2dpm/TogF2k2xM
	pCnHDKGgzQnZ+qtFihyCbIUtvClrVUqIhGLYZWpr1FSO8LzYP+HSNamLtqHr0SZvfeF3Wy70H4c3q
	9fOmRgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCHB-0000000DJ4V-2FB8;
	Wed, 15 Jan 2025 22:54:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCDF-0000000DHq3-0sLi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 22:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D393A42630;
	Wed, 15 Jan 2025 22:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4618BC4CEE1;
	Wed, 15 Jan 2025 22:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736981412;
	bh=V7HfILfKHrG++xGqo9/hAILN9a9av4lFR6UkNoZVYvY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KjDkVlD+R8yfGwzqUVVKh5etq4lUwj0j/zsX9clvGrp64ZE4NYKJJvXRT3YIwYZjs
	 MZ/Z5g0/bRxMcfkap6mP112qKAWOWRDVRyCNtETDvhDWTF7uS1Zdrmumdu225oA0GP
	 XeYZWUUABWVhhxQxCvHIh2qA+IEyGZAzusXUapgw4l2iJEAOx4H+vUM3soDzSm8wfs
	 i5UkaQY4D2acsJVLgFjCMue866K8prGNANjI300Ow6G1xd9FEu/pwZnnZjarscTrYL
	 xjYVS7TM7R2ip8ZonHyVAnqpgKUUhp4hU+WO9FnShlubMf9S88giKR9pWzIEumTdvk
	 QunEwYhhBDB6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71B5C380AA5F;
	Wed, 15 Jan 2025 22:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/5] net: lan969x: add FDMA support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173698143504.903583.7524014147804199820.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 22:50:35 +0000
References: <20250113-sparx5-lan969x-switch-driver-5-v2-0-c468f02fd623@microchip.com>
In-Reply-To: <20250113-sparx5-lan969x-switch-driver-5-v2-0-c468f02fd623@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
 jensemil.schulzostergaard@microchip.com, horatiu.vultur@microchip.com,
 jacob.e.keller@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_145013_325019_9F289E52 
X-CRM114-Status: UNSURE (   9.67  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 13 Jan 2025 20:36:04 +0100 you wrote:
> == Description:
> 
> This series is the last of a multi-part series, that prepares and adds
> support for the new lan969x switch driver.
> 
> The upstreaming efforts has been split into multiple series:
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: sparx5: enable FDMA on lan969x
    https://git.kernel.org/netdev/net-next/c/4a7d78c27806
  - [net-next,v2,2/5] net: sparx5: split sparx5_fdma_{start(),stop()}
    https://git.kernel.org/netdev/net-next/c/b91dcb237c69
  - [net-next,v2,3/5] net: sparx5: activate FDMA tx in start()
    https://git.kernel.org/netdev/net-next/c/cded2e0f1b0d
  - [net-next,v2,4/5] net: sparx5: ops out certain FDMA functions
    https://git.kernel.org/netdev/net-next/c/56143c52a342
  - [net-next,v2,5/5] net: lan969x: add FDMA implementation
    https://git.kernel.org/netdev/net-next/c/d84ad2c0d80c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



