Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA95DCA1019
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHI7n4nszXNbaZKw8v1OM/6/wi5l5Tl3IrbdH2oCzgw=; b=r+FGBgRFdhiV7HAkoUWKFkAW/+
	Cc433PPPxaOOe/DHBNWfK7lXrLK/75ihqBGwKjF4O01V4YZ5l92HrcrLOYxgBh67RwQe6tXqzL5rx
	KD8boLlPd5bUYA2smlb3O9Kpjvihm9eN2QkRtnTtF64uVuomAeZyxyavS1fSH+8y9Q5AzTaNOqEl2
	NXHfLF0HedAJVviShCJZ6x4o6PjQ39JMuc9kOfMt70rxe/YtoxRvLCytAwzJXAcRqKyFTSNXlGtL9
	U/U6w+pN7JXA5VqLoaD7becEMuGTRDSXV6WTjPNL0F/+ixZ5IOvK1jyZ9DqomsRvBBtmFGLtTLIuS
	gLuivoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturo-00000007dXR-4BfZ;
	Wed, 03 Sep 2025 21:18:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqXb-000000075Ud-09qr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 16:40:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 623496024F;
	Wed,  3 Sep 2025 16:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A0BC4CEE7;
	Wed,  3 Sep 2025 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756917658;
	bh=SsiclISk443zkOK/H3wMBLBs3D4jxyQEPB6xGixEaKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZOZ8YC6UQdFrcZMTGlBg7kafdrpx+RnTT8cCfWGSESuJ8j4KdS0rbRM+1MCroxyU
	 Z4pooXVOYQ8SHc0uWLKMQBmNq/Pr6E3VF+1zWS/bdtgxEidW2zi1wzC6/DSqrtNHKl
	 5W9c4/IDSCOJ5fPusqW3HNNq1GdDRy/MjIFfFNIxzfDrWbdy8C36fkTDsQPSHYqXBD
	 X7864DmEJ9Pq6D3WHYk9yxwcIGZEJyd4xh+EUuyrYS/h6Ivq732V22jN+9or3bvJ6F
	 3T8eahvr8M7uHRyKBnNUxggnNLoE2mBbIupVTvjsIdzF2EWQZm/3Db4Z4127t0lEfw
	 6SERT7dpGm/fQ==
Date: Wed, 3 Sep 2025 11:40:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain
 interrupts
Message-ID: <175691765626.2450401.13914030815174267647.robh@kernel.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
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


On Tue, 02 Sep 2025 17:40:52 +0200, Krzysztof Kozlowski wrote:
> STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


