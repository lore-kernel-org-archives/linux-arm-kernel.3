Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF336E7E379
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYmj+RmI59lUc3oRYL28miTebRrqVEFBlcRGuFWLEpM=; b=dpAH+0fGtgOokJZ3PM+rzjMvmT
	Iysw/yDIdOglNkbIcHq6pBjbYkf8AXqDaGUhi/A6bGVTbRrQFdEYshlYHW1ZqIieO5W4dMVwUJIXZ
	j07WV6irIBcSI9TaKkEYip5AAS1JKEojnbVztpe3ZaQHpFobMpK7BO/ZH+yqXLJU+hoqdiekWPb0C
	zZNUz33g4mUu2HYEqfk7K5682JiYv+XBWkmwZL/F3hkPJ9Fa+0gcLeuLHltNJn7ve6QiR4X714EFK
	2MikbKuAwOLZ2n+b0lFjmT2G/3rm+DBmkCrM8PCG2HVrwiEZXFySVJgItGt1NRqgMcFz08T4/PVUC
	ecI5Nc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cvt-00000001yac-1sUW;
	Fri, 03 Apr 2026 11:43:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cvq-00000001yaD-431v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 11:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD013400E2;
	Fri,  3 Apr 2026 11:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58017C4CEF7;
	Fri,  3 Apr 2026 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775216601;
	bh=nHOAlStK0yrlXQs+u/fb9lpL6PjE3lfkGJ95j8Xl3nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyuHvdfDDlqPoMZDZjxvIJhSoBDAhKwdbUD2svKr3+MfA4KxH3cvX8Giw1t5EGV0G
	 vxlttlQtZ89rshVo8UyvmLsaJ697M9N6CuB/lXxnMnklVpbWJu2Q/pPR6gOrF8rRFl
	 wfL49F/yY83JguOMukBYajhn359hvV3MzdCXL5K5Dl+8bwaLhNE52aWvOeYeu6wpVq
	 32oAI5PYc7jyAuFhGFqiLq6fWA+LzDrz8gO9bUY+gf3DlsJDLXF8InlezI7kIk5z0p
	 vSsVU9I2cEE8+S1u9+NuL3EyNRhKsi/+DgjieCIRrzJweaKLChSV0WOTY3V9tbGzCy
	 b44b3DqiMX4yA==
Date: Fri, 3 Apr 2026 12:43:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Frank Li <Frank.li@nxp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible
 string fsl,imx25-epit
Message-ID: <3ba9e33e-8d58-469c-9c21-5861c0f6c5eb@sirena.org.uk>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
 <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
 <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u8+SQnjbHNPxZuSK"
Content-Disposition: inline
In-Reply-To: <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
X-Cookie: The Korean War must have been fun.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_044323_024936_FF571C93 
X-CRM114-Status: GOOD (  12.23  )
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


--u8+SQnjbHNPxZuSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2026 at 10:15:49AM +0200, Daniel Lezcano wrote:
> On 4/3/26 10:00, Frank Li wrote:

> > Can't find it at linux-next master branch, anything wrong!

> The patch is in timer/next but may be linux-next disabled my branch

I have a timers/drivers/next branch in your git tree in -next but
no record of anything else.  That branch was last updated on January
20th.  If you want something else adding let me know.

--u8+SQnjbHNPxZuSK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPp84ACgkQJNaLcl1U
h9DozQf/YNeuimr/qBF1dSRHOHAPPCJDwyu6/YY4S+uJp5MPGgO8XaXHsKHMtfkz
gOyIxskBRJM8hZf3XmZozh2FqhOqw0Kndi2zXvpunr7EQsTnKuQUaVbHW9dznM7f
GXElrI3MMi5flsW5bj9qvg882psBbU9bN8a5tj9PpKZvqhYrQCyBzZcUXn+sCpEY
iYiLu0GaKh5NeQ6V9Acq9C1Np5twKfNpAjX6brcoCmcF3RhqCrAQ8RtvtbI5BiwY
0Ay1VIG/KY5dJCJh8IESqwwDG92/XyV4oxxFMSRQtM+9wabl0cXl4ytmSQCH6f19
2qYyqWp8185FXBG91h1oPmi24oTtXg==
=Cmi/
-----END PGP SIGNATURE-----

--u8+SQnjbHNPxZuSK--

