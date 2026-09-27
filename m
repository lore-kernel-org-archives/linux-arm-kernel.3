Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59376C98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 03:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6a0VT1f5TCixo51k9+lY1+LlgZn70eiYSlEvJbKsfbU=; b=Ta32HVEciDcqbrtWbsugGFzEoa
	9qgZCQlfI4IzvLGRK/y8ZHHYobIk1laJ3WWU8CpPLodMV0qEtJnLcAgx+emQ47RSE6LIFugJaB0vi
	Cwvv24F/YAF+1zRCindtPVy4QSZg47ewwrAO9dMC6r/6BP7DvcGXFh1oEQrQTAHmm6Bp5Y/WWaJ/W
	NJGSDa8txIyIvEYLeV7tSxjZUvfUr5DEwSxoa6c67DmFqUbq3Fih1TSUmSHWvSgPWRu15SwcFjzJA
	YYMz0ajMbyVb9aFMCrok9qzVCg4ZowKAsaBKgPJwb5ihnh6olj/kMEUzg/yCePykKh4HZFsaLjUc4
	8kXscQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAfZP-0000000Fyt4-2Rl4;
	Sun, 27 Sep 2026 03:28:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAfZO-0000000Fysy-0HeD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 03:28:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33E4E407B0;
	Sun, 27 Sep 2026 03:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E44D1F000FF;
	Sun, 27 Sep 2026 03:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790479732;
	bh=6a0VT1f5TCixo51k9+lY1+LlgZn70eiYSlEvJbKsfbU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V6HXz66qKIOMxyMLQqbHBfABI8ZMt3ztYEXexLFaEcHpKsfAO011oTmtM2YiDL6aK
	 95W1VtJ+zSd0ooFRvlwTsi0CC2TbDkmimEbQHQ0n5RAyymDHztuTE4oQOlSPZ7mrwz
	 28Ss9VqUwjIrsOR1rz+ne6ZUcxyYeEgRxuN5Box2kaL0ESMV4lgj2kCkoedrAK7jtc
	 hVlr4jLAI6heNJOYLeA2FccBChv1H7AVtKF0OrIAJFTDotFqEBvdev59C4GjT2g3xI
	 4fVwZzpIrcFDYQkatavpHrNX0Vew1pTblL2QgeB/Zii+5pcOHYvE2jUEl2au1PsaqC
	 aBDSPGTwFkA+w==
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: altr,socfpga-stmmac: Add
 altr,socfpga-stmmac-agilex5-tsn compatible
From: netdev-bot+sashiko@kernel.org
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dinguyen@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 27 Sep 2026 03:28:50 +0000
Message-ID: <179047973070.2160803.3411978604945361082@kernel.org>
In-Reply-To: <20260923021823.46649-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260923021823.46649-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
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
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The binding patch makes the new compatible "altr,socfpga-
  stmmac-agilex5-tsn" a peer of "altr,socfpga-stmmac-agilex5" in the…
- [Low] At this commit, socfpga_dwmac_match in
  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c has no entry for…

--

dt-bindings: net: altr,socfpga-stmmac: Add altr,socfpga-stmmac-agilex5-tsn compatible

This adds the altr,socfpga-stmmac-agilex5-tsn compatible for the Agilex5
gmac1 port, which has an FPGA GMII-to-RGMII converter in front of the PHY.
The new string goes in the same enum as altr,socfpga-stmmac-agilex5, with
snps,dwxgmac-2.10 as the fallback. Plain agilex5 is intentionally not used
as a fallback.

> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index d8f90d36d2469..ca768937d8905 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml

[ ... ]

> @@ -42,7 +43,9 @@ properties:
>            - const: snps,dwmac-3.74a
>            - const: snps,dwmac
>        - items:
> -          - const: altr,socfpga-stmmac-agilex5
> +          - enum:
> +              - altr,socfpga-stmmac-agilex5
> +              - altr,socfpga-stmmac-agilex5-tsn
>            - const: snps,dwxgmac-2.10

[Severity: Medium]
Should the allOf conditional further down in this file also cover the new
compatible? It still matches only the plain agilex5 string:

  - if:
      properties:
        compatible:
          contains:
            const: altr,socfpga-stmmac-agilex5
    then:
      properties:
        interrupts:
          minItems: 17

        interrupt-names:
          minItems: 17

        dma-coherent: true
    else:
      properties:
        interrupts:
          maxItems: 1

        interrupt-names:
          maxItems: 1

        dma-coherent: false

The TSN port deliberately does not list agilex5 as a fallback. A node with
compatible = "altr,socfpga-stmmac-agilex5-tsn", "snps,dwxgmac-2.10] will
therefore never match the if. It falls into the else branch, which holds
the Cyclone5/Arria10/Stratix10 limits.

The TSN board would override the gmac1: ethernet@10820000 node in
arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi. That node has 17
interrupts (macirq, tx-queue-0..7, rx-queue-0..7) and dma-coherent.

If a board DTS switches gmac1 to the TSN compatible, wouldn't it fail
dtbs_check even though it describes the hardware correctly?

In the companion driver patch, socfpga_agilex5_tsn_gmac_setup_plat_dat()
calls socfpga_agilex5_setup_plat_dat() and changes only mac_interface.
That suggests the MAC-side constraints match plain agilex5. Would
something like this work instead:

          contains:
            enum:
              - altr,socfpga-stmmac-agilex5
              - altr,socfpga-stmmac-agilex5-tsn

[Severity: Low]
At this commit, socfpga_dwmac_match in
drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c has no entry for
altr,socfpga-stmmac-agilex5-tsn.

Would a node using the new compatible bind through the
snps,dwxgmac-2.10 entry in dwmac_generic_match instead? That path would
skip the SoCFPGA sysmgr, reset and platform data setup.

The next patch in the series, "net: stmmac: dwmac-socfpga: Add support
for Agilex5 TSN GMAC with FPGA converter", adds the match entry. No
in-tree DTS uses the new compatible before that patch.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923021823.46649-1-muhammad.nazim.amirul.nazle.asmade%40altera.com

