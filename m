Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241E51090255
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9bmMfFx9VaqawS+DAi/VMX7Ox1YGfZETdSY0ka144s=; b=i5z6Jd/Rw0HJnKB7HNgKP70NQt
	gU2r5R10FAj/qaolZ+icNHeheV3MteUK0IztVHzS0xNp7cjF5ZEihxvI69aNM/dnItBmuqwjt2B9i
	9FQ2Gz6OTZq03kycnAdFvi/MYdU8KZW7IN/21F+XFmpOIgokOElfOpV7B7ggUOWlXUy/XQ6Qzag3X
	v2t5Gpmi9M6RnGTag9VhB3y9NO+XU0+nhirxkxRdOTPYHNZB50iP3Fu2wdMwe+CKuziOq8mlsU98+
	sE0HhCgbZfxzEbJ4GuqYkh4FazCDdn9GfO8Mrb6MORkuBFWjoyaMYPeier9ix1MSYC6vb59aCSRB4
	OcTq5Ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GX1-0000000B6rX-1efa;
	Thu, 19 Mar 2026 16:47:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GWz-0000000B6ql-0Hgp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D3A140DF5;
	Thu, 19 Mar 2026 16:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548C6C19425;
	Thu, 19 Mar 2026 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938852;
	bh=Q9bmMfFx9VaqawS+DAi/VMX7Ox1YGfZETdSY0ka144s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6O09R++VeRZeBLvlRglepXSbWOnsIhuBkcGpNhTMB1/MxNyYTeJapekjDaW9ym/U
	 g3WiEdfd8R7uBK2Xz+c723Mt4iJoIhcaf2D0KORmNFiAcBex9S3LDRiAatMQMSmEp6
	 hxCeFN1P2frgIgp4rTTbaO08bJzT3s/ict3CmhuZ7Od9S9bnxl1tk3RYNwiYwtltlO
	 BmL3gyQPevLioogcVVd92zpTvWC7r9ofVSUz2yQElRmOw+UfqSCYLuP3sXupZcEHPc
	 D/laaMiHxUOPr3yX1/rh+tkLZh0/blr5EGrrm3OO7RF/31GDgPmVJKMZcumqeUrw2y
	 q7Y2i0DjnTmwQ==
Date: Thu, 19 Mar 2026 16:47:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add MBa93xxLA-MINI
Message-ID: <20260319-theater-aspire-8500b91fbdaa@spud>
References: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
 <20260319125013.2421621-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/6QbIyqIGRlgMuc7"
Content-Disposition: inline
In-Reply-To: <20260319125013.2421621-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_094733_132594_F90AD82A 
X-CRM114-Status: UNSURE (   6.96  )
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


--/6QbIyqIGRlgMuc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/6QbIyqIGRlgMuc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwongAKCRB4tDGHoIJi
0uTNAPsEyayXseF02444xp1C/jh1jrMtTIiGUoPEhRjgH5ffcwEApfj3NtwQgBqm
vlSCD93D6v9TigARn+e896cjCGUAoAU=
=JafL
-----END PGP SIGNATURE-----

--/6QbIyqIGRlgMuc7--

