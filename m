Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFAFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbGIqBA827fqYiJ/qcLr+X8FwBh5RiPrv19CVKjyq3A=; b=LczdWateAeC0O/cVf2RQGeIKa5
	qG0cK0dOpZ+v8UEbiJU2DUjFcxKshpc8AFmfhnPv14bKKgl5CnyYWWMytO8GHQ0Yv4jSgpHtLVHYt
	OqpQVNeAu8duJiv65kkpfNTZXAPDk49qOox5a+hzBKkWyXhhVhxzhFfNQ4WsF+73FshW9YZQ5aGo5
	Hi4AUL8eL3iY/I7Qf7H/HP9CHszRCd3xkt8xwTRb5LvQ6xLWCjwf3xmEKNhg2udxFguJAtg70HPLm
	rpCvnddlglZSadgHUBmhe8QU9XH8Wxz7gTpzXxOX8NjztEHoaIlg7ZUBHkseholqKKMq1LMFnqdDR
	y7+GrxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIxL-0000000GSl4-3LtZ;
	Fri, 10 Jan 2025 17:37:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIuz-0000000GSFw-1aRH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 17:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 022C4A42755;
	Fri, 10 Jan 2025 17:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF36CC4CED6;
	Fri, 10 Jan 2025 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530532;
	bh=5KZvj0UJW7q8uEo+QUesHwTgLnEO03HmGRUGeRMyG9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6cAy4m7SRrKAMozBVgurC2+n8aTsRrKOBvoQ5NLYDdDlrY9cdKkI5fgC7/S8DAVT
	 rxbDnkw+r+Q8B+ta9wVNFD1w6kCXYyEpDox2porATxo/MLopH5aerCTCkca5IekCMd
	 DW9q147yCTUYucmR/Ot3GuBZ82XVGzJ8ywViymVOSTCn6ykR9/7XMcc9KLiHKWfGk4
	 GtqsOj3msFi7UF3o4Kp7GGEeU6Jsm96kuHoxBG+VlMXkgjnjmLaztqp+bLw8rQltb8
	 tNuLX5qCNFVJQ/tmmhVsUBojKgLPF7CWGLnRZD/U/zVCqh/sxSZamn1QWaHxQ1ISLQ
	 c71EwuPgpOksA==
Date: Fri, 10 Jan 2025 11:35:31 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Romain Naour <romain.naour@smile.fr>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org, kristo@kernel.org,
	vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <20250110173531.GA3025883-robh@kernel.org>
References: <20250110100331.1642242-1-romain.naour@smile.fr>
 <20250110153520.GA2904744-robh@kernel.org>
 <3e8ccd7d-0bc1-4ccb-8446-c9d10efbc969@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e8ccd7d-0bc1-4ccb-8446-c9d10efbc969@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_093533_542132_6752BC5A 
X-CRM114-Status: GOOD (  33.22  )
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

On Fri, Jan 10, 2025 at 10:17:15AM -0600, Andrew Davis wrote:
> On 1/10/25 9:35 AM, Rob Herring wrote:
> > On Fri, Jan 10, 2025 at 11:03:30AM +0100, Romain Naour wrote:
> > > From: Romain Naour <romain.naour@skf.com>
> > > 
> > > The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> > > SoC are used to drive the reference clock to the PCIe Endpoint device via
> > > the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> > > obtain the regmap for the ACSPCIE_CTRL register within the System
> > > Controller device-tree node in order to enable the PAD IO Buffers.
> > > 
> > > Using the ti,j721e-acspcie-proxy-ctrl compatible imply to use "Proxy1"
> > > address (1A090h) instead of "Proxy0" (18090h) to access
> > > CTRLMMR_ACSPCIE0_CTRL register:
> > > 
> > >    CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)
> > > 
> > > "Proxy0" is used as the default access path that can be locked with the
> > > help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1" registers.
> > > 
> > > The Technical Reference Manual for J721e SoC with details of the
> > > ASCPCIE_CTRL registers is available at:
> > > https://www.ti.com/lit/zip/spruil1
> > > 
> > > Signed-off-by: Romain Naour <romain.naour@skf.com>
> > > ---
> > > v5:
> > >    - Add missing change to the J721e system controller binding
> > >      to avoid DT check warning when the new acspcie0_proxy_ctrl (syscon)
> > >      will be added to J721e system controller node (Andrew Davis).
> > > 
> > >    https://lore.kernel.org/linux-devicetree/90f47fae-a493-471d-8fe6-e7df741161be@ti.com/
> > > 
> > >    - Explain why "Proxy1" address (1A090h) should be used while using
> > >      ti,j721e-acspcie-proxy-ctrl compatible (Siddharth Vadapalli).
> > > 
> > >    https://lore.kernel.org/linux-devicetree/begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl/
> > > 
> > > v4: Add missing change in the second list (From Andrew Davis) [1]
> > >    Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
> > >    [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
> > >    [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/
> > > 
> > > v3: new commit
> > > ---
> > >   Documentation/devicetree/bindings/mfd/syscon.yaml           | 2 ++
> > >   .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
> > >   2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > > index 0e68c69e7bc9..1f3e67f432e7 100644
> > > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > > @@ -115,6 +115,7 @@ select:
> > >             - ti,am625-dss-oldi-io-ctrl
> > >             - ti,am62p-cpsw-mac-efuse
> > >             - ti,am654-dss-oldi-io-ctrl
> > > +          - ti,j721e-acspcie-proxy-ctrl
> > >             - ti,j784s4-acspcie-proxy-ctrl
> > >             - ti,j784s4-pcie-ctrl
> > >             - ti,keystone-pllctrl
> > > @@ -213,6 +214,7 @@ properties:
> > >             - ti,am625-dss-oldi-io-ctrl
> > >             - ti,am62p-cpsw-mac-efuse
> > >             - ti,am654-dss-oldi-io-ctrl
> > 
> > > +          - ti,j721e-acspcie-proxy-ctrl
> > >             - ti,j784s4-acspcie-proxy-ctrl
> > 
> > How do these 2 compare? Are they compatible?
> > 
> 
> Yes, they are 100% identical and compatible, but we were told
> to make a new string anyway.. [0]
> 
> [0] https://lore.kernel.org/all/1bfdf1f1-7542-4149-a85d-2ac4b659b26b@kernel.org/

Then you should have:

"ti,j721e-acspcie-proxy-ctrl", "ti,j784s4-acspcie-proxy-ctrl", "syscon"

> 
> 
> > >             - ti,j784s4-pcie-ctrl
> > >             - ti,keystone-pllctrl
> > > diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> > > index 378e9cc5fac2..16929218d611 100644
> > > --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> > > @@ -68,6 +68,12 @@ patternProperties:
> > >       description:
> > >         The node corresponding to SoC chip identification.
> > > +  "^syscon@[0-9a-f]+$":
> > > +    type: object
> > > +    $ref: /schemas/mfd/syscon.yaml#
> > > +    description:
> > > +      This is the ASPCIe control region.
> > 
> > So this is a syscon child of a syscon. The primary reason for 'syscon'
> > compatible is to create a regmap. Why can't you use the parent's syscon?
> > 
> 
> The parent node will not be a syscon soon. We made this whole bus a "syscon"
> so we could just poke any register we wanted which was a hacky solution we
> want to fix. The parent will be converted into a normal "simple-bus".

Sigh... And that can be done without ABI breakage?

> Most of the IP in this region can be described using normal DT devices,
> but there are still just a couple registers like this where we need a raw
> syscon (or we could make a proper device driver for these registers, but
> that might be excessive, instead seems easy enough to just poke them
> directly from the PCIe driver).

Given it was already a syscon, keeping that is fine.

Rob

