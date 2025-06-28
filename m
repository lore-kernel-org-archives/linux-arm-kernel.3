Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46385C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRmglBZRzUZs55lGdIaJZ5KS3KNiefOaKqKJbdkEc7c=; b=kNmvR9u/MzUiaEbrA1v2SgWIYC
	9vP/HWH+Roe9jE+rAnhYPMCNVD0MLIkmkKsdg9Ks1Pje8j8fjO9XAV4ZmhCQPbI22zspkh/Httqne
	lBJQoQJr4Ticqq99Mu+7pcOrxbUTPctqu4MIPl779JfVhq1sTSUntGQ0AaoWCVu8laKcB/+hgBG6L
	jX5QKQSZzJ2V1tY0G1CqfiINdTovFC/4AqBEB4QM1LXy0RhUb9CWo2oI6SZbXVUyz/0AGj8VWFxpT
	pfPIQWjmqAVti3IJp9qY7t5Pm2De5uKR+zggADdu+UuhKGgT7rOZZ2b//dR4PfEYZOHVFHaRK112A
	8q5vGnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUnQ-0000000Gmun-1nH2;
	Sat, 28 Jun 2025 12:36:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUl7-0000000Gmgq-31aD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 12:34:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3D5960052;
	Sat, 28 Jun 2025 12:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8237EC4CEEA;
	Sat, 28 Jun 2025 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751114056;
	bh=Gv8OZAS59VuowhMNvxr1kBxJNYmz6S/ffMO8w95ApdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twO55Ffo5tiT0qncLDcjcnipq7VcjU8Nm4Y9P5oTopNqmVT8EmBWZqJwkVAx0gmt6
	 sePfRtnNb/GBnM2VBj8vrmWQ8Qm08zQ+ZIv/X1Bl5ASJEZPEESajBqhX1zJzThex+s
	 oLmAgFK+4fIvX308YNdwKC63WEV1TyInmmKCst38scYijOyyOcZZiGK0fTihwqeHSh
	 AiJQ6ZtEB/9wLHRRmMzyLWtPEMBjlyJUE0yr/xxRfJwsOruDQMYV9IZkMQM3Kk1pf+
	 QMeFbaQeTnUY/obXXj6gH2GPFysCCZ0bXLTCfAjs73AeDZiMD3mCkWtz5AaJS3s/Kw
	 cI6DI31LSqVPA==
Date: Sat, 28 Jun 2025 14:34:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: PCI: dwc: Add one more reference
 clock
Message-ID: <20250628-vigorous-benevolent-crayfish-bcbae5@krzk-bin>
References: <20250626073804.3113757-1-hongxing.zhu@nxp.com>
 <20250626073804.3113757-2-hongxing.zhu@nxp.com>
 <20250627-sensible-pigeon-of-reading-b021a3@krzk-bin>
 <aF76jeV+8us82APv@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aF76jeV+8us82APv@lizhi-Precision-Tower-5810>
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

On Fri, Jun 27, 2025 at 04:09:49PM -0400, Frank Li wrote:
> On Fri, Jun 27, 2025 at 08:54:46AM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Jun 26, 2025 at 03:38:02PM +0800, Richard Zhu wrote:
> > > Add one more reference clock "extref" to be onhalf the reference clock
> > > that comes from external crystal oscillator.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > >  .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> > > index 34594972d8db..ee09e0d3bbab 100644
> > > --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> > > @@ -105,6 +105,12 @@ properties:
> > >              define it with this name (for instance pipe, core and aux can
> > >              be connected to a single source of the periodic signal).
> > >            const: ref
> > > +        - description:
> > > +            Some dwc wrappers (like i.MX95 PCIes) have two reference clock
> > > +            inputs, one from internal PLL, the other from off chip crystal
> > > +            oscillator. Use extref clock name to be onhalf of the reference
> > > +            clock comes form external crystal oscillator.
> >
> > How internal PLL can be represented as 'ref' clock? Internal means it is
> > not outside, so impossible to represent.
> 
> Internal means in side SoC, but outside PCIe controller.

So external... It does not matter for PCIe controller whether clock is
coming from SoC or from some crystal.  It is still input pin. Same input
pin.

> 
> >
> > Where is the DTS so we can look at big picture?
> 
> imx94 pci's upstream is still on going, which quite similar with imx95.
> Just board design choose external crystal.
> 
> pcie_ref_clk: clock-pcie-ref {
>                 compatible = "gpio-gate-clock";
>                 clocks = <&xtal25m>;
>                 #clock-cells = <0>;
>                 enable-gpios = <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
> };
> 
> &pcie0 {
>         pinctrl-0 = <&pinctrl_pcie0>;
>         pinctrl-names = "default";
>         clocks = <&scmi_clk IMX94_CLK_HSIO>,
>                  <&scmi_clk IMX94_CLK_HSIOPLL>,
>                  <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
>                  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
>                  <&pcie_ref_clk>;
>         clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ext-ref";

So this is totally faked hardware property.

No, it is the same clock signal, not different. You write bindings from
this device point of view, not for your board.

Best regards,
Krzysztof


