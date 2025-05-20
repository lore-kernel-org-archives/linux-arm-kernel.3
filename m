Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F431C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXChCrg4zi2mP8HmApa3lb9G//24MDn098/SJ1kJta8=; b=4Mn5QC0ogzV4qDTnIQHdESn9Io
	dBR/7umIHuLGTmj3G1vPyto2lkP/AMAqFPOVxQEmaM47QQLoL9EG7ac85i8Ifbe6UKWPIshVhQFqa
	CXfFWogmUcp4JUcWSOtLPXsGJ1VBEVefBUlMYbWtQ1oOmmiGmE34QX6lfLxAqz+Z1rMWp7bVCSAXF
	cugohHSLlRgaqZeUQPR20Q2kWDp6NQ7qdyh68GyLHo9AwSV9gmI8t2fDHPZqFElH+YcIld2xEH0sX
	fbIPrG9hgOcC19+4j/vXEquL7anAepHmVDa3A7HlWoVmWmA4UXEhdzVm52QaAkLqFHbR20EllnLlx
	uxjmRPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQ1g-0000000DZOe-260i;
	Tue, 20 May 2025 16:41:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPKT-0000000DQAw-3ej9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9136D442D7;
	Tue, 20 May 2025 15:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD3AC4CEE9;
	Tue, 20 May 2025 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756593;
	bh=n1pxIM65d8MoHw115XP1NVDZAKKeEk/k6mze3yHO8s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7XBpT+epQQjXsP8yAqN2XraGSgMh8piR5ajbSpVPDUaH4r+x5+81+SVQq34FXmTz
	 AbuW/jbx1xIcfy+2hw+gF3aWO1+lojCd/9Pg5qx4jMWLYXwPrs7mnOLTie8cmN0Z4u
	 jE6FqXRZOjuV2gQcwkuZghvDXum/x0IbticiC4VExuxfZjdDd2kZmiXHMIpZd01P4T
	 VhiHsuXI1TW4trYh99AJ5yx27EJyCESSPhDxclDQQs7LFER5PyBQRlPMd3R3aHaTaN
	 kBu5EZNwKHLlrw/eAwAZ4/3365c/87QtuEw/prjx1v9unenMntbKknWXn8GK+EBSUf
	 ags6MohDMZPGA==
Date: Tue, 20 May 2025 16:56:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: stm32: add STM32MP21 clocks and
 reset bindings
Message-ID: <20250520-absence-sixtyfold-0fd9bb03a42d@spud>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jx9VuttWMZGkwh2m"
Content-Disposition: inline
In-Reply-To: <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_085633_929164_4920C410 
X-CRM114-Status: GOOD (  11.23  )
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


--jx9VuttWMZGkwh2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 20, 2025 at 05:28:37PM +0200, Gabriel Fernandez wrote:
> +
> +  access-controllers:
> +    description: phandle to the rifsc device to check access right.
> +    items:
> +      - description: phandle to access controller
> +
> +    minItems: 1
> +    maxItems: 1

That's just maxItems: 1, the minItems is redundant.


> +    rcc: clock-controller@44200000 {

Remove the label, there's no user.

--jx9VuttWMZGkwh2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCymLAAKCRB4tDGHoIJi
0kaJAP4grAh/GT4IdIk9FDbZ3XvjNvZh5my/Az0+lUyaEjrXHwD8CskVJGC8F6if
ly0yvkmRUH6dHXpa2Y3SE/anCpfV+QQ=
=C2Ym
-----END PGP SIGNATURE-----

--jx9VuttWMZGkwh2m--

