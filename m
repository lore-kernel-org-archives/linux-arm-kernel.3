Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C95CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qujMjalLm+fR9p2YtYH4uWTPdLVJMOUVJv4gYWrE8Y=; b=3LOEz/+Y9uBSZ4tu/aaGOwLS8D
	LuppPpaN7EdKMSE+l/OQ1MUnAtygN/yBwMqR1ktUAXvBzkGgle/+GVpbfcFGsaI4Li4FcT3KTTX4/
	UZgoyuudroUnnk5QlHzDcmEmu84CgpxWlJ/J+zoHgZ3qBuIQXWmH5DQyAQKNi2DeRzKVyJ7NzmXKR
	0gy6luAnXvGjYJwLYriDATvX45YgRmu2/1URHl8A01geO6NIidoZjfAYZ7b93LzF+0LP90lNE8B1S
	Uky7/uFLdhPjjQdRY/CxQUaZzVgSdHCy9hkEA5GK4xeSpr4KGFmG/PX13x30k3HJKIcKcVK0iY9ts
	+ACai3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEZI-000000015Eu-1aut;
	Mon, 28 Sep 2026 16:51:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEZG-000000015EQ-4Bpi;
	Mon, 28 Sep 2026 16:51:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB91C429EC;
	Mon, 28 Sep 2026 16:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD871F000FF;
	Mon, 28 Sep 2026 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790614266;
	bh=7qujMjalLm+fR9p2YtYH4uWTPdLVJMOUVJv4gYWrE8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OVcc4nwtk75SjYcZBGTZBLVBZdYzxJNk3wCeIOjJUcHdOzA28qnXyoMHtALghanJc
	 TZlDrvfBIx/0/Qf8U1OF70LV/xFJXyubsPVOUCk47JaN7BmzHZ/udeZiTlIBfJbiq5
	 89eTp4DvJ4j058sTLQZze5JLuGrGNMxnEMTdHG9APGrGkRl6n/R6+4HSoGzgc53LKA
	 GylfwUKKoCrjhjbidIsU30R8FN59svuN5tLUC9HVKyQt8miRZmQ0/BJPfD2s8hhiOk
	 fctHLUGySdovImS4cSVXTo3ugfeUy4I7mgHVRgWgvuaJXU1L4MuriR2MOJrh0Lu+Iu
	 aQsyONrMj0bDw==
Date: Mon, 28 Sep 2026 17:51:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add compatible for
 Allwinner D1
Message-ID: <20260928-reorder-laborious-73515b6ef657@spud>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MUxTtFBeNtxJvpZQ"
Content-Disposition: inline
In-Reply-To: <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
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

--MUxTtFBeNtxJvpZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--MUxTtFBeNtxJvpZQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarqa9AAKCRB4tDGHoIJi
0lVQAP49KPJ6ClOf6NzSjcHl7OvrOuUz/0otTRx2Ry1qRLGnFgEAub8iEEd4aYlo
TYoCQmOGZ2i8zKTGaXDzcxb42/ym2Qo=
=Rij2
-----END PGP SIGNATURE-----

--MUxTtFBeNtxJvpZQ--

