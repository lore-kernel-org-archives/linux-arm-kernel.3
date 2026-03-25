Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383A6109C055
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wA3AaXCRzESvZkNtYLUwYzrrKD5GU9j1r4KSqN/38rE=; b=4J7FA7XQFBAxMc+ePm1qsNJTqg
	SKZVlYLbfO8WDttIs8Lw+VhD11tg79I2XduA4BLMzlhZU6ChQ0nhJtLPou7bTiUj+i50TdMnkvuWb
	k0soh71UzrHRg60bjyl8tkVhSK/2Di5CT1B/UwhYE+tzxR2HKzwoIfa5J5XNnUOZZMvB9bU13lhdO
	VsipMRlcqdRgWn+EWwPbWsK62uLilzsS8+5A5kpYHcSNSnYkJ9jIRYtIvO6egIwykCUkdLe4bYsoV
	BWJArvhMnOOI0neRHZso3742THv+wKLBHgUlsMUay/foEZ2dwnMDMPiB9t8doaAcsSS1IN9JfwbbN
	3cZdZmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SrR-000000044MC-2NZ1;
	Wed, 25 Mar 2026 18:21:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SrP-000000044Lq-05jT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 18:21:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C04F42DF5;
	Wed, 25 Mar 2026 18:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AADC4CEF7;
	Wed, 25 Mar 2026 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462902;
	bh=wA3AaXCRzESvZkNtYLUwYzrrKD5GU9j1r4KSqN/38rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGQjrj+gxcjEYMmX9E6vkFBMAwVAgdirn2pG9Tpp9ueqZE2BQR0ih3EeUv0nk4D9i
	 vQ3v88QAfHk8MntHHWRtYrP28nytUUPm77gc6YczOBwb8ulfBNl149K/S+sGDqz1kV
	 /vzJv77cg1U3Zv/gmu/h9mUyzS4Z1pcU7gesWjf/q+vF2PShtmiUgdHoUfYVbYV2W4
	 fUiV+xDZMM/ZF2bXhhqISFSxPLDBlg4jjh2bS6s+FarmanNQL4ZmpfDm+opQzlMYNo
	 UJkaox4ASPEdKnIGtzD9+LaGcNHk4KlzrLDQA7WNuSYlJvynZaSYfwPqVcvkYkYrSf
	 Ok68c/kDGJL4A==
Date: Wed, 25 Mar 2026 18:21:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: display: simple: Add JuTouch JT070TM041
 panel
Message-ID: <20260325-unretired-commode-4b5c46861c6d@spud>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
 <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-1-10255d236439@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="03/Mmn5KrX/eOG5t"
Content-Disposition: inline
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-1-10255d236439@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_112143_071750_E2CA8787 
X-CRM114-Status: UNSURE (   7.34  )
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


--03/Mmn5KrX/eOG5t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--03/Mmn5KrX/eOG5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQnrwAKCRB4tDGHoIJi
0qPFAP4+1nsTJGSVuIqhbQ4xCZAfYKJhlukkxY4zNFocmAHrXQD/VIBzCTZxMeS5
CWnelrL2U25+YW2xEnElm2DC3h48PwU=
=xuAa
-----END PGP SIGNATURE-----

--03/Mmn5KrX/eOG5t--

