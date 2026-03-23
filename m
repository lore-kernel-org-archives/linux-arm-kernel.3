Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CABF483E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjx39ilZrLD9eegnvZBoM728RyH1At0AzI9UWm21L4s=; b=o4r1g6KgXHFlfkS78/6kX+8SNa
	ChPvO7MGlKPw3dE5DF/3a37KCkbF2iroDvktYUsNNJkNj/ht7SKHzzyH+oWnh7Odv4GtaHvaIdLs/
	LbKE61kyIwWn1rvabK9xDeoEFkq68YGJSebf3QvFBZOS/asgHVWlXwvEwkiszB5aXfkSqKUVpvCHZ
	CCkWvK6g+BGId8MVw9ODj98dzfrjarL6crdPc//C+o1CzBNDy/EU9tz02H5gZfDD2u6PSxwGmwjf0
	ebsPbeAsK5F1B2dPl+X2uwfVAlbKqZmkVhOpSigTOHOILKmZqZWxijOaoCNG1qfcJTG13UZOsqcSh
	kG6U2kSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l6l-0000000HSoE-0S1l;
	Mon, 23 Mar 2026 19:38:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l6j-0000000HSnC-28SB;
	Mon, 23 Mar 2026 19:38:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86D5C600CB;
	Mon, 23 Mar 2026 19:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFE6C2BCB0;
	Mon, 23 Mar 2026 19:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294716;
	bh=zjx39ilZrLD9eegnvZBoM728RyH1At0AzI9UWm21L4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZgJ219eSO1BluKKrE0/F78/wIPyFIUlg3b1vY41BTYDdRyXHEdZg8+eiRHHgY9UX
	 VgmNCe6IBbjAHJ6zs3NPZENOLtDPeIKm3EKFsnc+y9bRDhFkpCaGvoXhqXdy5pGS2W
	 2g5gcwt53jQe6NjG1itfP1o0k+1ADBg7PGZZXLwgMs+OF3XclYBRjwfsSSu15888iT
	 F5Ew36jMz6PAm54ZE/qr8+gXSld5EYHDxbzhTh3wv76epi+Q2fEpLzkQYqS3GvRVo3
	 QXdnRXu3XuHjnPygiDXkY5FPUFM+ZGO0Ed2Enkzxvf9DNn9t65+YDJjMAYPkvltcPq
	 1Wj/giAuEfTew==
Date: Mon, 23 Mar 2026 19:38:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: mmc: amlogic: Add compatible for T7
 mmc
Message-ID: <20260323-unlikable-crinkle-cc31999aad5a@spud>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
 <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l1GQQw0YeXOQe55v"
Content-Disposition: inline
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
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


--l1GQQw0YeXOQe55v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l1GQQw0YeXOQe55v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacGWtgAKCRB4tDGHoIJi
0tYqAQCrWwcbdjUSvcfyVvddjQQ9LY+4jSz9SafZfg0an6LaGgD+JMXZKODbZhL5
cE/+52VOplJVr6pGlNoUkQdovcgiVwE=
=r7oK
-----END PGP SIGNATURE-----

--l1GQQw0YeXOQe55v--

