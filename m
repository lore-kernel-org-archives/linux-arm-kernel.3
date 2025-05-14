Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78C5C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaJ3mYXpiqVWCadvGDlhoqZiZkdGykFk8Wh7sBs1jNU=; b=q5xXLtP7mefF8v6XzPL3E05+eB
	o8HoUzV23fJ7sWWiAcu5zPtpg+YuGit4RzYnptEXbLZ4RvK5t9c+3pI/xVZYV8vobbR/z/pkrXEYW
	0f6x/0cGse3F2OPOzSm027R7B8R1FYy4ko26Z9SMo3u300W/umWlyr5AOVcIXtoeiE19WdC+qLNcE
	sLmaXkwYW+OZhGatIfABt8BHBkzSPIVRvOg0Dfu0TpRjWyOi6mrjWa8QqWpzLl2fCPRgRM3DAYa8a
	fxyzjiyBiCkm9j+faY77KI0Kxmo0z89kZ4VwjX5o0WS1XYhyj/8eg3tVVhNI+Jw1usbt+EV15Bp4c
	NdQhYEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB9s-0000000F5qX-0cGx;
	Wed, 14 May 2025 12:24:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAQj-0000000EuXf-18mV;
	Wed, 14 May 2025 11:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D5975C1D94;
	Wed, 14 May 2025 11:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B04C4CEE9;
	Wed, 14 May 2025 11:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222664;
	bh=jISERuaY9qmDFJKtUygAy794V54ed8Ao4JMN9t4+FHo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GneZh8EDbYt1L15AvpZL1bcBLJpsVedS7VpuI6NCooz2TVTqGippouQ9pExUkvLW4
	 7oYUAjaZhvpUm5J6tBTopqIzFS6BOgVqYdMBncmrgI3XiUU5vHFlXXVMKEurMTOX/6
	 fZ62xwSO1DiUUXvZ/QKCnZprUeHXyEH3pcicoCR52muQS0/U9jkZCPOVISFRyhVFNh
	 j6hfgL230YzdDe8GmdBJ9tUrClQf/cHmXQLAiNnzqiBrW4HBQ/6/fayw71OKA44jWr
	 5SY+w/AUv9n4sb+czqZBfORyS5Yv5GGiVahLVtAr9zm1ev74yt6Cvu3ndbckBDiGcO
	 CGRhshx5Axzdg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>
Cc: jun.li@nxp.com, alexander.stein@ew.tq-group.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250430094502.2723983-1-xu.yang_2@nxp.com>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: imx8mq-usb: fix
 fsl,phy-tx-vboost-level-microvolt property
Message-Id: <174722266099.85510.8742771363116122058.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_043745_369604_325F150B 
X-CRM114-Status: UNSURE (   5.27  )
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


On Wed, 30 Apr 2025 17:44:59 +0800, Xu Yang wrote:
> The ticket TKT0676370 shows the description of TX_VBOOST_LVL is wrong in
> register PHY_CTRL3 bit[31:29].
> 
>   011: Corresponds to a launch amplitude of 1.12 V.
>   010: Corresponds to a launch amplitude of 1.04 V.
>   000: Corresponds to a launch amplitude of 0.88 V.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: imx8mq-usb: fix fsl,phy-tx-vboost-level-microvolt property
      commit: 5b3a91b207c00a8d27f75ce8aaa9860844da72c8
[2/4] dt-bindings: phy: imx8mq-usb: add imx95 tuning support
      commit: 7325e0995f414af1cfa38be965dc47248cb4ec45
[3/4] phy: fsl-imx8mq-usb: fix phy_tx_vboost_level_from_property()
      commit: b15ee09ddb987a122e74fb0fdf1bd6e864959fd3
[4/4] phy: fsl-imx8mq-usb: add i.MX95 tuning support
      commit: e75d564f64661086fcd65ed07268590259893448

Best regards,
-- 
~Vinod



