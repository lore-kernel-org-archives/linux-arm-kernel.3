Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93696C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 18:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkyfOJ3yTrmRHu7yVzjlccEZ/BF46DAE41WsL+jVEfc=; b=TWMBB5kMT+stLtEWjrYjxMT9as
	DMwap4aL8P0Zi7H1NVlEA4nVrGNPQkuKhG0kLkiIVqBZN9PPAw/bXoUdn2KRG6PSoLPQkUj0lvwQD
	QsvM1PwMuFUbqGh4979R5tnvOXwFaDgHl8QeYSoE6/0sLqwM7P+9jZvIzgFevQi+8Mmc79508F8Nx
	HbNGD59Z/wHfR5kVBo1rdLIAY9sg/q+ep2/EfvZiAMYW5O8KeI6J1NZmBb/PCQRP7uLRRSji8j/nY
	ykmyywWJrbqzxzPE/TH6qqk7riHuMuvgAsO/VzNOLF7LEdzqjp3r5+hH4e0Qage5jFC2+NyLldLky
	Xsv3KLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufjr4-0000000BkR9-2grb;
	Sat, 26 Jul 2025 18:42:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufjoX-0000000Bk4w-0EVK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 18:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 713824594D;
	Sat, 26 Jul 2025 18:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491FAC4CEED;
	Sat, 26 Jul 2025 18:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753555208;
	bh=slhXj9ZnZblb/hPj1KmavhFL4eNp8rvn2VLkAoSF4Yw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aKmuLd9NUEDBWiehiKidDGOLyTaHP+FVIo66IPc6HzY8W6vN7nbDxcVTV6UjD6QR+
	 8Y3gjMgOc079huDHpqCy9EQaWDHBxDaFalRh9a/vZIc0ZLT0Ul1bdpF9AE8ifcp8iu
	 usD+328flA76vLtlzQjpvwlDHl8vJE9OfNeJfPdsZ3fCi7u278oeclaW9Vt7kR8EAi
	 44Kokim/gcAYzLPIO4JT5AV8cwfKUZrXkzqoH3nb3BMbxBWb1P/TQV2ZdGMbRgHdSg
	 EFEtpibLvQb+4bEttayxLmSgyy4aaV2lCaXQFLMxXWO5Ca9Ig455CnKD8EtMd33Ll3
	 bq6JQ6Y4r3WUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE20D383BF4E;
	Sat, 26 Jul 2025 18:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND v3 1/1] dt-bindings: ieee802154: Convert at86rf230.txt
 yaml
 format
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175355522524.3664802.13412387588392922957.git-patchwork-notify@kernel.org>
Date: Sat, 26 Jul 2025 18:40:25 +0000
References: <20250724230129.1480174-1-Frank.Li@nxp.com>
In-Reply-To: <20250724230129.1480174-1-Frank.Li@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_114009_114663_84B3D44F 
X-CRM114-Status: UNSURE (   7.96  )
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

On Thu, 24 Jul 2025 19:01:24 -0400 you wrote:
> Convert at86rf230.txt yaml format.
> 
> Additional changes:
> - Add ref to spi-peripheral-props.yaml.
> - Add parent spi node in examples.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> [...]

Here is the summary with links:
  - [RESEND,v3,1/1] dt-bindings: ieee802154: Convert at86rf230.txt yaml format
    https://git.kernel.org/netdev/net-next/c/d7e0d327805b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



