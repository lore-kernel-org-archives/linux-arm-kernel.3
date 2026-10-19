Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACB8CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0QANOw3/YflyQHsxKAQ7FbU1GzakLqdGTy7ygi73FM=; b=2qQ7z0yiMYrp+v2XhLk1K/ytNl
	ni86q4IhYfKVq+dWm0cdrpuqHALUFaxiJMWqo0I7uANGl3sLR2VE5CJPyL7DnnGzJbLf+D4RLKrDH
	qOT8iaaP4I3DS+LWA9yJDVuty0D5pImNiqX/AEXHbm/CL19XLGmxmBRcVfrX7MLy1Z7FQX0+6bbNa
	67ehoUEHYtDN81M6ahl8T6/wyENiKOiSEAJwo+WyE4zH1e59u5m9Xoc1gBe4hX8kKVSDh+/sIMFqq
	r66djRJyA8il2ENnVHjPflmt4pkY2oPi092T2kHLarnLprLmedcXxPJqyeedkb1yF4A+nTyOJnCDy
	h8Wh4nxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImgb-00000007Pip-34gZ;
	Mon, 19 Oct 2026 12:41:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImgZ-00000007Pho-11Ff
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F0QANOw3/YflyQHsxKAQ7FbU1GzakLqdGTy7ygi73FM=; b=rO7Sr89zO/YJiwMN8XiYMwlCTI
	8cVZTYM/exDC94h8ybPb1TQCI3ixc9dmocPbirBZIbjkXYdtY4y2wqQNlEQdPBHSzPsw+RSpcbbI3
	GrJP8mogSafcjJ+pQjVRKTL6D1NRMmUuLDf1yrZPv/evjVo9iSmsS5t2gW+CP6uLGEVo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xImg8-00BcyU-Pp; Mon, 19 Oct 2026 14:41:24 +0200
Date: Mon, 19 Oct 2026 14:41:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alex Elder <elder@riscstar.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, richardcochran@gmail.com,
	p.zabel@pengutronix.de, peppe.cavallaro@st.com,
	joabreu@synopsys.com, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, daniel@riscstar.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: net: add support for Toshiba
 TC9564
Message-ID: <7ea35e21-aa5d-4ded-ae4d-fb88d072cdad@lunn.ch>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019030129.1470307-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_054151_282385_82009352 
X-CRM114-Status: UNSURE (   8.22  )
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

> +  snps,tso:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Enable TCP segmentation offload.

snps,dwmac.yaml 

  snps,tso:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      Enables the TSO feature otherwise it will be managed by MAC HW capability
      register.

> +
> +  snps,pbl:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Set the programmable burst length.

  snps,pbl:
    description:
      Programmable Burst Length (tx and rx)
    $ref: /schemas/types.yaml#/definitions/uint32
    enum: [1, 2, 4, 8, 16, 32]

> +  snps,force_sf_dma_mode:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Force store-and-forward mode for both TX and RX DMA.

  snps,force_sf_dma_mode:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      Force DMA to use the Store and Forward mode for both tx and
      rx. This flag is ignored if force_thresh_dma_mode is set.


You should be using snps,dwmac.yaml to provide all of these.

> +  phy-mode:
> +    const: sgmii

This device support 10GBase-R? So why in the binding only allow SGMII?

	Andrew

