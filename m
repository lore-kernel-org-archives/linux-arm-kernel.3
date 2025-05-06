Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A70C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3oC9L/V7wY2qcuWyTte91buVEvN7VIAf+IqqHVzafQ=; b=Z51RkNo+AV2EMBJY81psBM/G5m
	I4pgkUnWLY3W2/P/ZRJ4RpuPp2k1tHGAQxAnZ7c/PTpdWiFMoUidjXTIYivqJNI5AjAgWXrz9AcqY
	/dBlwRx/WsP2XaqwOYv4fZLBoGyZJ/dTQlro4btZvotU6TeFgH0gwCvyFb9OjJX1LQcMnGiRyu+6k
	yZdFdKF9moIVr4fr3lm95iqRksXDGWa1HQjJATJF7fmoGkBTTjoHsKT3zRjJaowBY65wzFjadTt8u
	khiQevZ2qXXfzB19y9lSx3j1G7TuoA/jkrzeF0DxqOlGP8xV4AoP30/SFdXSNC3XJhd08E8l14AqL
	gaHilFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOSb-0000000DIZY-3mWg;
	Tue, 06 May 2025 20:00:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKU4-0000000CXIm-2xNo;
	Tue, 06 May 2025 15:45:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCDA05C4756;
	Tue,  6 May 2025 15:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB54C4CEE4;
	Tue,  6 May 2025 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746546327;
	bh=P3oC9L/V7wY2qcuWyTte91buVEvN7VIAf+IqqHVzafQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifD+jmjKve8EpiVakQZWDkuJGL5Crak0Y63C2Iuz+zYMzZHC8m0hh0MInTre4zlF+
	 0g7VrwD71C8qc9+zZW53eHQBh4eHRrAzXLbq0ij3DXWKIHaA4HrwmZKt9LWHwGZta7
	 h9lfLl/wIvrKPJ3/oYX+ZDMEJE8u7umwkqs+kaDHbaJ9a9LkKhgcw6aMFxuMjwYxYR
	 Vlbb+GHAbvyO9pW72+kEiH46uBipgtTaOdlmwLZMrnJsfeHXL3wt/hY4urhdQTVAhg
	 c/FDg5cnPiqbRg8ikYfRD/a3YIpuct3i+KZMF1SIALXZWYPqZcEAogvB/0JwYPq5rb
	 WII64nfbxoRrQ==
Date: Tue, 6 May 2025 16:45:23 +0100
From: Conor Dooley <conor@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	robh@kernel.org, krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org, jonas@kwiboo.se, frattaroli.nicolas@gmail.com,
	andrew@lunn.ch
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Message-ID: <20250506-snitch-entitle-25cbf145619a@spud>
References: <20250506114115.613616-1-inindev@gmail.com>
 <20250506114115.613616-2-inindev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TLZaWWfPrZXx6LHI"
Content-Disposition: inline
In-Reply-To: <20250506114115.613616-2-inindev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_084528_785970_A555C917 
X-CRM114-Status: UNSURE (   7.82  )
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


--TLZaWWfPrZXx6LHI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 06, 2025 at 07:41:13AM -0400, John Clark wrote:
> Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
> produces development boards like the Luckfox Omni3576.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--TLZaWWfPrZXx6LHI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBoukwAKCRB4tDGHoIJi
0q/SAQDnCCu02bLPOAnaomZrDXAhPsG2xZdCE7XnKQqYMekDNwD/eG2b6EcefmUL
uThxnlzlq0vIpzbu+DWhSuzwcbJEtQU=
=lucH
-----END PGP SIGNATURE-----

--TLZaWWfPrZXx6LHI--

