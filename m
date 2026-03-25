Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA57109C055
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHNgcFIO6hQV4oLncfHbHayJjWhyYTZ7VYKpJ48Ex5w=; b=tgNe0EO0sD2js7WPXPmt4ybvCE
	fP5YVYhIwCJNgJffhDjUJvrYGM6W0Ac2ywiIAFkvbW9Gu6QH7ODPGxedrFFepbq0uB54Zwr5KS1w1
	aUv9RKio9Pl4okhkVupwdv6tRwL35HsdmlGYFzoBoXP4IiNifEoHf957L+uoj23GxmJwfStSfnYG/
	zQfUZzPHfdDs+UfWyn7ici+E29cJnujzs3GrdvkN9KtTrSsMXbwFMddvkoIuKGyf+vo0ylGHgaPdt
	caxA9iSL7kQVHItk0YRTQqwtjcoWirnIl12uE9bbPEPPTxgZCcFcVqi+FZNMApPYwDunMBhpqJB7G
	VO4GS6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Srk-000000044P0-3g04;
	Wed, 25 Mar 2026 18:22:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Srj-000000044Oa-33qW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 18:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED372600C4;
	Wed, 25 Mar 2026 18:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5075DC4CEF7;
	Wed, 25 Mar 2026 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462922;
	bh=YHNgcFIO6hQV4oLncfHbHayJjWhyYTZ7VYKpJ48Ex5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2B4ZUWZk/fZPOrzid/tq7Mm1EDIpGuOE11AQRY8S6NJNvOJwzqzpf0qrw1dYutFa
	 siGnlKv3+I/w4ynBugQkJ9sAmTFyGYQiPwA8EgEwSfORV13iixtK7i1LfVyvRP4jDN
	 cvs0PmMM5Yn3LrYWX1CHy7oLmEl3IVcLGsIvbNClqDFnPI8Gzx+QIlLlXAsoAWN4bc
	 u2IoHN3JtdJdWiAiBjLRrmBiS9SYRTxF5Be1V4oU3YWoxlHFIhmA96vG1lGqij8N5W
	 BjPZqwOueFAFsZWMfjFftOG/EGmwnwZ2nkQtSskRTaZyKRKjeTNKOth/VCevoIYbAW
	 k9sfiJ+QN+mnQ==
Date: Wed, 25 Mar 2026 18:21:56 +0000
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
Subject: Re: [PATCH 3/4] dt-bindings: arm: fsl: add compatible for new Skov
 I.MX8MP variant
Message-ID: <20260325-trouble-dispersed-06a77ad41a90@spud>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
 <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-3-10255d236439@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PZTvQgnWwJ6KjtKN"
Content-Disposition: inline
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-3-10255d236439@pengutronix.de>
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


--PZTvQgnWwJ6KjtKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PZTvQgnWwJ6KjtKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQnxAAKCRB4tDGHoIJi
0o9CAQDXdpBhuEh7kTCcbiLCc1nFZHZqEImPwNnhaFu9T/buAQD+NTlLTJTRZ9pI
VxCTB/9AJtJtngY3mjOl2Q5qx7idhgA=
=BVDg
-----END PGP SIGNATURE-----

--PZTvQgnWwJ6KjtKN--

