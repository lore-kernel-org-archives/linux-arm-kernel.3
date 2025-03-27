Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030DEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvC16u1aqR/2KG04a8f4N6Xoq/iI1HOtNPpUepOa0Ms=; b=o30jCWoawLMmjmdoGrqtTSD8xC
	gjmjrGB79j2juNMu8X/sTnhQk0N/4RF/KKU6+PIXfZFWkx40p+mwZ0qNbcoQxYqETdBj+cV3jFxuU
	6Yb/87DAab8jXuhhlyuTGLxCSLI+ns1yFL6htolTCM7lPilRZ0scO5i0mtjlLoAaLYvTOw2FD2fHu
	RjIsrOv+SCPbxRwcmKxIw6xxwA8TtApmaUIpof/HtN4IadDoi/HxhrMXCj/zN2MnQYtJh2oDOxp+8
	hDOEx6du+9NW9xYlS8FdyUuxM7GEZiHOw33clr5zyTjf2ZbnJ5e/YFAH2kxa/fhvXeq8/XwfzoLuQ
	76cgbnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqLV-0000000BYXN-2CDa;
	Thu, 27 Mar 2025 16:44:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqFF-0000000BXPa-3AkU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD8CA5C35A5;
	Thu, 27 Mar 2025 16:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15777C4CEE8;
	Thu, 27 Mar 2025 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093496;
	bh=NvC16u1aqR/2KG04a8f4N6Xoq/iI1HOtNPpUepOa0Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3ztZUCEsTgAufZFIr54bxgGmr3liOeSSxSNHer94WsXcmqD6VkiFMJpgxN4qBDpI
	 BtOIwp8CLI6Ri4PDU0wPxHZv5eCUfsEgY7UXGM0/Ipj1Quhx6WA8bn+cnuw5/RSjpN
	 bGulEuC72O8WOwISAx5IXkbmdCIw4BWmhGMyjjoQINgPphdojzU37IE9tM1hJf4cHc
	 O4CLk/OaeYXzHinKCDM+z/NZ/ltVO6XamoCGyi9f6WXu+dYHBuxHbEWcS2uYtUzd9Q
	 XeWV1DkJRBHxTNFVnGvmccUeI6FFgZYGXMTEfcfvg4P/nF4X5H6d7Hs+9tSjt4MFvc
	 v8so7ojzrKQSA==
Date: Thu, 27 Mar 2025 16:38:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: stm32-rproc: Add
 firmware-name property
Message-ID: <20250327-defiant-quicksand-83cfdd8cf8d8@spud>
References: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
 <20250327082721.641278-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytieV3SLIaVgIcdG"
Content-Disposition: inline
In-Reply-To: <20250327082721.641278-2-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_093817_848851_7ECE0173 
X-CRM114-Status: UNSURE (   9.34  )
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


--ytieV3SLIaVgIcdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 09:27:20AM +0100, Arnaud Pouliquen wrote:
> Add the 'firmware-name' property to the remote processor binding
> to allow specifying the default firmware name in the device tree.
>=20
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ytieV3SLIaVgIcdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+V+8wAKCRB4tDGHoIJi
0rA7AP9JyUbjLOakoM+hJBNcmQksv1MkDD5pE8noBMWu3qQ68AEAsjA4jPrHo7Co
a14daJ3eTuSb4JbviHqOsCWo9L2j0As=
=9SvW
-----END PGP SIGNATURE-----

--ytieV3SLIaVgIcdG--

