Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF93C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 02:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPZ128OdvGtL2HGOQH/Z9emS0mNIIv2/qzjzmWBJFQk=; b=hTlOnbl7t+AfZojFZFYS/B1vOO
	iIZbyncBtZyDgTAvNY+dgeebpkvUFt8R8kNVqKw7S0hcTkyx4lgJm7RxX8RtHrtxVU0CePkLe0yat
	Am7Jb4d8LFOQKJx8coCGtM+Jcopt0LeZMVGThTD31LBkRGgQ4TU7RmtR4WVnhZiEKoZnr00CsKK60
	1YV0SgTOfuckUeADJu1Vzs28r8ZH1bJb3t/t3cMtq9BGnkIgqKOdtc3zxp4Ia0yUPpSPXI3BYEpfm
	AjoUxiPpojHNgMOfHuRH7Gb/4kfNlWxWevmmcL4FaTwrWeToTuzSe1dZHecVvwZaAXHDUcOPzwAhj
	R/I+X1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tka1u-0000000AgSe-1qdR;
	Wed, 19 Feb 2025 02:41:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tka0Q-0000000AgGq-3Wfj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 02:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB00DA41E80;
	Wed, 19 Feb 2025 02:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C97DC4CEE2;
	Wed, 19 Feb 2025 02:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739932809;
	bh=tiloIvKYtmvXtq9n1DhVPEZySCD0vWC9KJmidWCd6WI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XB+Iin3XPAjVvL9N79BtkHn77dq1a1SJnFIzHpUj16mDKcT2YG8XFxuYml5chlHL6
	 aOno2cdTwrJ3pCGVsD1SWy0MpNbh3s+d6CzSmtNcY3VxWYs9OBUZWzglENxTvRk5o0
	 9nKLAvNS6nefRCBLcu4r9rJPUA4TWiH+HjpA46Yowab/fx8w6ieu+vA6HfyDL/+tHT
	 5SM8Ue9b+cqW4Nrcq+pUDHtwhlj+LhOF+I3sqyIcSmn/K6LdP9ySU+rgfv+Wo5Ex9f
	 3cs50kXPb6OErfAJzQR83wdbHW35fJHF19A9LC9Glm58VAY4/ikfroaJjCOAnlQUMt
	 hblzaZNmkiLUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBC00380AAE9;
	Wed, 19 Feb 2025 02:40:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: Use str_enabled_disabled() helper
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173993283976.110799.6484723718905539141.git-patchwork-notify@kernel.org>
Date: Wed, 19 Feb 2025 02:40:39 +0000
References: <20250217155833.3105775-1-eleanor15x@gmail.com>
In-Reply-To: <20250217155833.3105775-1-eleanor15x@gmail.com>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, visitorckw@gmail.com, lkp@intel.com,
 chenhuacai@loongson.cn, rmk+kernel@armlinux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_184010_940707_FD1E3CFB 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, 17 Feb 2025 23:58:33 +0800 you wrote:
> As kernel test robot reported, the following warning occurs:
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)
> 
> Replace ternary (condition ? "enabled" : "disabled") with
> str_enabled_disabled() from string_choices.h to improve readability,
> maintain uniform string usage, and reduce binary size through linker
> deduplication.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Use str_enabled_disabled() helper
    https://git.kernel.org/netdev/net-next/c/3a03f9ec5d33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



