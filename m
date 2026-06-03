Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E09CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkqp4IcVnRoBGsFQcPvmYUMsFoW092uXDpIVveBct0Y=; b=SfYFIMMaFLdRIajFDI0Ytvebx7
	CzkcmQmV2jCuoBEpO6N4ejB7qVAlpEL9q5z+qtiW6ubE16DGEUVXgM0d0lwuduujBbiOzAP4xOHT3
	04ltVUWlmj+hZlDF39FePtqwrH1k41wbKGQbtcMdcJZce3qxwJXbjex1nmsO1ZZUcY2W5BRFkXUl0
	KXB3C101Z0Nx0thRRSdhF7IwobieDu2W7spyBhhGk6zohg9qs+bVP+J7qEC4xRdDyjL6djuUnQc1a
	8DTueLqBz80NoShQL8/8guacCP8ybn5rib+yBJ0MUgitMX3e6FVqHrZSa6zvMme0pgUyzJNYfN8uI
	s/eDoPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnbz-0000000FQkv-01iF;
	Wed, 03 Jun 2026 15:34:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnbw-0000000FQk6-3c0b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:34:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 539E34415B;
	Wed,  3 Jun 2026 15:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9D61F00893;
	Wed,  3 Jun 2026 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500868;
	bh=lkqp4IcVnRoBGsFQcPvmYUMsFoW092uXDpIVveBct0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KN9vwYVAZNQ5KY8cV/u5jM2ET1669txiTgrE5Ve1RU60xMxt3mber9I1vmP0piZiH
	 tU0dXR64asXnOihn5JjgVUDcIDhfl3ut/1IdE9LwSli1VSStiskKDUf/12sfR4CcFW
	 DHoM3vUYkalqmb4bE+kA+P/0B8Uvi4v1XarnzcnUbM59iQtilVE5wUNTIW2fEPkR2X
	 6qCUVs+/iw5Kti0q+BfBhClDIUBDkC66Ku4MbFzgse5lIu4VH/u1IGx1FUiVPviwjT
	 ADL/OK0hxbXqjSQCh665Mu3Cg7uLNQMAfmR23Kfh+Zm2ElVfxhMHrbnljjsGQTCzGq
	 xCK4CojjyQr1A==
Date: Wed, 3 Jun 2026 16:34:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	kishore Manne <nava.kishore.manne@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
Message-ID: <20260603-revocable-unearned-413d8c943ad7@spud>
References: <cover.1780499520.git.michal.simek@amd.com>
 <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eTmVpuXs8nEdW++5"
Content-Disposition: inline
In-Reply-To: <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_083428_918705_51BD680E 
X-CRM114-Status: UNSURE (   7.15  )
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


--eTmVpuXs8nEdW++5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eTmVpuXs8nEdW++5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBJfwAKCRB4tDGHoIJi
0mnjAQC/Pct3fOY5WkSqAMSrA1C8cufBn47nb5Sr5nSzVU2miAEAtdK0HJy5G1TO
Mi1WJUc/nfD2DhTR0hLArYkytkDxxAI=
=52Y4
-----END PGP SIGNATURE-----

--eTmVpuXs8nEdW++5--

