Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76736C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0jvqgC79bdg0pdzTtOyCEQHgcIpzw+yLTKCSTLmEGk=; b=FJ3yMYAJyUV2/eVLnvosaMbP4+
	RVy2iJYB2d5LAAfiXlJ9PKNk7JB/schCWOZGuN5hx+rFS1TEm1FBjNesGn9dbzqveHEnDsHYGlg51
	NTl4SLuIqMWDfOuf+CgNdnASEZiYMCfGFqNpFXJH+N90VLr1erfxbl8Gv14h/kPt6EsSscJl3lWcN
	AW6EjaSPhfYWxQfkA9qn3NhcxvSU2l5MGuq17CDmeErXdmlY2UEMt4JcBPdGdaHRBc6PL11ANQnGO
	+6POT+TSvZuoNrLGWZ5hymRN+U0geaOZY29OMBu75qtEkc5YGAcJmO3KRjsMJCpZMGb246NaqRt5R
	gQ3XYntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dFG-000000085wC-3JQC;
	Wed, 16 Sep 2026 00:11:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dFA-000000085vM-3hFJ;
	Wed, 16 Sep 2026 00:11:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2360D444FB;
	Wed, 16 Sep 2026 00:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF13C1F000FF;
	Wed, 16 Sep 2026 00:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789517480;
	bh=h0jvqgC79bdg0pdzTtOyCEQHgcIpzw+yLTKCSTLmEGk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ybu/t1Q5PHjEuRAqiE1/J148VOgeQo8iYgqqmzI/3iXvFuos5aSOQOLpHXOliNZRG
	 V9Ceo1ZveZADvGVvuNzgK5B1vAG3A8BKupH2AYbFtcjypMJxLkxlUqlkwf6iViIytd
	 GhpJmSiPUMs/MIlh7tEKA0PA/atih+k/ElG0HkfPddeCqXsw+r5zrbAVoHvYCcQfa/
	 R6hmDwp/R+8U8lMOJU+RNqgFudRZYhGogexXbCNTotX/AZ+bQ4OE5EV4HSHEOn/VEE
	 +HCxUaB912DLsy3MjZZFOKUHd6jzEsmNUXZtGlUx9xEUbJ1j9sIUnDmpIBoIiTilzG
	 cMLcWkbhcAlHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939E7392706C;
	Wed, 16 Sep 2026 00:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation
 in
 the example
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178951741413.2328807.13052906737611774655.git-patchwork-notify@kernel.org>
Date: Wed, 16 Sep 2026 00:10:14 +0000
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ulli.kroll@googlemail.com, linusw@kernel.org,
 clement.leger@bootlin.com, olteanv@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, johannes@sipsolutions.net,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jjohnson@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, vineetha.g.jaya.kumaran@intel.com,
 claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com, elder@kernel.org,
 s-vadapalli@ti.com, rogerq@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 ath10k@lists.infradead.org
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

On Mon, 14 Sep 2026 17:56:46 +0200 you wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> In cortina,gemini-ethernet.yaml also drop the wrongly indented mdio bus,
> because it is not necessary for the example.
> 
> [...]

Here is the summary with links:
  - [v2,net-next] dt-bindings: net: Use consistent indentation in the example
    https://git.kernel.org/netdev/net-next/c/032ef43b9dab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



