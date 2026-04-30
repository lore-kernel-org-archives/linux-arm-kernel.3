Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC14FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHAZ3kzxAKZIAeNxD3SciKFOCZcm5lZPIA8wyQkhf1M=; b=ZahruXm8DzKSnnDV+clBcCgbTp
	QavJSu2of8y+/yE1Sz083qXV/AF8Dd+zIyJNyQMKpF39f69lTwy2Uj+/GRZ0AXgS4uYzY8HRBXxJl
	ymX1qNA7G+XTujmy+TQggm/0cg3xcE7iIW4x0SL+HCtEs6+4+3IjoSKSpwhyEKnIwvG5fdOzpRwVt
	TISsROPxJIHgAJ0TbN4owZZEVASxmAVIWxOCCQVjncqNy+VY9AAk+OCw+lY4rgxlodAtbwS8FKzj4
	3/B5HltQtjiHt7Op0MPZNGKQZ57DPi55W0YE92TPV9G0wkkYUsDTVC/LM7SUp5WPHI3U+6pqwWxt2
	gOZ5m0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRuF-00000005Yhf-2Rr9;
	Thu, 30 Apr 2026 13:58:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRuE-00000005YhZ-0k4X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 13:58:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AEAB60180;
	Thu, 30 Apr 2026 13:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295DEC2BCB3;
	Thu, 30 Apr 2026 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777557497;
	bh=o+8+KjdJ8yZ9gakFLBvMNa1VbfsIydfrHzxEKqLfIGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OuhE1BM62f7Wu/VvE9GJhsvrcGk6tTHvmjROQzTm6Tp1Ypek9rKLRu+hv9yqLnvU4
	 HBoM7skhBKxG0VWiRv/c3dYjcqZ3nmeWCqlSxiOIiiN8PT8lLEgszpW8xiSl9cJmu6
	 QVG0PbT1E0/FlDr1RUa1SdFA+p9fDFY20D7EJW/D/BfC4BTsmgG0Mj1mIpkGVPFqMo
	 MqwypdBusXGm5XJyX/AzodUXDIMaD3r/x6gBPxjXxSwh00tsBXG57qzUVvB65P91vL
	 ka0xloXLsGYPNd2XeiHHFno8ZzErWG8HaeHCzJ2kqJxW794cmjEXgauw4cgt64KOPP
	 MjeHpr/5k/jBA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260407-max25014-v8-2-14eac7ed673a@gocontroll.com>
References: <20260407-max25014-v8-2-14eac7ed673a@gocontroll.com>
Subject: Re: (subset) [PATCH v8 2/4] backlight: add max25014atg backlight
Message-Id: <177755749291.2610033.12945503282955319463.b4-ty@b4>
Date: Thu, 30 Apr 2026 14:58:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Tue, 07 Apr 2026 16:41:43 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.

Applied, thanks!

[2/4] backlight: add max25014atg backlight
      commit: 3014ad47cfaf454cb0bbee353272beacd1e7c4bc

--
Lee Jones [李琼斯]


