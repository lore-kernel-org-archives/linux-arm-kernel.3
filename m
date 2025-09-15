Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20784CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJJvh5w1R9nXmEjFqkW+/hKYN+hA2MRPzYEwZlDdaW4=; b=s3OG9CZbGqu5XaNpSn/0zk6dmq
	u3UkOtfbjnsA3WRsKFfvfdqwaRBExrP4dukQoUT5ckUuVI1diBjW+Xc/83nctfywekwYBbcIyXDsi
	O8l44rbz9JG7Bup69rRFlpLo5CbjR/JFULGOlkuDPff04LN3Oq7O6ghfawRM4v0cMEIPbPvM+SV+6
	pNxOfDjSE/HSfgGIpKVXp9ja0E09Yi5X87jKqNtiOknKerY/GVL8DtR0SjZ+DEmR/pM/hO4duXloB
	s3Y7XO5HWCrFtQIYOm5PSFvPWUCJbSz9X9chkkuzpJXcqvgV7vt4P4lTeJbVDSyBnjMrsavq5VW9G
	zSrLI7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCrx-00000005Gb6-3xSZ;
	Mon, 15 Sep 2025 17:20:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCrw-00000005GZk-08Pk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 17:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B888F40363;
	Mon, 15 Sep 2025 17:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D480C4CEFB;
	Mon, 15 Sep 2025 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956799;
	bh=AJJvh5w1R9nXmEjFqkW+/hKYN+hA2MRPzYEwZlDdaW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQE73fdk9HVoEr27DncLojCtI3t2zTiAJZ1jG90/3TAllz/SdD2TZT2bB8wHpyvGf
	 pPjbhfRitWlMchsQeePyfsowMhGqXLD44mmBjwFVszsuEk23JnZsTG2DL3nuzrUgTC
	 DnW4auiS/7v6cGYh4fwS0dNhxQ9y2bDg9gMMXzoOtT5Sk3dOLb0jsTn3Gv5OgwwHK7
	 nHBfHVsD31eRxYhrBfQP2hvUXdWwM2o4JFUyy9JAdFZ656ECly252AntEzKzWzVqMn
	 oN13ZXFhLWgxi2vkiaX57UpI9eArYgJTgG0kGIxjlMXmTH48GFN5YXg8wz4N4ChXuP
	 /JnHgVCCM7+Jg==
Date: Mon, 15 Sep 2025 18:19:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
Message-ID: <20250915-raisin-placidly-d440495fdf53@spud>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-2-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OipVD4JuPL8umPoi"
Content-Disposition: inline
In-Reply-To: <20250915143440.2362812-2-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_102000_092682_2FAAF697 
X-CRM114-Status: UNSURE (   8.07  )
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


--OipVD4JuPL8umPoi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--OipVD4JuPL8umPoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhKuQAKCRB4tDGHoIJi
0n0mAQDS/ZfHn4W7+zS0AA9bqS3UWH1Ag9jyYeFsCd98agveXgD/RF/LIo62w7p+
hPL25pXNWVcvLg8/Mu7ZElqxG4JDUAk=
=88JP
-----END PGP SIGNATURE-----

--OipVD4JuPL8umPoi--

