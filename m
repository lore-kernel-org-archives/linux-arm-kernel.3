Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC422CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHk9QZwIfgCBwU2eb0C//VJ5U26Wg7VRyTm2PCeEHYU=; b=x6UIAyp5cyVaMoVw1czmH7Ln1q
	Koza6N0tYGfxYUorOYUuZUo+sY6ozLQ0tpT5pcM/MUlIyCTT+lHTb+cfbfKAAYUE0B6OKBxlCFxdj
	uw6qFRkxyRLasaaXehgl+Ajd4lSPuwgJ7pidWlWfHM+J1BmnlnhUvvXsb/CEe9dKArhyLwaCll0Vc
	tL4wFNjEZu6d9MPWn83WcIEgqCpSXAsmNSCIL3jlyizClO/TnBNpLGhdAlJv3Dxqe9dbHlhCc0ZD3
	+1oB87dmVzyfiQI/7PY6MpAU7n4UqjFYz93tW0PfjMvRsh7YmhHoOsDqRgn5cdcdLVBdMpGE3fWZA
	cOMpCeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8XX-000000062pV-1ZuJ;
	Sun, 24 Aug 2025 11:05:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8N9-000000061Z5-3a1H;
	Sun, 24 Aug 2025 10:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AHk9QZwIfgCBwU2eb0C//VJ5U26Wg7VRyTm2PCeEHYU=; b=yiWES5cv1GPzuII/nMhMmVXco8
	SzsQsaBD/Oowg0JdSACibN1wV8sXEjfcYoLjN6pU3Qmbvf6fhdHyirLRXSPxlUeJOal+XmqtN8mFO
	bRVNt3GNwbZiW4Mfatb8lJLGCuBhq5lfrRETo/XFVo4dnbvw3eeuVNAOSdmOf8JR0zr6IDTd04SY4
	UwPhiYlpGBTd6fBTVely5aCDi6fTZ7nh1E8CbfqqflcOJYlmvyP/HcnKfm+McOiWIU6x4dH3F4duv
	Y/QTUx+NFEhbGSOfLvzlFB+sk2l0eReQn8uzxEImHsEpw4cA9Pk67HJSAGM2I0VSiGEsVBfd5zfKz
	fnqmZDgg==;
Received: from [62.245.128.201] (helo=phil.wifi.munich-airport.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq8N7-0005H4-0b; Sun, 24 Aug 2025 12:54:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hsun Lai <i@chainsx.cn>,
	Alex Bee <knaerzche@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	stable+noautosel@kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: rockchip: Fix wifi interrupts flag on Sakura Pi RK3308B
Date: Sun, 24 Aug 2025 12:54:43 +0200
Message-ID: <175603280229.3445205.18144135063810636432.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250818090445.28112-3-krzysztof.kozlowski@linaro.org>
References: <20250818090445.28112-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_035451_890573_33543E4D 
X-CRM114-Status: GOOD (  11.39  )
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


On Mon, 18 Aug 2025 11:04:46 +0200, Krzysztof Kozlowski wrote:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning: GPIO_ACTIVE_HIGH = 0 = IRQ_TYPE_NONE.
> 
> Correct the interrupt flags, assuming the author of the code wanted same
> logical behavior behind the name "ACTIVE_xxx", this is:
>   ACTIVE_HIGH  => IRQ_TYPE_LEVEL_HIGH
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: Fix Bluetooth interrupts flag on Neardi LBA3368
      commit: c9f986a54d4031a9b9dff1eb616b0796aa28c730

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

