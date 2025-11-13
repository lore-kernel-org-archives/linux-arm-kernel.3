Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DE3CD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riHuRM1k/DFvdlBRjwWTjBhHifAxIVebtaf9zUqQz1Y=; b=m8pRwgiv67eq6RJt0t0oAnoO+K
	gWlIyux3BUo1IFg9quGZH/mu7WpgQ3UhZr9zzY7NT2mZdDsu9hbkYjOaCB9zjzKI7ghcBwf6HYJjp
	0D3P0+LMilaW301Sq0e+J4W/J1jmFPKNNmFqmqHvX4XXdzQNzLbJkZQd9LQ1YM+Gx50AZDq9kpvEY
	GgXxlSsrxufDVZ+P1x0lwWHi0QEigkZSAZJ9b2YipMVSSzcDg35dLr7wQUk4CSCbJjy0mkOCatDnT
	AEYIGBe2OfLWt2uIv95+WeW8Ew2cTfORSUBVp1qBTauRVJmiugo9ybWzxy2IC2zFGt1WnbXfoPSKH
	8s+2LFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgaC-0000000BFsG-3EEc;
	Thu, 13 Nov 2025 23:18:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgaA-0000000BFrT-1riu;
	Thu, 13 Nov 2025 23:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=riHuRM1k/DFvdlBRjwWTjBhHifAxIVebtaf9zUqQz1Y=; b=bqhkUYzbXASVj7s8KfMA53VDMl
	W4RsuZa/eINItbpAFP1DGUvd3ssbzldYGRarJUe0/MM1z2Co6mAJZ8JBmW49dIdorpI+alcdgNiz7
	8yJbLK016pqbMHX5KKHE0y0Ip14qfWsFZncUXtWABhsuCXACfiDepOBALJ/Hig1I0s65ZsmTbOuhG
	KKKFVvNEyJ82N6+m8eRsGbOaxpOqFlpJav2FF+52FLTRnJBrzeyCXEBqW/msSeTImEzjjHR/8brwK
	MCoIFcP7aUB9SfWidWvOrZmDrhm0JmgYwUFgqq90l1IGoTFn2NIY65+kn+SRiTqmSasqGJE43xllP
	frPqcZTA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJga7-00000008KDI-3KQL;
	Thu, 13 Nov 2025 23:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=riHuRM1k/DFvdlBRjwWTjBhHifAxIVebtaf9zUqQz1Y=; b=jPv47wxRaXGpcY/WjPo6mTDh5l
	bN0pYUxMKtxtkmR3YaArdlw0XH9vswzuGChcKl+nFt1L3oyQS6/RuFaU8fvEItmEc+G0xJDxreKGZ
	4S8qZcWy2SWIhf5iF93rd6C53lqibF2w1W7vaeKXmEUIfG7lpaJCNtQuML9wWl1uPPu2/5AJR/jfg
	bju0WS6vz2Ho9/meXy2Tt4vwPFJhcb2mlAsqJ254Qt5nnCaO7IDG5mPA8fqz4PDMOVQkCTlnLpczn
	u2aOiO67F3dEU9lnbJQnRFPqCkcQuTAcGpXCPzFeNIEvK6cuoEJnt+AT73z/JA1j6IrbqAwqLHTzD
	bRBn8qxA==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJga3-0005lz-FO; Fri, 14 Nov 2025 00:18:19 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Muhammed Efe Cetin <efectn@6tel.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mykola Kvach <xakep.amatop@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator voltage
Date: Fri, 14 Nov 2025 00:18:16 +0100
Message-ID: <176307584246.496508.12079514999315183214.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cf6e08dfdfbf1c540685d12388baab1326f95d2c.1762165324.git.xakep.amatop@gmail.com>
References: <cf6e08dfdfbf1c540685d12388baab1326f95d2c.1762165324.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_231823_855351_3762BEC7 
X-CRM114-Status: UNSURE (   8.71  )
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


On Mon, 03 Nov 2025 12:27:40 +0200, Mykola Kvach wrote:
> The vcc3v3_pcie20 fixed regulator powers the PCIe device-side 3.3V rail
> for pcie2x1l2 via vpcie3v3-supply. The DTS mistakenly set its
> regulator-min/max-microvolt to 1800000 (1.8 V). Correct both to 3300000
> (3.3 V) to match the rail name, the PCIe/M.2 power requirement, and the
> actual hardware wiring on Orange Pi 5.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator voltage
      commit: b5414520793e68d266fdd97a84989d9831156aad

Please start new threads when sending version x+1 and don't append
that new patch to the old thread (less confusing for tooling like b4).

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

