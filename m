Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84105E9D41E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQogdaDUzetebzTwdzsS/Q7RYSuHAuztkU9A7BbLk+c=; b=XomU9rDPhQw6IdHEqcHvdSM6rr
	QYkEgObTcnhOeH9gLyzv2i/zNHOr21jaDR7CJEi9MfUO83o2XN22g5ypVDQ5FF2Wz+wYkiMHszty2
	7N6kHBX1rdDrC3ezOHpB/8sropW8GBb51gIBEqDRi/tVddHoCW8A5FDDydrsqToaWbFSyDf0vtD4g
	uZgfo6tcYIzlvcaIoj+agOfqmHayMmTmkkUB1vw9AKOZ0jVpRS4i5AC66UUuShqied83JJ4+xWpvM
	LwtkpxuIxD8YTE3eBOS+bH8PxzKPzccWmuxGtq5KRAvryRFlZQ1OyXygHZF81TT/FFc0FZ9hyFoXj
	kbDaMR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnh4r-00000008tQh-37sa;
	Wed, 04 Feb 2026 17:54:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnh4p-00000008tQN-32kK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 17:54:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19E64400CE;
	Wed,  4 Feb 2026 17:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CD3C4CEF7;
	Wed,  4 Feb 2026 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770227647;
	bh=sQogdaDUzetebzTwdzsS/Q7RYSuHAuztkU9A7BbLk+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ0k48vv2IgFLxtuT65uX9ijW12Y2jXDmJFzcBSJB5hawAv9VigDH0uwYdMr/q0D+
	 Rxzpmm5oitF9JlA8XiuZ6sr7jHMRD/manMPvl7YvK0J3PXx6fgAZlC31inliBq4M6b
	 +p7puWl+DeJGXfQ+Y8eZtbBHfTHXUdV93PFKUrt+B+/eKE46S7L0jv7JLudPeZwyka
	 w4KRyAz6bITzqKq5iWXVcG8StZHuxraSf+j6n/sHY6+VEqK8fyj8z0+jY4AZ3ULA8j
	 Y4O0Wm3mB0ug+W8uZRMZOEC3baFQM6fBh8XCADWOvKELHpHwuvXQfuXR/H8TFZPGcx
	 mk+DUlW0V50Uw==
Date: Wed, 4 Feb 2026 17:54:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Oskar Senft <osk@google.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: aspeed: add
 aspeed,ast2700nx-uart-routing compatible
Message-ID: <20260204-phoney-crumpet-91d785f26c21@spud>
References: <20260203-upstream_uart_routing-v1-0-6bd5dd75ee3b@aspeedtech.com>
 <20260203-upstream_uart_routing-v1-1-6bd5dd75ee3b@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L66zuJgLCEhFZBMR"
Content-Disposition: inline
In-Reply-To: <20260203-upstream_uart_routing-v1-1-6bd5dd75ee3b@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_095407_782159_413DC9FB 
X-CRM114-Status: UNSURE (   6.63  )
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


--L66zuJgLCEhFZBMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--L66zuJgLCEhFZBMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOHugAKCRB4tDGHoIJi
0itwAQDNp1MbH2s996w7U+f1cW0+YUARaHJuZVp/WSPyp3dhwgD+PPbN/qeb+n17
ih+JZMAMozojeZOcXtH1br8U27pCMw4=
=MGNm
-----END PGP SIGNATURE-----

--L66zuJgLCEhFZBMR--

