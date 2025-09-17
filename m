Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E001CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v12o5iwyw41C8ihek+ckWbnVdlFN2k5R+5rFNQJK590=; b=lb2kcgFMgwOJJ/kFMSQKuChxzt
	m42/JpbPWSPKUmmH0xrd+l/eNmborGcBj+Ysto8QiqeMG+MvrsGTSxwa/71fZeaK8VJIoPsp/nih6
	EGKuut7s4YSOiRp9NmJqBTq3NFbLYPUWhgPhqMPirwyJLFqILuyIjcoRdTWTmhsd8OD3XnukW6R9A
	yy+W8fLuX8xY86o5kbVDQF9UHQFueKE61v3k53CR2t0tKYuECdzY7GwOrgJgBssT153merHG6hNh7
	DQ9ZJnqHeT/1K9VFrl335Hc//bo+F13umffLaorROBNcthBLpOmLWLH3KDjkHG0Q4ajbUU15ba4K0
	LxuYUk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxqZ-0000000EI4g-2NoX;
	Wed, 17 Sep 2025 19:29:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxqW-0000000EI3B-3WZ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62C2744299;
	Wed, 17 Sep 2025 19:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFA2C4CEF7;
	Wed, 17 Sep 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137380;
	bh=v12o5iwyw41C8ihek+ckWbnVdlFN2k5R+5rFNQJK590=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aG7uCXPN6cuxbuyjgnbi4iOfnjVxeRb015U5DHqy+klOPlPT77WuL0G5T0CemjsI8
	 4/zk7UKc6bRVkrUfmd88q5fKo0Ol1hPBYdEIkzghhZXH1pMaZO1jvtpG7T/dG0tC3j
	 VMDC3grM9mnvL3Ovw7gStTetMOj3Iewq2T3QTFq6N0/NBszyuM0R+ACXpKM83YCzG4
	 ExAfGwPELxOd8OQIRo33XvK0fCK0Cy/6Co0XvU0BiaLT+R50boLjurLAEE1cVHU644
	 chcK2+hUTmklopfOYLUuFk4q0GFupnY4SczRV6ctW/nLSRYQyFQepfShVLQjVZgMfe
	 4Lzz0fHhROObQ==
Date: Wed, 17 Sep 2025 20:29:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, robh@kernel.org, conor+dt@kernel.org,
	tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com,
	kenkim@coasia.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-9 SoC
Message-ID: <20250917-putdown-unbent-5f606733ab13@spud>
References: <20250917070004.87872-1-ravi.patel@samsung.com>
 <CGME20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d@epcas5p4.samsung.com>
 <20250917070004.87872-2-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rU/3WvnOMBYZh5rC"
Content-Disposition: inline
In-Reply-To: <20250917070004.87872-2-ravi.patel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_122940_892652_B34B1A1D 
X-CRM114-Status: UNSURE (   6.02  )
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


--rU/3WvnOMBYZh5rC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rU/3WvnOMBYZh5rC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsMHQAKCRB4tDGHoIJi
0ofPAP0Vk4Yt1eXjrrWtDfuzaIZWx4hwMFwWg1joQyhYukSJzQEA6x2UXKkHQ1bq
Gs0eZdMZWs1ZFN8FyjqQjoqMWzRgugk=
=T4JH
-----END PGP SIGNATURE-----

--rU/3WvnOMBYZh5rC--

