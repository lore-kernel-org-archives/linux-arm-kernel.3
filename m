Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81730CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW2I9IQOgQPeKJJKfmoCD2QasKn5Lkl/P+IL+G1Ddug=; b=qdoT/OzTVoPEl4jLJ7CkJkf7Rq
	55eEuiIerRsi4+WWe5qWPRr7i4ZhOBqgqWQ81Q78W8UG1fwk6WM28Veou0Br70leO3SO224Ks5wtr
	nP5OtJDy9JEFM5R4EfstY2b3QT/5cZt3xxhlCOvrrSjhMWxi8/aK8FQp59Mp/ebSparYDOJvzirOC
	ZGUCbAGDapMlaHiV+dNhZOlkyNe7PN8FFDtMx6Iiyni8+S2FBoSA7Oevg7rOkQrXg7olwqmaBuos1
	ue3jmGX9Jb3i0N81iGiDUv5XVjwu4jdAl47Hy/F/95yGbF9WRBXBh7t66BT67PDySPZ5MkLqMK9pe
	IOBWtqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7a5-0000000BfvR-2upR;
	Mon, 01 Jun 2026 18:41:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7a4-0000000BfvE-1Fau;
	Mon, 01 Jun 2026 18:41:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AC4060138;
	Mon,  1 Jun 2026 18:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2033F1F00893;
	Mon,  1 Jun 2026 18:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780339303;
	bh=wW2I9IQOgQPeKJJKfmoCD2QasKn5Lkl/P+IL+G1Ddug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ex9uII4irekVurRAmQj59bEAJ3EVPb5zJ7FnuwdPimG0xK9XK8aFGGUyfDkjikOuW
	 LIJ51F7aQ/r7xBCVjEdJZ8tqUHEEUU9MDbIyFWND3/FvZ4af6bXvNDNt9/AXmOvyyQ
	 zvPPeuPawPyr62qJtpv/FndtkMObgMItdKBFXm54N8ej7R8IoZQ1Ux1kaL5SPkukyy
	 f0FeUwI08+XAleI0hrzAQO/ANR/HGEp4JfyQUlkDDFg6uYAn/A0rvMJF5hX5KRZUf5
	 MV3lT4gqTkAtgeTySEHAGgeZ6e4yH9ZS4zjqiJep63xwBFZzN3w1LGGARFDijkEU0d
	 uBgMv4ieGgYFA==
Date: Mon, 1 Jun 2026 19:41:37 +0100
From: Mark Brown <broonie@kernel.org>
To: y.oudjana@protonmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/4] regulator: Add driver for MediaTek MT6328 PMIC
 regulators
Message-ID: <c94c94b4-c3f4-4369-a110-dfb825c5f103@sirena.org.uk>
References: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
 <20260531-mt6735-pwrap-mt6328-pmic-v2-3-dac37bf92894@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hTo5YyAF2wDum4dv"
Content-Disposition: inline
In-Reply-To: <20260531-mt6735-pwrap-mt6328-pmic-v2-3-dac37bf92894@protonmail.com>
X-Cookie: Have a nice day!
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


--hTo5YyAF2wDum4dv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 31, 2026 at 11:10:44AM +0200, Yassine Oudjana via B4 Relay wrote:
> @@ -0,0 +1,500 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MediaTek MT6328 regulator driver
> + * Based on MT6323 driver.
> + *
> + * Copyright (c) 2016 MediaTek Inc.
> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static const unsigned int ldo_volt_table3[] = {
> +	0, 0, 0, 1800000, 1900000, 2000000, 2100000, 2200000
> +};

Use linear_min_sel for the first three values.

> +static const struct linear_range ldo_volt_range1[] = {
> +	REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250)
> +};

If there's just one range there's no need for a lookup table, use
regulator_map_voltage_linar().

> +static int mt6328_get_status(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u32 regval;
> +	struct mt6328_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	ret = regmap_read(rdev->regmap, info->desc.enable_reg, &regval);
> +	if (ret != 0) {
> +		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
> +}

get_status() should report the actual status of the regulator, not what
was configured.  If the device can't report this just omit the
operation.

> +		if (mt6328_regulators[i].vselctrl_reg) {
> +			if (regmap_read(mt6328->regmap,
> +				mt6328_regulators[i].vselctrl_reg,
> +				&regval) < 0) {
> +				dev_err(&pdev->dev,
> +					"Failed to read buck ctrl\n");
> +				return -EIO;

Better to return the actual error.

> +		rdev = devm_regulator_register(&pdev->dev,
> +				&mt6328_regulators[i].desc, &config);
> +		if (IS_ERR(rdev)) {
> +			dev_err(&pdev->dev, "failed to register %s\n",
> +				mt6328_regulators[i].desc.name);
> +			return PTR_ERR(rdev);

dev_err_probe().

--hTo5YyAF2wDum4dv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmod0mAACgkQJNaLcl1U
h9Cowgf/TR/qzesVBhChXAa4+FjLbC3YcC3giv6TuI0GVikEdxuWGTDvD2iipvAK
p+sJYyV5B+BuTDI6NaYr4CrVsJNIpV+ci7qoXixlUV9ju7qY/L6GmjdYJY+l/XcF
W+fZFCQfqkIRFB3V87HJPY81af0WQLJ0c9G4euXtdmzusaWOGaHhecMu2Sic1IZn
FMjUVSMriahgusOeO6uikaa86FqoXcJtHB6aLGX654xLky6UJCNaLJJ4G/PitxEZ
py6OsBALpjjImVOGWziwKrIsMqxdFPH8/15+N8Kv5fT8VkEG2rT0Gh+LhmBvKTA7
j2oF8Qysg9lhLOv6gc9Aw3i+nMZ5PQ==
=Ua+8
-----END PGP SIGNATURE-----

--hTo5YyAF2wDum4dv--

