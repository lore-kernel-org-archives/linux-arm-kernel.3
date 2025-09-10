Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACD6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlHv0+GrHV1hBNSj6BJKLSwams6/gKxyprG2p5gwuN8=; b=0zfIiEwLxAl/uM7GhKcUQE4cpq
	Qokuwe9ZqluV49IR10VSjulu+oI0hR5b8Fs8b6jJxbXMpWzkDaRA6hS/D1leukjYcqSCdp6o4/rqI
	7a02asTa7rBwRl5TCyOu+by6wH2zZQsNXu2RM5ACR1XUEt9lHj9mKn2KZs2LSCNqLEjH7SIdHtxx2
	zINzOsazFs83quh+7sl3RO2614Ic0tqquyGevgDI7+mkF5ygJYAbWhY7NbeqMGrX5hWScOy6PxEPs
	knfN9sYKUM4BF3xyKL4MN0JFRYX5sbCC8SFD2SKCDmcuNlfBQKzYYMHnmBiljYmCfc+KqlgtqynpE
	J1bhDf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNJQ-0000000FL0Z-0mly;
	Wed, 10 Sep 2025 16:04:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNJN-0000000FKy8-375W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KlHv0+GrHV1hBNSj6BJKLSwams6/gKxyprG2p5gwuN8=; b=La6wrW4KHul4jfO4rtbU8hD01X
	FcZppvUr5TlhkRKeJber2yMH0LVsSwhRAKwz+bhLWoEMEg0OIAjMwJ7FC5Ow/BYVscoA22vdPHydt
	Jot1v/kCWKxpJ0qC5GzmEy1GXrSPjmz8c8Sh1AOlk431WwjvNSYPJU6caRZ7GOnck1Eo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwNJ6-007y3p-Ip; Wed, 10 Sep 2025 18:04:28 +0200
Date: Wed, 10 Sep 2025 18:04:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
Message-ID: <24cd127d-1be7-42f4-a2ec-697c5e7554db@lunn.ch>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_090445_778873_18507FD2 
X-CRM114-Status: UNSURE (   7.44  )
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

> +    ethernet: ethernet@7a80000 {
> +        compatible = "qcom,sa8255p-ethqos";
> +        reg = <0x23040000 0x10000>,
> +              <0x23056000 0x100>;
> +        reg-names = "stmmaceth", "rgmii";
> +
> +        iommus = <&apps_smmu 0x120 0x7>;
> +
> +        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq", "sfty";
> +
> +        dma-coherent;
> +
> +        snps,tso;
> +        snps,pbl = <32>;
> +        rx-fifo-depth = <16384>;
> +        tx-fifo-depth = <16384>;
> +
> +        phy-handle = <&sgmii_phy1>;
> +        phy-mode = "2500base-x";

Nitpicking: It is clearly not an SGMII PHY if it support
2500BaseX. You might want to give the node a better name.

> +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> +        snps,ps-speed = <1000>;

Since this MAC can do 2.5G, is 1000 correct here?

      Andrew

