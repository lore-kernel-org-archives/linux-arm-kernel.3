Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE23DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 18:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDgT3OLYqBNSwhcwVokASYsuRbIZdhKM2PFAjL4kmfg=; b=Kmn3Z/WAovMQX0KLew65z7reml
	B3uuDH1yFpFEnTxYdW/0j49OHxwK4V4jm80M4sKaqF/3GjZQGi/9GMXv8XvmFOM/uyFB3tU/NXtDt
	yCVO/q7eU6BGbfpuOWN3qh2Gi3ZgeSYGVdh3jKD3FQJgRQr7M1UixiiFv7w4eNrg1tFgyC/Pr14qE
	pZR7ffludRBXeSTnPrHMRhjgNdjdp0KjHdzZByb2wlx1V9NyNXaEwhoao9jyIfbIogDQqwVfCSS1M
	VN5H9CQG3kjiREOFgsthU6/FI29XhtyfVsNr2kcSdjtTiIK1R5A/8BYvD6Kp/eRyyiVx5vvr9P9JJ
	FfH5R06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWsD-00000005zLD-1AMJ;
	Mon, 10 Nov 2025 18:44:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWsB-00000005zKp-3tgb;
	Mon, 10 Nov 2025 18:44:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ABDA445EF;
	Mon, 10 Nov 2025 18:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A019C113D0;
	Mon, 10 Nov 2025 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762800255;
	bh=uDgT3OLYqBNSwhcwVokASYsuRbIZdhKM2PFAjL4kmfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pm2NaPdw1pQxcle3LBq1dJXMeAMTKMxQbo/+GoyGaNPZBOKVb6/TDfIsKHNpr05R5
	 wNPlNpJhlPqu5KE2DS6Uo80rTSC7qp0/hMfiBs0sADDUZJBRykNV/KTx8o92qQdOCX
	 cW1k03hHMEFQd1sFxVchziMlpK1YtdUByq5q1ChpmgWYMTzIVQp46z8UbC0as8zWTf
	 MC96jrFvdqHy84cZTKRdN5jOARljbnwgmrHBPZmNJ5g43XidoVN9lnBJcHCMretitp
	 48bxa5dw6EadcnFUoDkymMxz0P91/CTQeN+lFrYP4kx3tfpNhx6dNVTU4sluOjmFhJ
	 mCNvbrNvRhgwg==
Date: Mon, 10 Nov 2025 18:44:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Huayu Zong <huayu.zong@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 3/3] dt-bindings: remoteproc: mediatek: Add MT8189 SCP
 binding
Message-ID: <20251110-wispy-unsliced-4eaa89c6a866@spud>
References: <20251110101342.24261-1-huayu.zong@mediatek.com>
 <20251110101342.24261-4-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lfkxYjN0AXZNGzBE"
Content-Disposition: inline
In-Reply-To: <20251110101342.24261-4-huayu.zong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_104415_984450_356F89BC 
X-CRM114-Status: UNSURE (   6.92  )
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


--lfkxYjN0AXZNGzBE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lfkxYjN0AXZNGzBE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRIyeQAKCRB4tDGHoIJi
0gZNAPwMSrWLJjJv/TIE354SXgaXXyg/Lhs1khSwgfyy9QS8eAEAxbotzJllfTAJ
lnDKXD4R7yCtnW6Jx10F2R9VKtJYVAg=
=pkeZ
-----END PGP SIGNATURE-----

--lfkxYjN0AXZNGzBE--

