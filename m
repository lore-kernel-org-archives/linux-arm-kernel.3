Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DAACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uK8VD28pj5HsQA2BIDc77NxRzzo0PVYvig7p9Rq5qx4=; b=XLx0KrOiSk3ZeQ7ng9MR5ocw1n
	NWo6zNp+CO9HRrnCBbua/mHir4KBDbmUToDECZmO2g/GHg1ulJcP/V0XZ6WeKO7W6phT7BOUgfaQ/
	+DP9Kuf3EeOyC29/OQrK7lQYwxDR2NSFu9qWwUdAxCXQPqW2qcBZF7aIHfy5wQaDwiP1qzpvywCzT
	2Cv10U3rmu6S1dhk7D4SQAX8Hqajt4eYwAVdiU0OHUn5ngrR+Px8LS9YYrnPXeoQZFkC3M2XEmcRZ
	TwxyubDts9dVJnHhvQSWXG04hymDmMiDHpxU51SGzeRffImuJrdPb0NYBTFccc10miJLHzl43F4+4
	xCowXvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxij-0000000EEaw-3b8m;
	Wed, 17 Sep 2025 19:21:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxii-0000000EEaA-3QWo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FA2A601F6;
	Wed, 17 Sep 2025 19:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73474C4CEE7;
	Wed, 17 Sep 2025 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136895;
	bh=uK8VD28pj5HsQA2BIDc77NxRzzo0PVYvig7p9Rq5qx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUDWAchDuxejcbCy7Djo+l7J5pMHNe9+okeU2CCorrXCidCMI9adv8g5XJZxvEBuj
	 XVZ4+cGy4qay6XGmNXDOsVWqhiiqrNY8q0jV7ckBFODPQ1sLbAV1dMHk/vfe51srgd
	 D+6gwUyDsnynsP1ScAJubUaOeogZodPWGj/oVxc6eEWQpSHZ4S0p7qMuCVOsVi1geL
	 4DDJf/sY2rK9PLLQzl/242Rc0/ci3efF5YYo7VLwAu5c5/omcLw1M5q5+S2cQX+IAB
	 RAAZOIUV8xyEpy8U7/qd3L2VY6iVbfClW+N9korLKE4MgzWf7ad1WRznqwUm5POVJ1
	 DMI0o4tn60hNQ==
Date: Wed, 17 Sep 2025 20:21:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com,
	mturquette@baylibre.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, ksk4725@coasia.com,
	smn1196@coasia.com, linux-arm-kernel@axis.com, krzk@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: Re: [PATCH 4/7] dt-bindings: samsung: exynos-pmu: Add compatible for
 ARTPEC-9 SoC
Message-ID: <20250917-overture-freely-8279720edce9@spud>
References: <20250917085005.89819-1-ravi.patel@samsung.com>
 <CGME20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6@epcas5p1.samsung.com>
 <20250917085005.89819-5-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dRvbyashsTiNm1sK"
Content-Disposition: inline
In-Reply-To: <20250917085005.89819-5-ravi.patel@samsung.com>
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


--dRvbyashsTiNm1sK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dRvbyashsTiNm1sK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsKOAAKCRB4tDGHoIJi
0p78AQDSMTw2stqWHLzjK5+LTkdtN65qrrWqUWRI2Rf17tUVnQEArHJgpN7vG2Pl
lBmuPUXF4wfsNnyi465N6V7WOXUT7ww=
=GaZD
-----END PGP SIGNATURE-----

--dRvbyashsTiNm1sK--

