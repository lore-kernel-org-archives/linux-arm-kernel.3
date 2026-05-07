Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDC4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2uFCtkUNsia+m6fpAEh1XqkuX3NtaugGNibOKloo4o=; b=Mtbwv1jpIMTnkUkwVarY8kAbYg
	KtjbOqX6YtEtbDQCvMw1XF9Fym32EqrId8VGkOapfslCtNs263IWQRJ3IuPWuk0CVYIgs/SL05WYr
	qi5r6mXFkRzVzMka6TzN3ewXeFMzLG4wdtab4vgJmgB3Yhte+egHS2Kd+ujLWKjaqkWzIyRoijKHt
	E4rNxtW8QfwzquLYb3ZDFJb0lCItJoBpQq0VzHBZyJUAfxpyrlVrTO9Yqd/APIXVhSflZ/V3WnqCJ
	+NFYGyct7OzjIdDqrxtULX5mqo2HhX4cmJF/JnRq8uLKj6EISK+a/qf1nJj6M1BhTEvTpzMsbFWgh
	IXoRXuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Ss-00000004TTN-2m1Y;
	Thu, 07 May 2026 17:24:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Sq-00000004TRA-3E57;
	Thu, 07 May 2026 17:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 373E06024D;
	Thu,  7 May 2026 17:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F400C2BCB2;
	Thu,  7 May 2026 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174683;
	bh=P2uFCtkUNsia+m6fpAEh1XqkuX3NtaugGNibOKloo4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpwAj9kc8UHoERSQHR0XSVqory3ohRb6FqTA8C81qrIvv/U+4tAaRBmUd5plpauW6
	 O2+JfcJ/rrfXrnYcdDnCt4nXNbQ7v8EyO5n7h3FzT2LaOIxaF7axtWgiCEMU+q6X3A
	 S+SXGhN92RGwwBvB1L4ZrstRVtXNn95gG9/V78z9EnqRy/Bkbjcn9Fbb7RhN/K1eUs
	 LPu0e+wfwM7aZMG9k9BAxL/mgkZkFnHfloGEYsd48Oj1b3Pct2pPAN9xwN8aMIBJbH
	 ZAIPpiwJixuexPRRoCx0FKTdHCo8iikc2sMAFS8fY6VLthtXyBd5rRsqg/1CTTB/sd
	 TsYOru+1Mv6yw==
Date: Thu, 7 May 2026 18:24:39 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Message-ID: <20260507-juice-helpless-b04e31e10778@spud>
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
 <20260507-a9-pinctrl-v2-1-49774feff2ef@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hcasBY/b5pRydqvZ"
Content-Disposition: inline
In-Reply-To: <20260507-a9-pinctrl-v2-1-49774feff2ef@amlogic.com>
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


--hcasBY/b5pRydqvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hcasBY/b5pRydqvZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzK1wAKCRB4tDGHoIJi
0lmTAPj2IuWZOzkdHyd1WG3b7KQWEm0yZDOhSvUgbOssnp7HAQCGYO2izgbTLuuW
g6S0C7Z2i/91Jf5RCru9LETDYWvfCw==
=CbFS
-----END PGP SIGNATURE-----

--hcasBY/b5pRydqvZ--

