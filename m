Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7276BC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 23:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BO+8gUrMYtjwhGtLnfcOVQRae2UvKhRyXsiVHIp04Yk=; b=ZtyilL/1Co9qLJ+AyWscaqHmq+
	Jbob6Rqh+pfcPzcXu+ZoQB6n3C3dgCU/VEWHAtTvDm6Aj3sbfRxv7GGpZurQLvVPNeeNd0RLPQ6QI
	10tX6Dlrg99wt+1Qafa0FS+L1Hal2AFPmq19/FI3wcha4+cOzxfnl5dn2GeXsh7/zQzAiK9q7qUTh
	L8Tcq1Fl2ypZJhtpeKJulqAFNFIPfMbVbiA6DmQWrtvpRktnjx36lnLFVTKOGjbH6ghf1gfa313/+
	sBBdYQL0hM4NyHvw+MII8DSR+nH3nv1dK32WyTkVBKqsZPyt10Tg6Y2f2N+aFYcjiXITFun6yrqT7
	GFXpwGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCkr-0000000DLYx-08je;
	Wed, 15 Jan 2025 23:24:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCik-0000000DL66-1Oxv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 23:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D410A4264F;
	Wed, 15 Jan 2025 23:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01311C4CED1;
	Wed, 15 Jan 2025 23:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736983365;
	bh=BO+8gUrMYtjwhGtLnfcOVQRae2UvKhRyXsiVHIp04Yk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LDBJyv1xAPiQ8OCfWXU6EpFIHgkh4MEsISk7KwOyyjt1uaMJV5hcdoZlPFsh+9EWI
	 26C1r2GsMdvncAHrRzi9Lj2IpoVa4BGyiLMFEl/xtK8fR3CitwTAEOlmEB4DuOJrnf
	 rqYKoOV2PKZv5qO8ZB0HhFLOV5FT9k3wjUpvS2S+AjHiMLFrQnwYTbg9vWYvqIlI0I
	 PQX5jnLvq1Jv/gTn5PVJwoEQky/DLlNwyeyYuTTFbfcV3D2ayHun4mjXlEtss3Ae2n
	 /JapwHKSEw1o+qyr5p1yHmQSe3JocrpIsN8psa/wDyd5/e2kCBj0YrMM4cRhnkrQXI
	 RaA75ETzeAmcQ==
Message-ID: <aab7227a048a822ba7f228930d3a4eec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114182021.670435-2-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com> <20250114182021.670435-2-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:22:42 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_152246_444605_51BB9A25 
X-CRM114-Status: GOOD (  11.01  )
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

Quoting Dario Binacchi (2025-01-14 10:19:46)
> The patch converts st,stm32-rcc.txt to the JSON schema, but it does more
> than that. The old bindings, in fact, only covered the stm32f{4,7}
> platforms and not the stm32h7. Therefore, to avoid patch submission tests
> failing, it was necessary to add the corresponding compatible (i. e.
> st,stm32h743-rcc) and specify that, in this case, 3 are the clocks instead
> of the 2 required for the stm32f{4,7} platforms.
> Additionally, the old bindings made no mention of the st,syscfg property,
> which is used by both the stm32f{4,7} and the stm32h7 platforms.
>=20
> The patch also fixes the files referencing to the old st,stm32-rcc.txt.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Applied to clk-next

