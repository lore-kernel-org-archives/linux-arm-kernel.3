Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF5DC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwoehGGBAhR0cagkpPRWd/9sXoKfT5de8DDZI2psrzc=; b=L5sWtBS+7h47+NHdyk6zEmyM2D
	aFETeeRJIK3Lk1cT+w+/g186wbfhBX3TWqd0/TT0TavoZEHyP91gco79etRQxzZ0p2umds0PwgbbV
	kR9kzZDQb1/vitK5RdZkoTDPyHKWtrpIYArq3fQ3OFYLILzuLwmPTUE2Wlf35rMgmwnEsX5CVLWX0
	55/PuMu5nmXBjFrdzKTS1JXv0Z0OyvAr4Bk3LVVC7PubMww7IJOqlRSn9OtlUr83D+CLJOqbxCD36
	3xUSyNRw218Xwa7Y70SAvZGew79AdZrJzluk5ZLQTfW8R6MIZocgQeV6pi7k+f7nsdHXvctGoPzcn
	QEneZIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzys4-000000068LC-1UtX;
	Fri, 28 Aug 2026 15:52:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzys3-000000068L5-0rQv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:51:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A2837410CB;
	Fri, 28 Aug 2026 15:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB071F000E9;
	Fri, 28 Aug 2026 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932318;
	bh=rwoehGGBAhR0cagkpPRWd/9sXoKfT5de8DDZI2psrzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYOIB0VVHL879W4CZ+t6ZiPdxa00oVDK6k1Qp4kHhNNKKL3LOKMko+hY4KCBSxURn
	 GZRgjEdMfKk1K+J6u724ez/Ln24vGwRSI+dAbPcc523LlAMB4VJQEX3vFXSAmwdQV1
	 QzITqOV6jBFZx9CN6LYI+VPeY3Kk3Ovbx6MZ/Q3kCbkN7QD4rMPEl3jB9yFjPDn4pj
	 kETgi2Pmf3Tqhi3zLcBmAUcC3EsfVjMQ5fBUbb62R9Unqg5aguJvtl4nhdzJFquhvi
	 +8dgkia09fTEjt5TJbJUCc0MICC75IjL5ql0TxTKxhPGIc8R7grrLye5oxpzWpmC9Y
	 1HMod6uyozqkA==
Date: Fri, 28 Aug 2026 16:51:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: generic-ehci: Document ST
 STM32MP1 SoC compatibles
Message-ID: <20260828-frisk-mantra-08f44931ffd2@spud>
References: <20260828152130.176171-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SCyc/uFZ5vKiW8zS"
Content-Disposition: inline
In-Reply-To: <20260828152130.176171-1-marex@nabladev.com>
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

--SCyc/uFZ5vKiW8zS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SCyc/uFZ5vKiW8zS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapGumQAKCRB4tDGHoIJi
0h6ZAQDgyIwsLmoo0BKJh3n9Hrqwx3SjWARrWkEMMmEeISZDuQEA9dj8KZ2AT0Ui
O68HKHtNqAQW+EMjpxySCU5lMLFcmAo=
=m18u
-----END PGP SIGNATURE-----

--SCyc/uFZ5vKiW8zS--

