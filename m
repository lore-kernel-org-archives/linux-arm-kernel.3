Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45555F4BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGWiPa0dL/ROedM+8XEWJmfaUR8wqXnAsGJgoaTGJb4=; b=IkZ/WiCrvFFTF/NCdvQK3lxZAN
	Qnu1v5g60w5i24pS3w5BDiOffltDF3fX26Z5Ux25NugZmZgAxpABSMX0Fz9poRmMcxR067EgtY8Tu
	aK2chU4bMKZJTJED/E7LQRnwku3fLHibQ1EOnEVGc+EWhJyqOBLmtrCG6rACgAra8rC0msSkr9zok
	jMcdcPXz1J0pP01MrHzAJgjNM12bQT3J5LkaOyE4gAkZZB6s+3IVzorbuXHbbIEVJzCYE/+uIXEKC
	B5WQWfZGZ4pAYrEhA8AcaxQWIYzy8fiOuy4DauqsQhbDc/EWCGKSpHYHnfV1bOA8mQmPk2L0X41eW
	d2a3SdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwhk-00000002ZTD-4BAt;
	Tue, 24 Feb 2026 18:00:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwhe-00000002ZJF-2I9o
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Feb 2026 18:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EGWiPa0dL/ROedM+8XEWJmfaUR8wqXnAsGJgoaTGJb4=; b=Gmw93RiNa3Z0b9YshELl5P8Rl/
	E6i8vvpmAoJZQm1PtpsOdu63F3W84u7WRjbC6gJ/8J0QrYfjmBTPelTjOiXAqPzNBvVnJ7nL4yOGi
	4T1lah2aWtYdTYnRQz93S7hCQx/7I/hQnbphFOc3624PjLyAiu/lBgx5/Waj84lfW2EFZkbKio7qf
	7ASZh0bNBF5lYMJDznRHM+0bt0SktcLKigg0yhl6UfJbszHRLxxYtS+Ekuy6AAdOXX+NFA9tVjRdX
	72aQQROqgn2iJsyxq4XO7IsLhZ8Y2zPjGNq0w6j9JAlq+bLoIESMH0BESpdlGi6RvwGjOFc9T/EOk
	O4BgMRuA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwha-00000007e9c-04xo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 18:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 746A844322;
	Tue, 24 Feb 2026 18:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A95C116D0;
	Tue, 24 Feb 2026 17:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771956004;
	bh=EGWiPa0dL/ROedM+8XEWJmfaUR8wqXnAsGJgoaTGJb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRJ7FRaLz3YSPVrxP0PUdk14LWGnLukQxkfNzBtKnRdhIXJ0OXNEik2VasxoYQfcC
	 ask6MmryF7N+cakziVE3AOaRmKKy/YsuSEveMGfbpMq5r7W82yK/LskvmQKsFNivTv
	 A3/SEgF845nIdokU+2/PjKfIWB4w/0+P7b8r+cg+r1mO526Ig3Gfj6ZgkG4wg5BdOV
	 g0vyWD5n5jNGo4GTdo8NIz3RhZeh6gM1S0ZGfCL0ir5Lp3WogF/oYn5nWIjdlhAuSe
	 mnqj+gHDqQHZBZEVDzBaWfjH3fH01yWjgEOL1WM3uS1O6aqcS5zgPxDqMFFvPv+CKq
	 2Ait/U9+bLdEA==
Date: Tue, 24 Feb 2026 17:59:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH  1/2] dt-bindings: arm: fsl: Add compatible for i.MX8MP
 audio board (version 2)
Message-ID: <20260224-subsystem-subfloor-465db23b2a68@spud>
References: <20260224094527.169215-1-shengjiu.wang@nxp.com>
 <20260224094527.169215-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="srMF4upFs8PZBjXF"
Content-Disposition: inline
In-Reply-To: <20260224094527.169215-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_180006_212947_E73A3E9B 
X-CRM114-Status: UNSURE (   6.62  )
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


--srMF4upFs8PZBjXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--srMF4upFs8PZBjXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3nHQAKCRB4tDGHoIJi
0vBNAP9fAOLwhbcIxU9LOWBFaQGQSQ7k8kV7S6eIpyWquTqYAwEAr9n57ZZR5u9E
B+JD76RY2R8paRJVQ3pHPNLjfqExPQg=
=lKqY
-----END PGP SIGNATURE-----

--srMF4upFs8PZBjXF--

