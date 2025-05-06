Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E476EC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 20:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TpsnbtzUqhHhEckDsvf/oiePK3hr7sfkAKrcv1xXBA=; b=VEKUOFBQ47jJ6oq/9paaAw/Ook
	WUniXDFrBIH2gWZnOqj2S1dJjs20jdHMYNXat+ajTjdZD3dzgQQYzKCVTQVpMVwiFaqQmS23SA1R9
	NLlRZ+3ifsvF2g7T+H0piwwiFBYcK4Br/Dp0XNu4JxgU6WGoKSkbzWd5kDAnyf+qvseh8Cfuz246m
	QxP3s8Tl9OkN/pVakN8/Z1vIY5/IN9tLUTUCoDOL9LrNFS6jZWQOOZXF8h3ovx+i7xwIiUDzhetIa
	HzQ4JC3jVIzprhqcZVf7xLbEmXTi6jMBHpZhzOk0gbssyk90MkIKDlnoRgcoX3w1+FvP0uKz0ldUg
	ecGmYZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOj2-0000000DM1j-16L4;
	Tue, 06 May 2025 20:17:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLAO-0000000CfyB-4AWP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44600A4D6B5;
	Tue,  6 May 2025 16:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A813C4CEE4;
	Tue,  6 May 2025 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548951;
	bh=kOucaCiTOjCuwEDYRf4xSI+oTb3XR4SieOgn6ttIfaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oq2LlI2P1lJQ/oyTKrRnxPw7EO9BiOf+OVuYZ3G451tnU26eZ0c+4XvvzNaTI8TVP
	 iAUD+c5GLRTD/oj9Y53Pxyf0lnqRNijMMDncNs/iu8KopcJamreqtaD9YZN5ju/6rd
	 Q8OVymac1ixkcsZNpLy3CWfEtTx+6U2omV+Q9jU18T3sYgDp78jfj2MAf/8kLDCyYO
	 6ETStIDRBR00iFJ/Brt5WAEw3IyB2Hc4GJ/HTZpJ2+wZzXsuguw/eDaKguJpZWzpqp
	 re/s0R/shqflOfoKJmYzXV5xCjBjuoXReIXPf/L3/YpSDf/aewjwAeKHpVcnef1B5Q
	 V60LKme8+mWaw==
Date: Tue, 6 May 2025 17:29:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: convert bcm2835-aux-clock to yaml
Message-ID: <20250506-recycler-sugar-2b0f34d60361@spud>
References: <20250503080949.3945-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BYm1tPIPDcX1NmBu"
Content-Disposition: inline
In-Reply-To: <20250503080949.3945-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_092913_094115_4D478DE3 
X-CRM114-Status: UNSURE (   8.47  )
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


--BYm1tPIPDcX1NmBu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 03, 2025 at 10:09:49AM +0200, Stefan Wahren wrote:

> +    aux: clock@7e215000 {

Drop the "aux" label if you respin for some reason.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--BYm1tPIPDcX1NmBu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo40wAKCRB4tDGHoIJi
0szWAQCpZXN5ujtc5qNCr1gNAxdHwpTCCoxoCXi85BN1ByM1GgEA/fkQNS08jLp2
XxAoeX9oIf4UJM+aYeyiZPqBk73MwAs=
=9nwV
-----END PGP SIGNATURE-----

--BYm1tPIPDcX1NmBu--

