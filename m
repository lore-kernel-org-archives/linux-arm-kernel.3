Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153C7C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDuXv4mytSaw3QUpQ4W/0Z9j0VJSFj4YqRtc976l3kw=; b=k8dRsEVhdArpt6yBQ2u6dew7M0
	3mSSwpYRjfVSBQppE8k56wNxx62sP6uDPbomDQK5/pmKX/aYQjdJAthC8v0QLHDT7tosKs63bsqJb
	aRalzvjiQ4faQdQAMk/Aff+eax8xI943Rddhg+BAtLn8magRyuMI6YjTag4vmfXlDv/fUsdYOYkgz
	uohwOfZPD8m8SED+zio8uzPpJJxAiUTSnvSL7lOYEyKoAlrKwyxeGjIx3/9mzGRM0AUL9zC97hh7g
	A+QhxigswkA1nUSsf0vZL/ZVheNxjuiJiVeDJN6MzNTv6Xt9blGnB0/++BFZohXoIaJDu50l9V0pc
	CCFxJQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcRB-0000000449p-1Dhs;
	Wed, 05 Aug 2026 14:17:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcR9-0000000449K-1SQ9;
	Wed, 05 Aug 2026 14:17:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD5EF43AE4;
	Wed,  5 Aug 2026 14:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BAC1F000E9;
	Wed,  5 Aug 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785939458;
	bh=JDuXv4mytSaw3QUpQ4W/0Z9j0VJSFj4YqRtc976l3kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BTmyM5ty0rO4V6Jhc9sL9DMndsBFHlqLTQgLY9LUoxFgvGpr2SC9LBcvTIdE5qgy3
	 VoIHsoyYSOoIgFoTdEkA4oZ1ZzvIZhgXymlnc4Tvu4YApXBwTAVrT269JzTQTSd3/C
	 UGjrmH+36Tw4L6TO5bnWMId9rWjTzIymEET1CU3TIRHlD6aHAwsmMkW9HYVohBAnSS
	 2aK+1y89RZsYhJt7Tz1WVkT46VJDLEh6j7+v8e0IlptUfgHy1Bwxlzer0IxHfj9Jou
	 8KjMuZdHwKtymSyblYhLz3+XH1lZ2maTo2wUJYwrF0VWpU6bxJgBavxS03UhcbWGhS
	 377MhFlw9Hc3w==
Date: Wed, 5 Aug 2026 09:17:37 -0500
From: Rob Herring <robh@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net-next v2 5/8] dt-bindings: net: x-powers: add AC300
 EPHY control
Message-ID: <20260805141737.GA715959-robh@kernel.org>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com>
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

On Tue, Aug 04, 2026 at 08:27:03PM -0600, James Hilliard wrote:
> The AC300 exposes its Fast Ethernet PHY control registers through a
> separate non-PHY Clause 22 address. The manual defines that address as
> the link PHY address plus 16, giving control addresses 16 through 23 and
> link addresses 0 through 7.

That's not a separate device, but just a second address range. You 
should make 'reg' have 2 entries.

> 
> Describe the control endpoint, its required VCC1 supply, its 24, 25 or
> 27 MHz input clock and its SoC SID calibration cell. The actual PHY
> remains a separate ethernet-phy node and supplies the MAC-selected
> interface mode at runtime.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
> new file mode 100644
> index 000000000000..8a616ff3e89f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: X-Powers AC300 Ethernet PHY control interface
> +
> +maintainers:
> +  - James Hilliard <james.hilliard1@gmail.com>
> +
> +description:
> +  The AC300 Fast Ethernet PHY has a separate control interface accessed as a
> +  non-PHY Clause 22 device. Its address is 16 plus the address of the link PHY.
> +
> +properties:
> +  compatible:
> +    const: x-powers,ac300-ephy-ctl
> +
> +  reg:
> +    minimum: 16
> +    maximum: 23
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz and
> +      determines the corresponding EPHY_CLK_SEL value.
> +
> +  vcc1-supply:
> +    description:
> +      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog front end,
> +      and internal digital LDO

Sounds like this supply and clock would need to be enabled before 
accessing the "link PHY address"? If so, then 2 nodes is really a 
problem.

Rob

