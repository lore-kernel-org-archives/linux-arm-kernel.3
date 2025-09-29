Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B41CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soLluZgeSmqgsmOBHJcCPda1vU0ZJi0dJXO96pm9yUQ=; b=4wah6cOrhj65desVzKek40HXhp
	tBfyy3E/H+VoBtIPFd+wcWlTuqEGjiXTiv0FqBpa/0DMem+z7+FwH+3XmrO54JuHEsNKH7wqluGjc
	6mIODwOq2p0/Zw3RfAeYBGrS6l2kcYa9Eoj/WpDzPVBx/oKD3Syfv9JVA8avXLHA2fantRwF5hK5R
	NMAFlOyVq2563wmc43ZJDH6OeTIT26+noce4I1Ee3YUXSPHY2QcllUaH/JpExeJA2vlMnoJKDWKnv
	g0XyQURpMqLnYDI6X7XdAHFhUOq2t3VCKbcQ1j3fYVMYQJSfSN443D2ZBx1SBdiCely1+1axrSRke
	KixtpYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3I06-00000003BXb-2TRB;
	Mon, 29 Sep 2025 17:49:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3I03-00000003BWf-3qPy;
	Mon, 29 Sep 2025 17:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EC054050D;
	Mon, 29 Sep 2025 17:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AF0C4CEF4;
	Mon, 29 Sep 2025 17:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759168163;
	bh=soLluZgeSmqgsmOBHJcCPda1vU0ZJi0dJXO96pm9yUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViAKnlkzzXET5wwfMyvm1xC0DmknH7EfkpmjRb92WixqJFyGvCn2z+WMV9Fyc6kUc
	 H7OgHGIJoSxQ6sp63SxWJUQ+d3uW7xsuXRSMPo1zlTvcJP8YBZ8ZNi0iScJG+oKz9K
	 JowbAnDH6kijVEakdb1PhYFroGKY/haao1MB9R5iz6H5lhnJMKjNj8ZPSnwXkLls5a
	 h5U/LKY5Bz11JiJjmSAJ0+2GAEZ/wb5FXdvkv745DMqMm/Iq0P0Sg218nOboa4jabs
	 +OuKHWOKQg/6mIU6oDd6uXfWLNdt9i+evAa35I1fbX1COi4jBu4GhtI0zOHG8Rq88E
	 sLXKhjX0DomIg==
Date: Mon, 29 Sep 2025 18:49:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Tanix TX9
 Pro
Message-ID: <20250929-geometric-massive-7ebe6c6c7c15@spud>
References: <20250927125006.824293-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jdhi7zx2CJL1nOyr"
Content-Disposition: inline
In-Reply-To: <20250927125006.824293-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104923_971917_0C9BAED9 
X-CRM114-Status: UNSURE (   6.89  )
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


--jdhi7zx2CJL1nOyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jdhi7zx2CJL1nOyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNrGngAKCRB4tDGHoIJi
0lVDAQCj0EH8sKppN9fcZi8CL0ZzlYbuvLG5lN9ZfMsnhBU5fgD+PywrSMAcHnqO
7xsSNakZ8ZVUV/XWH+AOuRzZicayCg0=
=p03h
-----END PGP SIGNATURE-----

--jdhi7zx2CJL1nOyr--

