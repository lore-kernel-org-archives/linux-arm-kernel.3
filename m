Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E6AC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuFvVYJoHxWOPg4L2VXKOq9qm6k3RQC4qvQt29QFY6E=; b=qGlPJh42FJL4YEzORjw27R06K2
	LENMJjxMRtMdpF6Y2BHn7FidqAvzFMGOt8JTUDyLrv+UDQLReXnyeMxu4jLXSMBmsO5uccAig136z
	huNzsLRrXG48bdjL0bQJRKWgafPiPjjKJNGSOVEOWAQPZKKkP+qM5IGPM+FIEnF30iQnSvy359+uY
	AAsKBtRvEuCkz6kpanZ9cw3LVrCQBGwRRQ67GlBdFivwGgASRaj5vy9HkSd57vjgpFrFHybpv4d5E
	8hkCKHID2KrB0MJJsWfBEwbENcf1h4DoknJYOmpyNlzoZYQE8CfSGgWvm3tpMsJ5qLV8tc8QYFcZ0
	KhtuLPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8I-0000000Cucf-1lWT;
	Wed, 09 Sep 2026 21:47:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8G-0000000Cuc8-21iS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:47:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D134840BD9;
	Wed,  9 Sep 2026 21:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389131F00893;
	Wed,  9 Sep 2026 21:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788990423;
	bh=uuFvVYJoHxWOPg4L2VXKOq9qm6k3RQC4qvQt29QFY6E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CM1jE2kirabr4C5dOeOZ2560aTwcLVhyPTUAHRsttFxvpRgkVWzRJ9Ekh/hNoxcvL
	 UxgjS6Co3KYEAQMzM2d29g7h2SWKs9UZc9/r9jnE5R6gPI14ZrBut/+j4UiOKVlhfT
	 2a37wMtyuEgP3ewBAOYQ3rNo6Jbz67ELGlwrBOIXTDilIInXMREvA/rv+8wLA0+tUV
	 RV13YFofjVRsKQ00NMBDSMnQiY8EcuLoyo1gcQfxzhixL2cU4RXUy9J2fftU440S34
	 ++fflDx0zFlF3qFA3DkY/R7voVNK9CG7XqyAUVpSEWS/uDUT6FSOmYWCFg023yUhZx
	 WGZek9RmvVrNA==
Subject: Re: [PATCH net-next 1/9] dt-bindings: net: ti,dp83867: add supply properties
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Sep 2026 21:47:01 +0000
Message-ID: <178899042172.219967.3850665440981574441@kernel.org>
In-Reply-To: <20260904-shikra_ethernet-v1-1-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-1-a50765996035@oss.qualcomm.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] Concern (invalidated): the four newly documented supply
  properties (vdda-2p5-supply, vdd-1p0-supply, vdda-1p8-supply, vddio-…

--

dt-bindings: net: ti,dp83867: add supply properties

This documents four power supply properties for the DP83867 PHY
(vdda-2p5-supply, vdd-1p0-supply, vdda-1p8-supply and vddio-supply),
matching the two-supply and three-supply configurations described in the
datasheet plus the separate VDDIO rail.

> diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> index 4bc1f98fd9fe5..e78f08ded3d0d 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> @@ -118,6 +118,20 @@ properties:
>        Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
>        values.
>  
> +  vdda-2p5-supply:
> +    description: 2.5V analog supply (connected to the VDDA2P5 pins).
> +
> +  vdd-1p0-supply:
> +    description: 1.0V digital core supply (connected to the VDD1P0 pins).
> +
> +  vdda-1p8-supply:
> +    description: 1.8V analog supply (connected to the VDDA1P8 pins).
> +
> +  vddio-supply:
> +    description: |
> +      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
> +      2.5V or 3.3V.
> +

[Severity: Low]
One question came up while reviewing this in isolation: do these four
property names have a consumer anywhere?

Looking at the rest of the series, they do. The following patch,
"net: phy: dp83867: add regulator supply management", adds
dp83867_power_on() in drivers/net/phy/dp83867.c, which walks exactly
these names:

  static const char * const supply_names[] = {
          "vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
  };
  ...
          ret = devm_regulator_get_enable_optional(dev, supply_names[i]);

and dp83867_probe() calls it:

          ret = dp83867_power_on(phydev);
          if (ret)
                  return ret;

So the names match and devm_regulator_get_enable_optional() handles the
disable/put on teardown. No change requested here; noting it only so the
binding-only patch is not read as documenting unused properties.

One remaining observation, and it belongs to the driver patch rather than
this one: a rail such as VDDIO that gates the MDIO interface itself cannot
be brought up from a PHY probe callback, since probe only runs after the
PHY ID has already been read over MDIO. Is that ordering expected to be
handled by the MDIO bus or board regulator-always-on instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260904-shikra_ethernet-v1-0-a50765996035%40oss.qualcomm.com

