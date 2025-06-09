Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989DEC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daOC+vKgljGGAi24/WQBuWAe1UD9I//0tA3pjxmN7ro=; b=ECAyeJl01FtaMXsZlabF0EFvYP
	sX8n6fDV265qb7RZcdMqPVmaz1sZkNoqGxq47AxY4lDU4ER1Rpi94IWEMPppkQEABLB6INAMFbt+1
	hYPfaeZ4yQ6t1U6eXBL+t3DKZ1i16OV9CrKZQARTd4TIiPgeI/5XvhKkPid2pjmXM+TieE4Zqr+Kr
	DAOuFPV5y+TM0EuA+XLlORjnYpxmR8M/wStE4qqoRh1GKhZ86knBTQ9O6CMD1WB9vERXVv7fGm0us
	8AtOfajbCzlnH3GGIAPPfWcYRcp4CkfbLY/27dMhSlCRdnPf98jvjWOUhjkttJGKVtGqn/5yA6hco
	01wb8JBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZyQ-00000003w4I-3nLX;
	Mon, 09 Jun 2025 10:43:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZfI-00000003tWE-3a9K;
	Mon, 09 Jun 2025 10:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=daOC+vKgljGGAi24/WQBuWAe1UD9I//0tA3pjxmN7ro=; b=X3aQk6g97/OfFKGH+TrgrKp7+9
	XphR7NRaWmB8Ir2rLPm9OgPt5xHBAz7e/yweXDZq0rU3NJEzCvMXzq0QUa3N4tTM0gTJutwAm4Hw8
	ZZyxTLkzjfuFQWVDl/zx7qxMvhIIv7PzL2ChCmmEx80YEaHj8pL+QAIyK71dpHGGdQjEo94vLUJ+v
	IXjWyW3fsIQSVPwGdBj5Lwzca1kOCT1gtKV7uXr3M93azRn8U97uqWU4qhEdd+UNErDvz+YeoekI8
	JJkSbAeQhifiOPtGDVjndTyaOwZOiS1L5VIHLkRDXy6GCa9DEUGjKz9w7l+e6M8Mw+lW+jLAtu/dK
	XUHRhAFg==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfB-0006Av-AU; Mon, 09 Jun 2025 12:23:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: rockchip: Add spi nodes for RK3528
Date: Mon,  9 Jun 2025 12:22:56 +0200
Message-ID: <174946455541.762051.5287964403437718499.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250520100102.1226725-1-amadeus@jmu.edu.cn>
References: <20250520100102.1226725-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_032340_891441_B3A0CAED 
X-CRM114-Status: GOOD (  10.22  )
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


On Tue, 20 May 2025 18:01:00 +0800, Chukun Pan wrote:
> There are 2 SPI controllers on the RK3528 SoC, describe it.
> Tested using st7789v chip with spi-cpha and spi-cpol properties.
> 
> [   10.831306] fb_st7789v spi0.0: fbtft_property_value: buswidth = 8
> [   11.042915] graphics fb0: fb_st7789v frame buffer, 240x320, 150 KiB
>  video memory, 4 KiB buffer memory, fps=20, spi0.0 at 15 MHz
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: Add spi nodes for RK3528
      commit: 2783335329e5762deb0dc5b6d634225d8613af16

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

