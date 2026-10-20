Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D6606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GzNEbTNl;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=xBMO2iRM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnKiBHjj/zZJZwT63i24hX+x8FOF0JDz2q0Gba8m/uk=; b=GzNEbTNlAUc+cRjS4wZQfzLpeX
	BUjSDtMs+h1mY+7ouUVYFsWNlI7VKybZC12mJLERtwGaS27/NuF9Ocf9615zvpJF0B+Yuem7SnHZg
	akEnANKXARBiOGWlVaE/A7rUUyCl5oPptYld2KcDvnqYiP5fjQs6RwHKdiqHSs9Fo5GPjwX6sxgS0
	anHQt4DkC+nffxRWH4taCqtjAXzC097KFQrBHEtYVFpW0ZTG1iYts+52BTIgzAoWQz78n8vuaBl9L
	8E+TMy6aGHCAQwtQjTjR8TlVQKuTwITK8tzLYqbi5W2sg8oWscRZy6sNmSYdQtaSONRKcfKX8mKrP
	Z+6PBE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFt7-0000000AZ4I-2XJL;
	Tue, 20 Oct 2026 19:52:45 +0000
Received: from mail.andi.de1.cc ([178.238.236.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFsW-0000000AYzH-0tbY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=WnKiBHjj/zZJZwT63i24hX+x8FOF0JDz2q0Gba8m/uk=; t=1792525928; x=1793735528; 
	b=xBMO2iRMixj53jeD3tMPJdBRPRe9c5Hhk7aqRJyHNVe/laJb7/Bffr66vyMENUYXs8/W7p52NzN
	bDonnfKoNkdcDm7lPlOIQ3OwKyrLu2vQVCFUD/8gvEpzeTePaob129nl+3IQBonMWqwzPFn4CMYmn
	OskBlrJTbi5R7LBVRnGWn57fYTdHPk+hs/C1EgnnSxfl/1IGP28o6C92kCZ6bcnQQqnl/huj8z+Ei
	5BsHOMtz7RiNhn//Gp8S3Mx/MmlgF748NNDq/r2qTV54ZE1x9/awcs5idyy1OxsIPmX6cTNpSs5DX
	aJFvum3YH11AaErtPlzgPpf5vbVhQrEyrrHw==;
Date: Tue, 20 Oct 2026 21:51:43 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Walmsley"
 <paul@pwsan.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christopher Obbard"
 <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
Message-ID: <20261020215143.7dd0ad5d@kemnade.info>
In-Reply-To: <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
	<20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
	<ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
	<DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
	<46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
	<DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_125208_260807_B78196B4 
X-CRM114-Status: GOOD (  11.03  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

[...]
> Sorry, does dm814x.h not look as bindings? I'm a bit confused.

probably also not the ideal placement in bindings.

> FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
> Following 
> 
> Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs. 
> 
> For a better solution, you would prefer:
> - Keep omap.h in dm816x.dtsi
> - Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
> - Replace defines in dm8168-evm.dts
> - Add the header in dm8168-evm.dts
> 
> or:
> 
> - Keep omap.h in dm816x.dtsi
> - Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
> - Replace defines in dm8168-evm.dts
> 
Hmm, there is dm8168-evm.dts which uses PULL_UP / PULL_ENA
in nandflash-pins. Do they factor in this inversion? Do you have that board
by chance? We probably need to take the brush there anyways.

If I had my head in some OMAP3/4/5 dts files with non-prefixed
defines, I would probably not object against any PULL_ENA without
DM816X_ in front of it if I am not very awake.

So better do the undef and not use DM816X_ prefixes there.
Maybe rename that file to dm816x-pinctrl.h. That is a bit
inconsistent with the other omap files but at least that inconsistency
can be catched by the compiler.
Other arm32 platforms have things like e.g. nxp/imx/imx6sll-pinfunc.h

Regards,
Andreas

