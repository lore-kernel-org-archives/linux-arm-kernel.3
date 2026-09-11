Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F58C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKouco8/yNm0gBoTUKavYASU9EWlitA5dDOKirGScbk=; b=O46VVlERafN6VgjybbPhEqB0Rw
	Pu1rXiYXDT1v21DXqMjx+7R/i+GfMg3mpfqRCXOQPHC9gmH8pEogcNZjgU/Kasj25EtlSQs50QrVp
	iTbDwEW/8vTc9IiK2ssFJrlvrB+mb672bEmJKmNmLMLri0/h/pEIZIuZtjxEjBrZ0C71HKu7G8SQt
	+Bu0dGpOt2kjbCQd8T1fj6NrCaMcM9XCp2TrWUfltk+8hUqYbteai4t9+kZdbIcVSMlZW2RIMSJuj
	fsf7LQocNGquzfwdg2h3GKeEtrMr1/LLgl9nTOwj6Il7EId+6oYW8pgPgtcuuiqhQFyVmL3hIREhq
	2nFzukdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zNe-0000000GUMz-2UZ6;
	Fri, 11 Sep 2026 11:25:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zNZ-0000000GUL2-2HQa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:25:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F401160A66;
	Fri, 11 Sep 2026 11:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3291F00899;
	Fri, 11 Sep 2026 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125912;
	bh=rKouco8/yNm0gBoTUKavYASU9EWlitA5dDOKirGScbk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fBV/WqE1dSL+wlc8I8clbjJeywFqIe4YN/xQX6mZMq9yQpdk6IkeXHCn2VzGB9781
	 ZGbzxC0urNvdKoO4O5GE7WNa5KAlLkzlmCV4sTNL4lRwCR8B11rC9qy8yn4CWqYIK3
	 eJIabMuUAH2P36dkh+KeMy+HB4CiRZ+RfpdeXDC5yS8Bunxz+8x8PSHKdKKr91Jr1Q
	 kIFwdIqwPa8AyefV1yoXJ4dE7cDH59X4hQX9Fl0OPGngJBmuw6CSCiHVFb0bYP4KeY
	 DSShphr1s11Rk5LGw2syNvxKMGlLRehxI8wuDvC3DMdrkoSkAHMRxIHkS1HtFkU37p
	 fVpkYMhkl2+bQ==
Subject: Re: [PATCH net-next v2 3/9] dt-bindings: net: qcom,ethqos: add
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
Date: Fri, 11 Sep 2026 11:25:10 +0000
Message-ID: <178912591096.219967.12828338145381099454@kernel.org>
In-Reply-To: <20260908-shikra_ethernet-v2-3-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-3-bbe3389d0652@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] Documentation/devicetree/bindings/net/qcom,ethqos.yaml: the new
  `if: compatible contains qcom,shikra-ethqos` block makes `operating-…
- [Low] Concern (verified as resolved within this series): the binding
  adds `qcom,shikra-ethqos` with six mandatory clocks (including `axi-…

--

dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible

This adds the qcom,shikra-ethqos compatible to the qcom,ethqos and
snps,dwmac schemas, and introduces an if/else block that constrains Shikra
to six clocks (adding axi-noc and pcie-tile-axi-noc) while keeping the
existing compatibles at four. The Shikra branch also makes
operating-points-v2 mandatory.

A couple of questions below.

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
At this commit there is no driver side for this compatible:
qcom_ethqos_match[] in drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
has no qcom,shikra-ethqos entry, and nothing acquires axi-noc or
pcie-tile-axi-noc or registers an OPP table.

Checking the rest of the series shows this is closed later by "net: stmmac:
qcom-ethqos: add per-platform NOC clock voting" and "net: stmmac:
qcom-ethqos: add Shikra EMAC support", which add:

  { .compatible = "qcom,shikra-ethqos", .data = &shikra_data},

and

  static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
	{ "axi-noc", 120000000 },
	{ "pcie-tile-axi-noc", 120000000 },
	{ "stmmaceth", 120000000 },
  };

along with qcom_ethqos_init_noc_clks() doing devm_clk_bulk_get() plus
devm_pm_opp_of_add_table() and dev_pm_opp_set_rate(). The clock-names order
here (rgmii as the fourth name) also matches shikra_data, which does not
override link_clk_name.

So this looks consistent with the series as a whole; noting it only because
the binding lands ahead of its consumer and the intermediate bisect point
has no driver support.

[ ... ]

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

[Severity: Low]
The commit message says the OPP table is there so its required-opps can
"vote VDD_CX to SVS when the NOC clocks are enabled". Should power-domains
be in this required list as well?

The required-opps vote only reaches a genpd if the consumer device has one
attached. In drivers/opp/core.c, _set_required_opps() starts with:

	struct device **devs = opp_table->required_devs;
	...
	if (!devs)
		return 0;

and required_devs[] is only populated via _opp_set_required_dev(), reached
from genpd_set_required_opp_dev() in drivers/pmdomain/core.c during genpd
attach, i.e. only when the node has a power-domains phandle. Even past that
point, dev_pm_domain_set_performance_state() in drivers/base/power/common.c
does:

	if (dev->pm_domain && dev->pm_domain->set_performance_state)
		return dev->pm_domain->set_performance_state(dev, state);

	return 0;

power-domains is already permitted through the snps,dwmac.yaml $ref (it is
declared there as power-domains: maxItems: 1), so unevaluatedProperties:
false is not in the way; it is simply not required.

As written, a Shikra node with operating-points-v2 and no power-domains
passes dt_binding_check, and at runtime the CX performance-state request is
silently skipped while the NOC clocks still run at 120 MHz. No in-tree DTS
is affected today since there is no Shikra DTS yet.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908-shikra_ethernet-v2-0-bbe3389d0652%40oss.qualcomm.com

