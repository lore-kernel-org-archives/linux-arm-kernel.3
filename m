Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99229CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zV1tkuQVhB7asiK+J7N184oVAmpF7qz9rFGuGv/mKyw=; b=iuYIVBOnO5iIrdr3evoBJFhKkE
	IQBk+9C8s6NEhDNNiGh3yd6biylu4gY7In1sU+7VtbPAtWuQ/DkAEJXyGSLPnJ8MgZJf1Nlx9pJfK
	91qQVJXX3sn0ZmZiM7oBjPEfcMdV9o6PbfbJKKfQ1Y09bmVXF0Kj7vBybfJGX3HB+HmMweSZKOIcT
	Y2Dfj5zerL9lCvzZAwl/8HxzvQm7vhfQZhJ8QNq3b2B73QcOp54YeOHbC73OHrEifUT3FxZ4Bv5AT
	t99L33ynbCxeQMh/8E4RHCUEu4r/pGnin2t0U4bK+MzFo2AEdjoGrSSja3/Jq6TCcCr3iMgVkbabv
	OZO5T8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHk3D-00000003J9n-291G;
	Fri, 16 Oct 2026 15:40:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHk3A-00000003J7r-3gYP;
	Fri, 16 Oct 2026 15:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zV1tkuQVhB7asiK+J7N184oVAmpF7qz9rFGuGv/mKyw=; b=nW8dNfcxTDYiFECGGfWoIX/Ku7
	sNm/7PDt5sXWvnWyXzhpOQ2gJNbHyuDrk9MvdSwog/lwmUtPRdYxf/cY8s5vrupvCYCd5nLhfXZkc
	T+HCLAIsl4EYA1mG6U13D3Fg74Ln3knSk4rATAMC7bC7iRz98pywJkmpdcpg8OX3tMa0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xHk2y-00BArn-3k; Fri, 16 Oct 2026 17:40:40 +0200
Date: Fri, 16 Oct 2026 17:40:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Biao Huang <biao.huang@mediatek.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@kernel.org>, kernel@collabora.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 2/9] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
Message-ID: <b4950f82-0163-4482-9799-a5e3c6eb5964@lunn.ch>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
 <20261016-dwmac-mediatek-mt8189-v3-2-25daf2bbcf35@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-dwmac-mediatek-mt8189-v3-2-25daf2bbcf35@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_084052_917893_D233084B 
X-CRM114-Status: GOOD (  10.11  )
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

> Finally, update "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps" property
> description to add MT8189 RX/TX delay stage divider values, as they
> differ from existing supported SoC.

These should be mark deprecated and the standard rx-internal-delay-ps
and tx-internal-delay-ps used in there place for new devices.

> @@ -86,8 +85,10 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> -      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> -      or will round down. Range 0~31*290.
> +      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a
> +      multiple of 290, or will round down. Range 0~31*290.
> +      For MT8189 RGMII/RMII/MII interface, Allowed value need to
> +      be a multiple of 180, or will round down. Range 0~31*180.

Please make this:

For MT8189 RGMII/RMII/MII interface, this property is not used, the
standard tx-internal-delay-ps should be used instead.

> @@ -96,8 +97,10 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> -      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
> -      of 290, or will round down. Range 0~31*290.
> +      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a
> +      multiple of 290, or will round down. Range 0~31*290.
> +      For MT8189 RGMII/RMII/MII interface, Allowed value need to
> +      be a multiple of 180, or will round down. Range 0~31*180.

Same here.

     Andrew

