Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC334C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=872sDDSaszSL1+yhyVainkn552F70TCEUEKtazE+wZs=; b=Ek+dk8eu8TtNHihN5vHHCqVgeH
	gehuLQf5ib0D0GHskU/TBT5V0CTN/sVSVdgmBP5QbAGho7/dxSqCp5SftDg+AwyTxC960Pv+UYf9A
	pvzu0wKc/afjT47gANl+kmLSOsbIVisPdHghyNGsD+QO7SmsczI0zkMpvU6qVezOqECNSfDTXTOjO
	gtWWMuO6n0rBpqTpNXftNso38dcajF7Pqx6WvKxZHlxIY2JXlCn/JsbYQa6mEYB3/0sWFuOeYbBfI
	3o/fUlYzi2E4h6nSdvfPpd/6Vp0WLN8EBWlS9C+Z1XbRQiV9olxJTcGrfRLiGVOre5T+LVyKcTeN5
	crQw3LUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjRt-0000000CjvZ-1lSm;
	Wed, 19 Feb 2025 12:45:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjFO-0000000CgQN-3gut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:32:16 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5462ea9691cso1112462e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968333; x=1740573133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=872sDDSaszSL1+yhyVainkn552F70TCEUEKtazE+wZs=;
        b=kS+Oo/O/wuS4IM7AjerkxJTDroNEYUC4FS5qcoGEw2crviBHhdY3+jjaE3jL3V1Co6
         xhoWC0iPJupu4Jg+kmVmEbCEWvLnfXd3Ug/H5Ir4wfAyDntUifmCA2P5BgoCsE9t1K4e
         HJ1QbuROG+jHIJSWYN3lRPlag/HebXNPi4wdg4GGnnPrR+9SHIltILVehWRCGH3PKWhs
         KeBdgcgeCxX9vtMQ7GQTgwc2dxILRPC1i+PE9yu8OhyHo4+4dJbhAyX0VUdnMW2CGRA+
         zfE8EAARMlztzyWkCNEFQyvobzoPaEk7apF71w3rbIvGAnAhUTujldvf/EI03qepgbvK
         cy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968333; x=1740573133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=872sDDSaszSL1+yhyVainkn552F70TCEUEKtazE+wZs=;
        b=r307O7jIybe91sc8ALTCaTTFL6IIZD5ipCE38/SXzbqGPb7hNYSyqUAOPbBqZA2+KN
         arIkwi5JILmW2G79kwllfW930td4CTzs51nIk5Tn1k/hr7vgP1zu+XUqMZ+7MgLc3U3Y
         xulWEzh6b8XHzhTAMyASZsE1l7uoyrBG8Igcsxl6KVN+p58xLiPVH3nNNXxur7v3kjG9
         GPG2BjGlxpVAsBriWvviTEJERW1FoRpFhIb9cc47XB5b9SOvyvHuMfZbtlX7UbI6JNwi
         57OnnrkHOo+OEGrSMiCsNnvqizka9YypsMZP/GEXP3nRvAoWUD2GZ62SzDpT21HInJFA
         LoDA==
X-Forwarded-Encrypted: i=1; AJvYcCV/BJQKceTyvlsq1TpVXLbGCKjEJI2NPCogQ9CgWkxymSPUbIFzGDTIJJrw28mL2d3+5q8R6ZNfDDjdXuq5Mjdj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1+qRrcqGW80/T17nCmCkAmdAFnNMfiKBmVCJW3N9ZT2vviS8U
	I8LjE2x+rUMZQy1XcPdEMHCGASm9bq05eo5xVc7KLUTPCdy0MK4n
X-Gm-Gg: ASbGncvEH3efT7VDT4xmUQ4NtYew40QxoBZPXe00DkoL4ZxYGqx8kATy2gjKO3PQNsV
	kyLsgSbzq9jA6PzQXO2ooYTeXXM49c9HrWaimQvtnFNKUYiprqaIjGRDt70gXuzrdVO7rqAwm4O
	tqa6V+dxt3gkrjKXuw7Lc2NsAK6VtRYW0WoYKwvdc5Oni1KKcXzmHcWRNUu50hNqEGC/f7Uskyh
	egH5OzdHMV6qNrRmFVq2oRKDELZb0zp7IqcWs6OU4zvNhfFvgyn/VYb+GwKG9b+aoqAHDtRu+YF
	pzIn/t2Z9biiznPHD0vZ7g==
X-Google-Smtp-Source: AGHT+IET+JJuBMU3Y/6jzse1ZgT54+aygXA9AXNLRXFpXqkVIx7/7mkYzYqgDRV3tj+3kjGQpH/r/A==
X-Received: by 2002:a05:6512:2249:b0:545:c08:e17b with SMTP id 2adb3069b0e04-5462eef2242mr1448277e87.23.1739968332998;
        Wed, 19 Feb 2025 04:32:12 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f6efbf5sm1596646e87.18.2025.02.19.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:32:11 -0800 (PST)
Date: Wed, 19 Feb 2025 14:32:06 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v3 8/9] iio: adc: ti-ads7924 Drop unnecessary function
 parameters
Message-ID: <3155f491753944d6511d058a09f6f6c505d551f9.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LHcdoEmAz0cVNgKv"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043214_918996_95420237 
X-CRM114-Status: GOOD (  17.22  )
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


--LHcdoEmAz0cVNgKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Device pointer is the only variable which is used by the
ads7924_get_channels_config() and which is declared outside this
function. Still, the function gets the iio_device and i2c_client as
parameters. The sole caller of this function (probe) already has the
device pointer which it can directly pass to the function.

Simplify code by passing the device pointer directly as a parameter
instead of digging it from the iio_device's private data.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
This commit is compile-tested only! All further testing is appreciated.
---
 drivers/iio/adc/ti-ads7924.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
index 66b54c0d75aa..b1f745f75dbe 100644
--- a/drivers/iio/adc/ti-ads7924.c
+++ b/drivers/iio/adc/ti-ads7924.c
@@ -251,11 +251,8 @@ static const struct iio_info ads7924_info =3D {
 	.read_raw =3D ads7924_read_raw,
 };
=20
-static int ads7924_get_channels_config(struct i2c_client *client,
-				       struct iio_dev *indio_dev)
+static int ads7924_get_channels_config(struct device *dev)
 {
-	struct ads7924_data *priv =3D iio_priv(indio_dev);
-	struct device *dev =3D priv->dev;
 	struct fwnode_handle *node;
 	int num_channels =3D 0;
=20
@@ -380,7 +377,7 @@ static int ads7924_probe(struct i2c_client *client)
 	indio_dev->num_channels =3D ARRAY_SIZE(ads7924_channels);
 	indio_dev->info =3D &ads7924_info;
=20
-	ret =3D ads7924_get_channels_config(client, indio_dev);
+	ret =3D ads7924_get_channels_config(dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
 				     "failed to get channels configuration\n");
--=20
2.48.1


--LHcdoEmAz0cVNgKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1z0YACgkQeFA3/03a
ocUemwf9HQbiR77d1KNj4kGgWfMEpDY2y5qIlebPXJe94y1jkU+LPoFK/3yoptzd
1zmwZZHfvEO8pbuI5ZEkCVEtMIm8oD5KrC63b2fO3tB9AbXnHv/PIa7bGXmp4GRA
8qgD9c6WVzM0+j2WwUFzFq72g76QBdy+Ge46vYTR3FBmL4sNzrXOBlMYZ2SH/XcA
xbiF+7BSaInu5Xjlyg3hte9M1kZ99s+LzUDgNbE0Jv73W2vzK0bxqPbVZ+Jv/H30
hQ0EnHDjiZp1Jxmtcq6tkD4lzqD1OkLpToE3swDtstzlGyp5SXtx2npiiOKIebCO
XtHxNfk7lMQqw8ZSQdOZ/dCKUPnxWw==
=p/2t
-----END PGP SIGNATURE-----

--LHcdoEmAz0cVNgKv--

