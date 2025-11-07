Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20C7CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bl46a633tHaOF2ZnQarVYdbfa+FUQuLdrMP51j7Wxhs=; b=lig+VkN8a6/i077wfzW1m+XZtC
	o0/dujo9HQGDGX1KhUWzBJIA91N2q1sfuXMAt5YegJJ03Kx26BQgpgI275rONdVPKY+m5cfHFVguY
	QKgVOcHED6DX3l9vlI4TI7lJbhB5pMB/VHv1yRcnagY7GVdw15esHjeRxde11fPMe+8+gnJ/aLfbp
	s4+2152YFKOIoCgfllxeQiCWgHsVXIUYHNpsQPgni6mWDsyuzTJJ0sqMvfZ15k7Q+ZXTf6G7BX6gg
	AeX/msxiHcNe0gWLo9ZijoReww7Kk9HM0l4nEHPVtUp5zJVn8U3dDzwghJoX6P5eV4UTMeIOUhrnT
	AUaytdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQCL-00000000Fgq-0duW;
	Fri, 07 Nov 2025 17:24:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQCK-00000000FgJ-0Lm9;
	Fri, 07 Nov 2025 17:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35C7661921;
	Fri,  7 Nov 2025 17:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5846AC4CEF5;
	Fri,  7 Nov 2025 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762536267;
	bh=iKWILkhz+c2dRe8cWkaxtQ3t5wgfEL4WzsX8PLBPxO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5JY+NCAkOPWxby286M3HkgsYu4G15KonQq63w23Atx6Nw78U9GUMYD2eNoJqd7pu
	 nQbCevLnAE0tJQA1si0J9mUvJ/xVu+FO+XxUDGLcAbFI72ttFugwr44zVrF0WLYUni
	 PEdps4THg6M0PbBcvuRNVo38UFaF0msM6fcA7lCG01TrsEiBZJS/PxUPNWqfXzkSEu
	 UFo7M5gw6+4Rj1gR83bWFSzejpfnNYBQKKJdsN+8ajDFz/6Qo9Pnk/oTw7LfhTKKHY
	 rnlopPPCGRVlE+L20J5X/B82jECdS177dLuMUH+vhOSA8rSq5O2chyC+B2KyNhHbWh
	 XFTTAXnzHCPXw==
Date: Fri, 7 Nov 2025 17:24:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
Message-ID: <20251107-washstand-motivator-c5e5e5d30dae@spud>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cXGsyKspLHvZR8fa"
Content-Disposition: inline
In-Reply-To: <20251106235713.1794668-5-ansuelsmth@gmail.com>
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


--cXGsyKspLHvZR8fa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> minor difference on some function group (PCM and LED gpio).
>=20
> To not bloat the EN7581 schema with massive if condition, use a
> dedicated YAML schema for Airoha AN7583.

You went to more effort than I would have here with that conditional!

> +patternProperties:
> +  '-pins$':
> +    type: object
> +
> +    patternProperties:
> +      '^mux(-|$)':
> +        type: object

What's up with this regex? Why does it allow either - or $?

--cXGsyKspLHvZR8fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4rRQAKCRB4tDGHoIJi
0m+6AP944+gmALtZGR1CkfB4zaT3eHH3sYRIpgbLLZY+u6lbaQD/ZB/xRj4VWjq4
esQCRuxRKBz7tiNcleNfRyxChdSjJA8=
=YhQN
-----END PGP SIGNATURE-----

--cXGsyKspLHvZR8fa--

