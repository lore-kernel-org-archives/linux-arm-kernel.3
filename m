Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C10606B6EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1VDRhzKu;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IeyDigUw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H52bp3lerhcgmKry5JkDwar65iC1VQWKyNAm6iD1jYM=; b=1VDRhzKuFc/9FvA1r3Y10jyQvh
	JhFpX0OE88TxwwasOQtU07PLody3PpDA9WmgcQx0o0OTM/GAobPbOwOv81i7Zd6+535csaVIKrhxr
	IjqK1LPpL+fSLiZKwlosR6bYeNC/lvAzz8g1FaxsT3fdgNpC2m08Mh75hVW4qh+ujsdMBjN8zJjwD
	7kJ5NNZo/kRW4VNmySyq16qQL38E3Bbg/897dZSukeqG1S5wQWPyEu8dElL6Vlf1ZUzTyYSQaXzon
	JmrXO5jP36Byi1eQDYP4dgCaopGAAY1WU+YvZ3Jnrd/AP7oIB2BkUg2yWELbWoo4xa9Ot7HuSY4XH
	5ADO3OlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA8Z-00000001cYM-3C2Q;
	Tue, 03 Nov 2026 08:44:59 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA8T-00000001cX7-12r4;
	Tue, 03 Nov 2026 08:44:57 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 66535200B28;
	Tue, 03 Nov 2026 09:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793695491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H52bp3lerhcgmKry5JkDwar65iC1VQWKyNAm6iD1jYM=;
	b=IeyDigUw+OpEeGuVX9BAYSzDf0nsf4CKe+Uzm4kQFKJdY/FRuNVY4lkeGZ7SqtZkcZDWMk
	KpvsB1xCLnWskb8e1izG/fzXkTQbxMKXKFbpeit0HjL+4+d9jjFWO4haXsZ7DifpH8K0f/
	0iio1wp+T0txV6YJXb0Iktlf6NdFOhc64KExJrBIKBf9H7ildaNGJnn6SGzdqYiRr6khrX
	CQFV8z/XOy0bnxBpv40PhMhuCicBq50NQI59jxqKi8GM6IPIweejJR2xSwygnfZWwNtFP7
	zLkWxRqd8nGGDezYOBeXkXIPwA+lb+aaMPfqJO2zme611gq4rRs9LoYZg5Pgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793695491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H52bp3lerhcgmKry5JkDwar65iC1VQWKyNAm6iD1jYM=;
	b=gPlTYWalJABj2uWFLM6kpbtwrkuKl3Wo5ySrON2oPuqNqEDxBS36qNvXjaZDdLajwfkYEY
	FcThQ/LbiI6Ma2uZuMgx4xbrkRrRjXXUsD+FiGyE2C2wkHj8p0ubuvzQNlRldVeHMABNqM
	WDwl4usYl4276taDuXEyMjvtIN7/Ox7Vh1fASZ0gB4+8LEWL9e2l4FKzlWctNk2kTTLezo
	xwdhOcYUV6RALiGQXWS5Qib5XK674nEhUPQRm9OSzVCH2XNDZylXBwusCO0f6BvwAxPYvn
	RLXuX0bpS6oqEuCNP/oCI6Oztx3jHv/Qx/mf9eq58pdTtShlpNzt3+CPy2JwjA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793695491; a=rsa-sha256;
	cv=none;
	b=PrgKr2unShSy60Wj6xn3w8Y4aMsywKH7l8tBosj4ihtl3H8o6Kfhdw/x/N3durWcSUa9L/
	ePVQQYP/fsa+eC0gHefhfYJdUjgm22P00NdVqnmi9U4Loh7JUXUIsNLeX2axbJBREP0SCA
	GQxVriFIvplCOTGeMW9B0m9K/izd3KfrC2dPBoaLCN/4gpD/cosAOjIny+HJ49cmfrfXoi
	hva6X55xraS3aBuM1QCF4v+skuNf9cOIQJdAvea14ZC7ID6ZH3k5BpvTF0iRVKJ79mhcKA
	GMzTOKAaeca6nobQn3Q9xHBCoaD0EUIfobwB7IkmbU1nSMNMOaJOTblMKF49hw==
Message-ID: <b717872c0f75e16980675d17a5fbbca91b9c8a3a.camel@pengutronix.de>
Subject: Re: [PATCH v5 2/3] phy: cix: Add CIX Sky1 USB3 PHY driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hongliang Yang =?UTF-8?Q?=28=E6=9D=A8=E5=AE=8F=E4=BA=AE=29?=	
 <hongliang.yang@cixtech.com>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Gary Yang
 =?UTF-8?Q?=28=E6=9D=A8=E6=96=B0=E4=BC=9F=29?=	 <Gary.Yang@cixtech.com>,
 Fugang Duan =?UTF-8?Q?=28=E6=AE=B5=E5=AF=8C=E5=88=9A=29?=	
 <fugang.duan@cixtech.com>
Cc: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, cix-kernel-upstream
	 <cix-kernel-upstream@cixtech.com>, Conor Dooley <conor@kernel.org>
Date: Tue, 03 Nov 2026 09:44:51 +0100
In-Reply-To: <20261103074913.1971025-3-hongliang.yang@cixtech.com>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
	 <20261103074913.1971025-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004455_305139_36799594 
X-CRM114-Status: GOOD (  17.04  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Di, 2026-11-03 at 07:49 +0000, Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=
=AE) wrote:
> Add PHY driver for the USB3 PHY found on CIX Sky1 SoCs. The driver
> handles initialization, reset, and clock management for the
> multi-port USB3 PHY.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> Reviewed-by: Conor Dooley <conor@kernel.org>
> ---
> v4 -> v5:
> - Documented the origin of the PHY initialization sequence.
> - Return -ENODEV instead of -EINVAL when the OF match data is missing.
> - Use dev_err_probe() when creating the child PHYs.
> - Dropped the unused dev_set_drvdata() call.
> - Guarded against underflow in sky1_u3phy_exit().
>  drivers/phy/Kconfig             |   1 +
>  drivers/phy/Makefile            |   1 +
>  drivers/phy/cix/Kconfig         |  20 ++
>  drivers/phy/cix/Makefile        |   6 +
>  drivers/phy/cix/phy-cix-usb3.c  | 418 ++++++++++++++++++++++++++++++++
>  drivers/phy/cix/phy-cix-usbdp.h | 289 ++++++++++++++++++++++
>  6 files changed, 735 insertions(+)
>  create mode 100644 drivers/phy/cix/Kconfig
>  create mode 100644 drivers/phy/cix/Makefile
>  create mode 100644 drivers/phy/cix/phy-cix-usb3.c
>  create mode 100644 drivers/phy/cix/phy-cix-usbdp.h
>=20
[...]
> diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb=
3.c
> new file mode 100644
> index 000000000000..4417506d4f6c
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usb3.c
> @@ -0,0 +1,418 @@
[...]
> +static int cix_u3phy_probe(struct platform_device *pdev)
> +{
> +       struct cix_u3phy *u3phy;
> +       struct device *dev =3D &pdev->dev;
> +       struct phy_provider *phy_provider;
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *child_np;
> +       struct phy *phy;
> +       int ret;
> +
> +       u3phy =3D devm_kzalloc(dev, sizeof(*u3phy), GFP_KERNEL);
> +       if (!u3phy)
> +               return -ENOMEM;
> +       u3phy->dev =3D dev;
> +       u3phy->cfg =3D device_get_match_data(dev);
> +       if (!u3phy->cfg) {
> +               dev_err(dev, "no OF data can be matched with %pOF node\n"=
, np);
> +               return -ENODEV;
> +       }
> +       u3phy->reset =3D devm_reset_control_get_exclusive(dev, "core");
> +       if (IS_ERR(u3phy->reset)) {
> +               dev_err(dev, "failed to get reset\n");
> +               return PTR_ERR(u3phy->reset);

		return dev_err_probe(dev, PTR_ERR(u3phy->reset), "...");

regards
Philipp

