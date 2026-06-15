Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BD7CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJsguvxNi5fQr9YCT2BoG4xKCVnOtut1mmKgRM8TWRc=; b=FNEMmK07P1rNtw/UrKXJGAiwkh
	qPirUMN/s+a/9DnMOfGViRjTMJX+803PuPfrDkT+C61z1q1bVCGlBCMbN+Is5NMqBB3rpHe9A2Gog
	rSSuFLej1FZbiDutWYNdczbqJZgbusMnbS7DK/wJb8XYYkGvQpVokuFVaTKdxszPtcPpIm6Wi+Sv2
	Yt6T/ExUdGAfVC5NAODqpH3Q+m6WKFB5UHXtpKs5C0THcNkLFBjApIphGWwaa4v1TOFCmPsEoRiT3
	0tN5glTjw48+PCsZXuWR3CDkjP9GB2bFSI3soOLKJFU5G+Xi6GUDalR3ui21jqg3rolaojwcjxSvK
	JYGGFeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAOG-0000000Eah0-27cu;
	Mon, 15 Jun 2026 16:42:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAOE-0000000Eagp-3nx6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:42:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20B976008A;
	Mon, 15 Jun 2026 16:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D8B1F000E9;
	Mon, 15 Jun 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541741;
	bh=VJsguvxNi5fQr9YCT2BoG4xKCVnOtut1mmKgRM8TWRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aj5viKEJWFiPMoF/bF+oFQVm5EAqw6YLo3AZo3FCULsVcp4sMvAatlXFYBvciIuT8
	 4/k0f12BsEUGiCJnmswWCKGFa3v3aYAce60l6P+cejRkjE+EW7nhdrIQROpJnKZ+e0
	 rrPQ1X0xDFaszZWfYlExTwOmuRBWS8G7AwwdANbrFLz1YDPNlJ85uVUyVaBy68n8Te
	 THONvNaS6x7RMnpwRAktXbhENphosFJNcm+Un9H810s/KkhYp6zKMT1C0T99DWLmt+
	 ugByPYW/V8DyqxzOtNjHGrODQ3DUcYiyuoBNy9UHuWQma3iY4sf9IcYhzU6AnjBHyi
	 dqSFsl/sTnAkg==
Date: Mon, 15 Jun 2026 17:42:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: clock: clocking-wizard: Make s_axi_aclk
 optional for static-config
Message-ID: <20260615-squid-showy-435c9cf780a0@spud>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
 <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eTLpNP9HuW1rO1hW"
Content-Disposition: inline
In-Reply-To: <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>
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


--eTLpNP9HuW1rO1hW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eTLpNP9HuW1rO1hW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAraQAKCRB4tDGHoIJi
0nEOAP9wX1ySQ59Bw3YpTYQp7fbRjsjjztw9F71sBS4cWb/xsQD9HnOFFh9aDO9u
mIngdQmFlwsmGnd6D/IaxOrzKdaquwU=
=gIdg
-----END PGP SIGNATURE-----

--eTLpNP9HuW1rO1hW--

