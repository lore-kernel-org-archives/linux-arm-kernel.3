Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8013FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gBDVt81+Z6+bypTYiB2xxBDHd4XxKl0bgApuFHkZzZo=; b=YzNktaEpGOKEjJ
	x9o1DJnjdpX6IaZ+u/mS7eFZn4IqDqjx/aTk+hn5p6xASa39/c01rr2QVLM3/oc2Pl8jpmCvl43ld
	9brr8JWf4LiBVOVIZ8aMwexoKQgZgMQys9B9MiTSU1SXZiNMz1VZI9L3cIUFs9rqkFslT51S5Bde8
	X36NIGBBk0Mf5grZrKMG9q5ctF0zxnszxfvNd0ZaxwkTIlGtEQLcIBdWslr5Fsngafm19flsDC1A7
	oAQkT8+NE7fXPyFzJ5lwYCOpF2PmPRiOoQXCZQGZy2NjEpN3BT13myYo+OGriG7A0gWEThu3ouaEE
	f0JKI6g+dxxhS1ZvD1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX5J-00000009DRK-49eu;
	Wed, 09 Jul 2025 15:51:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUn6-00000008mAU-2vRN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 13:24:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E11B161425;
	Wed,  9 Jul 2025 13:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69982C4CEEF;
	Wed,  9 Jul 2025 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752067491;
	bh=WCdeg512n7u0cYs8soM74LBJQEoLwV928d5GHL9redY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=daa2njfv+WZNVqfEWPj7nNEdKg0R9rUe8W+gAG9pzoDGWAyQ3uD6ME3saw+esFTdf
	 Rt3Gp7miu7zq71+O8mKdojUijnJ0fe82W+0Um9afNSvZulMKuqzwhmH+GyyS8S7ZFv
	 9an8Fz5OzWMeSQQ9S84xPde5eK4HUNerE9GD43X1sbhl86eTzMq+eKInNJM3jekOi0
	 WIk6f14cRbB/FhF8IwzwbTzMyy/7NYpYPNQglLTE80eYucCI+aiiePL9aQAN6a8VEU
	 PHKJ1mfcwRO3TxqetXiP/6qg6YXIQu+8l63T24yi8N/NDIklzDPvhUiTRIA353VXwJ
	 QQoip09fhKSwQ==
Date: Wed, 9 Jul 2025 08:24:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
Message-ID: <20250709132449.GA2193594@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f3863b5-eb7c-494e-951c-feb257bbaecf@kernel.org>
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

On Wed, Jul 09, 2025 at 08:47:05AM +0200, Krzysztof Kozlowski wrote:
> On 08/07/2025 18:34, Bjorn Helgaas wrote:
> > On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
> >> Base Specification 4.0. It is designed for root complex applications and
> >> features a single-lane (x1) implementation. Add documentation for it.
> > 
> >> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> > 
> > The "r9a08g045s33" in the filename seems oddly specific.  Does it
> > leave room for descendants of the current chip that will inevitably be
> > added in the future?  Most bindings are named with a fairly generic
> > family name, e.g., "fsl,layerscape", "hisilicon,kirin", "intel,
> > keembay", "samsung,exynos", etc.
> > 
> 
> Bindings should be named by compatible, not in a generic way, so name is
> correct. It can always grow with new compatibles even if name matches
> old one, it's not a problem.

Ok, thanks!

I guess that means I'm casting shade on the "r9a08g045s33" compatible.
I suppose it means something to somebody.

Bjorn

