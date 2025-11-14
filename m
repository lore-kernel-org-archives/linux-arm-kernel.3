Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F456CE8D68
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bbn75JmNL83npodCTJTBOAPaDgy6voJdhk7xvelQSXk=; b=tJZM1PwQEYGlqiLxT1lXjs6nQh
	gr/IsqZrjqnemorGmCrcDfYm8fbh5fwUC4G/Rvd9Sp3VWvTtsI1WrQ2R0zVyNL9fE8SwzwF7gmtXV
	Qs+QxTgNpTSY0or/7UFChjRkxpox/s9vokOG0G0oE2jhOkjbEXArMXS0p1dzakBzZyOA6b2LVdyfo
	7QVdkXmf13hIG7WYpUxD+dHg8dZRAF7HCvn97ILzhg40C01BuX/pz5vg2lHykCipJBfHnZaeP80Oq
	xh6Z1OvVMg8pLljbj6MziahJh8WxzAtJcGo9/ugaHod8VmZH0VkTUxItkwdxyNU5xq1/9qoGLPuI8
	kUcVDbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy0v-0000000CuSS-2O1u;
	Fri, 14 Nov 2025 17:55:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy0u-0000000CuS8-20hN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E54F760227;
	Fri, 14 Nov 2025 17:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49221C19424;
	Fri, 14 Nov 2025 17:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763142911;
	bh=Bbn75JmNL83npodCTJTBOAPaDgy6voJdhk7xvelQSXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6X541PQcR+vUg9Qe47frMIQly2Sd2xFW7KLq4G7AYVFOl1az3CbbARBIl5b8fPYq
	 QnFc8mT9SIpMPZ9+2+2DbhMLb2/hv3dgG6I2aBUBnEwCCPRh0xBAy24Us3RujLoG7F
	 QESqh1+T5o/Wd2b3dBZjoZXHpbckcsCdChLlgoF5mi46lf3JQLSoZ3NqQA6bMd3Oi9
	 9akNt/t/3Sz2BvWKZKEQgRTdFq+Mq+7c0xg/GFBHKJUWQsJsFrh3Q5tlFCvurg7ltg
	 7yBmNSc57mki9Pzv9PNasRGIfkXiYByHmq1aClYxWdpspQ9yry2xG63Kea7bGBT5J+
	 R+EEG+Rj4UdvA==
Date: Fri, 14 Nov 2025 17:55:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: clock: tmpv770x: Remove definition of
 number of clocks
Message-ID: <20251114-gatherer-landlady-de35d5ecab9e@spud>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
 <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2MovHCO94YyZNoex"
Content-Disposition: inline
In-Reply-To: <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
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


--2MovHCO94YyZNoex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 03:53:58PM +0900, Yuji Ishikawa wrote:
> Remove the definitions of number of clocks from bindings because they
> prevent adding new clocks. Since the previous patch removed all refereces
> within the driver, they can now be deleted.
>=20
> The same for resets and plls.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2MovHCO94YyZNoex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRds+gAKCRB4tDGHoIJi
0lV2AQDV0BxOT40o+VE6NKbdmT7olKBY8l4rzUaLXTsZxea9EQD/dfaGYz26GiUt
Odbl5zIWpStM9pj9OXriS0kswZdHYQY=
=Vb4j
-----END PGP SIGNATURE-----

--2MovHCO94YyZNoex--

