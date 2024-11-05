Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0389DD2B921
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 12:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INrn21bX55vjYiynTcMRZ3hqt9uWDH5jbXONNIDoitI=; b=FtDJVonZkRzKNFRhvAC7aIIJAv
	tyP9to/wYO7XdRARzE+KKLBRyqzUO4Wd0yOlcSKsfZC/cLgPaf1msfROXC6vxr8DO6RJMeazsa/0H
	D8gv+QuvpLA1WuUPYlvTDWjSzPosSUu3ZkMnRQWzGbdnqfWJslWexfpqheb6Z+6/6OtWzUWfE7J7H
	13KjavjLceu038UbxOkpkxm8t2OrWjl6zgvWTp+Q2Ajpu+prZ4wcRmCVO2058AEXFYMR0Dr685/Fj
	9DU7UVEsuIfZijpBcMm0lPKudrKjEy+p187bgHAvmTe6GvtIvKW1jWfrq0l4vsf+K2DfV/sN00Wnk
	OJI/BgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8IzJ-0000000H1sG-3u0i;
	Tue, 05 Nov 2024 12:48:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8IrB-0000000H0iM-0lfb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 12:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13B565C3930;
	Tue,  5 Nov 2024 12:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF2BC4CECF;
	Tue,  5 Nov 2024 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730810423;
	bh=B470//hXIXrWvSblv+Zhgqc1KNBhJ2sWDSCy8NGeT8M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YAqMdFAkC499s6s3pWmQ9QaZWEWS9YgZHVua8RrnUvI1+nT+nVzP5SQ54LJz0xKhY
	 cFW4fuAwlXKs4w4ffYVxcO/yJJ2TU5x7no8NUT36QAUOSkdWwqlFa5oFBxkDo5Rg8D
	 oazbzKTXJM3aMq8VP2kyiiP+ujCVvT16GtgvmCH1LgiHwIKmjgNzw9OMXrhYvGkWOE
	 hqCf/MFBK5TpVxgZHp2ocuQyV1W438PP+D3OWs9ER0h4ZcVuDy+89/aLg0W64/I4/n
	 o1b4xJA5LkfBKie7CWnyfcY4c5sn8YhkjxNin+Y/Ode8ynt7U9KilOlvVZ1xfs1cnD
	 tKetBWYgTyGsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FE23809A80;
	Tue,  5 Nov 2024 12:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: lan969x: add VCAP functionality
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173081043226.542753.11161846541422250316.git-patchwork-notify@kernel.org>
Date: Tue, 05 Nov 2024 12:40:32 +0000
References: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
In-Reply-To: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, jensemil.schulzostergaard@microchip.com,
 UNGLinuxDriver@microchip.com, jacob.e.keller@intel.com,
 christophe.jaillet@wanadoo.fr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_044025_286274_1D38E66F 
X-CRM114-Status: GOOD (  10.48  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 1 Nov 2024 08:09:06 +0100 you wrote:
> == Description:
> 
> This series is the third of a multi-part series, that prepares and adds
> support for the new lan969x switch driver.
> 
> The upstreaming efforts is split into multiple series (might change a
> bit as we go along):
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: sparx5: expose some sparx5 VCAP symbols
    https://git.kernel.org/netdev/net-next/c/9bdb67b53f3f
  - [net-next,2/6] net: sparx5: replace SPX5_PORTS with n_ports
    https://git.kernel.org/netdev/net-next/c/8f5a812efff8
  - [net-next,3/6] net: sparx5: add new VCAP constants to match data
    https://git.kernel.org/netdev/net-next/c/8caa21e4e4ed
  - [net-next,4/6] net: sparx5: execute sparx5_vcap_init() on lan969x
    https://git.kernel.org/netdev/net-next/c/d4c97e39bf40
  - [net-next,5/6] net: lan969x: add autogenerated VCAP information
    https://git.kernel.org/netdev/net-next/c/7ef750e490dc
  - [net-next,6/6] net: lan969x: add VCAP configuration data
    https://git.kernel.org/netdev/net-next/c/1091487dc743

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



