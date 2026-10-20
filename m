Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70036606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FP/ziV6f;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ol6g562a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OFxyQtijBXYSbvcaeMGg6HSw20JVaD24lHAGl8RQ2E=; b=FP/ziV6ftcJ8MIPAGdOuHieSUs
	5qpo4Psa6aTXZcGWE62Fbkli3eSLJN7vahVixw12ajlYCEJe29XrSn+J04HfOOGSgr2biTcC7a/OY
	kIOISeneBFfpBYVWIIR+rImWRMjwBrPXXO1p81i+84KPZoiKbi+8MPta8nO7Y0FEO/zxD5wsnr/iz
	Fiu+GQd9x34q2KG2Bth9AgvGM7JVT6KXg/OqIZqn1T2rHA2i0VNyfAsVMCtwNHyeIYut8PxaHExuE
	YXcUg+so9oEJ7AVM59cffUpvBJUAh1uHg582Fn+RmX44hxrVP4wbyS1L9bTeO2HZN5z7eTLqCDFX7
	MRg629Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAY6-00000009tCX-2Xkm;
	Tue, 20 Oct 2026 14:10:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAY5-00000009tBu-0AMc;
	Tue, 20 Oct 2026 14:10:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 640A9413DF;
	Tue, 20 Oct 2026 14:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3801F000C4;
	Tue, 20 Oct 2026 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792505440;
	bh=6OFxyQtijBXYSbvcaeMGg6HSw20JVaD24lHAGl8RQ2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ol6g562a328HhuoljmZTxXatRs5NBevcNy7ffv0uafG1txZ5Lu89zsglQ57D+IXXj
	 3fSewLLQaumJDPFb0wUgSpJr3hFmusYrkbHHJklEmQvOWf9leWpFmN7sYG0bBSa5vw
	 1jsan5AGieccaW+dM+AfFdLheolL8u3WY7/I3CkVcMqi+aQLOVqbtw/5PGw+HrDpeO
	 j2ynXCIrvUClI8Qfx96F+Jk1W5KfZUi6jwDR+/23DhmS5m7xLPMnF/zPOFg6VS5U75
	 /dD9Tfm2dUDiC0Jn/92vk33QIHU6TSb49Y96N1Hj9vXn0SjITfNzLQk2Y5kdC7DPO2
	 HbX4ELMkGaGwg==
Date: Tue, 20 Oct 2026 09:10:39 -0500
From: Rob Herring <robh@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: =?utf-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
Message-ID: <20261020141039.GB4157247-robh@kernel.org>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261019150631.GA265407-robh@kernel.org>
 <73ef0d06-75c5-4c10-b4c3-c7b3c07a1e18@collabora.com>
 <2501273.NG923GbCHz@diego>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2501273.NG923GbCHz@diego>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:37:35PM +0200, Heiko Stübner wrote:
> Am Dienstag, 20. Oktober 2026, 00:20:47 Mitteleuropäische Sommerzeit schrieb Michael Riesch:
> > Hi all,
> > 
> > On 10/19/26 17:06, Rob Herring wrote:
> > > On Mon, Oct 19, 2026 at 04:15:03PM +0800, 楊智成 wrote:
> > >> Hi Krzysztof, Rob,
> > >>
> > >>> Existing OS should ignore surplus cell if the driver is coded properly.
> > >>> Same as adding new properties or new front-compatible.  The question is
> > >>> how the existing driver behaves?
> > >>
> > >> As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
> > >> driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.
> > >>
> > >> 1. Keep the second cell. Add the patch as follows:
> > >>
> > >> - if (args->args_count != 1) {
> > >> + if (args->args_count < 1) {
> > >>     dev_err(dev, "invalid number of arguments\n");
> > >>     return ERR_PTR(-EINVAL);
> > >>   }
> > >>
> > >> + if (args->args_count > 1 && args->args[1]) {
> > >> +   dev_err(dev, "only the transmitter is supported\n");
> > >> +   return ERR_PTR(-EINVAL);
> > >> + }
> > >>
> > >>   With Fixes: and Cc: stable, the stable kernels maintained at that
> > >>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
> > >>   dts, and the receiver fails cleanly instead of getting the transmitter.
> > >>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
> > >>   It goes in with the series, since two-cell dts only exist after it.
> > >>
> > >> 2. Use a flag in the upper bits of the existing cell, as Rob
> > >>     suggested. Existing kernels are not affected, unless a board enables
> > >>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
> > >>
> > >> I will write the impact clearly whichever  approach is selected in
> > >> the related commit messages and the cover letter.
> > >>
> > >> I think the cell approach is easier to read and more symmetric in the
> > >> long term,
> > >> but it breaks more. Which one do you think is better? Thanks.
> > > 
> > > I'm not a user of this platform, so I don't care. Up to the platform 
> > > maintainers to decide if breakage is acceptible. You just need to 
> > > document the issue in the commit message.
> > > 
> > > Rob
> > 
> > It's a bit of a pickle, all this.
> > 
> > I gave it some more thought. In the end this is an IP block with two
> > PHYs. No more, no less. One cell is sufficient to address those, and it
> > could be 0 for the transmitting PHY (DSI, display) and 1 for the
> > receiving PHY (CSI, camera).
> > 
> > Of course the two PHYs can operate in either DPHY or CPHY mode. The
> > phy-cells have been (mis?)used to select the proper mode of combo PHYs,
> > and this principle has been applied here too.
> > 
> > However, we have the special situation here that the mode can only be
> > changed for the complete IP block (and thus for both PHYs at the same
> > time). As Bryan points out, we need to check and complain if the PHY
> > mode is not set to the same value for both PHYs.
> > 
> > I suggest using a property
> >     samsung,cphy-mode;
> 
> I guess, a maybe nicer way would be mimicing
> 	Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
> 
> with its
> 	intel,phy-mode = <x>
> 
> with x coming from include/dt-bindings/phy/phy.h
> for the distinction between cphy and dphy, so we don't introduce yet
> another way to describe this.

We already have the plain 'phy-type' property which takes the same 
PHY_MODE_x values. We don't need yet another vendor specific property.

> 
> > (name to be bikeshedded) that sets the complete IP block into CPHY mode
> > (DPHY being the default) to distinguish between the modes. Since both
> > modes use a different electrical interface, this is clearly a hardware
> > thing and thus suitable for device tree.
> > 
> > Then, we can address the two PHYs with the help of the already existing
> > phy cell (without any bitflag tweaks to the value).
> > 
> > The sole drawback is that we need to accept the PHY_TYPE_DPHY and
> > PHY_TYPE_CPHY values that some OS in the field might pass. (For Linux,
> > it should only be the former.) And we need to handle those values
> > correctly. But I think this is not more painful than the other
> > approaches. At the same time, this design seems to be the most correct
> 
> The current cell values are 10 + 11, so as long as we don't re-use those
> exact values for the other constants the driver should somewhat easily
> be able to recognize an old DT?

I think you will still have an ABI issue of what does old OS do with new 
values?

Rob

