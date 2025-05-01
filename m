Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00471C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQapiMUsqLctAxkgX9dXBZAjV7cdFsWlzKkeB+Niv0U=; b=Y/G4s2AmtlMbZGyV6/XMNF50Zk
	y7JZjO0cnNZ5yr62u0K4kqpEKOnz98ZkkFt02nole6rdgyjrhLOgquZ/TEtuOMi/epeE/Cc4zThgA
	9EYbRHiy/Pvf1EZ7Vucdl1yHB5EKlhNblyXbPDX/zMtcI7FwKaVlyleivceS+wxNu2H3Pp7j9Fidz
	35tMvcfoFLrJNrpbgy+LdatyWsN28a6uQgyduzJZu2O/Q+yLuLx4cSCBGm2SS4RY9Hq0bFhelLWes
	dWcWy3iqWIMCKEUUd7tSnPJF47bZbwuldtY3XdbLVqZdu+Fy2rmXQmv2J0BqJ/u/m+fXgkAPiUB7p
	ikSoN2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU4L-0000000Fq0Y-259j;
	Thu, 01 May 2025 13:35:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATzI-0000000FpHX-1MWL;
	Thu, 01 May 2025 13:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WQapiMUsqLctAxkgX9dXBZAjV7cdFsWlzKkeB+Niv0U=; b=ODSs7RMwPsA+22A8yAIGj/mbwj
	ZdBCEtCjWCjwOWVruBpFeP8ewMivf3gWmD7hvwEin89jVS1xnBkjdldEgv2qRgFzZKcOnF94K/E6v
	r9CQJPC5iocFeEov0Vvl8yg24GdE5zdmZeJkXAJKDAmlzaz6WgA6+4kdkK4L4U06yHQgmG1/N/dJx
	YJ8CBLPQbEinjb6l0Go/L9AMBmxnSR1u5r76InDRNwtQGY2XsEVxoUiSESJWe+fqKfMsFQWK0eggX
	GD+Rhkt4XebJRYjPGCD32ISvmt9SFDcSZVaqijBtTK3o+BWzkjTCqcdCF3a8jsCaIzlf3GoNFc4za
	FiU7greQ==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uATyy-0001xd-QL; Thu, 01 May 2025 15:29:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Johannes Erdfelt <johannes@erdfelt.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable bluetooth of AP6611s on OPI5 Max/Ultra
Date: Thu,  1 May 2025 15:29:33 +0200
Message-ID: <174610616059.401554.10034489142081349913.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250427182019.1862-1-honyuenkwun@gmail.com>
References: <20250427182019.1862-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_063004_363019_27E61F90 
X-CRM114-Status: UNSURE (   9.57  )
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


On Sun, 27 Apr 2025 13:20:19 -0500, Jimmy Hon wrote:
> Orange Pi 5 Max and Ultra has onboard AP6611s with Bluetooth 5.3
> connected via UART7.
> 
> The chip reports as:
> [    3.747864] Bluetooth: hci0: BCM: chip id 3
> [    3.750021] Bluetooth: hci0: BCM: features 0x0f
> [    3.775923] Bluetooth: hci0: SYN43711A0
> [    3.775930] Bluetooth: hci0: BCM (001.001.030) build 0000
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable bluetooth of AP6611s on OPI5 Max/Ultra
      commit: db1fefec31e79e59459c2c14fe4d42e303ef8ba3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

