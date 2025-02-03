Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F0FC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4nx1cYB2XMya5dsknAcGEuuSmOAaTjn1xFWh2exy+4=; b=eYv/dol5EJS7fjb1MmsaWJqYkp
	n8wnvo2ESfHMDvojVCuZEt1Bs87Pdl4iAx0l6seVMrxwc052vMD9mjOZI1Wj/wkQKkJH3ml0cneft
	bQS5UYnx0Yi0Ls1yb7OiC4bh69ATTFTOqTzzZ0+9l+jOR2fYRMT7V6GQ0UTvQAP8fsJyO8ZDs9CfQ
	JaAndix0Cj3qiq6lwonYrzVYiSlEXKKq6TpogsioTOQM36mIXM6crQ20yHUV8ZaaOww6pRODK5/Mi
	5zXUB9g2Lu+7Xt7IY0rEXjkR4ttv2bVrkKm7mQSV8/dBtwv1esTjQrNd5KZnQX6JWcMQfh9YgAtFQ
	8wofgucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terop-0000000Eq4q-0654;
	Mon, 03 Feb 2025 08:28:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tercv-0000000Enb9-2tbZ;
	Mon, 03 Feb 2025 08:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W4nx1cYB2XMya5dsknAcGEuuSmOAaTjn1xFWh2exy+4=; b=wVtWgjgtbp2wxfGovdDNbeIw0E
	EK1DVFc4xJIWIQwM8SK8cRKLncxvRuaFsv9BkE3sExkoDVmzBORvBTcZ8MUJp/gB1iJvtHVsJjDFK
	k82QPc9SoMUbcfmK/QGYscdGDZXhnG/YUZ2DdZwVj/rDK0WTJzo9j7YcUDtJVt3WFo6Por+nohmVZ
	k4avGC5VXYb04RXQC1opmK6BIqwJ3eUz36D6yuVo+S8XaFxCsIQBQJ98Hya2Hkq/5PXm0per0zxko
	vCNA3LIqDtzGYtLgOIkqOASfCFfATZ25mEDLuW3r7KJXpFijwVeGLLZ0r1NrfzlDtUFyxZTbuIpyy
	07QCjOgQ==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tercl-0005Vr-GX; Mon, 03 Feb 2025 09:16:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix broken tsadc pinctrl names for rk3588
Date: Mon,  3 Feb 2025 09:15:57 +0100
Message-ID: <173857053617.78657.9000996460900671824.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250130053849.4902-1-eagle.alexander923@gmail.com>
References: <20250130053849.4902-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001617_731681_168D3D1D 
X-CRM114-Status: GOOD (  10.78  )
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


On Thu, 30 Jan 2025 08:38:49 +0300, Alexander Shiyan wrote:
> The tsadc driver does not handle pinctrl "gpio" and "otpout".
> Let's use the correct pinctrl names "default" and "sleep".
> Additionally, Alexey Charkov's testing [1] has established that
> it is necessary for pinctrl state to reference the &tsadc_shut_org
> configuration rather than &tsadc_shut for the driver to function correctly.
> 
> [1] https://lkml.org/lkml/2025/1/24/966
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix broken tsadc pinctrl names for rk3588
      commit: 5c8f9a05336cf5cadbd57ad461621b386aadb762

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

