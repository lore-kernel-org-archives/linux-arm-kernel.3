Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D53FF01812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+9eh1GKoXKvN+iTRb5SdTdHqhmPyo3KOrf3w38LGgs=; b=JiXYbGYz8ikI7BLD+d4q44bM8A
	wvIkq0C0JQBRdmq4LZa1w/bmQS1Hj20oN6v2XEBCmHkfzmG5zvy0fWmS2D5ET0boDbYqJHhckDISn
	QlX2NjuGtUjEOapQI031X3+HZl7xv6ia029P6TaE6jotiJsaiV46RSyHKCVBVi/qmkPSKMdM6965J
	nlY6DhDw9Ar78B//G2X2nOIjlU01boCtaT9zZ1WlSSaxoc/EcsEpjg6mrA7Up9o7lEfDqrfDS+6zT
	mfOqIMdBGPqpY9W+IQz/UtxKGVApytIcL8+V9Kjj5D/JdyRlfFqpGqxFxIWya8gG6D1/UXILzB7F5
	Jd6LGbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQo8-00000003HPx-2Td5;
	Fri, 06 Mar 2026 08:45:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQo5-00000003HPR-2aqt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 08:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4008643AC3;
	Fri,  6 Mar 2026 08:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A931C4CEF7;
	Fri,  6 Mar 2026 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772786713;
	bh=xDpS7E9mTWjhtIwUYMgTXCTt+wHEc1BFGf+VVsdD1lU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJdame2/emJrCIivulXkdE3s+/btMsDNwil+GEaLS2cmx+2r7OiBel0Gj90oU5cB+
	 6xDw/2eQLN23jsHPK7fAlz+f0y57K7a/D5jXI/NC7z+T6XXcocILfT1Ts3tBD+ZJko
	 ijowZzmOH0J/KTi0mhp7R0IoYVJuRYKfHYQagnMrtnAmEEDuqlnZLwNjNSzee1+ngo
	 3Fe0V0dBMskdTJH3QrCC7h0u7/410SAfpfGGb8gc05r0NfCEVl6P3zZEUZGCFQ1Knl
	 RsL2PpPGpPUq0obgrUca5a/OiQiYS+E2Erxr0FwJSP/wxAtobVS3KafB+H7IrEKVXr
	 w2woqcojCaFTw==
Date: Fri, 6 Mar 2026 09:45:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ray Jui <ray.jui@broadcom.com>
Cc: Lee Yongjun <jun85566@gmail.com>, ulf.hansson@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, nsaenz@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: allow dma-coherent
 property
Message-ID: <20260306-tactful-asparagus-cat-b77853@quoll>
References: <20260305234703.38490-1-jun85566@gmail.com>
 <CAJ8Y1dTJ5yNPP8BN46BfDdLAvuWxW+OrZ+P538Bp9+3_6XankA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ8Y1dTJ5yNPP8BN46BfDdLAvuWxW+OrZ+P538Bp9+3_6XankA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_004513_677754_746B00C1 
X-CRM114-Status: GOOD (  18.94  )
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

On Thu, Mar 05, 2026 at 04:03:48PM -0800, Ray Jui wrote:
> On Thu, Mar 5, 2026 at 3:47=E2=80=AFPM Lee Yongjun <jun85566@gmail.com> w=
rote:
>=20
> > The Broadcom iProc SDHCI controller supports DMA, but its binding
> > schema does not allow the 'dma-coherent' property.
> >
> > As a result, dtbs_check reports the following validation errors
> > on the Northstar2 SoC:
> >
> >   mmc@66420000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
> >   are not allowed ('dma-coherent' was unexpected)
> >   mmc@66430000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
> >   are not allowed ('dma-coherent' was unexpected)
> >
> > Allow the 'dma-coherent' property in the schema to fix the validation
> > errors and accurately reflect the hardware capability.
> >
> > Signed-off-by: Lee Yongjun <jun85566@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
> > b/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
> > index 2f63f2cdeb71..579e44843404 100644
> > --- a/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml
> > @@ -38,6 +38,8 @@ properties:
> >      type: boolean
> >      description: Specifies that controller should use auto CMD12
> >
> > +  dma-coherent: true
> > +
> >
>=20
> Yeah for Broadcom iProc SDHCI on ARM64 platforms (including NS2), cache
> coherent DMA is supported (as opposed to other 32-bit based ARM platforms=
).
>=20
> Change looks good to me. Thanks!

Just open the file before giving blanket reviews or how are you exactly
reviewing without knowing what is there? This was already fixed and
this patch is obviously wrong.

Best regards,
Krzysztof


