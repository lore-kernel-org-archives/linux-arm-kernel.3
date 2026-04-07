Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E701EFF511B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLSOcHPJ/LT9wr/fQ9H8JFrAuuvSRX/sEM3SKVjwVhk=; b=H4Xoz87+bVcwfWZkYePNlS0Nfj
	b8k86e/JB5C/BO0RUCNax1hsIbzmv6yE+9S2afG6nDdhMbbzQNqHZOeTjNasi5fwHSgRpAMuiTjR/
	j7rj1eEVzBkDdIYDfdnrNhM5ykBcz3PFz0yoDSOm2ZEIyXYNXGANhvaEF4Qy7kOilEzOS6cD4RjaY
	OE/q6l3A/5f9Ezz5xsDWPEG+o2O1/IisQHeFvJAM6SJeYUMfyPXiQo+JEr/YtDq5fshuBYYYxXO5h
	Yd1zP7KWa/A8oyNg5rMRJudFw0ZAFiL4Jnep/qnhyXj/iKqvkx0kApcJxRm97Ecgjbnfyo9h3buB8
	7sJOopFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9A0-00000006moV-2Gmf;
	Tue, 07 Apr 2026 16:20:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA99z-00000006moD-06jM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41E836012A;
	Tue,  7 Apr 2026 16:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D1DC19424;
	Tue,  7 Apr 2026 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578814;
	bh=qLSOcHPJ/LT9wr/fQ9H8JFrAuuvSRX/sEM3SKVjwVhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VvyR4JRo8MP4XchgDZHkJK+xhrdJ4hJYSqFvsIrTb5kCbMSAtxiFit6EDSYddduhg
	 2NCBwHFOB6mQxYMlXQnHWMl2JiltkZr2WsWAS6lLCvH4bJIZiVRt5jr/BKZjNzk34V
	 ppOEFAO6dQbzUIGirFM3NHLksT7sQiG0JLCNjYg0/uY+fqe6F3CctUkcSimBM08k90
	 yalf2rPk7mmMbXyYMuFAbp0ATMRlKqs8GosBv/U4LI1J023vXANHTsr1+wOBbQyqBJ
	 lyOuiDTddfC5CWSLyFQOzh3PGjqG9z2M8jXOB1K/am86iDxJWuvk/Rd5WPpSq29sCt
	 Pv5pBmqtDiWYg==
Date: Tue, 7 Apr 2026 17:20:08 +0100
From: Conor Dooley <conor@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260407-slang-scoff-795164352c62@spud>
References: <20260402122514.1811737-1-florin.leotescu@oss.nxp.com>
 <20260402122514.1811737-3-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DeEoZ3LUzOVpm+Wq"
Content-Disposition: inline
In-Reply-To: <20260402122514.1811737-3-florin.leotescu@oss.nxp.com>
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


--DeEoZ3LUzOVpm+Wq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 03:25:13PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>=20
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
>=20
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the PWM duty cycle applied during shutdown to be configured
> per fan output.
>=20
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DeEoZ3LUzOVpm+Wq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUuuAAKCRB4tDGHoIJi
0vYKAQDc8PmGvn+SYQyxj/xBCFto2oQSVCh4pi6grWFMzYdABQD+PBeWK1D/8di9
FKOw6IBmOzagSoiKXzLj6NnQuvX6EQI=
=QQhM
-----END PGP SIGNATURE-----

--DeEoZ3LUzOVpm+Wq--

