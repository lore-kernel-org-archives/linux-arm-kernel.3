Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4D5D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9aXapsZuaqPnOXzfdDhI/RnimcdxYeMxnTT1TJaOFQ=; b=GRDfj0QrAPFxhTtHYfpb4fcrDR
	r2U2TcLHKBiXK4BwgtRnS7vqTdQ1er/6rHaJ1xkV5JBNkilYrEwkQIChP+cTAxetMIw8Ggwy2zlaF
	yXTi+sYaVedmcHwGfXgOIWL74LpDixM8YeO6Pu84T5HieeuylKS9PCNvDxudm5L/61jTa3eCY1wi/
	HCNuB+XwhPoUdodmTTk93CImtU84xmMRHmuzFX1JyOTmemvaHhY3k21j19JFrULMzWEmMTsJEv7k3
	iMFeHrtFsZvgQRq5VvvDZZ3juY/ifufJIkOzHmwm7bLpjYeIo4Yc+t4yD5mef9q52m6i2mv6u5Kb2
	GpLPEmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb7W-00000001Cyz-3Xmj;
	Mon, 11 Nov 2024 20:34:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb4T-00000001CVy-1vXP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 746835C5C90;
	Mon, 11 Nov 2024 20:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD95FC4CECF;
	Mon, 11 Nov 2024 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357096;
	bh=x9aXapsZuaqPnOXzfdDhI/RnimcdxYeMxnTT1TJaOFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMWfXXUNORLhTI3cTOwE0A1ETqw8UqTMRqqc7Wc0Bkt653CuvRspCpYP7fc0Y36y6
	 U8WaealJUt2xHAtYBFe7eZDTV2jeYuHZvELjZas9GEzTFAMZhY9ZpEU3HteYQzDCsg
	 hYkUkXN0ydmkAUTk1BViQWHmDzMi0rPfRobRsB3dHgb7YKio9ls4wiN0KhCYPcdwPc
	 gFbE+AQGN/10ogmpEeLNejEXBa7K/y8IBOngyxuU+EeHnU+Xpd9ab7w+ZHA5lPMj/f
	 FbuMeh0dsk0ekGZ+MaZwgfb3g4QYNHQaOSW+3UWVMRt/nPXwsWmMdWphKd8IscJCLU
	 khb2nGadcHbcQ==
Date: Mon, 11 Nov 2024 20:31:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Icenowy Zheng <uwu@icenowy.me>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: clk: sunxi-ng: add compatible for the
 A523 CCU
Message-ID: <20241111-deepness-escapable-0a3bac2b3505@spud>
References: <20241111004722.10130-1-andre.przywara@arm.com>
 <20241111004722.10130-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Asf0m3qumdcixdxJ"
Content-Disposition: inline
In-Reply-To: <20241111004722.10130-5-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123137_558194_107D2F57 
X-CRM114-Status: GOOD (  11.60  )
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


--Asf0m3qumdcixdxJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 12:47:19AM +0000, Andre Przywara wrote:
> The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
> the main CCU.
>=20
> Add the new compatible string, along with the required input clock
> lists.
> Also add the DT binding headers, listing all the clocks with their ID
> numbers.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Asf0m3qumdcixdxJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJpowAKCRB4tDGHoIJi
0tv9AP4nwUN0sO11WBtf8cOH5uXB5Pv2Hk5WrGcCfONvtDz1IgD9EYWzRej9LYZ/
B8R9KRR9KHpIv6Sm0pXaJ7C7pqYOSAA=
=4MSE
-----END PGP SIGNATURE-----

--Asf0m3qumdcixdxJ--

