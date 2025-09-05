Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96580CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liXWa7dh6ReZC09ODku+7XeyTsswVi++oqxCWlYHPHI=; b=Ris1AOBjmLdNqaS6M0LIZU3egK
	4q2Hf/xV4eHGYPkvwjUHmifHb5n0wiuK3M5fNewbWFi2ZTPI186ln95Gzz2rX119aSBwleOVX/fzQ
	QvxhScWjV4OQ260oLf3G3ypUsGZsUigxXXIIycvHHY00nG16mITjlpXbhEOTS+TSk+6Np6RdBILgR
	8M6ncTq4jXVtycwmcgiqWPGpKbEKyqEJqT86QQ18a9X+ESyjyf1A3sVqAGYGdZOsVr4GAw3MlxBus
	9o208KlgeW1d+YZ+1BMyY5HVj9EcRz8NZHNMNvmYlFvg0vfSGMyrwfnBKcFYaKu0Tn2pCK3BpNc2c
	WgjTXDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN5X-0000000GR7y-0FKW;
	Fri, 05 Sep 2025 03:26:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuLkB-0000000FtIb-2I0U;
	Fri, 05 Sep 2025 02:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62AC444891;
	Fri,  5 Sep 2025 02:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297EBC4AF0B;
	Fri,  5 Sep 2025 02:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757037602;
	bh=6WrSKGMcklSN3roHjGk3yFcw/fLf1SGPFW5yr0SuEYA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=keIR4MolXDCuDAQ4tpQuRfXkj9XNWYKqGDp4fRkc61kQInngXYCgqRhI6cwQ+G2KI
	 WHaiElr2nXUMWbBrIWQAHLGc6y/JM7K0tIvmNAehAsJwMt2fKui0y4RljvXxBefdxF
	 +1j5Xj/d1fJIHjCaUpOcQVGyh/JS5B5bHVYBfK+jxbrEdZhgkQnyfBxD4S/UUSPdYI
	 ton3QP+6YF/XdXMfaYrOHwC++lCqsVGyIZqMdmr7vu6sSrOunyn3/K51gk6W8UGK1w
	 VhdIkXlGWz+Sz1peFjS0rQXq1PYYNKHIMY2h4OqY3hDZP2WopJmHUKRIl0SSge6WCV
	 RONgPnl0iGlRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEEB383BF6C;
	Fri,  5 Sep 2025 02:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] dd ethernet support for RPi5
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175703760650.2006573.13109159782302004132.git-patchwork-notify@kernel.org>
Date: Fri, 05 Sep 2025 02:00:06 +0000
References: <20250822093440.53941-1-svarbanov@suse.de>
In-Reply-To: <20250822093440.53941-1-svarbanov@suse.de>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, florian.fainelli@broadcom.com, andrea.porta@suse.com,
 nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, phil@raspberrypi.com,
 jonathan@raspberrypi.com, dave.stevenson@raspberrypi.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_190003_604006_BC17C19D 
X-CRM114-Status: UNSURE (   9.19  )
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

On Fri, 22 Aug 2025 12:34:35 +0300 you wrote:
> Hello,
> 
> Changes in v2:
>  - In 1/5 updates according to review comments (Nicolas)
>  - In 1/5 added Fixes tag (Nicolas)
>  - Added Reviewed-by and Acked-by tags.
> 
> [...]

Here is the summary with links:
  - [v2,1/5] net: cadence: macb: Set upper 32bits of DMA ring buffer
    (no matching commit)
  - [v2,2/5] dt-bindings: net: cdns,macb: Add compatible for Raspberry Pi RP1
    https://git.kernel.org/netdev/net-next/c/d9c74e6f8125
  - [v2,3/5] net: cadence: macb: Add support for Raspberry Pi RP1 ethernet controller
    (no matching commit)
  - [v2,4/5] arm64: dts: rp1: Add ethernet DT node
    (no matching commit)
  - [v2,5/5] arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



