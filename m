Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F59CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 01:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJR6AKUyGSUOsMk5lSKuZJ2Wvblf/S3YNFdN/AvpJ1s=; b=0RP/8qfNzNo/K2ayg8/G2BSC3s
	qAEN6naGoJMeTU6+dMznuz0sCNU4SGCgaOJNkGsb1/ztYDWyAcvHBXaO7VZr/LlwiqKa18OknLo1g
	hB54Bc1MOdrPwPbUML+fjXrIxFU2R6SsDB1wE6QTSDVlwnlYu+OeW7Ofcvpgk9fDwlJRALIQDWy0L
	X6d02Zh6EecJtDQGpDAjTKQYp4+rhqRX7icG28MOjcxMp/9q91a+aZO/M6sy2PavZvaURoTikWebD
	kqrsesvb01njjZt5K54+Y0LdTziFvtU0Fv1dE5kpQVA0pyebuLfSbnTJWHObNYRNtgch8XyJDFwhR
	1wN8yTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjIo-00000004sQZ-4A5s;
	Wed, 30 Sep 2026 01:40:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjIn-00000004sQL-03MO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 01:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 704EE405E1;
	Wed, 30 Sep 2026 01:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476541F000FF;
	Wed, 30 Sep 2026 01:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790732408;
	bh=FJR6AKUyGSUOsMk5lSKuZJ2Wvblf/S3YNFdN/AvpJ1s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Lf+pYSps/lAIbsWOY9uCo8t96C99/0ySQjrRaxJMx8pWPe43vQ+b1uorWaQTJHp9h
	 ex2yoxw/HZuOiY9fHJShbg7VbysThdY9FP86ZUMeAnRjaZguFjxJEe2Phiuhte/1bZ
	 DVKJSpiDUhdXGe7AfPrJTgbU6gGINUCT/Tq24LcRn96rqWlkcgGNiKYgT2mxRG9Oa1
	 19A4uhuNU/1xiHjw1bNMCSJ/QAr+qid/CwPh43bBj6X8ewI1I1g7YFY3MnGiclVTLQ
	 MEaCsC7VGjaLdU01gvoGksieuXGPpjqcbYqquiU1hR+XzD+jjK0YUFdU+SekEFVL6p
	 qcnOj0IYatqzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3AA3924FEA;
	Wed, 30 Sep 2026 01:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/3] net: stmmac: add Allwinner H616 EMAC1
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179073240703.1199722.17774874033053476727.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 01:40:07 +0000
References: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: richard.genoud@bootlin.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, clabbe.montjoie@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, peppe.cavallaro@st.com,
 joabreu@synopsys.com, alastair@d-silva.org, mripard@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 andre.przywara@arm.com, krzysztof.kozlowski@oss.qualcomm.com
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

On Sun, 27 Sep 2026 12:52:18 -0600 you wrote:
> The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
> system-control clock register at offset 0x34. Add its binding and a
> sun8i stmmac variant using that register. A distinct compatible without
> an older fallback prevents the driver from using EMAC0's clock register.
> 
> EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and has
> no external PHY pins. Leave PHY initialization to the PHY driver instead
> of using the H3 internal-PHY controls. The RMII-only variant does not
> expose the RGMII clock-delay properties.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/3] net: stmmac: sun8i: reset the MAC after PHY initialization
    https://git.kernel.org/netdev/net-next/c/fee9c17671b6
  - [net-next,v6,2/3] dt-bindings: net: allwinner: add H616 EMAC1
    https://git.kernel.org/netdev/net-next/c/1cf9c2ac57fd
  - [net-next,v6,3/3] net: stmmac: sun8i: add support for Allwinner H616 EMAC1
    https://git.kernel.org/netdev/net-next/c/61240e48a67d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



