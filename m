Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD10F8FA9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1ylYruYbhjfnpeCNaQ89mNWV1yukc5kkoI0lUofjuY=; b=iEUugjUcwMjosp4UhgDOKbhTpO
	iYJVxboRZ6uSJ52xZbU45IrTtF6qajFcRTJsHLVs0/lty7EbLOXhwmwLYJM6UyypFhQpB0aF2K9Ez
	Alqc039FSN9FR6dvnzE9ppu2CyueBH5/opZuPz1DmVPDHQqhPHQi5rqBgM7VZl4Bds1emFyGiP4mV
	6l5blyYeOtHqHAEuPeSoJG30ugzCoIe7mMZzgrasdlrPwNxc6kPQA8a0pbMqM3TbCSHNOs6a0zLsw
	MoCxOwc8tJrKT79L5XnXHm5ATn8AtiZfq3fssOM21KqA59YnhMpJNNxNwHkKqPywS1+4ct7xEsh8r
	0TkDzt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEXO-00000008wZn-3OeO;
	Tue, 21 Apr 2026 17:05:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEXN-00000008wZR-1Uj6;
	Tue, 21 Apr 2026 17:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CE1B60142;
	Tue, 21 Apr 2026 17:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD50C2BCB0;
	Tue, 21 Apr 2026 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791124;
	bh=Z1ylYruYbhjfnpeCNaQ89mNWV1yukc5kkoI0lUofjuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkzXN6rXLrqbPaKzFrZVA5O7xIxtH4nkHCu15azhXJ0NWdls3ios/GdzaRlM6uE7I
	 9geCxENEEi/Y633zBDxaLCHopnhQ7PXsohfM6dxswZv88ojXMJ9F0offWnWZmm86hC
	 5rNODIAwQp14JLnzNM9C/NSRb3sPVtPuqIUyDxox/kG91DWmD5q7/7rdy+C3AdLPBg
	 UhPgZVbCxc/F5fuLXZeF3AdBtIeTK5AnC5nCKLcNQKi1HqIzHwcEgDMwxa/iUyVu9I
	 g19f++9oev8llXhdNyq4zP7CEXyqb6TQL86JnASJtgQtmKva7ov213Hbowegv2+Ul2
	 ICxIejn9MK1Ag==
Date: Tue, 21 Apr 2026 18:05:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/8] dt-bindings: thermal: amlogic: Add support for T7
Message-ID: <20260421-nullify-volley-5ba0e5e8070b@spud>
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
 <20260421-add-thermal-t7-vim4-v3-1-a2e7215ed003@aliel.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m1dzShhxAayQS2fO"
Content-Disposition: inline
In-Reply-To: <20260421-add-thermal-t7-vim4-v3-1-a2e7215ed003@aliel.fr>
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


--m1dzShhxAayQS2fO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 09:19:43AM +0200, Ronald Claveau wrote:
> Add the amlogic,t7-thermal compatible for the Amlogic T7 thermal sensor.
>=20
> Unlike existing variants which use a phandle to the ao-secure syscon,
> the T7 relies on a secure monitor interface described by a phandle and
> a sensor index argument.
>=20
> The T7 integrates multiple thermal sensors, all accessed through the
> same SMC call. The sensor index argument is required to identify which
> sensor's calibration data the secure monitor should return, as a single
> SM_THERMAL_CALIB_READ command serves all of them.
>=20
> Introduce the amlogic,secure-monitor property as a phandle-array and
> make amlogic,ao-secure or amlogic,secure-monitor conditionally required
> depending on the compatible.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--m1dzShhxAayQS2fO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeeuTgAKCRB4tDGHoIJi
0qYWAQDxAFHuGm57LUVlyryh3ibC8pwBHTnLzI4xPChCJGGMdgEAvu7/hlYMeKT/
TdukkKtxdAjY7R/Dxiwo8NmDWA850gI=
=3G3u
-----END PGP SIGNATURE-----

--m1dzShhxAayQS2fO--

