Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDEF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KLC3v4Di;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IY39tHg5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLBODvbSr6gtJBJto96ISE7H3MJPrfgXiOoDCPQrvq8=; b=KLC3v4DinVId6tU+Opumm5Wtqu
	hOLLnuilFoT1dVCQp0sk2hz2CYIHRrXcWFOQC7X5tql+4Yhqz/Xg03VCCiyfcfPiWUFJs2uQZCj+4
	RA+NTmTJOwZxSaRHX12UyUfuJdapxcm4dahbPPzKuHUfkl75ldQBj2cmokrySkpib6B0mpkpKVkOT
	AfbvMCIxuWyzRsk94fujXkosfXrjEZJUt11XxCVOslT1qAm9zLFC6XpleD+1FJOqUv8xCncXsxqm3
	1Ke4UkTMZqD06ksWbxRTXYrYWgiQnF/YUoC0AB5Rxg9lnDgFuNpGXvO9bzdoFdpSk/tDCf7VnGBic
	GXeio2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJMHq-0000000AxXS-2geM;
	Wed, 21 Oct 2026 02:42:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJMHp-0000000AxXG-3fqN;
	Wed, 21 Oct 2026 02:42:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBB5860142;
	Wed, 21 Oct 2026 02:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C02B1F000C9;
	Wed, 21 Oct 2026 02:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792550560;
	bh=oLBODvbSr6gtJBJto96ISE7H3MJPrfgXiOoDCPQrvq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IY39tHg53XDT9wDChQziERP7v+ZcmXqAlg+Hg7cYkakX1Nov638ol1YuM8hp8XCRk
	 9WcNhLLwS8Snk7dDeIWAVl7jkbA1HxsGv2WKZWOpqODHUpZKLJgPO3c4dw7emPUSOQ
	 LfuNNjdN0JCHb9hKkA0Pf2y6PePRTtVyfL3s331SFoci7r3vFAQFFjrIJ9QoQNbmJg
	 hTH14eicBbmzPbZQHmYYrUxjNel5YcCe9IRSw1UuRU5r+HjhSHRg9a3Qg0bRaCiIUY
	 20ubXMuOUUL+4tDT7MQ75rQMrTKuQQ0+Q7dqu54hBYXbWrNHTZH5uOefRZq1kWawy+
	 f6CI6jS93guPA==
Date: Tue, 20 Oct 2026 21:42:39 -0500
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
Message-ID: <20261021024239.GA3667411-robh@kernel.org>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <2501273.NG923GbCHz@diego>
 <20261020141039.GB4157247-robh@kernel.org>
 <25254818.ouqheUzb2q@diego>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25254818.ouqheUzb2q@diego>
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

On Tue, Oct 20, 2026 at 04:57:34PM +0200, Heiko Stübner wrote:
> Am Dienstag, 20. Oktober 2026, 16:10:39 Mitteleuropäische Sommerzeit schrieb Rob Herring:
> > On Tue, Oct 20, 2026 at 03:37:35PM +0200, Heiko Stübner wrote:
> > > Am Dienstag, 20. Oktober 2026, 00:20:47 Mitteleuropäische Sommerzeit schrieb Michael Riesch:
> > > > Hi all,
> > > > 
> > > > On 10/19/26 17:06, Rob Herring wrote:
> > > > > On Mon, Oct 19, 2026 at 04:15:03PM +0800, 楊智成 wrote:
> > > > >> Hi Krzysztof, Rob,
> > > > >>
> > > > >>> Existing OS should ignore surplus cell if the driver is coded properly.
> > > > >>> Same as adding new properties or new front-compatible.  The question is
> > > > >>> how the existing driver behaves?
> > > > >>
> > > > >> As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
> > > > >> driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.
> > > > >>
> > > > >> 1. Keep the second cell. Add the patch as follows:
> > > > >>
> > > > >> - if (args->args_count != 1) {
> > > > >> + if (args->args_count < 1) {
> > > > >>     dev_err(dev, "invalid number of arguments\n");
> > > > >>     return ERR_PTR(-EINVAL);
> > > > >>   }
> > > > >>
> > > > >> + if (args->args_count > 1 && args->args[1]) {
> > > > >> +   dev_err(dev, "only the transmitter is supported\n");
> > > > >> +   return ERR_PTR(-EINVAL);
> > > > >> + }
> > > > >>
> > > > >>   With Fixes: and Cc: stable, the stable kernels maintained at that
> > > > >>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
> > > > >>   dts, and the receiver fails cleanly instead of getting the transmitter.
> > > > >>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
> > > > >>   It goes in with the series, since two-cell dts only exist after it.
> > > > >>
> > > > >> 2. Use a flag in the upper bits of the existing cell, as Rob
> > > > >>     suggested. Existing kernels are not affected, unless a board enables
> > > > >>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
> > > > >>
> > > > >> I will write the impact clearly whichever  approach is selected in
> > > > >> the related commit messages and the cover letter.
> > > > >>
> > > > >> I think the cell approach is easier to read and more symmetric in the
> > > > >> long term,
> > > > >> but it breaks more. Which one do you think is better? Thanks.
> > > > > 
> > > > > I'm not a user of this platform, so I don't care. Up to the platform 
> > > > > maintainers to decide if breakage is acceptible. You just need to 
> > > > > document the issue in the commit message.
> > > > > 
> > > > > Rob
> > > > 
> > > > It's a bit of a pickle, all this.
> > > > 
> > > > I gave it some more thought. In the end this is an IP block with two
> > > > PHYs. No more, no less. One cell is sufficient to address those, and it
> > > > could be 0 for the transmitting PHY (DSI, display) and 1 for the
> > > > receiving PHY (CSI, camera).
> > > > 
> > > > Of course the two PHYs can operate in either DPHY or CPHY mode. The
> > > > phy-cells have been (mis?)used to select the proper mode of combo PHYs,
> > > > and this principle has been applied here too.
> > > > 
> > > > However, we have the special situation here that the mode can only be
> > > > changed for the complete IP block (and thus for both PHYs at the same
> > > > time). As Bryan points out, we need to check and complain if the PHY
> > > > mode is not set to the same value for both PHYs.
> > > > 
> > > > I suggest using a property
> > > >     samsung,cphy-mode;
> > > 
> > > I guess, a maybe nicer way would be mimicing
> > > 	Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
> > > 
> > > with its
> > > 	intel,phy-mode = <x>
> > > 
> > > with x coming from include/dt-bindings/phy/phy.h
> > > for the distinction between cphy and dphy, so we don't introduce yet
> > > another way to describe this.
> > 
> > We already have the plain 'phy-type' property which takes the same 
> > PHY_MODE_x values. We don't need yet another vendor specific property.
> 
> even better then ... and I didn't look deep enough it seems.
> 
> 
> > > > (name to be bikeshedded) that sets the complete IP block into CPHY mode
> > > > (DPHY being the default) to distinguish between the modes. Since both
> > > > modes use a different electrical interface, this is clearly a hardware
> > > > thing and thus suitable for device tree.
> > > > 
> > > > Then, we can address the two PHYs with the help of the already existing
> > > > phy cell (without any bitflag tweaks to the value).
> > > > 
> > > > The sole drawback is that we need to accept the PHY_TYPE_DPHY and
> > > > PHY_TYPE_CPHY values that some OS in the field might pass. (For Linux,
> > > > it should only be the former.) And we need to handle those values
> > > > correctly. But I think this is not more painful than the other
> > > > approaches. At the same time, this design seems to be the most correct
> > > 
> > > The current cell values are 10 + 11, so as long as we don't re-use those
> > > exact values for the other constants the driver should somewhat easily
> > > be able to recognize an old DT?
> > 
> > I think you will still have an ABI issue of what does old OS do with new 
> > values?
> 
> wasn't the main contract, a newer kernel should support old DTs ?

Well, yes, it was. That was a position I inherited. I hear complaints 
about the opposite though.

> Aka the DT is parked in some firmware part (u-boot?) and gets handed
> to the newer kernel.
> 
> I don't see deliberately handing a newer DTB to an older kernel as a
> very common occurence?

Do you want things to break when you do a firmware update that's picked 
up a newer DT? I don't.


> And from a practical standpoint:
> 
> We're talking about devices with DSI displays that are at stake here,
> so we're in the embedded world.
> 
> In other areas we're still fighting basic functionality like actually
> handling the type-c orientation correctly in the usbphy.
> 
> So I really don't see a device with a user-updateable mainline kernel out
> in the field, apart from people hacking around on their devices to try
> out new features and new kernels, simply because core functionality
> is still evolving in mainline.
> 
> 
> RK3576/RK3588 devices still ship with a vendor u-boot/kernel, with
> completely incompatible DTB afterall.

I can only keep my own house clean...

I only ask that compatibility issues be documented. Up to individual 
platforms to decide if they care or not. So, your decision.

Rob

