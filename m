Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1165560820F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qoku0wHX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMAcO0/8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cr4YwwSLfkiUol1Qs2oQGw7Kr0kUMHG32ZziBkuSaP4=; b=qoku0wHXHyiTmXQKlb8SbLbkmi
	7u6vkbPbJKY8LFKix6MFAr0DZ/N/6a4e1p8AHE2LTdKfB7h3BW/ud8Y0BkpQLRWkVopl4oOcJMEA0
	lyjBs/B/VY9p+WHAW73XIf39nKuyvPu4Iwy363GqDKCp3TQ36R7noNOLAs+t6sn92MmgBbvIPLG6t
	jPp62IfUJwJcQlT0oPgZnT8puBUZCxtWjccfC6sgSxM3QkE1z+2VrxXXi7Wn/1CxlHiJ+8MbBCIHN
	hmJWJ1Q3bxBCkykEjIf3w60Crhri/rDTiBcz0rxP3nmcZ0XzTlk5NpFzajkAepkygMpY4VVvyuq5Z
	iQkB9GkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIowc-00000007oJ3-3vMJ;
	Mon, 19 Oct 2026 15:06:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIowb-00000007oHs-1zVL;
	Mon, 19 Oct 2026 15:06:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9048A6021A;
	Mon, 19 Oct 2026 15:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E47B1F000C4;
	Mon, 19 Oct 2026 15:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422392;
	bh=Cr4YwwSLfkiUol1Qs2oQGw7Kr0kUMHG32ZziBkuSaP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eMAcO0/8yUllBiV1FwYry+ie9hG4Dd1vc+Lu1I4Tw6w33WQrgBEspZw4t4uvXPmEs
	 hL0L7gs0tWZWecc4cbCRMKOfqE2bvTL6PVKkzwVi0cLxd7oel/sNEd4grJ3BuyN2ik
	 bpHKUSTlsFuWeJO4L5Ai5V4ZU1hbN7FdYoP60UaY0vf/Dk1PxwCXyCINaHlmwjfW5h
	 iTafIxUPLvCaXeQfwcE8anw2fDK2zvackbEKSaJFP0Pkz2NhDZjxM8HqESdL1xPIJw
	 krncqv99/JN6676OYGThHfR+CtpScn0UP/Ltnh0V2OdnUx/L171lKDEFOw0F/bSW7h
	 kv14+0p4tthnA==
Date: Mon, 19 Oct 2026 10:06:31 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
Message-ID: <20261019150631.GA265407-robh@kernel.org>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
 <20261016140115.GA1798470-robh@kernel.org>
 <20261017-gainful-goldfish-of-climate-bef863@quoll>
 <CAPwA33+bR1BF9KeA9my07Yz7gXW7TXq8EPhwQ4GvHMSFDk+uWw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPwA33+bR1BF9KeA9my07Yz7gXW7TXq8EPhwQ4GvHMSFDk+uWw@mail.gmail.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:15:03PM +0800, 楊智成 wrote:
> Hi Krzysztof, Rob,
> 
> > Existing OS should ignore surplus cell if the driver is coded properly.
> > Same as adding new properties or new front-compatible.  The question is
> > how the existing driver behaves?
> 
> As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
> driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.
> 
> 1. Keep the second cell. Add the patch as follows:
> 
> - if (args->args_count != 1) {
> + if (args->args_count < 1) {
>     dev_err(dev, "invalid number of arguments\n");
>     return ERR_PTR(-EINVAL);
>   }
> 
> + if (args->args_count > 1 && args->args[1]) {
> +   dev_err(dev, "only the transmitter is supported\n");
> +   return ERR_PTR(-EINVAL);
> + }
> 
>   With Fixes: and Cc: stable, the stable kernels maintained at that
>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
>   dts, and the receiver fails cleanly instead of getting the transmitter.
>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
>   It goes in with the series, since two-cell dts only exist after it.
> 
> 2. Use a flag in the upper bits of the existing cell, as Rob
>     suggested. Existing kernels are not affected, unless a board enables
>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
> 
> I will write the impact clearly whichever  approach is selected in
> the related commit messages and the cover letter.
> 
> I think the cell approach is easier to read and more symmetric in the
> long term,
> but it breaks more. Which one do you think is better? Thanks.

I'm not a user of this platform, so I don't care. Up to the platform 
maintainers to decide if breakage is acceptible. You just need to 
document the issue in the commit message.

Rob

