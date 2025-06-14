Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE4BC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ggmzPHqkHHw8BpPQbugVgyx4Z+IMO3yy/GesXPIh7c=; b=zhsWncHc10Ur0APEOdTRA2gNon
	kP1Qtepq6Kt+1+/1HuyOGS8RjUE23t53FBxxagemvYf2EEd2imYzlAfGrs0hRm93Zt5XaikuF17rZ
	t6+E6uEx2z9fPb3OjgUlmjL2c7PMefRcT52szFp249Lv0k1TnIFHiSVY37OS84nW1IkT93aYNwGoW
	6k2Lz0D4RHNEurgtGjGwpCXXrsEIpeLDuCFdeXQjxbUokbmfBJ/2yJeEnKOG4kWKZy3OFXzeczXOF
	7ZWf9VvsgCYwmAV6i3uTjMUQbEfcPfkGBoiWP6xkxt0Ov34AFIJTl+UllW3y5uWgDrZ059tx8c6wG
	T4RbQcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQUX6-00000001Za2-140l;
	Sat, 14 Jun 2025 17:19:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQUUu-00000001ZPL-2H1N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 17:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CCCDA4F308;
	Sat, 14 Jun 2025 17:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA60C4CEEB;
	Sat, 14 Jun 2025 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749921410;
	bh=SyhuSHTiP7kYh6dQdHpRWX3b0foHA/A5vUWOW9/wys4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ju9KVuUtGxQXCAjdaMZnZyfnQ7oL9HN0ghc7Crpm6kBXNpPwCv6vUHTg81o8eQtHn
	 7N/vjHsfsXTGqG5TEg+tfGzsKAMV2QMQ5SOmAfhVkKxN2/xjOOQj3g5YCBIw3EDqp/
	 /0ObAIAI2A2ImOL6KOHef1moBxj1Z28yzGSVTPURTkbHslRidL0NBQOsky9Pj2v0iX
	 j45c5+u3wZCb9dgin1Ll+yTXMkq7gdr2ySd6x+V5gHLalOb65MnULoXDA3aCpMB+C1
	 cNOkCekXOmUPb8vJ6ttwcI2vcj75E5ECH3sAUH3UHaTCiScHKRWN6OHUeZktGsaue2
	 bC0pOIKwGCPog==
Date: Sat, 14 Jun 2025 18:16:42 +0100
From: Simon Horman <horms@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	catalin.marinas@arm.com, will@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, ulf.hansson@linaro.org,
	richardcochran@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-pm@vger.kernel.org, frank.li@nxp.com, ye.li@nxp.com,
	ping.bai@nxp.com, peng.fan@nxp.com, aisheng.dong@nxp.com,
	xiaoning.wang@nxp.com
Subject: Re: [PATCH v5 1/9] dt-bindings: arm: fsl: add i.MX91 11x11 evk board
Message-ID: <20250614171642.GU414686@horms.kernel.org>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
 <20250613100255.2131800-2-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613100255.2131800-2-joy.zou@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_101652_648649_6E50C7BD 
X-CRM114-Status: UNSURE (   6.51  )
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

On Fri, Jun 13, 2025 at 06:02:47PM +0800, Joy Zou wrote:
> From: Pengfei Li <pengfei.li_1@nxp.com>
> 
> Add the board imx91-11x11-evk in the binding docuemnt.

nit: document

> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

...

