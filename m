Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4335CD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 02:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhy99H5Z5G7dzWd+oY9te4Ksayq4YqycA86cLBuHbaM=; b=LeS5utTKDIHpbJ9Qa7DK/z5v67
	Np7c4d/obXVR8W8fSMyVYylEidUDMnllWx9ULKmtdMRkXR88ffKzS+/MppE6b5loA6GzvjdIic83W
	9ltQR2uEPpkOGydsbY5oEPG3XZ1StLT28FDDnwznrdzZobY8fOKww6OOwxMAo4xys3OuPcaROVCnP
	BywSFQwCTJIuT5exouoPb9qQaSa8j+yuOrOrxCtv8oe9VEFITqMPkC82SapwTfCBt/FEaBNz+3spe
	tH7OVteL/3JspSctDHwWdwSvzGoagwFSbBhgl2smXhi4IZzFOljEiToypBsEt72NvRpalNBAkk56V
	WrvWzI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcUG-0000000FEC5-24FV;
	Tue, 12 May 2026 02:04:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcUF-0000000FEBk-2ZDK;
	Tue, 12 May 2026 02:04:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0FF360055;
	Tue, 12 May 2026 02:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C2EC2BCB0;
	Tue, 12 May 2026 02:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778551482;
	bh=BFfAV597fx7JIQQh3ImNXDlSTe0sOcLlBpul6Khg9KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv/ai9CAsNvqsXG1g6XrXNf5yiW1t5DA3ifU9yT3VR4+Yk3NSryMG4QxNk7jlx6Yc
	 LRJm4+ds7I7zlbs5PENgwACO6mWNjtTeiO8l9nXVtMqrfWtAMpldCXdd/AlEsJ4op7
	 sgmMvYAIu2dr9GsrDSwZ6oDuDFjvAE00WXn4WQ48EPpSe00kWuESXtz8h5TpRvgZpn
	 CX/5TIESQ1y2GIfMkGW5uSkXHc2NiUnYIgSXbffV1Sy+T6rjaWFbyXAdgdKHegn2kT
	 aJwm9fyZJLJfS+ghH8S4FokHG6KYu4XmG045e6E4vGffO/KCr+5kZPbv5qhGdYwvdy
	 xizVbHKB1RDaw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 222661AC5843; Tue, 12 May 2026 03:04:40 +0100 (BST)
Date: Tue, 12 May 2026 11:04:40 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH v12 2/5] regulator: Add support for MediaTek MT6373 SPMI
 PMIC Regulators
Message-ID: <agKKuH0fP3lBMuFd@sirena.co.uk>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <20260511101355.122478-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fg+KBHu9WioghG3Z"
Content-Disposition: inline
In-Reply-To: <20260511101355.122478-3-angelogioacchino.delregno@collabora.com>
X-Cookie: Truckers welcome.
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


--Fg+KBHu9WioghG3Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 12:13:52PM +0200, AngeloGioacchino Del Regno wrote:

> +static int mt6373_buck_unlock(struct regmap *map, bool unlock)
> +{
> +	u16 buf = unlock ? MT6373_BUCK_TOP_UNLOCK_VALUE : 0;
> +
> +	return regmap_bulk_write(map, MT6373_BUCK_TOP_KEY_PROT_LO, &buf, sizeof(buf));

regmap_bulk_write() takes a number of registers.

> +static irqreturn_t mt6373_oc_isr(int irq, void *data)
> +{
> +	struct regulator_dev *rdev = (struct regulator_dev *)data;
> +	struct mt6373_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	disable_irq_nosync(info->virq);
> +
> +	if (regulator_is_enabled_regmap(rdev))
> +		regulator_notifier_call_chain(rdev, REGULATOR_EVENT_OVER_CURRENT, NULL);

If the hardware is reporting an error we should report an error.

> +		INIT_DELAYED_WORK(&info->oc_work, mt6373_oc_irq_enable_work);

What stops this work on driver removal/unbind?

--Fg+KBHu9WioghG3Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoCircACgkQJNaLcl1U
h9D8+gf+Ji7rvtqYNutZdS+zKCDlfbTtrpScLfa0ZPS5xWFDLYt4/Rvhset5eAIe
1bFjLbmykpiTwp2CrA50AuULlWeXRZIcHtU4w3TLbC0y9Jy56QbARjhVXgbLj0c3
ZR7fHlhMf0JoS9TqSHqRU5mtBnMWS1z9sr4QBbfgmV+uVE4oOtREif7MIOpYMikV
tEPHX9j+ljPXMb6i81E61VoQVI/xoIkmTdWtYgYSKizXzqt7VsWs3XhfDD+JKNLD
2ZIHapsz+1VJ/9SVOjlaO2ujquKLdfjQFMJ8+nHyMGWRpsmUiYu9e/kyKsORpEuP
swSqNRY9anDWWAFIr6ncfUTosit7CA==
=f+lH
-----END PGP SIGNATURE-----

--Fg+KBHu9WioghG3Z--

