Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1216EF8E4A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 02:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+Jlkw2DzxGDVPjkTh09CfTkIC7dU4fvOK8TwWJLXqM=; b=VcUkNd1N2H1GcsItJZOY+kihk6
	1xs+OlCyU5cmxQ8xVJHoYwoozAyGWA5ogTST0LediI5kMDWv2qxL31q/Nm0vhtU89PgUjyhGRlY5Y
	/T6AvSQo/4krJhOV5oSOsd0G4NBcQu6KbRzdudGduohVZ8mah2ADzuYFsgsZfn+KrSkGyCJ72dGOO
	bQlhIf6a3Ptt1kJNC29s+iCUNtuBJuglQFzilOrTOnYi3bp98MRAz3RxNToc/JfwLfGxILZ0ICWv5
	RPDIDLGXppqLaQ8JMFTOG+rSGtzY2JEMc0TU4QX50RaDwqefnolqWFo83a9CxWvy1FOflX2h07RDw
	R0OM+2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDZ8Z-00000003L4r-0o4e;
	Fri, 17 Apr 2026 02:40:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDZ8W-00000003L3r-0ljS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 02:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5DD944599;
	Fri, 17 Apr 2026 02:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8597C2BCB3;
	Fri, 17 Apr 2026 02:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776393650;
	bh=RE8pXUNFnXrfp8k86oykmMdq+NuDocEHXqwp95teTlA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nziXgXAEDrvVDkLZpvE+XxCZTTZKH/M0cgCTyVUSO2ln2j+DlzcbyJsIwyuZpEsDG
	 vcgOQCkJO2fjQFNwe5nJ1v/9IAxyVfVAfW4M9mu2CiDbNdVUDR4T+dZwoE/H70UgNG
	 mYC7Zy6zrfRPTI0J+S65v+riyW9x20dQKieQc4KgHT2t1BUOjmfSG/ibHXyuciyc9+
	 peqUsTXW95O8TlCI783Pmcvmgh6OHrgpE6u/kkCz/vpfAA7c5fOpxX07BCI/8d5/TF
	 pLH1TcwabVr46cyJb2FzLu75ShiMqGTXUjgSdulYkca5q/GJwwuA1cWX6NvjxgoBUi
	 hvPtDEWqVDNAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CE6380AA76;
	Fri, 17 Apr 2026 02:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net 0/2] net: enetc: fix command BD ring issues
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177639361854.3490984.12957233652551599024.git-patchwork-notify@kernel.org>
Date: Fri, 17 Apr 2026 02:40:18 +0000
References: <20260415060833.2303846-1-wei.fang@nxp.com>
In-Reply-To: <20260415060833.2303846-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, chleroy@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_194052_270365_022F9FE2 
X-CRM114-Status: GOOD (  14.19  )
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

On Wed, 15 Apr 2026 14:08:31 +0800 you wrote:
> Currently, the implementation of command BD ring has two issues, one is
> that the driver may obtain wrong consumer index of the ring, because the
> driver does not mask out the SBE bit of the CIR value, so a wrong index
> will be obtained when a SBE error ouccrs. The other one is that the DMA
> buffer may be used after free. If netc_xmit_ntmp_cmd() times out and
> returns an error, the pending command is not explicitly aborted, while
> ntmp_free_data_mem() unconditionally frees the DMA buffer. If the buffer
> has already been reallocated elsewhere, this may lead to silent memory
> corruption. Because the hardware eventually processes the pending command
> and perform a DMA write of the response to the physical address of the
> freed buffer. So this patch set is to fix these two issues.
> 
> [...]

Here is the summary with links:
  - [v2,net,1/2] net: enetc: correct the command BD ring consumer index
    https://git.kernel.org/netdev/net/c/759a32900b6f
  - [v2,net,2/2] net: enetc: fix NTMP DMA use-after-free issue
    https://git.kernel.org/netdev/net/c/3cade698881e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



