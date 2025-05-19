Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EC3C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNVVWenUO4XWo/JHN6YcXvLpUtMhhiMFX5R1egOkoa4=; b=CYz82TglkvaH+E9nR5Se5zHkam
	kcPz4fKVLa83I9+6Exn2BQrur8vpCC03W74UtuU1UK6Dp/PpeLAqkgrxhFdgRybkLG3qu/ddKL7Fq
	7nn7LabQLmOKb7lqVW1oj3nHTHXrwNg4xHnuMBbxYqz6Gq9JPLYZplov5pdCRE2YM+Fpwm8+UBvdT
	ngNG+4o5d5FGV49j48J9HSvWtIyzAI3vFNGkQEG8Dtm0Dlhh2XxtnaxW6q9+DoKPlfEnQUIS9xD2R
	C1u+65+Qlgo2S6ZYpYJVPC5dFTwm5xC8j9yqgZfsMeaOEbfsJYmmNCWOTt6+Q+nnNq8bpmZfwPIGD
	87Plc47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3AI-00000009loC-35IO;
	Mon, 19 May 2025 16:16:34 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2CK-00000009Zhx-3Zk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qNVV
	WenUO4XWo/JHN6YcXvLpUtMhhiMFX5R1egOkoa4=; b=g74IFDW5kTkYT00I3rBN
	8r5S/M9tsSKrF+Ot7+LtGNVvcwqFTXHJOrZiRm+jRoDUsEHZMlL8CLMVIXJcZZSg
	3o5VyRr2Bz43P/4OPZ5g+BQ0oYyTdVSszHySgmQARSs4DEwMxAc0eOuTdwPExQ6c
	6d7MWXs/yE24PRrQnh/jMEIEf9px0OH1ppT8u6D4RaYGLa7ZE5m7lrhVyMM1ujRP
	Yw7DGIDmMJkJI5j0KKJdbuDDBssmfsIEa4y/9DIkM5QamVq5+czKDGOkUZ7qkHQU
	boCkKuGTbFG7V/rUWfTxASAGpD7KDr6dT/eY0k4J0APhBIVT7sVXHzUUunqec57c
	aw==
Received: (qmail 2536472 invoked from network); 19 May 2025 17:14:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 17:14:33 +0200
X-UD-Smtp-Session: l3s3148p1@RgO+ln41mJxZz6uL
Date: Mon, 19 May 2025 17:14:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aCtK1-Yn6u8-n8mU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N50p7v0rMXI5QQZ1"
Content-Disposition: inline
In-Reply-To: <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081437_162103_DE98B79F 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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


--N50p7v0rMXI5QQZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> ... so clearly the suffix is "-foo" or "-0", as we usually prefer. This
> should be replaced into i2c-X, by dropping "gpio", instead of using less
> favored suffixing (one without -).

Hmm, I can't automate this because it will then need to be aligned with
the bus numbering of other existing non-GPIO-busses. Which is highly
individual per board. That means we need to drop this series?


--N50p7v0rMXI5QQZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrStcACgkQFA3kzBSg
KbYZUQ//RQF+ICoSYNeA3SyfK3l3mO5YkFWpb1eSl1CAHUe3Bdh1xCjyYZUIa8aF
v42eWw6HeFyz/+CUAUcM2+YCoYc8wdrQtdg8MnTgieCzd3c83h6LmaKfZd39VxJY
iqPJ/hj9vFjd98/s3XtWXflp4Lj9MYcbMds/BJDUz4R3C0lxCr+RjOSrJsk2ElZn
PTYx3W99n3jXAVdEb4TQbeC1Vy86wCC+kalPAZhLsmks2tWCBC7a7MBqqNNDmQwk
7+ACg1UYA3hBKrba8/DmxMIHGyhneP/aEwLjQv4hH4Z6GFQZYZ+jotqz0wdVfGgh
WYKtqFVKrZYzHm7KQ0P0uh1iguOzQwVFLvdtzSHeytmSRp1adWr8UgiA3WmJOuf1
3CvIPZv/SjRvD3l1Fcv5cfiiGjKGtX1tAf9uPICQUQOqJ5skuoNWP+HCrvm9vpqn
L6G8Yv/wQNqutzaCYiw2b3mU1NFbpLqEuLyzGjG3wPdo2uhFeGVP6YxIK92n6Ixb
hJecCPgi2hbsUi1JbY4AlcwPOQaKLGTX4LtZjxFHaqeNqVp1ZZ79lK5mXWt1P9tT
k2FoqxvvPaikH9HUKjPDQU3ukjFfC4ixmMJh9XZcpGMcw/dCeD3H9qKxCPW/XF2c
eGIptUSzBXjTXZCqAM6XQbm0HS/nQhwJ3HAS2rAwHveXAuotLx8=
=ri5t
-----END PGP SIGNATURE-----

--N50p7v0rMXI5QQZ1--

