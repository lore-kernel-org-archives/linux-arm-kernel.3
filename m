Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF5606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QS1iWk20;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmhphRlQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui9p0aimwq/+/RaSYtQ2u41VZdG+ZsDq8umW+9wZaS4=; b=QS1iWk20IWjfr9533tzlzNS9ja
	5tjBvplLiupDeMZZS+vEEIo04UC3FO9U8GbxqRIfdFVMwsBpAYKI5FX1atp7cJT1HiorJhVKvresF
	ArpROWEUMI4CCFc0KOV1j6Pv26OUgZy0tUy/w/TKaGXukl+pwdsl1cPv0sJvwuzZm3FmoWf1vRpOP
	XHPWG7PP5gbHzMM8D11pSxD2MzVXKz0hDLFb2CuDXobzgryRrItg6QIFYFBcbe6AqWchUv72TnhVO
	W9WcItf4O9RGy1fvtaXVui+5qYuK4LWzB4QrLt6G0TtOZHh9S6YpwqAOyMtve91ovFUjE3XPqmrpb
	OB75wCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ48S-0000000912E-3Z6R;
	Tue, 20 Oct 2026 07:19:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ48Q-0000000910q-3TuL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:19:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64F9742D7A;
	Tue, 20 Oct 2026 07:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3891F000C4;
	Tue, 20 Oct 2026 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792480785;
	bh=Ui9p0aimwq/+/RaSYtQ2u41VZdG+ZsDq8umW+9wZaS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bmhphRlQyGNivJZ2bRFw490m+bzd+aOVK65B1oyiPPtuQXMzdhK0g2z/iZWZ9Kcul
	 Gol0ybzQ/r8yunYwcOIhjtHNKBzER+g0WyC88B3iscvFFBAb1kYaSoxHuSMgveVP8g
	 4xw5fGx27Q2qIgO4gffRsp1uA2lzysm9UTlycvBubs5A9dsnQOM7iSLrblyaPV7fVa
	 q8kP6Xk3a0P4PPdYjqKUiLnTqJ0EN/jqqyMpAcHZAw9g6xOh3P9XmfyFg4sEjiu3PA
	 2az9SUj3RhqeTiY774C1suCjXfn3eKwLgAJeAL8+J8wPodJDhjFi5FO/Xh9c7ZiVvg
	 Q0wt4OWx9tYRw==
Date: Tue, 20 Oct 2026 09:19:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Cochran <richardcochran@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Message-ID: <20261020-hopeful-delectable-dove-62f1d1@quoll>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
 <20261017-shikra_ethernet-v3-2-26a8beb44b8f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261017-shikra_ethernet-v3-2-26a8beb44b8f@oss.qualcomm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 17, 2026 at 03:15:13PM +0530, Mohd Ayaan Anwar wrote:
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: pclk
> +            - const: ptp_ref
> +            - const: rgmii
> +            - const: axi-noc
> +            - const: pcie-tile-axi-noc
> +        operating-points-v2:
> +          description: |
> +            The OPP table specifies the rates for the NOC access
> +            clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc"
> +            order.

Drop property here and move description to the top-level part.

> +      required:
> +        - operating-points-v2

Best regards,
Krzysztof


