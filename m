Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D7AC636C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV75AXXuEOzZgqYdCfcJqh0AHXFWizhyarQU0FSzido=; b=Vt8fXVvERSOjhuvANP2VIwNN8q
	2TqOqBSN75jx+SM3L4NpRY44r7l3hUpmqQdGx6qCU1v9nAt3+hQp786m9VRUY+OKZvxWkpAP8lzNU
	WxLM8g6JjN1wssIy1DFiX1VZk+ThqeYgP/jAuhx9mhqejq0J7MSl++C7k6Y4SFVbhfeb3rNMjKQLq
	K56bxnBwldG/7uKMSuw9fFMNqvmesnX4j7M3Ya29tAkgYC8L6q6JKWjGkxkK2ntME2A004of/NxnA
	k69fBAAyYSgVSIFQ+xbv7oZVM4B6wGXc5r9jIeiRD8YT7OOvjZGCSMmz+/tKZ4NwfPebt7TkN9xt7
	0prn9dDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuIAk-0000000H1Dq-21yi;
	Sun, 22 Feb 2026 22:43:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuIAi-0000000H1Cr-17bk;
	Sun, 22 Feb 2026 22:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lV75AXXuEOzZgqYdCfcJqh0AHXFWizhyarQU0FSzido=; b=Wb8YeXYCQ7gpTtg7p9QO2yusXv
	1TwrcVRqUSTsuHCYRG4vCT5+Am66uHTs10EirNcFuqJVf37zgAIWRh0bXNNsaMui+oad3QiQEAIBG
	bFUJxnD3a8bmFfEiCtmwWaL7KYZrBw4Qzhqh0eBPVxd914sGt/u5f0+IAJ+Mih5hkJ6zm/ZOx7KM2
	NGnIBZYLRdxO+kZse8cGQhu7mv8kLRKvZqZhxclq8sn4oqiYmrIEaFhKTX4YQl271pbU4JCjRDwLJ
	ZOTDbWiA6z+cAoAJWnJhr4jeJWc5mcks0Vo2t3K2zMRUWEIht2Gp4RuoJA3oDz4UT3mBRM7pHtERI
	QUV5PVeA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: rockchip: add pwm-fan for NanoPC-T6
Date: Sun, 22 Feb 2026 23:39:14 +0100
Message-ID: <177179992306.1861430.10419331869777090303.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260125181228.25145-1-sigmaris@gmail.com>
References: <20260125181228.25145-1-sigmaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_144328_306652_DAC7F2C7 
X-CRM114-Status: UNSURE (   9.60  )
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


On Sun, 25 Jan 2026 18:10:14 +0000, Hugh Cole-Baker wrote:
> FriendlyELEC offers an optional heatsink and fan addon [1] for the
> NanoPC-T6 and T6 LTS, which plugs in to the fan connector on the board
> driven by pwm1. Add the fan as an active cooling device for the SoC package.
> The PWM duty cycle values are taken from the vendor's source [2].
> 
> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add pwm-fan for NanoPC-T6
      commit: 0c02a103908b8c55633013deb9c76843db879bd6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

