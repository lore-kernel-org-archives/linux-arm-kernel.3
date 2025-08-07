Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5475BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQPqKFUBZOqlBbuHBV2txu01LxbimFRPE66N8YJtaCA=; b=VPVLJX+BeQysg2/SiCfr4Oeym6
	S0oyUziWfL7IaZ4NHHa9VzeTNZlDPDz7I4rChBT2CjGh8fvYgkD5EaHpkBwSrzu+J7kpRXjN6VWcG
	xfmswJ1VLZ2pFUGJOZN04FfzePNFoXhCP7j5lh4xHmJIHIu/stdA+LgSdqwTIqZMKfivsLvWl6KNd
	TvDCLMQh8bBurwsMuMsY8oWi0QXc9f5u2LXczPzOoLQ4IJGpnJosvL65I38DTSPrrpANeo2T/PZB5
	VahWVz3iSGpMWF+6jOLgLY8VCQ6GAgiwi3A4PQydvzmO9ZCQZfrf+PvMLQufefYp3oq3VO39wbZXc
	zdYhtyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3RZ-000000018RP-0tdb;
	Thu, 07 Aug 2025 16:26:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3Ez-000000015x2-1oDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 16:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B259C601BB;
	Thu,  7 Aug 2025 16:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4429FC4CEEB;
	Thu,  7 Aug 2025 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754583196;
	bh=IQPqKFUBZOqlBbuHBV2txu01LxbimFRPE66N8YJtaCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kb8C12SRmA/TCjvwM17rooJf+h6BfX17To5G2qICOvSQ7rgY6iEy5iB2BdNO6I+wg
	 QtiKQCPlMs2wxf0Fk0XeV8vRqHdGuzaPcWd98lPlVLbDVtFwUNHfQtYctPTwKpYuOn
	 zHXhgN5/QlqEgt8DAwYUJkk7sppkZBMn31yWzntAkQi8rhE6H6W4pIRZfAZ2Pf6wJx
	 0RnqGxEA2h3hPkrWxlLGFxkIHy+6sPVXfB9x3J3DiprbAUxRJGPltD8buyC+KpAWeF
	 AZVKC2TgRR6e6YaEPpN0ELZfPbXVN+bQiEQjyjzftbEkAVp7tQyDsOWE9oh0FhGLRs
	 yHwPnjRhXpK3Q==
Date: Thu, 7 Aug 2025 17:13:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, linux-can@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-binding: can: m_can: add optional resets
 property
Message-ID: <20250807-polar-ruse-b30ef402c9fa@spud>
References: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
 <20250807-stm32mp15-m_can-add-reset-v2-1-f69ebbfced1f@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="95eIz5YQcH/glHyT"
Content-Disposition: inline
In-Reply-To: <20250807-stm32mp15-m_can-add-reset-v2-1-f69ebbfced1f@pengutronix.de>
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


--95eIz5YQcH/glHyT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 08:09:30AM +0200, Marc Kleine-Budde wrote:
> The m_can IP core has an external reset line. Add it to the bindings
> documentation.
>=20
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--95eIz5YQcH/glHyT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJTQlgAKCRB4tDGHoIJi
0kUJAP9nSDad7BkpEvlqTnkas2ereywm7R/blr7FIwjgf3067AEA/KXy2nxKIAPs
Jh3qLPDZl+RhlWwEh2w4flquuzXXAgU=
=gIXt
-----END PGP SIGNATURE-----

--95eIz5YQcH/glHyT--

