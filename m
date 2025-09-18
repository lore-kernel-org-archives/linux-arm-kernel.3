Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A965BCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 23:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2WjvzcY29xlGrDzi4E4gIiMb07r5g87Plw67A0tCiw=; b=ar3nwBidO1G363yiQEgy9QXTIZ
	Os3f4g/18A85iluwoyOzxaxnOuPxIMmELTZN1WBzelgO7UdD33F0JeLowgOpYVQtmJJKhqSePZFcy
	KEz/RxhWeOO3Drc9w92RDq+7tz8CnuaTPRLrIuSt33mG4N7Qq64fqADGPVNbgd6m8KgRe9tGhXROc
	9BlVuiGGyQ4nmRpukFQzWD0I3EH79oYWUTRiGGXFN0LuMUozbDZbWvwDmBBEfmirlRqc3e1/0cxeh
	bovDJot3iPN0AihPRRB2KIK3MOg10eUyrvF3obIr/Bysfxjur2zGsCiM+he9RQwVvuU2OaCf+pmXl
	IxOZoUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNbw-00000001NOc-0RJL;
	Thu, 18 Sep 2025 23:00:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNbt-00000001NNU-1Hjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 23:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B2A144C96;
	Thu, 18 Sep 2025 23:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFA0C4CEF7;
	Thu, 18 Sep 2025 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758236414;
	bh=R+DUhF/KaJOi/fs49UwyB0eqg6I3dUVnwx7V84tfvdc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kuehvDFcko+Ca+LH7Hvdl2P8TCwTUJICvJmn2ThVDEpYmxWybc4oR+yC1skDuUIqb
	 19P37a9ynwAPODNCLn/X50xj8pbA6SYz/jPalpr1i/qFyNM0qLmSVcFxioHJdIlLH0
	 nNcUz52kHFMnEVtchBc+iA9tZRSX+tpp+YR6WIzCPH3vMT3padPeyEHmHnKa0KQvuV
	 y9KDGOSd3rYEZTrqPB0/KFfhOxVN1GRBSXUasPuXecg+axU7KFRbcEeIq4uruZD3mV
	 GhgF0qvlrUlUtbWY+3LmHLJ4oSKjmZkPHY23+jFYQsDMhPOjiiCnQl+cqikQ+FxQQv
	 uGfwzwzAIgg0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C9939D0C20;
	Thu, 18 Sep 2025 23:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: sparx5/lan969x: Add support for ethtool
 pause parameters
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175823641399.2980045.14115345753886201972.git-patchwork-notify@kernel.org>
Date: Thu, 18 Sep 2025 23:00:13 +0000
References: <20250917-802-3x-pause-v1-1-3d1565a68a96@microchip.com>
In-Reply-To: <20250917-802-3x-pause-v1-1-3d1565a68a96@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, linux@armlinux.org.uk,
 jacob.e.keller@intel.com, robert.marko@sartura.hr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_160017_368612_059B33C7 
X-CRM114-Status: UNSURE (   8.05  )
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

On Wed, 17 Sep 2025 13:49:43 +0200 you wrote:
> Implement get_pauseparam() and set_pauseparam() ethtool operations for
> Sparx5 ports.  This allows users to query and configure IEEE 802.3x
> pause frame settings via:
> 
> ethtool -a ethX
> ethtool -A ethX rx on|off tx on|off autoneg on|off
> 
> [...]

Here is the summary with links:
  - [net-next] net: sparx5/lan969x: Add support for ethtool pause parameters
    https://git.kernel.org/netdev/net-next/c/315f423be0d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



