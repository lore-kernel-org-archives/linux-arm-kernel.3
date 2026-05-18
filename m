Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDFECD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3Ikqs/u6iw16HVdcS6tQdZmxm4Gckpgsu2UZkrryLA=; b=ppfo5+buqdAA0KSRDSAlE1BhXV
	OpWCsQQWg9synMkNfalC0AKcvlANR0wTVXvzvYmwbmSJjT0e6+M6brL7GpFe6kN6KzSHoYFDXZpgN
	OgKb6htPkBQ7pTD+2mnnjn5OuyGHFzuwLOflH4CCRNmaUw7d3sIHBtiXv+uIMxAooygHv0SUMBf1+
	peIJuAnxufi45whNvKOhsuLnnLRFAoYUnpc1pZ5F1GoVfjSwWbo96KYFP0ny0A2cp801GCKt/ykC+
	Qg+C/46TUTXfuQBIWZzmDY/CZ6+H5Q7ZtUwfrK4FSX1t3mQggBozcO6XvcRuYBSu93/I3C/ryNOwi
	CIZ4MFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP15A-0000000GKgT-3ZqH;
	Mon, 18 May 2026 16:44:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP157-0000000GKg0-4AjW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 16:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7911044414;
	Mon, 18 May 2026 16:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CAFC2BCC9;
	Mon, 18 May 2026 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779122681;
	bh=m3Ikqs/u6iw16HVdcS6tQdZmxm4Gckpgsu2UZkrryLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hnb+B7S2mrRrVnxTpFwavDZYcQo+ZA1OPZyLlO4Bpa6hFh5jghWsMhgRFUVVlkW7g
	 A2EsU9A42Y8hoddNVbUjyRrHB/Ed6rNmkKQNeto7AnMHZmOoaAF05mFTpmKjVsKjgb
	 bgpzq/j6tRXVlvMgda1RQ0iMOkE6+OYGsWObpIaymsWH472UwYWRcL3fHX09jW0EKu
	 cFBwPVDK5C7dAj3Yaw+pZWVPjySDN/ip+NSCn3rErFrKFBK1pcn7I8rt/KfbWB8z7G
	 TItf52cNhgK3oaF5pg2e4iQlRseETGquwS3/Epnvg9ralWg8TNKA3jxkjy/1glyuKu
	 CFI//kXd9M+0g==
Date: Mon, 18 May 2026 17:44:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com, francesco.utel@engicam.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 01/15] dt-bindings: arm: stm32: support Engicam
 MicroGEA-STM32MP257-RMM board
Message-ID: <20260518-cranial-egotism-425cda572694@spud>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
 <20260518143150.3138712-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k8rYH4PA6MYcOw7H"
Content-Disposition: inline
In-Reply-To: <20260518143150.3138712-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_094442_048244_22081219 
X-CRM114-Status: UNSURE (   6.72  )
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


--k8rYH4PA6MYcOw7H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--k8rYH4PA6MYcOw7H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagtB9AAKCRB4tDGHoIJi
0i/4AP94lXNNmFYS6tVgFN3LRcZ5Ins4gmmknN0ofz1VRWQEgwEA5D9fYg7lqDmX
1W6kIm5teSCnFwGj0zzwdjMgivR6eQw=
=t30R
-----END PGP SIGNATURE-----

--k8rYH4PA6MYcOw7H--

