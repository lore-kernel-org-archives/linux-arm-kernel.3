Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA94C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpyTqBdevw99iwwMtLPxyoNC08nRFEMHQTer9pjaR+0=; b=ygnrqUqNo5YEffiFvaw2cn6uFR
	yur8jlCcnJVYA4ef0XAGhUlBrWSJE14GM1b+OHhOw3ndK5uyqN2MuvyvW8yN6ugxFNG5AIhiuPzvo
	yRpMU/MSXDC70LiqU4SgdbdEuc6DjcL3QF/Uk/u4D5n4OE4A7O1ETuXX+4bkKTOWeIFhSOxSyq41o
	5Z3AWLheiKfjkhqy8h4FxDsSQMJ2xhPy1GemMvVee5Odb4EcLwderDinLmPSSX+mAn54HTEDhHjAc
	Bzxy1WJhXQRslKv5urQqxjOpoyCOdNIw/sZNu0B99K8clhs/cRKGWmImn1KQmeUv7L3UVKZkUkxa/
	WJD5UFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFhO-00000001zTs-0rHW;
	Tue, 04 Aug 2026 14:00:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFhM-00000001zTW-2d78
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:00:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 175B260A8A;
	Tue,  4 Aug 2026 14:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA771F000E9;
	Tue,  4 Aug 2026 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785852051;
	bh=mpyTqBdevw99iwwMtLPxyoNC08nRFEMHQTer9pjaR+0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Sx+ViW51f7Y1cfpviGJ1Vy53xrX4yX8YHp6Wrp2FczgCJaeVr5OnKbstW4lZc5es9
	 RfKTV7vlriQYcCi32RvpfUArRXV7SHIG+PF56R0MSsigwyDo2CsvS2X4bfyExN2415
	 KkKqnyj2mKqDHNYKJl8w7M8ur7KIZyjjr+s8+dL6KmXxyZaMjn1b8wpZBHBfbgvcK5
	 JtwUkZ2Iuc03EdHkpYZd0xez2udCza/wh9FJBNR7mTmRkMj7FK67RUnjpAEFisfzJz
	 jk0u70rhivNHGB3cTxIkcSfc8516wGaBgYET839orkeWeDW0VNxsr90dU5m7iz4gdT
	 PMf5RuqfoARvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93ABE39253CB;
	Tue,  4 Aug 2026 14:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: Correct white-space style
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178585201216.3168424.15227977507793041541.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 14:00:12 +0000
References: <20260801195505.235099-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801195505.235099-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, j.ne@posteo.net,
 horatiu.vultur@microchip.com, lars.povlsen@microchip.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Sat,  1 Aug 2026 21:55:06 +0200 you wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/net/fsl,gianfar.yaml    | 2 +-
>  .../devicetree/bindings/net/microchip,lan966x-switch.yaml | 4 ++--
>  .../devicetree/bindings/net/microchip,sparx5-switch.yaml  | 6 +++---
>  .../devicetree/bindings/net/renesas,rzv2h-gbeth.yaml      | 8 ++++----
>  4 files changed, 10 insertions(+), 10 deletions(-)

Here is the summary with links:
  - [net-next] dt-bindings: net: Correct white-space style
    https://git.kernel.org/netdev/net-next/c/828c4a5a9518

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



