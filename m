Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BBCCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caleFy4kbE+uvk+Sc3e36cq0k2w5/jsAIKa0fhdNasQ=; b=49FanxBAtlS7c4WgEcS6sjNC5x
	6PV5LjYD+IofEr5+SqbMVMegxYI+gEr1M65iDsFImwaVrO1s9pZKAcOx10SHlWK6oQaI7kJqwKfpA
	cDIRoOvQFO8x1asTnDJNZObbtgHFzLXsE8aL4ic/f9CTFXNF34fZN20DAGHHwrhwnKdWqk/at7Faa
	p7ukiQI1cDIRXfVZJftiso+3zbHkcacOn9XogVLFnH2E9PCm4yNHH5t62JobxreF8DVFu0VxnuKxF
	6ShZDwWRJY+/VhZ8AdxihNHC3AToXWToGeMyrgklSsyprZ2h7mXB+VHKWrlIDbmE4HrB056EOs3N2
	7O65pllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uposN-00000004pOj-47BW;
	Sat, 23 Aug 2025 14:05:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upopj-00000004pGz-22ks
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 14:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFFCF5C4187;
	Sat, 23 Aug 2025 14:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EA3C4CEF4;
	Sat, 23 Aug 2025 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755957778;
	bh=caleFy4kbE+uvk+Sc3e36cq0k2w5/jsAIKa0fhdNasQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2dJWl3OewBdvZspyrkXJtc/pEAkGEL4Kp6j+9pW5g+tFVxg3KGCcs5TcDAWs+niW
	 fn2auyv+V4wuRNYNz0NNeMuHm+aZwfjkeH93f+g06aMy5fgL5SoOwNcCcVYSGCZdoC
	 pS4IjgdDGFQa9BkbOihvhiadlsHHRxPGJRSv3t/sRhA2SA0fpPWkyNkCCf2wOcM8uY
	 VvIr4xh00jrqwAhjYTNmBjZgpk57DUNF0/z/8CCHlHa0036LNAGD/oTgddYGD1KE8d
	 h6Hc2446PDOBlGTW6w4apuFUSAQwuQIJehVWm7n1ENp2W7Yr3n5iKVg++lDjVuZlbx
	 Rf6mKqLS7qOzQ==
Date: Sat, 23 Aug 2025 15:02:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,imx-iomuxc-gpr: Document i.MX53
Message-ID: <20250823-shimmer-conceded-35d10a7b5264@spud>
References: <20250822120241.26419-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C1ZqRzwRJhwxXUSo"
Content-Disposition: inline
In-Reply-To: <20250822120241.26419-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_070303_556172_FEA3025E 
X-CRM114-Status: UNSURE (   6.02  )
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


--C1ZqRzwRJhwxXUSo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--C1ZqRzwRJhwxXUSo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKnKDgAKCRB4tDGHoIJi
0twtAQDhBDDAYhVJmau4HmLAEuC6wDq0to3phN8IMEFZVeNB+QEA1cljqSj4WxWU
ONvIfhtDTCppLOw2os+kUlIBdwNkcg8=
=4Euf
-----END PGP SIGNATURE-----

--C1ZqRzwRJhwxXUSo--

