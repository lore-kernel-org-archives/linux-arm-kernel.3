Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1DEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkp4HiOPABBONoTf78hQOCnxl/elkCfMhe6Bpuh0yx4=; b=ZILDv6+jxbOd29fVNyrkaKleg2
	gaRBYfRDCKzJM8Z0qOU36+CEnYXKv+QjWBl3jiZ0XaFQfsyvxx6dqI2qdx/sLNYoaZoWGsdbssk3z
	7u3tZMOk2mgkIkX4EoPOoyW7szFjBNv/twvsjp7RNn8MyLuftoNMwMeKCN5qLzOmLDQvcGGlLmBe/
	XAnuVZcMPkNdbVRETzBKpJvPwwqQJu47tY8w7iPCVNMB5GLGDn3ElqIqpDA4n4nZe35ZA+tpanG1o
	YggnneaVY8fFatNgNWQ7O+lK67Olqly2AF6Xg4KbkQj4yCYGl3S9NqZtcVGwqKz7BGUIXCS6Oo8nF
	Omwyv3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyIF-00000002eZw-1D7e;
	Wed, 01 Jul 2026 17:00:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyIE-00000002eZU-1ZSq;
	Wed, 01 Jul 2026 17:00:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 789686001D;
	Wed,  1 Jul 2026 17:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE47A1F000E9;
	Wed,  1 Jul 2026 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925209;
	bh=Lkp4HiOPABBONoTf78hQOCnxl/elkCfMhe6Bpuh0yx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A8j4rPn8GXnN682mi5i14xifdRIV0M5B159dMsfcnWdWH2sb2mMioWiJGhFLzrWc0
	 Dyr9c2MoFSnr/orqV99qlyqFaveNQ7qAy7okRZOhpWmyag2MRRhGCGhbLZ4Dzm3qU5
	 VAU86MGUpc7T7/jw5E1fWMEAbyZcF2sEGdVKV4IqwoTy4PP/cP407BP1fy5X6UqH5b
	 DSogYVufJ95XHKi8Y+HofC3K131mqd68wdmHEx6GpZGyk0kiFJlnJsk7EgvequLex5
	 MoL5cW4HPQUA6iRA59HhmxmIdKm1dSIH3EqXDHzNpdjlxAzdbVR//xcefQ6xZsHOvm
	 Twzdtils5wQJw==
Date: Wed, 1 Jul 2026 18:00:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support
 for MT8189 SoC
Message-ID: <20260701-twisted-splurge-d8428a6ab8c2@spud>
References: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6LIruBZ0RnifyB06"
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
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

--6LIruBZ0RnifyB06
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6LIruBZ0RnifyB06
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHlAAKCRB4tDGHoIJi
0v2hAP4xG8uRvU5urx9tcNk5sTMtXUUWh0Pp6QoPg3ZhJxrmsQD/W7k1BGw3eGna
wHVQ02sZvHrnrhOF9xU/nWYvggscKAk=
=8Tor
-----END PGP SIGNATURE-----

--6LIruBZ0RnifyB06--

