Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1289CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGgFtg9jVS4GhMzavMNyBt9FDJxaR40jKV4yOVGIV/g=; b=MqLQFVdz5gplvQBzukUxojny5r
	DhbblI+CytEaqfoMLTNmhi/tofHhRHapXqn93ad0M0eqm1ChIRNMqE8yENzM03zzkYvMQ+2KZgWVs
	q8dR8CGyhCm6O2vTSdDVgkn8Lk1h5eOG+5PdP5kGoZV7FqGRuXyt6TaGBx09nj/HbU3VF+Iq7vlIb
	qEbMsyyxD5fAwK/DM296Ke/rrgTLJDdSUaFoh3IWIlJHvpUD/W6hjWiZYqjwFgfwcgIrRvUq40L6S
	7XxPq+TKShWyfB3sqTpbRuScHdn1BXe921ICzgsqxNfJM/VTqBpFs3QgBUBp2oNgq3f0LBGchL4cs
	ORP44Maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmqr-00000009TKi-3her;
	Thu, 25 Jun 2026 16:22:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmqq-00000009TKI-3Fyf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:22:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BC55406DC;
	Thu, 25 Jun 2026 16:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217B41F000E9;
	Thu, 25 Jun 2026 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404572;
	bh=LGgFtg9jVS4GhMzavMNyBt9FDJxaR40jKV4yOVGIV/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nXnV4RWVzF6XZ5HHLjv9UMTwfl/DCoRbm2IWVcLkdXsym2EePqYLW3OnoKIIirsQp
	 PL9mhC1W9rWCWpFCEceq5K4K9OH4EDH3N2DpPO4RhLEyQwGss9CVa7GrgNyJSSWedZ
	 Vi6M8Aal7SMHDKdPrAQD0eAaQ+4nY6kqpwHA1KLXymPIuBjVefwDPXj8ZoKaNzMGWC
	 3qFPCc4ukr8ZgpU06ATN36RaFbX13bQRehkxKLfBGkztjhzz76VoDkxu1y7ih31osl
	 uSUb8k312vLSnvNqhDH2bhgL76Vo1qF8IbppgWnhEzA3IZEk9/ZelzbwEoW2a8pKuz
	 kvKeamNFn8rOA==
Date: Thu, 25 Jun 2026 17:22:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Morrisson <nmorrisson@phytec.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x
 based hardware
Message-ID: <20260625-pliable-dose-38419101d654@spud>
References: <20260625160214.4001298-1-nmorrisson@phytec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ssOFjh6MDidAPni"
Content-Disposition: inline
In-Reply-To: <20260625160214.4001298-1-nmorrisson@phytec.com>
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


--/ssOFjh6MDidAPni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/ssOFjh6MDidAPni
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1V2AAKCRB4tDGHoIJi
0nq3AQCwiV+35/MQQs4CaxZUUDygIeQm11HT36LX1TAy3FQdfwEA8/Ow7EUXLXg7
6AudMx/BQBTw/DifXISY2cDThpX0EQI=
=2GgM
-----END PGP SIGNATURE-----

--/ssOFjh6MDidAPni--

