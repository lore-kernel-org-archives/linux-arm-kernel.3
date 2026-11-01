Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3E5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xqJnByhI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bc5NfN5/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dGR9kl6uTtgDJSJ4dH0fCa7ftWGcF8J5cSIZIw5rbBA=; b=xqJnByhIqc/MnM
	hQlS8OMO2XY+Qx6MhSgoLkPcTPuDjf7yZnp6r+36dcnR2KzOikI92wxjLRq7ZnSiZlSZCSqV+G7KJ
	hfQmMlaK1hi9iUblbakVkQqk3cPBBZ94ZvAOfpo4KElgLEsk1iBzLFxVK1Or01uVS73wxfOr8oZwP
	/rynYHyTJYzdgFURkqbCvkppl+ZUnHbFYpamVQfsy5Sqf5dDdNd8mRO7DGnUKrsLf4P4+ZgcIWlzU
	lK/zEpHx1USeuyGcvP6sbfnPfhPDi3+pQNG4/Nq3aQU9MHbJyr1RcSuO7rXjf+/+ZMS0ZIpEc1cKK
	4oNPyAfDmlPiFp8BwlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNT4n-0000000E66i-14ON;
	Sun, 01 Nov 2026 10:46:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNT4l-0000000E66Z-1xAe;
	Sun, 01 Nov 2026 10:46:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C52E7600E2;
	Sun,  1 Nov 2026 10:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5C51F000C1;
	Sun,  1 Nov 2026 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793529970;
	bh=dGR9kl6uTtgDJSJ4dH0fCa7ftWGcF8J5cSIZIw5rbBA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Bc5NfN5/LMPfNnPeH99MX6m4M2u5CrxRnQOG/BPkrvht/YNmLJwSIrTBGmoQxjeLW
	 T2Bg2buuYUycr0aVCtO/G/R2MJllHhAPat8oW/r1LdDyglvl2+Z2qDd0CKsWsPqXnn
	 j/sGVuY4gR0i2OuWmFHB/qu8qO1BzBXWkcvsCgfinMF8BR5+CsTYkRkwP/RUP8iK7L
	 B1OhEfAUIW7V5JaujC5Ylnb1W4JzBYfeqG8HPISXqmUneNsDDsmr740/E3atYdERwo
	 txryab4YqUcz5YKcElm9LGuN6ub5NCQMenoBLyOta7rhnYmLuPSSowmvHdOUSP8jhB
	 wN4e+sEzuMavg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 0/3] Add ASPEED PCIe PHY support
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
Date: Sun, 01 Nov 2026 16:16:04 +0530
Message-Id: <179352996432.2955.15360734272963479589.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=699; i=mani@kernel.org;
 h=from:subject:message-id; bh=0ZANUh9mwDKQrUQv7MpH+M4ZYnBxlA+EOdANf6PQOj0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xhuBnwVQvqgNHtWmOkbL0QfJ00VCESNLH3kq
 AAEIBKEXgOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucYbgAKCRBVnxHm/pHO
 9bdlCACpAfx1ovYivAViX6ocpuk9V3nGVQQRN4wHXNNOOh/d38VrknBLYT62wsga7ryzjp2/Zv0
 1ycwqaSEHLEKjDlrOEv7qk4yQfA138LlOE+oIXYKFEc7vhZTfBgBRoZ7oQ4rws3YlD1jy+N1+J4
 WdxTxkfAyTF2wo9OgzdidKUyKTKOy8hCieWaxPdlyvCpxsjN+ZEPFs67UREsDvNGOiChBMJBe4p
 YWyNIWolqgwTP39FsjxNJyzsK0t+TlG/rGpqUZ2azF3phE3VQtXFO+TNnIuT2Mn2RB9jSDNzf4p
 KEzf1u1uq/DLyo7kv91RfgR5b23/clTvn/sQIvfvnGJzFplV
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-20 19:59 +0800, Jacky Chou wrote:
> This patch series adds support for the ASPEED PCIe PHY, including the
> device tree bindings and the PCIe PHY driver.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY
> - Implement ASPEED PCIe PHY driver, including reference clock handling
>   and an AST2700 host bridge reset sequence
> - Update MAINTAINERS for the new bindings and driver
> 
> This series has been tested on AST2600/AST2700 platforms and enables PCIe
> device enumeration and operation.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



