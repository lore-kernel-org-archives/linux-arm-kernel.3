Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B69C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 18:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJGYR95OzBj8QQrlKrddVqSXRN2vXQMzoaoigQ4hsXo=; b=WOz5YTqPYD76ah92qckbpynzlm
	5grbsuDYIliiL9Gb8YuYlFxCnGWDmKiD3M7wlj3tdP8Pas38n6J4mzjM/MGZN4oSs8HluROOS+3CW
	fjVX62bTFxn9ZIDQJowRNHX9GANA2wNobNYcMDGndzvrDNRjHCGK8KtO3I0Y1GHg4xA0cU0OeIVdA
	jkfIqxpqXvSarcymFHDyLwEwDT3NGEvad4XCgTxVrL9I4oa83uY+Qxds79wK6HHCaoOMmbr6fQG58
	pisZxnnerwaBxOiDvegb9eeOsf0aU6b4x2QRJ9qYt5DmPtWSPtOLUjNMgiBtYhoIVnL/be2EZ+7JK
	UXgUyA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwGP-000000031ED-3cdl;
	Fri, 14 Aug 2026 18:04:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwGO-000000031E5-06qh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 18:04:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 122D360008;
	Fri, 14 Aug 2026 18:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4081F000E9;
	Fri, 14 Aug 2026 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786730654;
	bh=lJGYR95OzBj8QQrlKrddVqSXRN2vXQMzoaoigQ4hsXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jubd+W1NfLbtm6lAdMzClqirXNT6srtJHwF3bT3W3ckPhpJ9UESTWVxCB29x4ZPL6
	 uILMjE3VnYiLS0JnIvquRq/8A96z4UAS33vieWjkGE3tRzSZqCqQV2qPKmlBri0kOQ
	 ZKkrI6zT5HtNmJMnbdQSV9GGc81InAaSpdqwD8FB0xWMV6CLoaxhydpnP07yd1DAuD
	 bKGKc3Ws9DgmTQ+yrZfV0jkOKTNr7R/Ux1aciFjPxUAUSQBUy6fZ6XZ2OX40zocjFE
	 qZcHdlAiP+bVfGMfISAddMV6i6GbhvOqprelXrjq486McTmoeANEiMssh6dXm0Akwo
	 rEPqjJEuGZCMg==
Date: Fri, 14 Aug 2026 13:04:13 -0500
From: Rob Herring <robh@kernel.org>
To: "Neeli, Srinivas" <srneeli@amd.com>
Cc: Jakub Kicinski <kuba@kernel.org>, nagadheeraj.rottela@amd.com,
	srinivas.neeli@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
	andrew@lunn.ch, olteanv@gmail.com, horms@kernel.org,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, git-dev@amd.com
Subject: Re: [PATCH 01/20] dt-bindings: net: add Xilinx TSN Endpoint Ethernet
 MAC
Message-ID: <20260814180413.GF1981719-robh@kernel.org>
References: <20260807104431.157230-2-nagadheeraj.rottela@amd.com>
 <20260808194815.132344-1-kuba@kernel.org>
 <ba624013-e8e2-4262-a451-650c29dc6b8f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba624013-e8e2-4262-a451-650c29dc6b8f@amd.com>
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

On Fri, Aug 14, 2026 at 03:59:27PM +0530, Neeli, Srinivas wrote:
> Hi Jakub,
> 
> On 8/9/2026 1:18 AM, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > ---
> > dt-bindings: net: add Xilinx TSN Endpoint Ethernet MAC
> > 
> > This adds a new binding for the Xilinx TSN Endpoint Ethernet MAC IP,
> > describing a wrapper node that owns the six IP clocks and
> > xlnx,num-priorities, plus an endpoint MAC child and a three-port switch
> > child.  A MAINTAINERS entry is added for the new file.
> > 
> > A few questions about the schema below.
> > 
> > > diff --git a/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> > > new file mode 100644
> > > index 000000000000..00f52b7b623c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> > > @@ -0,0 +1,343 @@
> > [ ... ]
> > 
> > > +properties:
> > > +  compatible:
> > > +    const: xlnx,tsn-endpoint-ethernet-mac-3.0
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > [Severity: Low]
> > Should the wrapper node have a reg at all?  It is listed in the top-level
> > required list alongside ranges, and in the example the two describe the
> > same window:
> > 
> >      reg = <0x80040000 0x40000>;
> >      ranges = <0x0 0x80040000 0x40000>;
> > 
> > Every child window (mac1 0x0+0x14000, ep-mac 0x16000+0xa000, mac2
> > 0x20000+0x14000, switch 0x38000+0x8000) falls inside the parent's own
> > reg.
> > 
> > The commit message says the wrapper only owns the six shared clocks and
> > xlnx,num-priorities, and the wrapper driver in this series never maps
> > that region:
> > 
> > drivers/net/ethernet/xilinx/tsn/xilinx_tsn_main.c:tsn_ip_probe() {
> >      ...
> >      ret = devm_clk_bulk_get(dev, TSN_NUM_CLOCKS, w->clks);
> >      ...
> >      return devm_of_platform_populate(dev);
> > }
> > 
> > Would it be cleaner for a bus node that translates its children through
> > ranges to either drop reg or describe only a wrapper-private register
> > block that no child window overlaps?
> Thanks. We would prefer to keep reg as a required property of the wrapper,
> for two reasons.
> 
> First, reg describes the whole TSN IP register window, which is a hardware
> property of the IP, and ranges translates the child offsets within it. The
> child windows do not fully cover the IP window, mac1, ep-mac, mac2 and the
> switch fabric account for 232 KB of the 256 KB window, leaving 24 KB
> unmapped by any child (0x14000..0x16000 and 0x34000..0x38000). That reserved
> space is where the IP places top-level registers that are not owned by any
> child node.

Why not describe those 2 ranges in reg? Otherwise, you are mapping the 
child addresses twice potentially.

> Second, we intend to use that space. A planned use is a wrapper-level
> build/configuration register that tells software which sub-blocks the IP
> instantiates, so the wrapper can decide which children to populate. For
> example, an endpoint-only build has no switch block, and the wrapper would
> read that register to skip the switch node instead of relying on the child
> nodes alone. That register lives in the wrapper window, not in any child, so
> the wrapper needs its own reg to reach it.
> 
> Because reg is in the required list, making it optional later and then
> requiring it again would be an ABI change. Keeping it required now avoids
> that
> churn once the wrapper starts reading its own register. The wrapper driver
> in
> this series does not map reg yet, which is a driver limitation rather than a
> reason to drop the hardware description.

If there are registers outside of the child nodes, then absolutely you 
should have 'reg'. But please describe what registers and functionality 
are there.

[...]

> > > +      mdio-mac1:
> > > +        $ref: /schemas/net/mdio.yaml#
> > > +        description:
> > > +          MDIO bus controller for MAC1. Registers reside inside the mac1
> > > +          reg-names window.
> > > +        unevaluatedProperties: false
> > > +
> > > +      mdio-mac2:
> > > +        $ref: /schemas/net/mdio.yaml#
> > > +        description:
> > > +          MDIO bus controller for MAC2. Registers reside inside the mac2
> > > +          reg-names window.
> > > +        unevaluatedProperties: false
> > [Severity: Low]
> > This isn't a bug, but the child node names contradict the $nodename
> > patterns of the generic schemas this binding references.
> > 
> > mdio.yaml documents:
> > 
> >      pattern: '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'
> > 
> > and -mac1 / -mac2 matches none of the allowed suffixes (-bus, -external,
> > @<addr>, -<digits>).  Similarly the patternProperties key "^ep-mac@"
> > forces names like the example's ep-mac@16000, while
> > ethernet-controller.yaml documents:
> > 
> >      pattern: "^ethernet(@.*)?$"
> > 
> > Other in-tree bindings that $ref mdio.yaml for a child use a conforming
> > name (qca8k.yaml, realtek.yaml, renesas,rzn1-a5psw.yaml,
> > renesas,etheravb.yaml, faraday,ftgmac100.yaml, microchip,lan7800.yaml).
> > Would mdio@<offset> (or mdio-0 / mdio-1) and ethernet@<offset> work here
> > instead?
> > 
> > Related: the mdio-mac<N> nodes carry no reg, so nothing in DT locates the
> > MDIO block inside the parent mac1/mac2 window.  The offset is instead
> > hard-coded in the driver added later in this series:
> > 
> > drivers/net/dsa/xilinx/xilinx_tsn.h:
> >      #define TSN_MDIO_MC_OFFSET		0x00000500
> > 
> > Could the buses be described as mdio@500 with a reg so the offset comes
> > from DT?
>  Thanks, accepted. In next version renames ep-mac@ to ethernet@ and
> mdio-mac1/mdio-mac2 to
>   mdio-1/mdio-2 to match the referenced schemas. The MDIO registers sit at a
>   fixed offset inside the per-MAC window the driver already maps and have no
>   standalone address, so the mdio-1/2 nodes keep that form without a reg
>   rather than mdio@500.

If there is a register address associated with them, then using that is 
strongly preferred over mdio-N.

Rob

