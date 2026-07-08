Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFss4/S/yICf8SJT5ZkocKJZ9yfXRXHEIAWnYp4S8eo=; b=uhtBBuK8fgNip34rW3ZPSEUlSn
	IZmTlepOi8a5ofiaYTQepCzkHHGkFPq/Ggz9NBu7q/wOLvDrLcsXKgizfy2skCHEGarm7xS4miADd
	u72MUGr55vlm2DgtMYpz9U7hmVXh5U3wQbzqnOFuqh6wpFauRIEb2vWVPSi0WVk0ZmRTQdLXh3EaY
	Q3yLYPrx5R4LVdgzRaZQNn6h6xzhx+WF0P1EabNfrXIL6lnqMOss8nW8er2t3Ns1nZuAH+lHlKQPg
	WrJkX6uRHsYOLIbnMVBrf5PZ5bRHG7yEZrMUnjeCZwQy1lPdT8hNehhiUkZxTP3umABCcPz4f/j4r
	5z7b/Tag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVC1-0000000Hb0W-0O6X;
	Wed, 08 Jul 2026 16:32:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVBy-0000000Hb0O-46A3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:32:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B7B56001A;
	Wed,  8 Jul 2026 16:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8DE1F000E9;
	Wed,  8 Jul 2026 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783528329;
	bh=zFss4/S/yICf8SJT5ZkocKJZ9yfXRXHEIAWnYp4S8eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAP8EYUweI8vZ2h5UcuFPR8loWnsmjyNJ4N61SKwTa9UMG2G9e4qzXcDgkXuFtiU1
	 8Q5JChIk4/07ORmx6DnL8cpQtfVdK9g4qftdyyC17KFBqnzzz+bIkNm+T+nPtJ9hmp
	 6tST/6SipTtE5Qef5JsvDUF6ZVRsClYuSsaQTl/kMY3xIBUPxAVtblUa6ljSJaWFOp
	 62piQNPCiV/pyvCPwLEV0h69TRPMt4FMEQ4chFhuC9Tm+mk539em3g5BvzkWhxgQAa
	 lL0GvaArFiACjM6FtVxCn1N97Pi69ebrZ+X/VKznN0KrD/obxDdH29Hl1rXTFRE7fN
	 RHWdwuO02IEwA==
Date: Wed, 8 Jul 2026 17:32:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
Message-ID: <20260708-sloppily-await-9056ac43f82f@spud>
References: <cover.1783505142.git.geert+renesas@glider.be>
 <1d79020a5eb2f269ea7ebb354cdfdf880049721c.1783505142.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9S5YLxV5XE/gLITr"
Content-Disposition: inline
In-Reply-To: <1d79020a5eb2f269ea7ebb354cdfdf880049721c.1783505142.git.geert+renesas@glider.be>
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

--9S5YLxV5XE/gLITr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9S5YLxV5XE/gLITr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak57hAAKCRB4tDGHoIJi
0q79AQCJny6b8ULtU4s5HEzRTQXsdH21tOGDifiLLTrYxwzSOAEAjIk+aGMPyEn1
V/vEagzuhyvClTV9b5nPCGrzfvLaBAU=
=oD0t
-----END PGP SIGNATURE-----

--9S5YLxV5XE/gLITr--

