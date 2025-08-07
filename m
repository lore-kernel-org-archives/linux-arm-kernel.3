Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7B2C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Lbxqf6/CNfYbxwExDCoo3uJIOj0YFPbDWdDOOzBd+0=; b=UzkuEmChVZOhSwiOnWEaYQh89O
	CNAmd/LibXbZmps/haaw/eAw9vTqxzbsw/ddUWU1loLtBNRzDyW0pBBA6BP51V8DDe0Mc9epq5ALI
	jBkv0pACmCpQG+AhCrsDxM2UBaIOKPiCXySpjN5VksMKDWNx1og9M5y65kQIUee7LDRluSEwKvs+g
	O6zSgAidDYATZvTppC5p2NLvQ+Bdrdle7ucQ1MFNqujo3Lx+pB62m2oAcWkkm9jDr/1ATS6InqtC6
	fM2UcQ1WMvYRqBxYhZ1CJViMzxzy0IGkmUCWXMAx3icFHmAVvd9HM5k9roPFxRALrkfCO8vBTSN8P
	3jEU5kTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujudb-0000000HPsk-0npT;
	Thu, 07 Aug 2025 07:02:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuZr-0000000HPGn-2KcB;
	Thu, 07 Aug 2025 06:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14C02A55811;
	Thu,  7 Aug 2025 06:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295B2C4CEED;
	Thu,  7 Aug 2025 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754549893;
	bh=4Lbxqf6/CNfYbxwExDCoo3uJIOj0YFPbDWdDOOzBd+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LP3KnmTsJ4qGJUkalbyFcJijelz6GMzVGQpnWnmLXSurp7VH0OhgS8lu531eKvWYq
	 VslWvZqel4mtXyc864qUuHh63fHF6GYmgl8qQDjOB5GTsrsP8BndJ6JRc2yLli3Tih
	 k6lJZHVZVW6zcZ4gi3s86ADgfInhNM27RINr2UcX5wByJbgyaNB4wYbie3EEISfN8P
	 uRE//alEFxenHMiFBR2g/YQs95fDhEsJ8vPT1SjXtrXHOUS8IYA3O1tLXYhInEmF1/
	 7iomM0GXm+ou4Lp/6u4PZZUYkJThMmPsIn6qaY/PC6+CmdSTLqyNq12WKlrRncrLJB
	 6RNKYRG3Rhw9g==
Date: Thu, 7 Aug 2025 08:58:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, richardcochran@gmail.com, 
	guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v4 09/27] dt-bindings: clock: mediatek: Describe MT8196
 clock controllers
Message-ID: <20250807-smoky-mature-eagle-a0feae@kuoka>
References: <20250805135447.149231-1-laura.nao@collabora.com>
 <20250805135447.149231-10-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250805135447.149231-10-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_235815_666502_5FE58F5D 
X-CRM114-Status: GOOD (  12.11  )
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

On Tue, Aug 05, 2025 at 03:54:29PM +0200, Laura Nao wrote:
> Introduce binding documentation for system clocks, functional clocks,
> and PEXTP0/1 and UFS reset controllers on MediaTek MT8196.
>=20
> This binding also includes a handle to the hardware voter, a
> fixed-function MCU designed to aggregate votes from the application
> processor and other remote processors to manage clocks and power
> domains.
>=20
> The HWV on MT8196/MT6991 is incomplete and requires software to manually
> enable power supplies, parent clocks, and FENC, as well as write to both
> the HWV MMIO and the controller registers.
> Because of these constraints, the HWV cannot be modeled using generic
> clock, power domain, or interconnect APIs. Instead, a custom phandle is
> exceptionally used to provide direct, syscon-like register access to
> drivers.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


