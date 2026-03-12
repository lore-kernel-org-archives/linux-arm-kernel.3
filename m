Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC9106ACD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a17cA5BnD/c/myM6EVYfTaLwJihQ7JAnaqKyd3OHDOA=; b=Ktfb5kX06S1oQxLsn0eETsKr5/
	q88mzrMhlPB502oyNX//HOQQCiLxHdEpaOkzbigA8JQg0cAiMRYe94fwTHO1HZA9ALj+/VUmlLUAG
	PIupaa182rAc7XnHO637SbNgjemwyvYqC06r0/+PYfn6uDix/ZtmJJoNtuRAu0aTkm6uetuIzuHCc
	QtQO9biIBcq/7aAvlJXphqARSHrKzcp34dx2LRvCyZE552HGs0vXXPgdGTtjZ2jbm/ZQm4rzLsgRd
	Up7NrZyWSePmyaFIFt2ThgvGF1Scf6U3BcxXirt7KvA5HbZFWtyz29CLVbiS6EHPcd+/CmNFwjq5r
	LXDuoI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k3o-0000000Ekwn-3rqj;
	Thu, 12 Mar 2026 17:43:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k3l-0000000Ekvp-0GJu;
	Thu, 12 Mar 2026 17:43:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6913840617;
	Thu, 12 Mar 2026 17:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E396C4CEF7;
	Thu, 12 Mar 2026 17:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337376;
	bh=a17cA5BnD/c/myM6EVYfTaLwJihQ7JAnaqKyd3OHDOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qE+QJhIPGwVuj8pyJK3IkDMtJ54E3VXeQ/fEQWdqRplA5fDdfIgPdAERQ1cGjH9LX
	 nuWsWy6T173gi6eMz2X6hPUl+CQ4lSmn/SRmEI3dV6BSbcspSf73BEMUMrbl3Ef4O9
	 oyb77tbz8woMCSES3r3c6fPNY4JrArkvz99TihfpNktT2lWWQ110UQd4/VGokVasxg
	 DpzKOxlQf0J8duGhlutGQ4MqEP/ZF+fBPjzIEEDEKrHi9gFIToCjFpa5dcR8qEaU7g
	 QarO4ep8FQNp+T4ACNwu7Z1410nbQ/kLYKshBIRJ0UeYMCdN5l+Lw33P1frRJFH4NP
	 krQMmfmkoXCTw==
Date: Thu, 12 Mar 2026 17:42:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com,
	bartosz.golaszewski@oss.qualcomm.com, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v3 3/7] dt-bindings: pinctrl: realtek: Improve
 'realtek,duty-cycle' description
Message-ID: <20260312-bleach-olive-2e4c9bafb439@spud>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-4-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ic8L765LhWJyXXqe"
Content-Disposition: inline
In-Reply-To: <20260312113040.68189-4-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_104259_152569_BC8EDA83 
X-CRM114-Status: UNSURE (   5.58  )
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


--Ic8L765LhWJyXXqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ic8L765LhWJyXXqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL7GwAKCRB4tDGHoIJi
0g0DAP9A/A42ZqvKHU++vZOJOu/JYfPBWdqsQzgTz9tK8qUTngEA818TZ13rL9Y5
UKt4fPNRJmmCIRgSZEZF+ctSxb9GNQM=
=VfKw
-----END PGP SIGNATURE-----

--Ic8L765LhWJyXXqe--

