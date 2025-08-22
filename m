Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69F3CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaK/J9Mq7TMSJEOF0Q/1YTVBPo06y0I9D1S4aI0nInk=; b=3HWKLNYFv7jSlHLkR7luJlX+SE
	8SHRv5Py8rkHguwI+3bJh5dgn5uDGF+nQ/eXdJ/Kn3wEL3UDKQoYAzhYgnDJQHr+av1a+AVhRSUZN
	wuUkos3xR4y/+fcVzakB2vHLxOt5eHB89K07ni0c+lbKdFMyLLZ7PYyCKCns5NMGe3iKVCh5j7Du0
	rNkb9BWdXozOVwlpIZKBDodlvaMS597WRmxDtnlCewzW3cI6gdZwWFr4xBwANMDCnhKQDCXbfZlsx
	Fyjw6zlT2yzO9211zceIr7jLPrIi3jGV4V6vmOqG38k9dyBMdGxHs6mhVqO7BJppioOZMM/bCzPcN
	kGpmzCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuv-00000004BMf-3ZfL;
	Sat, 23 Aug 2025 06:39:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV02-00000003CQl-222k;
	Fri, 22 Aug 2025 16:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC92E5C710D;
	Fri, 22 Aug 2025 16:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27602C4CEED;
	Fri, 22 Aug 2025 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755881541;
	bh=yaK/J9Mq7TMSJEOF0Q/1YTVBPo06y0I9D1S4aI0nInk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTtKvyPnUlzqGaBwQRa4ApDd1eD78Vx/uDltIbOsZNeZ9FXqn6LgBoNYdVvzP+TLZ
	 G6Hwwgw3IH6QrbydGfUJK4dMRu/KjXCWM/Wta1Xu/Qh5m6pzO9Xodry7FgmAgQ6IE5
	 jfXRK1i9nIV6INAtYBguAK1DdUCfICmhNJ9q0eLH0D8hTMS34d1pXz1WZW1MwChISY
	 k+xpxj061avk6wAg6MlLci7qBS03EzI6oo8vxoAFQo/1sxpv8Otf/cLiZKSDuNfZNm
	 eoiKYpA4/RnHKr6ZVV2VELIfrwrqL/VJpgE5O5Zkarg6FdiWPBdoJUpiKj1vfs0SNb
	 vuOwjd6H1Sf5A==
Date: Fri, 22 Aug 2025 17:52:16 +0100
From: Conor Dooley <conor@kernel.org>
To: maudspierings@gocontroll.com
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: ti,tcan104x-can: Document TI
 TCAN1051
Message-ID: <20250822-gout-denture-688eeb65b6e0@spud>
References: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
 <20250822-can_phy3-v1-1-73b3ba1690ee@gocontroll.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="417/6ibRk/SLnFGF"
Content-Disposition: inline
In-Reply-To: <20250822-can_phy3-v1-1-73b3ba1690ee@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095222_555155_5B15A640 
X-CRM114-Status: UNSURE (   6.36  )
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


--417/6ibRk/SLnFGF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--417/6ibRk/SLnFGF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKigPwAKCRB4tDGHoIJi
0pC3AQCDOtsgl3v4+3MpC8nave18XEmONgIFklHfXnBS5G3TwwEA0mnpdzGtsgfJ
aa1SEma1o0J1HMb0GPVTGrRvFhFXVgI=
=SrOb
-----END PGP SIGNATURE-----

--417/6ibRk/SLnFGF--

