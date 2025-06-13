Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425E2C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRaFiqb2G89QF5GnFbb5DBEiP7Duzz6i3ys5DJWECL8=; b=D1seiBvKCuO52Z7GMXNVuT1zTY
	v3NC1CRD8OqhWxER5Xa6oyP6ditegRhTvQ0Dx2Xlp+kliY8x6EB+1UsgjVWXx5TlxM+jAZxslpvTg
	X+YFBTmom0xk20E+jtcgwJUa9KdkMdggegcRMQ6l1lSzbpd0dJHsVu0fCRbj08soSbd7jzgZcgBj5
	7h7ja2FGpSWgwn0tu89rfx5SWynW9OLCzEnr1dzLZNR3Co/C4Zgy2h5QJ0ipyXwS6I9efAsEnHFD9
	IS6u3q5lqmNtZlavUv2Q7limML/yLR/L/PCSCrOUPvBEWhRnFxjqITwMJpeVuAqVoW6kz66wGdNVv
	FkJQyuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6VP-0000000GuIQ-3DSv;
	Fri, 13 Jun 2025 15:39:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5YY-0000000Gid0-1z7W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 220CB49BA3;
	Fri, 13 Jun 2025 14:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C81DC4CEE3;
	Fri, 13 Jun 2025 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825538;
	bh=xrFkZTYOl+Mqw+MnXtAP1z+pwD14ChtvOblUtxTfkXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLfplMoX1JV+9xs3L9h7WbHAZKEUMGWzRVo/cvt7qFp7WFa428Sa9mEQeyuD6BZNC
	 wPX/cSbiKhDONQXokSzlLtoE/U17YsIwR+TDoGEJE9dWSv+fcWtbqVxxBwWjO+DJJa
	 3dxO1dRtj9c8uYiZ8ag36JsN58gRPyGK/HhQI0yIlWTNyT0keXpzt8zx0czPv6hOqf
	 smgg1swTkfLvqYvye/u4buKy5LPsz2ATtXQxZBLivVWK3VNpk+A3LJLVyjWrgfomC2
	 3YxiZGqmcSsRpHFxvUiW78up/4oJP+ASvVU1CZkYyUczff5odNKkdpKjSue5gi26uw
	 4wHAp0jc0sfXA==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts
Date: Fri, 13 Jun 2025 16:38:47 +0200
Message-Id: <174982533895.547352.2988220636703408038.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>
References: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_073858_531447_19F234A5 
X-CRM114-Status: UNSURE (   8.12  )
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


On Wed, 11 Jun 2025 15:18:53 +0000, Sven Peter wrote:
> Move the {address,size}-cells property from the (disabled) touchbar screen
> mipi node inside the dtsi file to the model-specific dts file where it's
> enabled to fix the following W=1 warnings:
> 
> t8103.dtsi:404.34-433.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> t8112.dtsi:419.34-448.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts
      commit: 08a0d93c353bd55de8b5fb77b464d89425be0215

Best regards,
-- 
Sven Peter <sven@kernel.org>

