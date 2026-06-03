Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289BDCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYQCy62/XeJkjWEE4NKpocL+cxTPaphso0jv+Gl4KNM=; b=KfgLbkm1YS8vi7obhDYoTtptoc
	lcj7mx6UhFtL00imft2J0IojyMiQms64Ht7Qd8ZU9QAwFRB53TTUIiQ9G5ni24puOndcPTJiyNnMf
	RXYmlLxrjR4HdoeTlHqTMCdbBJXSEX8aHysOYwNN8lCerN9YQkXZVs5di4GgSiEHPJzK8qHdrkse7
	26urvxt+oFR/L5FeHKtWzSFU+b7+kQEJJ+DrbOVMKNKAL00v5Nn48HSnhla2F0ynmgygmSWqi17Oh
	QoIlK3IByO75rn8OqCDTd8heiwVPgiFM1AkS9EqjFUqr9HPtk82UsIXzMObFvvSQnmBpSIosGfusH
	XNsuxSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnsz-0000000FT6Y-0iQi;
	Wed, 03 Jun 2026 15:52:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnst-0000000FT68-3720;
	Wed, 03 Jun 2026 15:52:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E7BC60126;
	Wed,  3 Jun 2026 15:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D931F00893;
	Wed,  3 Jun 2026 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780501918;
	bh=UYQCy62/XeJkjWEE4NKpocL+cxTPaphso0jv+Gl4KNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aO2DyS6qeNl6/06jRhz8Wq2s1LSS+9qyKwJqenZxXwgnc4l3YA+XYr33pEd7YyPcS
	 BjbHLYhf2TuAmNdeVWob7jx+YDinP1ZYZhHupOM+sqvN8r9ogtoBkY11hKkvQ19la0
	 Fh0icfuoU+c2H507oQt91EYpQIq1nmRsAk+dVu+bDTHNrAWVYFdx3zlEqj0rWH30nF
	 i4aKIXRaUa92Y83AVJOrWlG8I0cTSHCnaOFAB/LKoPtUwwl/8IahxXT+ZvIr2iIRKi
	 49Q20KJikmvmNzvzL7ffj8YdFXVc+qB9zqthuESLYkm9L/8GaLSNwj93y9biUmqnBI
	 xaxP2CfWWYggA==
Date: Wed, 3 Jun 2026 16:51:53 +0100
From: Conor Dooley <conor@kernel.org>
To: jian.hu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add Amlogic A9 AO clock
 controller
Message-ID: <20260603-battle-cofounder-e61dbe47d738@spud>
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
 <20260603-a9_aoclk-v2-1-f47ea616ee78@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KH2UgLPfdPMIqcoS"
Content-Disposition: inline
In-Reply-To: <20260603-a9_aoclk-v2-1-f47ea616ee78@amlogic.com>
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


--KH2UgLPfdPMIqcoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KH2UgLPfdPMIqcoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBNmQAKCRB4tDGHoIJi
0rzTAP96xbvAsmSRrQkjabFTx14yBLGyTdPq6O1/rx3e3lLp2QD+Ju+r2qcHP4mh
0EqjKT+MOMru1z0FBEQj1fzd8pDrIAs=
=ozLc
-----END PGP SIGNATURE-----

--KH2UgLPfdPMIqcoS--

