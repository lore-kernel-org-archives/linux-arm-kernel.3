Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F2ECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB/xcDstYUVPnTa87uG6SAP6OEUqB+fH/Eywg/NIyxs=; b=SP1bjNINa74Fx7qY7/F04vVVCR
	vr+vrIWS/rU44jDOyfTBzM/INAkqApF1uSILzvVIK+SZo3nDq0H0RXMSNcVNP5Zztz/x67CCc6TGY
	TIF4n8EwsMFnTy0BE4d2XbVbM9cR0rAw/zGPkDXiVOonOVrEDr1lQ0ebEDnG6BzsGFzfLv8942fk+
	FEhdtg2/wmafwT0Ru/P+JuStXfXlStWX1m0JH3MHQusQRsHu0Qp3R9oPBDlG6ZE2B9yVq0TEltz41
	3qVCsQWu4CjfRlqZMVmnnmlxpcNNCl/nvuEsLHBwnqy8DDWELiuau1CiDZhrl2/4463CfJrKMqguN
	lgmy9MOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQU3-000000086GL-0FkP;
	Wed, 24 Jun 2026 16:29:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQU1-000000086GA-3LD9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 16:29:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 586E460018;
	Wed, 24 Jun 2026 16:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BCF1F000E9;
	Wed, 24 Jun 2026 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782318588;
	bh=nB/xcDstYUVPnTa87uG6SAP6OEUqB+fH/Eywg/NIyxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ClMhLgvGviUAT4lTmqBBg5rMovWEhMvRTKDlxuTVmxfsWg9kK4KOko4t1/hlcrHrq
	 Aoh/QxnzxJO/y5tOgkcgdjXKg0ellnq1CQ4B21wyjWk17VESPdXd8jATAN6PO3I8ld
	 rkKibTIA9J5BsbAFgXl8K/1ORDvAZBgQ51TvpfvQ1qLq6DWVlG3Usiuk1UGRXTXv8Z
	 Ypqa7iN5mM/LoAzOADt3lllBzBLrqgRpktn8cEAMnwn4tMlGh3YdZx+fJ9Mi10TNVH
	 2LjvmOi2XQaTjKsHsKUg9MTemdV27oGTFvQLzsypvPaTHw9H0MjIsmRdMsIFIh7XI0
	 EQeBRFhKmCZ/w==
Date: Wed, 24 Jun 2026 17:29:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: ast2700: add PECI clock
Message-ID: <20260624-disk-lingo-1d9fac0de659@spud>
References: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
 <20260624-peci_clk-v1-1-ee28b92e22e9@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y2hWsGqtxlYAd0y4"
Content-Disposition: inline
In-Reply-To: <20260624-peci_clk-v1-1-ee28b92e22e9@aspeedtech.com>
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


--Y2hWsGqtxlYAd0y4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Y2hWsGqtxlYAd0y4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwF9AAKCRB4tDGHoIJi
0ilsAP96KMQ9XSh+uOlgb/NYGm4S9RbQOnUkbS1MHqeOnixC7wEA9hgVf0iPIwO4
vNCYTElGLjB+Jf2SMaWGJxn1GP0RKgk=
=L3x/
-----END PGP SIGNATURE-----

--Y2hWsGqtxlYAd0y4--

