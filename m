Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D836CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUyMAIJnbkOdcwtpYR/h4OiFxPawHL+4XS3+iNmUVuU=; b=s/9Sa7ztPVWyCu/tAc74LZtfRd
	7dW75uMieXkLPY33lwkQs8mI45rYn/4aMvhnZIPJ9LEE0p30nGP3qx7J2t5oL8XKYE4Bu9dN39yDu
	CY/Dy6dS+m9gJpijWWB+pU7j1yBIG4cqDOerKlX18oiKBfaTqBDy4SqZVcnAeRlo+GrgOAfcndsCK
	pIKheBN+anJMbhAnkAkZhAou4a3uZIhuLhA9eJ0p4367Ao1iWkRWNFonL++RsILNF0syP4tejjraN
	9ssXBTe/HUC2vQ7Mfr2PiGsbb9twsaN6FT02R11bfH7DGP5ujVLsmjp1yUiiMMqY13zgo4zfoSaRD
	KAIchSeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkg5-00000004Vr2-18LJ;
	Sat, 23 Aug 2025 09:36:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZDU-00000003ULD-2hq9;
	Fri, 22 Aug 2025 21:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MUyMAIJnbkOdcwtpYR/h4OiFxPawHL+4XS3+iNmUVuU=; b=MqjXmnGzSVAi7K9hMP41rVxp3H
	ZmIMpPrHojZ+uFniw/zrIG8lzmZQLGtvBp0p4cAKVhYj7dBBuCqsOIrVoNjazjh5+PnmT7I3FwM7/
	zIcVNaHivTP9nm4dZgEQVTtBvmEq2o7XvUsdu2PaavVIW1eUQS9GPVVTWpAv+J8PecKuRsbumGx8E
	yyxrGDmMfzwZ6jV2e/cbOYWZOL6eGqg/szMr+AhHkwsfkYl96E+3AsGRYslHk5mPc85CR9XMjgQzR
	7bGVtxiNIW0Uz23MNIxJSm5qmOze3zMqc33KvSgqpqjdw49k/IPwWqZ5DoBDf/UGmNoihdU6ssReP
	fUkCUIKg==;
Received: from i53875a83.versanet.de ([83.135.90.131] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1upZD7-0004lj-An; Fri, 22 Aug 2025 23:22:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 00/13] Support DSI output on rk3576 and roc-rk3576-pc board
Date: Fri, 22 Aug 2025 23:22:06 +0200
Message-ID: <175589772390.3317579.11344569273616285700.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_142232_682606_4F834CE2 
X-CRM114-Status: GOOD (  12.87  )
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


On Mon, 07 Jul 2025 18:48:53 +0200, Heiko Stuebner wrote:
> This enables all the necesary bits and bindings to get display output
> on the dm-m10r800-v3s addon module for the Firefly roc-rk3576-pc board.
> 
> A bit of cleanup of the ili9881c, because the driver was still trying
> to send dcs commands when the underlying DSI driver might have already
> switched to video-mode, which caused me quite a bit of headache until
> I realized this being the culprit for my garbled display output :-) .
> 
> [...]

Applied, thanks!

[07/13] dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon
        commit: 0e3f3d7c7ae3dec5ff52325915e3efcbce652a82
[10/13] arm64: dts: rockchip: add mipi-dcphy to rk3576
        commit: 21bc1a7fcea4635a49f6b2eff3e4c661e80e8f43
[11/13] arm64: dts: rockchip: add the dsi controller to rk3576
        commit: e51828f80df99a2899e263b750cada6426f14c92
[12/13] arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to roc-rk3576-pc
        commit: 3d5c0c21d86fed05caeae43549e0c13ddd203c31

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

