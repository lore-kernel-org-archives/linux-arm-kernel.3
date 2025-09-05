Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD94ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvlpwRNtZnIGPhG7S6zJZs/7xh+8sbv8Bx4xDVNZaaQ=; b=ijZraEepv/iClesi64Cro8NpWV
	62Zppc0VluanuksdyevXWUEMRvB/n9B8YYTzv0IUlcpthaGMXkq3EX2nsBCkamvR504gOGoOYo2fA
	4jrzKjgA6HQlMIzr68WA2bkb3rP3ehzKUbDfjaBqa1dqreDB4Nl1h3Jbe1riXaytlPd+wYxGW16II
	EDJtGz2uFk4xJgVp5ZWN5S5Fzx3bT3S7CBhD+mL41O2mvaMkwTMe7At7cIZwqyNeLxFiNTbyIj86C
	L7/MjKbJrBmH7HpO0ibJVvLAjsckcGchT0wtO7hd3Giek7A0kbZmuy2+Gi0e0TQ/Z3WTbdVopRYm0
	68wkKNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugWI-00000005TG6-2FpA;
	Sat, 06 Sep 2025 00:11:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubAo-00000003nA3-0P7o;
	Fri, 05 Sep 2025 18:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E5C2601AA;
	Fri,  5 Sep 2025 18:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26872C4CEF1;
	Fri,  5 Sep 2025 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757096913;
	bh=gvlpwRNtZnIGPhG7S6zJZs/7xh+8sbv8Bx4xDVNZaaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OotgecdISxk6kWKWnSDQYxp7at6LsdwLy6Ko3CjW/0iR212vxzjkOjrEEZyx5g/A3
	 pp1lH98V9O0sJqlQnNscYbjEapYQbJLDHUPM0b4xvsu8UfIGVIYFovlsxMIHVhNZTH
	 Q0PrGULAXljxr4kpmHJxDQVBErqV85O+1e3NKySx8herH0soBWOuajBzIlqhuR5q1k
	 xdLlf9eKVtjipig6m0+bO5U0MRLKCjkhU0bXQJ5nxkYsDDXoNvT/R4WoZPsS386HJ9
	 sXj+GJFfADGJsqVi1U5pVj7P0bHtxDhtzylcZMYvbHIMCeyw55ua5FVaBmscNo1b3r
	 M2Tnh/YR5/EEg==
Date: Fri, 5 Sep 2025 19:28:27 +0100
From: Conor Dooley <conor@kernel.org>
To: chuan.liu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
Message-ID: <20250905-datebook-excuse-659da9b41d8b@spud>
References: <20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com>
 <20250905-add_video_clk-v3-1-8304c91b8b94@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tp/2PmSvCUVt5yEJ"
Content-Disposition: inline
In-Reply-To: <20250905-add_video_clk-v3-1-8304c91b8b94@amlogic.com>
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


--tp/2PmSvCUVt5yEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tp/2PmSvCUVt5yEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsrywAKCRB4tDGHoIJi
0hR+AQDCr0nevvM8U0I/9Maks/GUrWECQUm7mVu1J/fU9cV7awEAnWatZjLmHYF8
WW1uD9ucXu1VnPgvK3uEC9EvFqfHLw8=
=+jIT
-----END PGP SIGNATURE-----

--tp/2PmSvCUVt5yEJ--

