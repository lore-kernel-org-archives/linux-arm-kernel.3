Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5328DC5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94H9tymTg5gcpmuYwg9C8lCQ86GSwM9hgbuVfliQ3dU=; b=BIsaCzv78S/Ys8c2nY8BoHwmgO
	q0M9yp84BULxpb2Q5LG829ikeR/NakkWvF+6aCLWAM6Z/AM7L8vlVBROb0qcXaCADDs6nykR1SRhK
	t8gIEmhge87ZkONQ1/deIqMuI0CWh/2JRxttr6VoQeV7JamEGrTXIk+kuOat8gTytXUtCfn8fTkNJ
	5Dq0CvWPdPgPPC+1rYEui7ac3BBHwHizKc+0Fchb+uE3HhePckEzhoIyT3LswiyUDAjYvTbYwfxIi
	KMqA+WcsnE+EzvohGQyOqsffv8nZmViPb1Wj+OdiDV/lM6GbjGNV0D04BtMeux5EM4oBEBbTiR62d
	CYdJmn8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXWA-0000000H2uK-3Vj0;
	Mon, 24 Aug 2026 16:27:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXW9-0000000H2u7-1ON1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:27:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AB774147B;
	Mon, 24 Aug 2026 16:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9261F000E9;
	Mon, 24 Aug 2026 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787588844;
	bh=94H9tymTg5gcpmuYwg9C8lCQ86GSwM9hgbuVfliQ3dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cxzB5YjICwcf9RcSo0IvxjTr804ZVvgW2TWn2YUARU7mOGM9m2dGdL+sawOE9IES+
	 hcBWTg59UEprG2J5robkoksweAu/DMfKs4OhhUvCbVZctQ4/BiC2E1L+H/EPJLLEhH
	 Tz8Vd20ZHxQCL1W5KyPbb21VBK/ingVMj+iA2h1Urbp1el3bJQ3947naZW2hgGFCBV
	 zDQwEM5lfO/7k7YMhNyVP9YrxUFMhDa14YSuGIrkbf+uYmQdP9Iocw8kHrmV7SQOpR
	 6IIpyLsHn6/phZhalfFjk5tgxokvyLJaq2/YhEcuk+FzKXpcYt5d0vW1JudCGmTaAo
	 EABmHI+2IsBqA==
Date: Mon, 24 Aug 2026 17:27:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH 1/4] dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x
 compatible
Message-ID: <20260824-tinsel-dispatch-0cc0edc2b485@spud>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g59KPdrPfRxeZu0n"
Content-Disposition: inline
In-Reply-To: <20260824110432.1074136-1-robert.marko@sartura.hr>
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

--g59KPdrPfRxeZu0n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--g59KPdrPfRxeZu0n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxw5wAKCRB4tDGHoIJi
0qytAP91iDGkB1qoLcibGVhYFFkbYTRY/CmBSda0ePK4DRgIrgD/S43wGpmVXIxk
/6e/Ns192dNJz0y/Cmk39FjaYxm4TAU=
=0m64
-----END PGP SIGNATURE-----

--g59KPdrPfRxeZu0n--

