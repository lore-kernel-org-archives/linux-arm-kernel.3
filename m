Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CFBCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaUW8w7YCOLdmqJMPsi0fOmvKVPBIiExCUVGJcBWXiA=; b=zCmt0Bk8i4u7LuOJ3E2AA7JUlm
	WoWOS6eDsndsfKUTenn9IGraxWN/XEQ75sZQDYMBNpQKLM3pBja84PhYE93Bx7NqtfrD48GtGdvGT
	Qru/xfJdoONn+61P4cSV76CqjF1bUbLJCik996fUOEmlSW4+4y/VDpT4Rc32NgVMiLYtn6ocmfPeV
	A1AIQubWfruMjHy65L0qsx75UuR/MoTthDrbjYG/DubVeCpPhkQm8DZ2eNG2/9iMe8K6EowzE9/Mv
	lJCcMnITvCAFWPIJ0TYCWeBtQ33omG/gOU+hhf7dq4ODdq4DziaCQVeYhN7bEu57WZdKgM1S2FbH6
	Gfp4EAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPlR-00000004jlP-1CaX;
	Thu, 14 May 2026 06:41:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPlP-00000004jks-1Zhi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:41:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8923C4382B;
	Thu, 14 May 2026 06:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11D7C2BCB7;
	Thu, 14 May 2026 06:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778740902;
	bh=YaUW8w7YCOLdmqJMPsi0fOmvKVPBIiExCUVGJcBWXiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXJcqPvUUBlQv5k1gBfu0VVCAn/D7q76eneiWoRKeq6dlpC9pMSXbCIlVwYmA97MU
	 r5wEiH9re8D1QbCA08KyImQZhpHafCe/v1IRzCFjynHIryafHFoCyqbsRbC2oSKU/C
	 pJIWrilJ4gQ0j9p3ixKPdB+UWBO+mMaT1rjFuMUntaHAMuvnPhsKWEQ+dJZDXk+J0n
	 35glokJki8vFnkKDYFFaL1qo2A8yoeVJ2VQJnQk0UiyYkc4WWYTXGDMA0xV/ELGuPY
	 cMevXEDbMubsw2CvJg3YAORUkWlmdec6HNwqwkX7lZbsVmJ5H2/t1gtLzp5BAyLp7m
	 gmkALpl8rnftQ==
Date: Thu, 14 May 2026 08:41:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v6 08/10] arm64: dts: lx2160a: add labels to thermal
 trip-point nodes
Message-ID: <20260514-kind-antique-ocelot-d34abe@quoll>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
 <20260512-lx2160-pci-v6-8-d0ff72d3c983@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260512-lx2160-pci-v6-8-d0ff72d3c983@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_234143_438474_873A9C39 
X-CRM114-Status: GOOD (  10.54  )
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

On Tue, May 12, 2026 at 04:39:03PM +0200, Josua Mayer wrote:
> LX2160A SoC dtsi defines rather conservative thermal trip points,
> alert at 85=C2=B0C and critical at 95=C2=B0C.
>=20
> This is okay for most boards, however the SoC maximum junction
> temperature is 105=C2=B0C in both commercial and industrial version.
>=20
> Industrial grade boards need to change the thresholds to avoid premature
> thermal shutdown in high-temeprature environments.
>=20
> Add labels to all thermal trip point nodes, enabling board dts to
> reference them and modify properties.

This is dead code or no-op. Labels should be referenced, otherwise you
are changing here nothing.

Squash the patches with the user of this label.

Best regards,
Krzysztof


