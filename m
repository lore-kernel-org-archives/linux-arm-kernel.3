Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E774CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cypEHEpRR2kJqbcPVa7GjXp1ID7KVO6yBwZP58hpPu8=; b=UB8jSucO9MX2fqm3TEPNO9FFcS
	l1ttOLVisZlmSDGJzuvxjC+tW4WUEC8LZDZTyF1ZJwAc0fM1VtElOoMJUBX2W5CroMTf46+iDsUay
	hrX+n4gJulGW61ojcq6E1EEGYXaL85q6gP7FdNQuXCNCG6wx5C63zRPzbX/j/PEWHQwOSX1D3F+dZ
	jYXaBzRjYw3j9mXuRNlYVT3nE64PLLHeV5okvwWj7NHD6q55SNxdfWoNmxurROfxUw8VG4Gwfiwqf
	X5UFbHi9OxrNo9BeT8wiRboWO8wC+agVdjxQq7dtba4JwP1sL5m5QKFjp6Ri5b9DEqKTTlnjSN5Ev
	at6Me9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjUW-00000004Ml1-0HWn;
	Sat, 23 Aug 2025 08:20:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZ0O-00000003TQG-0oCx;
	Fri, 22 Aug 2025 21:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cypEHEpRR2kJqbcPVa7GjXp1ID7KVO6yBwZP58hpPu8=; b=m50fFHfFtMqgCcu9VSJ5v/1T6H
	rXZjeTd4nbm4TotaElmywFPoV8XWbvuSL8GfaN6a0xWhFP1p1hlUN8ukE7DdXvkYtnaWjfoG4D0je
	JC2lnZk/8KsCYsbU7QoRjO0hQVndHLLDaOe1i3U2ep9K0lAY7RWGhPeiEDWtCxbc+9se5lg8uEIxD
	LMATyPUYvXPGh7wsS4XepSWRK68sUL0SfF70hBPSFw85dmzzccZSp629CltlOpyppucRM1bRNIUJq
	DtYXKHHGXdselR2BtScg+0iTxTl/8apdFsRowbsNS1kCHLh2PbDTLr5VOOgZj+nmkxAlVGRVI3Yh3
	ObWwOPog==;
Received: from i53875a83.versanet.de ([83.135.90.131] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1upYzr-000415-Uo; Fri, 22 Aug 2025 23:08:28 +0200
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
Date: Fri, 22 Aug 2025 23:08:25 +0200
Message-ID: <175589689704.3303128.5679950731528883388.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_140900_223857_EC4F927C 
X-CRM114-Status: GOOD (  12.88  )
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

[01/13] drm/panel: ilitek-ili9881c: turn off power-supply when init fails
        commit: 6c66eba502709a78281333187c1add7b71f7201f
[02/13] drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to (un-)prepare
        commit: 5efa82492066fcb32308210fb3f0b752af74334f
[03/13] drm/panel: ilitek-ili9881c: convert (un-)prepare to mipi_dsi_multi_context
        commit: 9002f55ee4480f23bd2ce91fb5fca536ce31717e
[04/13] dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar Electronic
        commit: 8e484ff181b177ea2e86e537fd7a5c8f9d7532ad
[05/13] dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
        commit: 157ba8c6742931a617a34555c27dd10b36385cf3
[06/13] drm/panel: ilitek-ili9881c: Add Bestar BSD1218-A101KL68 support
        commit: 38dbbbb41c515d72b0a82fde3cec450d068f5e94

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

