Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B70C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mMVj7zoSNrsqSxpmi4fJbUKy4RL0210P19TixtTxq8=; b=iR6T/XEXGjHHO3HKWGgkXnLaqL
	0DaA8TA2IhvznHFYjDZXPT2mCuZj3Hln23RnhQ+hELitYviXX7upkuHFcuinqpaBTV1AW/NQabZuW
	kMsu7i19n+37MALNIoodl6j7bVqK61w03yXX0qNhsDXjEYzro2NCIYZM9VYPR148zxAeAALRMv56p
	I1qXBvu1Q9+j9vMNLEZJv2/hoAwvXBJlOHVclQwEaXnhZ7Ls3CQsQQ0xOLuJMBJ18apBmOUQcVbC3
	8wej+i7k5B0GB6iuasEMUQ+4b7KZyFSN7oimuzaMW98TYxss76+/uTrMdim/4mM8fzLYLGa7MWK2g
	j632N6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlOp-0000000GHgk-1e4V;
	Wed, 21 May 2025 15:30:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlM0-0000000GH6c-3rE3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 15:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C5C5A4F0C9;
	Wed, 21 May 2025 15:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24733C4CEEF;
	Wed, 21 May 2025 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747841255;
	bh=5mMVj7zoSNrsqSxpmi4fJbUKy4RL0210P19TixtTxq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2TFrE20fMrmKXZ80cld55DvJ8DdxhLf8F7XawqoKWV6sIPp2pJeewXhZtad0WtZG
	 ZOG7t/6paQbeTepTTu79f61Tt5Os0tJVpPPqMoApI00jtUBbMcyUBaBgCwX2oGLpFo
	 1MvLGAdheHpx2DVozNxflJzeu03mnfKCnhEaxHplWcYJ0y9WmfxtS8JpQ+S6lPxgCI
	 aZMd2HOiB3d0zEMX0x++DkxY947AoU3Z5zAvy3t1ggZMyZBGu2RxV4ZgMO4WJddnu9
	 Y56dSdSD7gLDYOIj49w5J7Oq8bob7HRlqGsyQkwHBPNeKRLvm340LPD7l+loHK3Ql9
	 wpnT2KJ0XyvdQ==
Date: Wed, 21 May 2025 16:27:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: stm32: cosmetic fixes for STM32MP25
 clock and reset bindings
Message-ID: <20250521-lapdog-important-eab513a1f0c0@spud>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VmVkhvbJ+txMTgWr"
Content-Disposition: inline
In-Reply-To: <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_082737_026684_6195EA8C 
X-CRM114-Status: GOOD (  10.30  )
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


--VmVkhvbJ+txMTgWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 02:38:51PM +0200, Gabriel Fernandez wrote:
> - drop minItems from access-controllers
> - remove rcc label from example
> - fixes typos
> - remove double '::' from 'See also::'
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--VmVkhvbJ+txMTgWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC3w4gAKCRB4tDGHoIJi
0pXnAQC8hATk3hUwzGttwspTMjh0lSDX8+wInM4ZNqQ+El50uwD/U1qOZLNLaKRf
GewLL+A/wyRnHVMpEQf/1LcRSOQreQo=
=mwyf
-----END PGP SIGNATURE-----

--VmVkhvbJ+txMTgWr--

