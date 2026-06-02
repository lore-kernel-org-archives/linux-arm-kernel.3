Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39D4CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xqkn7EVchcMbjnDkgwOZm7cACncjKcFv9E/ppH9FXzw=; b=kv/wLNOIY/LDrjITfU2GFsfN+s
	pH57DQW/+eJiYKgDmrVTKrtOtpACcfOfhXPAmYoYNVWN0fSSFdBlgkdSA8tmXbQvDmnEZMRK+XqPC
	fLWB5hRr0WWlS5FUHhgRo57YceWmWB9Z1ZjC01dfHxoJ2G5bF6aSFHxZzesiTfP+aLu0NaMtbKpXx
	nq+iZXcui52uGeungg5JV3lkrzDR57AG6+S01wUR4WHKjMKOCLxvYutXVxHBIKF6/sWtOJl+5XVFW
	d3O0toSeNeFmKbdDTBLO5sFqrBYYQHXZMf+83xIcyNfCTiv3SOiAnX5n0QFTAOnlNIVW1VFGzVA3B
	MVNnvDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSCn-0000000DU05-03Uj;
	Tue, 02 Jun 2026 16:43:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSCl-0000000DTzg-2O9p;
	Tue, 02 Jun 2026 16:43:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93AA36001A;
	Tue,  2 Jun 2026 16:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B801F00893;
	Tue,  2 Jun 2026 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780418582;
	bh=Xqkn7EVchcMbjnDkgwOZm7cACncjKcFv9E/ppH9FXzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AKviLg/r7qZbVLQFlONrui5T3HKU3u5SJinZ/i4rswLVf0PJoqKWfti1xFXq19gFA
	 Sc8BIfY1giSDKsy+EK+S2mAIiHyKKT4Zg/dj0/gi1kPZ1+MKRe+ZqfPKQ+8Nkppotj
	 fhi/K/sltLjjH/kvzyEH3H9EfPCB8t2XlgIrf7xv4Xfq09b1WOcOiieFUpuiJUi+cF
	 HNo0uznHWlzhAoSjct4xx3TLT3ET+K17CKYvhPY8AjB2tOxLxU34FgVR2Ss/dOuOIR
	 K/YjcFr4JMcgJ1Z5OnLv9zkcajPE8Mcw7sLC+/LujQyJIEB5d3xEmZhSuhRVPd8RBE
	 3ZMVvpM83VIcQ==
Date: Tue, 2 Jun 2026 17:42:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
Message-ID: <20260602-chaos-jersey-50f60b1b4070@spud>
References: <20260601152707.29039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qIydSbG4bdZw6d2c"
Content-Disposition: inline
In-Reply-To: <20260601152707.29039-1-l.scorcia@gmail.com>
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


--qIydSbG4bdZw6d2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--qIydSbG4bdZw6d2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8IEQAKCRB4tDGHoIJi
0mrTAPwJtBLGBMldX25YoduFYOFABADCaCaWjt7yB0qRp8rY7wD+NIaskGXV1A/N
bLPvbwapWDo+tLidhEhl0hnA5+hl+AE=
=DwBB
-----END PGP SIGNATURE-----

--qIydSbG4bdZw6d2c--

