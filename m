Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A41B606EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qpBcgWLs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGE+28uN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4OS3i6eFd7tcdMjfachyyV6i3nKbEcsVPS6UTpVoEG0=; b=qpBcgWLsHRbAejEnlVzdQ+5R+U
	EiS9HP1+aN+XJ+1GNZFpkn8Jpew3Jg6FgcrHOWwOQyC46EJfKFiUuDBbnUuxFc43ELJbZJcne/FrX
	bfdx6fFPc+IYDLTXcovrdp1eCDtGvqphoyGN2e4zmjUEhRuBSrfwxB6+PiMeBD1ATz5hmn/A5h9s3
	FBCcJwWJJk9yu9yzVGYQmV02AwudiCIns76QMOAMfD7+ofoqyl9FImwl7yBxEFzUp5aRNE5KTCV55
	h9nanLnbW99EcHrA3chGzL2vLVH2mCKkxyO4P83EZV4NvceZzYKULBiFv7XCbYPaywgy+m5ww/WWq
	fLPUgWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvzm-00000008m5C-3auX;
	Thu, 05 Nov 2026 11:51:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvzl-00000008m4l-3ItI;
	Thu, 05 Nov 2026 11:51:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 819CD40914;
	Thu,  5 Nov 2026 11:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F30D1F000C1;
	Thu,  5 Nov 2026 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879465;
	bh=4OS3i6eFd7tcdMjfachyyV6i3nKbEcsVPS6UTpVoEG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IGE+28uNn0cQzvWb3P23I+Y3Y9vuvK6VC6xP68IsCJD/M64adDVLKoG85s06au+G1
	 J1Obn+d6Gm+CsWIH23qmxfKWtjQ0P9Ul4EIfHSTFHks5si+zlB3BjKVyxqbtJA0KV9
	 RgnOsaRULKxZIRLpHjq28Z6fmqBclgfbuB3hL9AgqZvHVVjxQ7TVuMPDKi00AdIcDH
	 bQxA0WJJEuNowi3dV+k79udSkhT5NK3lPeUH1B7xkzM5iS5szeFaG+IFgr1S6HFqIh
	 U9aksm3FlI1cHrtihxazmZEWUsN4wicDI/UHDHJ39YRlfInMv35rprdxxUrA6/6WPA
	 pHABR9k1OoZLg==
Date: Thu, 5 Nov 2026 12:51:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang =?utf-8?B?KOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang =?utf-8?B?KOadqOaWsOS8nyk=?= <Gary.Yang@cixtech.com>, 
	Fugang Duan =?utf-8?B?KOauteWvjOWImik=?= <fugang.duan@cixtech.com>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v6 0/3] phy: Add CIX Sky1 USB3 PHY support
Message-ID: <20261105-illegal-fervent-swift-3c05c2@quoll>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 01:17:56AM +0000, Hongliang Yang (=E6=9D=A8=E5=AE=
=8F=E4=BA=AE) wrote:
> This series adds support for the USB3 PHY integrated in the CIX Sky1
> SoC.
>=20
> Patch 1 adds the device tree binding, patch 2 the PHY driver, and
> patch 3 the SoC node plus the board enablement.
>=20
> The PHY provides the SuperSpeed lanes for the Cadence USBSSP
> controllers of the SoC. The block drives both USB3 lanes: it is
> exposed as a single PHY provider with #phy-cells =3D <0>, and its
> init/exit calls are reference counted so that both controllers can
> share it.
>=20
> Tested on Radxa Orion O6 (Sky1) together with the USBSSP controller
> series: the PHY probes and USB 3.x devices enumerate at SuperSpeed.
>=20
> The controller device tree nodes use the PHY phandle added here; the
> USBSSP controller series is posted separately.
>=20
> The series applies on top of v7.4-rc1.
>=20
> Changes in v6:
> - Drop the per-port child nodes; the PHY provider node itself is
>   referenced with #phy-cells =3D <0> and the driver exports a single
>   PHY instance shared by both controllers.
> - Select REGMAP in the PHY Kconfig.
> - Use dev_err_probe() for the reset, clock and regmap acquisition
>   failures in the probe path.
> - Corrected the mail sender name: v5 was sent with a non-ASCII
>   display name in the From header, v6 uses the plain ASCII name
>   that matches the Signed-off-by.

No, you did not.

Best regards,
Krzysztof


