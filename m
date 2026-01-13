Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA7D29DC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 03:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVCjNOhh/5LUVZYAUAkZpluoJLWyRhJAmhnP+XiOgZ4=; b=oK4+jnCd+Hs3sCb7vJCp65DeOD
	GXYPYONvRuzLz+yqmAlOW8tPqd6/RrZUUesVO4x9/dkXUPU5O1PcH99kfPxrW+vXIeLPnMFJY0eek
	HxezT/3wWgyNn6WENebk59eyObrf6aS3IpZ+6QCv0oCFXYpV9QhpdJDzSMt+6jWqMfFIA/L3adluu
	cnHherCbqSmI6kvRJvF0zrWoekBdk52inwZisfT2bzzllGpWAW0TTIvdcXhfzwB/at43jGTkqkaza
	Ja+m+hv7/ZOeMknsm0WKRa1LQAh0He3gOrfNnCGdbtkFABlDcmEd62sBc7zbDaRYd3UExYucU/kRC
	xWA5YTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVA3-00000006UHd-2fV4;
	Tue, 13 Jan 2026 03:33:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVA0-00000006UHD-1lYo;
	Tue, 13 Jan 2026 03:33:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A35B9442B2;
	Tue, 13 Jan 2026 03:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A2EC116D0;
	Tue, 13 Jan 2026 03:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768275213;
	bh=spgkXTbeqnIy58cj1/9lfs3zCULO03AiiPx6WBBkw64=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bMyrmpwPlQAZYNzq7C1EIjw/cF5OoutO4g/uUqhUZSpdvUVKGdkj2uz9qOCjIqCxQ
	 HWF4eBSllxC5djL6+8YYMCo1ooUhjy+i43GDuVGAyykzOEkY3fYWHeDZ96yvIzB3FZ
	 3Q3b2nzKtJFFWhjqVdPSwJaVSydUq73sFNPiUNOXQE4Gm0WDsJO83M9cB1KM1RHTWW
	 9X3Gxy0VZxur47BD3v290ZbvhM2nwc5ZTMyXswqKiQtBT+umnUV2hnDj5aKitkcYis
	 9MODRdKyAuBoZGpjXAZtSYgN7JTO2bIRt1EeazlftzgQlZg4/kKlRXi9LBljCh8b9Y
	 gHyBfFiCkrtMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78A5D380CFE1;
	Tue, 13 Jan 2026 03:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix typo in airoha_ppe_setup_tc_block_cb
 definition
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176827500730.1659151.13605466861154324453.git-patchwork-notify@kernel.org>
Date: Tue, 13 Jan 2026 03:30:07 +0000
References: <20260109-airoha_ppe_dev_setup_tc_block_cb-typo-v1-1-282e8834a9f9@kernel.org>
In-Reply-To: <20260109-airoha_ppe_dev_setup_tc_block_cb-typo-v1-1-282e8834a9f9@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_193336_536334_6BAEB835 
X-CRM114-Status: UNSURE (   7.88  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 09 Jan 2026 10:29:06 +0100 you wrote:
> Fix Typo in airoha_ppe_dev_setup_tc_block_cb routine definition when
> CONFIG_NET_AIROHA is not enabled.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601090517.Fj6v501r-lkp@intel.com/
> Fixes: f45fc18b6de04 ("net: airoha: Add airoha_ppe_dev struct definition")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix typo in airoha_ppe_setup_tc_block_cb definition
    https://git.kernel.org/netdev/net/c/dfdf77465620

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



