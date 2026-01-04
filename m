Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE396C2A069
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RQYbrvPtsYYBlHay19MC/FXwRqcopauCnWVtvteUgQ=; b=TbiySftfzQMjDxpsZQlkH8sx78
	cV86v8WPhCAWOIvAJ/a42QfmM8v6L03MUJnntRdmGo/XvgiD/tlL4xhjAR+fxF/X3VZluHgD09Ju8
	4djNReTcbkqtGnZ4S/lg0cboHR7mQKjjIyQasWroMIrH00xXrYRhClmJWegTcHKuyvNzHhyN71J3C
	/IEQY3aukgWIBdcVb6EE7spa+YbNoH1JVKRcn9gtODTLpIO+7KUkyNWzbMuZZ/NFsmI/bjLGQ95SJ
	NcB+fzNEBg6hwrEbrkpl6cPPYuPfOP87jcHp1Km8s2dp6iCY285pFyMy1kC5XgKONEIMRQ2yb8Zru
	84t/FNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTGh-0000000AOLT-3QO7;
	Sun, 04 Jan 2026 18:55:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTGf-0000000AOL8-1ZT1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 18:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EDC843CEA;
	Sun,  4 Jan 2026 18:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F5FC4CEF7;
	Sun,  4 Jan 2026 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767552955;
	bh=FsmYT4J2wneLygt9k8P00NIpU5dia1i3KeDHzRjOSyc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IC7pSnzEclHGwg200X/YkdBBynq7odRScUs9ppZoZpZ5+vCC75MulNZG9xoNbQ7ea
	 YHl+gfz24aU8DAk/01qqCzHWqgE5huqcVehQ7bOvjuf1C9PfOOiVV+8sKjo5PD0Ux8
	 gufnEXHEZAj84Zw7OxxJ8epEP1/fFxR6HWqDntc0r/AZVBg5anq5l1wosBra4diGjh
	 HemjiMkiYw9l4FXiTGEZzICBstLP/oFQ2Kp80I2pGwGdvs9cEXvi/gXm+jLpkn5ydQ
	 PaFF0rRXFM7FglqmFWK1tATHw28PJZH5oZFT/U/eEwxFbtqt5UsOaoH8qU0JuS60fs
	 dMLakUjvihl3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BC38380AA4F;
	Sun,  4 Jan 2026 18:52:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/15] Add support for Microchip LAN969x
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176755275401.146974.3696343941489230641.git-patchwork-notify@kernel.org>
Date: Sun, 04 Jan 2026 18:52:34 +0000
References: <20251229184004.571837-1-robert.marko@sartura.hr>
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net,
 vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 luka.perkov@sartura.hr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_105557_457082_6FAADD2C 
X-CRM114-Status: GOOD (  11.86  )
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

On Mon, 29 Dec 2025 19:37:41 +0100 you wrote:
> This series adds support for the Microchip LAN969x switch SoC family.
> 
> Series is a bit long since after discussions in previous versions, it was
> recommended[1][2] to add SoC specific compatibles for device nodes so it
> includes the required bindings updates.
> 
> [1] https://lore.kernel.org/all/20251203-splendor-cubbyhole-eda2d6982b46@spud/
> [2] https://lore.kernel.org/all/173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com/
> [3] https://lore.kernel.org/all/20251203-duly-leotard-86b83bd840c6@spud/
> [4] https://lore.kernel.org/all/756ead5d-8c9b-480d-8ae5-71667575ab7c@kernel.org/
> 
> [...]

Here is the summary with links:
  - [v4,01/15] dt-bindings: usb: Add Microchip LAN969x support
    (no matching commit)
  - [v4,02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
    (no matching commit)
  - [v4,03/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
    (no matching commit)
  - [v4,04/15] dt-bindings: spi: at91: add microchip,lan9691-spi
    (no matching commit)
  - [v4,05/15] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
    (no matching commit)
  - [v4,06/15] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
    (no matching commit)
  - [v4,07/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
    (no matching commit)
  - [v4,08/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
    (no matching commit)
  - [v4,09/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
    (no matching commit)
  - [v4,10/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
    https://git.kernel.org/netdev/net-next/c/c303e8b86d9d
  - [v4,11/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
    (no matching commit)
  - [v4,12/15] arm64: dts: microchip: add LAN969x clock header file
    (no matching commit)
  - [v4,13/15] arm64: dts: microchip: add LAN969x support
    (no matching commit)
  - [v4,14/15] dt-bindings: arm: AT91: document EV23X71A board
    (no matching commit)
  - [v4,15/15] arm64: dts: microchip: add EV23X71A board
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



