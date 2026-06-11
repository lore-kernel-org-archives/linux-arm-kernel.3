Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC33CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbHo0RwI9j3Vdth4NfkBJIy1aubZyvoaCPcPZk7uecY=; b=TskQwuVXXyIOv4zo0KSoy3Ywh1
	WhtAmmmyoCmPBAwL7/8EE5l3rdAIEU6yPNKBzGznqQTNYmfuFxardrxG0bkI8Wzl0fE+CEcKCQ+nL
	epOSkoYH02Zh4PVwaUe5SySYcT9ug+U8au3K6ccn8ty3z4/EDotx2jFbAc0eDzyoobnxUh3wAtjo2
	C7OkkMLfI88MPgEb6KjOmCg4kAO9XDCbyh0RE29luPnEnaJarZvTPPgw1g1V7RVlCld6KjJiMQeBj
	YAKUAoGNt4bFgcWEMu/eqRRqUojlbR5iShKwenZxd9ua6zi/4EPkPaNDYdrLin56K724/wnc0r63U
	BU4aF92w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbMm-000000095iM-0b4n;
	Thu, 11 Jun 2026 09:06:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbMk-000000095hi-26yR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:06:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC0A96001D;
	Thu, 11 Jun 2026 09:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3491F00898;
	Thu, 11 Jun 2026 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168781;
	bh=WbHo0RwI9j3Vdth4NfkBJIy1aubZyvoaCPcPZk7uecY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kucb9rwcHEXWUXr8GWMIN4nP/+rRE9XttQY0S+Zj5R9LxhwYhLrtkW7kiqK3T9wsA
	 K/LYBXzTyz+OXKned5q1s7+VHP8RPSuxThdytrcODgkZ+WJJ/oG+3CGGmKhET8HXpY
	 96GI9HN+WxBg41+Wpnt2hKpwERANapi38JxjM889yFXkDj+8pqgbvMKmuX+EUpasu0
	 Y3Pgl6cTE54EJtrPpncQUxLpAF2gizVoAbPBxi0M7QYS767K9QRKZ4hJY4mPgXfCW5
	 R6GhQAyLqv9M0aK9rFaK9KUUs7A/T4YuH4U5QqSC7E2AxD/lNuY63y47PkN6BMgOHx
	 eTNvgHmZQX8zA==
Date: Thu, 11 Jun 2026 11:06:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Josua Mayer <josua@solid-run.com>, Maud Spierings <maudspierings@gocontroll.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite
 DART-MX8M-MINI Boards
Message-ID: <20260611-primitive-kind-crane-aa9800@quoll>
References: <cover.1781024557.git.stefano.r@variscite.com>
 <a3355082aec3454f671b44e1f9a78000d2733470.1781024557.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3355082aec3454f671b44e1f9a78000d2733470.1781024557.git.stefano.r@variscite.com>
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

On Wed, Jun 10, 2026 at 10:58:53AM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
> development carrier Board.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


