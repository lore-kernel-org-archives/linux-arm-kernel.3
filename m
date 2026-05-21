Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F53CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guo2ILE14Lv+AGNJMGuUpi1UMFrXaU2PnmPGdYeEOdQ=; b=iXxjTatqDj3kV6FGX8TM5879Hh
	tA6/jCiM0iH0Ri+rZw2Ei4CP5Nny0kNgwD7ZMQ1HRXqxbAlXaGY9FKyn8e2FbViWXnWoTqbiMvmRS
	oaDBkNHFgtfjiWjGQQoDOKf364Si16ClyLH2s05i+IYofGHPxI5kh/uIRoEnT1eyMw09yU20W/711
	3KzK96M5PrNu5kkYIp2tgrSIZeLVfpJoMZhJtDcXHLmnIHJMWZbe7Mje004dqWz6BG/Yk2rYx8wrr
	5OgnTlFVfn3NbdgvNfhxTZRmeMrxRnJfc+tf6YSvnMdEY/EN0NRfDc7UhQrvw6yOxJFj1svYppUMr
	e9OX5/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPy4r-00000006zxD-1Tav;
	Thu, 21 May 2026 07:44:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPy4p-00000006zwX-2qem;
	Thu, 21 May 2026 07:44:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E921443B61;
	Thu, 21 May 2026 07:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBB41F000E9;
	Thu, 21 May 2026 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349458;
	bh=guo2ILE14Lv+AGNJMGuUpi1UMFrXaU2PnmPGdYeEOdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XBeFB6idp4SgHemQhi4cfn957vDcpkBr322AaimEK+s8p96r3daWDX29in1ZPfuL0
	 5v+aLLoYECRJ3Zel/TIEU8VfOhyaKD8pAPeqx1yl8SMY02HwdSomkynOobdYoavmRh
	 h3FcGkz23yBIurIZuNwgOm5G9zPfdO7KsclQOKT+ksF2e3U4IRH7LjR5JvOe5wSL61
	 pHmKMdiIyJjB7LFhQtx0XFv0j7VqDZJKQqyjTggN488Gyjbvaz2DJke35/BylOLZ+a
	 G1EIYbj/h5Obw2RWLLf+c9rYcYylPyqHUz5cTfjMOJ6YdlqASXfqinF2UHeZ3gUW+0
	 SlO2mjb7XpKFA==
Date: Thu, 21 May 2026 09:44:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 2/5] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20260521-ambrosial-abiding-lyrebird-9dc86f@quoll>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520150912.11614-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_004419_734437_C6B4C8BA 
X-CRM114-Status: GOOD (  15.79  )
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

On Wed, May 20, 2026 at 05:09:07PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node.


^^^ here - required but:

> +  phys:
> +    items:
> +      - description: phandle to Serdes PHY
> +
> +  '#phy-cells':
> +    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> +      as defined in dt-bindings/phy/phy.h.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - airoha,usb2-monitor-clk-sel

'phys' is not required? I think you need it to configure the serdes
correctly, no?

> +  - '#phy-cells'
> +
> +additionalProperties: false

Best regards,
Krzysztof


