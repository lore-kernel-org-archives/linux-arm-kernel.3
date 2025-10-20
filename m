Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D140CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFq5LOrpzBT+0cc2xULTJJjO/I/ewFbE34Rwz7Vzghc=; b=CVKxcLupIFt45u5HgFLi/RclYx
	/kjL5Hbvr6vUZ/jqgDftU65xNhHbJ5atGzVJkhOCHTIwzA9ITCxM3ZMJkrtUH675xusO1BcRetwDp
	PMDmkxva3SPflnfLSfbUfc6DQtrx1IuSSREECjUxQwWo7iVjSEoObXWAIrT7SZlrhk0MCv7T8Lzbj
	WvP8TFV8P+ARNnjwMFk3plVnR5ipm00+7cW0zEb9z3mtZEl1ljdYOGLQ3+pGNuhc29pYyQ95tBmWM
	4F+oFUYlOxRrVv1WGvEs0hXH8BjgYtZKAkIOOZTm3U8XidTan/Mo/8ccVg3Ck/RdwORApTG1aCtfQ
	YmwqfgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtTu-0000000ESUw-1Grl;
	Mon, 20 Oct 2025 17:15:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtTt-0000000ESUq-2FFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E76F7620C1;
	Mon, 20 Oct 2025 17:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5DFC4CEF9;
	Mon, 20 Oct 2025 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980536;
	bh=QFq5LOrpzBT+0cc2xULTJJjO/I/ewFbE34Rwz7Vzghc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0N7qB7eyOf+og4EajM32N6iSDRWii4pM4IRcRrlLHUUVPxxeAz/pUZH5GMV0asoc
	 a/Df+2Ka9Q2b6okE6DBFL3ITMbpWGE+y+MbvRLu0+t+PJUS719uYEWje+KG8ITeCFH
	 ozdIKrp0R1hh96xNsggx5xkzmrCKG0fZ1isIa+sTaA/OMuxB+xwEciezZz3clKHFWF
	 0NtqxouSG8TySG1CitJoiLEi0iSaKLxoJxib5jZhg2ag/9aaE6/VeJXwjXMF+XwYzq
	 JGR4rmdw9/AMzO0kMie+fivm5M/VNz4r1QkijaZdvhVHaeNmO4QkApK7JwQNJuSqzo
	 +yaddHAuR95gw==
Date: Mon, 20 Oct 2025 18:15:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add TQ-Systems boards
 MBLS1028A and MBLS1028A-IND
Message-ID: <20251020-closure-eating-5562565a4032@spud>
References: <20251020133536.303471-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5gaGBfQOuF8CKPP"
Content-Disposition: inline
In-Reply-To: <20251020133536.303471-1-alexander.stein@ew.tq-group.com>
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


--y5gaGBfQOuF8CKPP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--y5gaGBfQOuF8CKPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZuMwAKCRB4tDGHoIJi
0idqAP99wn9rZ3vdX/HiKOVJU/T6U0epcn96qhI5HbBPOZrMCgD/fDSstymKGmQ+
e0eW7q6qrX43inmNTqVE9GCARUNQpAU=
=f5RB
-----END PGP SIGNATURE-----

--y5gaGBfQOuF8CKPP--

