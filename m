Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BD8606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OgwvUuk2;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=MdjfW2j/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ugyFSCnTfsLdf9m20uVYRw6UIGWGn+LdXLFTD8Rhr/s=; b=OgwvUuk2qefhsD1XhrBIojfcVu
	9sW5M6HHSD9UofHBVqU4I7aYsBP1PQmsTVpzUaEHaqsQ2mpyMkZ/Jwm/hrEE22zXY19TUA9+2BBpM
	L3121XWuEGEF0l+F4I9wgHzST7n0PCXk3MBSRXwT5CrBHCSqdR/CG3GyjaV1MW3ZRhW0v8OVM3Hk6
	BfLs9t4r90obX1nhaYme1oskLyiHTTQEI2jpMMyVRVAUanJ+JFf6sS7qQ1JGdCU+z32nNNaBTjlqA
	bFcyUY03ryI+Tc0LO8K145S5R0bXhgMA3jbgxmPbrzCD8Uwsgm0soH8bGc41vPlzvyyqpntevVHNW
	SYOCiZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpyH-0000000Dvd8-0CAt;
	Thu, 22 Oct 2026 10:24:29 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpyC-0000000DvcO-3kZK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 10:24:27 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 014142004FF;
	Thu, 22 Oct 2026 12:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792664663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugyFSCnTfsLdf9m20uVYRw6UIGWGn+LdXLFTD8Rhr/s=;
	b=MdjfW2j/k2QDPsZOIHy7PZt5Z2El+wcq2JctgMX74K8hRrhLGybZQrXu3CWicg97R2KP2D
	Ret1yLcSM3lfSjgcNOl/43Jg3TtiJlCUD5tgCP+gv/bocMeYbsUMt/niP2fXy0PGtAjoaz
	tp/HNvckDbBnkJAl+5stHagl+SI9nIntwRgaMhq1kuHrZMY5CYdqWqlwf00dGe8IYqT2xl
	WbGOmj8j3k71dUrFwjS5crsdfXMZtrJ+WoBjIHwhc/+sRJjJx1ebHt2ZbkrGo3sK690aTP
	W9kdkWYztNp2vhDec1ej6sgcurYNiC0yZ06Mp6GnF7gDli6QPdG7P2XKcN0B1Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792664663; a=rsa-sha256;
	cv=none;
	b=edtDA8hUpIe7+mU0hva+zNJQGy6IEOqpNBTRFhWhKoUnjvFzJtFxXZRFh2S99ONFJUZnPu
	Ne8xVqy21RdhXv5Hlige/XMqWFzrOlDDRgakCDeMYCSht9FA1YGr9s0eTnZvoS4zIHpvkx
	OWBWZsdzoECmGCI5NJ76c5SbbrieVMkRmHwPLsy3LSjZlon8RAkMDUHwj39cjLQubV6awE
	M3i0+KmcgNDZ4Bljnlr9XonivOr8CIsNBdbP2nz3cV4a0/J6r+VdnBLLIA6bf9xbhp9YyH
	0/R+aqMNB4SgpEADu3aoE+1rxj+Ujk/F+gTOxYFoA/8G84iXgng+uIs3Ikh3ag==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792664663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugyFSCnTfsLdf9m20uVYRw6UIGWGn+LdXLFTD8Rhr/s=;
	b=O44rc3MUCLXCMepH7FcLNVL4aje3eL/Kxcj8GCWeBb3Pk04DyoUO0DAGrvp3a4QHMtBQuH
	oM3Fi99p1dzV515dvFcH4D85lMfCqJUqjzHPawSQBdDt47otWiFMxoxOX8vNKCOtSApJnN
	QxqEC0QPB55vp5ECREbj5a9u1uHOlKX34o0vNsW3AzIXHylfDaGfvXbZwsZ2y3BP0M98QM
	jkegbpg6wVp8KDVMPLvo87Hv0s7WuQv9pXRy4e31lbew19ZQbN8C7t2U6AjT0z6TAqGiZi
	wxkV4NPED5YymbXEAGOngJ9UdQR7nc5fyzmuhQHyb4kgeFhPX/r8TL5kAzMh2Q==
Message-ID: <2e28581115962ef23af4834ff274ee11de172344.camel@pengutronix.de>
Subject: Re: [PATCH v4 4/8] reset: Add
 reset_control_get_from_provider_exclusive()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd	 <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet	 <jbrunet+clk@baylibre.com>, Ulf
 Hansson <ulfh@kernel.org>, "Rafael J . Wysocki"	 <rafael@kernel.org>, Marek
 Vasut <marek.vasut+renesas@mailbox.org>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,  Kevin Hilman <khilman@baylibre.com>,
 Vinod Koul <vkoul@kernel.org>, Wolfram Sang	
 <wsa+renesas@sang-engineering.com>, Kuninori Morimoto	
 <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, =?ISO-8859-1?Q?Cl=E9ment?= Le
 Goffic <clegoffic@baylibre.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi	 <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Thu, 22 Oct 2026 12:24:22 +0200
In-Reply-To: <b9e68c8df1e545191e0359dba23fe53de31a4ce5.1792163045.git.geert+renesas@glider.be>
References: <cover.1792163045.git.geert+renesas@glider.be>
	 <b9e68c8df1e545191e0359dba23fe53de31a4ce5.1792163045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_032425_586749_D9D15FF4 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fr, 2026-10-16 at 17:55 +0200, Geert Uytterhoeven wrote:
> When stacking two reset controllers, the upper one should go through the
> proper channels: request exclusive reset controls and use them via the
> reset_control_*() APIs.  However, unlike the clock subsystem, which has
> of_clk_get_from_provider(), the reset subsystem does not offer a way to
> lookup and obtain a reset from a reset provider.
>=20
> Hence add a public helper reset_control_get_from_provider_exclusive()
> to lookup and obtain an exclusive reference to a reset controller, based
> on the recently introduced __reset_control_get_from_provider() helper.
> This will be used by the R-Car X5H Module Controller driver.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

