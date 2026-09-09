Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5E8C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyR/9+HKKkwanUiR3MUx/t7NgUeADXU1eBQkqHF17Qc=; b=wXnTvUdW/P+xbsF/c5lTNSC+F+
	txOlc3i2XF/3NffKPSMVxAW8wGzDBfOIIwmpWwuHXLe/W315y0JvHdbS2x4cxsiYLrstY0+SqvY7B
	4za5bE+LS/eWv0uiMPY3uGG70bXiS3Pkyr55fKWB+XJ//gXx1QYUWgPTykGNE+1bXMJxkW+tY3Uhw
	/IsmDWpxwWQw32NBwpK7AHqN2hYRs3refzxgBFJGmSsVNuaDbkA1nwojasg0qPD2lFuxt9L4pq9Bm
	i0R2zNeWn1PNxEqE6p7PJAehARHjqvaz4/5jHrQf2ie3grPlbCIJyCKqDnDdX38Gb0bTjWxaIs8Ez
	ipawP+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8O-0000000CueY-2dz0;
	Wed, 09 Sep 2026 21:47:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8K-0000000Cud1-0KmL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:47:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D18984165D;
	Wed,  9 Sep 2026 21:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B051F000FF;
	Wed,  9 Sep 2026 21:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788990427;
	bh=VyR/9+HKKkwanUiR3MUx/t7NgUeADXU1eBQkqHF17Qc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TUcYEFS0/z0SsQXt7rbqKc78YIO0ooWhOFE1+FPYtSpnX7ywW+8KZRyUbHL2hhNQ1
	 1u8vZCUzEceW55ZGjRJRuWAnw35q6oQvizoS2ugVzpRKrnHOH4J0qhcvbLr8/fXK+a
	 DtL2m5O5O8yv1uFQW/IEwaYSv3ujujB7p2jJyOQQhBK+tMJYsx0RYQ8nTpirKMRVZl
	 XSTjcr8XhDuEk3VSCTwJpfKV0ZvimvrhsC2TGngCXBrIXlOoplD5+VPvtkAOt2heuW
	 HA222fcuGLtsfSuAd2nV6f0nSNG9vXMtUxFICewcIJvyPiSFwotD2YM7UGVebbFdXX
	 5zung3x9ENHYw==
Subject: Re: [PATCH net-next 3/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
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
Date: Wed, 09 Sep 2026 21:47:05 +0000
Message-ID: <178899042581.219967.9210178730210063221@kernel.org>
In-Reply-To: <20260904-shikra_ethernet-v1-3-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-3-a50765996035@oss.qualcomm.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] The new `qcom,shikra-ethqos` conditional in
  Documentation/devicetree/bindings/net/qcom,ethqos.yaml enforces only…
- [Low] Reported concern: the binding documents `qcom,shikra-ethqos` (a
  standalone compatible with no fallback), two new clocks (`axi-noc`,…

--

dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible

Adds the qcom,shikra-ethqos compatible to the ethqos and snps,dwmac
bindings, extends the clock list with axi-noc and pcie-tile-axi-noc, and
adds an if/else block constraining Shikra to six clocks while requiring
operating-points-v2.

> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 423959cb928d9..ad2cc706fa740 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml

[ ... ]

> @@ -32,6 +29,7 @@ properties:
>            - qcom,qcs404-ethqos
>            - qcom,sa8775p-ethqos
>            - qcom,sc8280xp-ethqos
> +          - qcom,shikra-ethqos
>            - qcom,sm8150-ethqos

[Severity: Low]

This is a standalone compatible with no fallback, and at this point in the
series nothing consumes it, the two new NOC clocks, or the mandatory OPP
table.

Checking the end of the series, this is addressed by the later patches:
"net: stmmac: qcom-ethqos: add per-platform NOC clock voting" adds
qcom_ethqos_init_noc_clks() with devm_clk_bulk_get() and
devm_pm_opp_of_add_table(), and "net: stmmac: qcom-ethqos: add Shikra EMAC
support" adds shikra_noc_clks[] plus:

	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},

to qcom_ethqos_match[], so the compatible does bind by the end of the
series. Noting it only for ordering visibility.

[ ... ]

> @@ -81,6 +83,11 @@ properties:
>        - const: cpu-mac
>        - const: mac-mem
>  
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +

[Severity: Medium]

The OPP properties are added here, but power-domains is never mentioned
anywhere in qcom,ethqos.yaml. It is only permitted through the inherited
$ref to snps,dwmac.yaml, which defines:

  power-domains:
    maxItems: 1

The commit message says the OPP table exists "to vote VDD_CX to SVS when
the NOC clocks are enabled" through required-opps. Can that vote take
effect without a power-domains phandle on the node?

A per-OPP required-opps entry reaches genpd only via:

drivers/base/power/common.c:dev_pm_domain_set_performance_state() {
	if (dev->pm_domain && dev->pm_domain->set_performance_state)
		return dev->pm_domain->set_performance_state(dev, state);

	return 0;
}

With no power-domains phandle, dev->pm_domain is NULL and this returns 0
without doing anything, so dev_pm_opp_set_rate() ->  _set_required_opps()
-> _set_opp_level() silently drops the CX corner while the two 120 MHz NOC
clocks run.

> @@ -92,6 +99,41 @@ required:
>    - clock-names
>    - reg-names
>  
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-ethqos
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
> +      required:
> +        - operating-points-v2

[Severity: Medium]

Should power-domains also be listed in this required block, next to
operating-points-v2?

As written, a Shikra node carrying operating-points-v2 and an OPP table
full of required-opps but no power-domains = <&rpmhpd RPMHPD_CX> passes
dt_binding_check and dtbs_check cleanly, and the schema emits no
diagnostic for the missing phandle.

Grepping drivers/net/ethernet/stmicro/stmmac/ at the end of the series
returns no pm_domain references, so the device tree is the only place the
CX dependency can be expressed.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260904-shikra_ethernet-v1-0-a50765996035%40oss.qualcomm.com

