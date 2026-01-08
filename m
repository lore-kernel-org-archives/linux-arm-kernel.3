Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF0FD1489D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 05:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HTw58LbbRBmk04pgi7jyjScM20PkaliJVCu22kzXsE=; b=sXNnGrqk24N1p0Qh2i4/9RA9Ze
	y8ftohgPfh3y24+B5ajTMGRp1Aw/KU32UjiHIIzRjtthpffjMCeSi1A6rvWc1JF3aAYgMt1aXE7/F
	9oFaTErjIMrg51zMrMnnZmsYuIwjBvLGV5lj+mKRKwmRhn1L4BiWXzFzxCtsPoL1hQdkO21BpLnA7
	bKsRkKhbfASsAWEaM1YOU80jo1/MbwPZT1FgbwU/WJklvHYCXQnFgNS8IeLsXzDWBDKucbmDlowR4
	asDwETfmQ0/fJ0ywzue0RdlnbTava9o9oBBzEVgNQo6rmDVmDIljRnL7nSlQ05PAeeyQqySmQDyV1
	Xm7oKAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vditF-0000000FxpK-35k6;
	Thu, 08 Jan 2026 05:48:57 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vditB-0000000Fxoy-462H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 05:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767851327;
	bh=6HTw58LbbRBmk04pgi7jyjScM20PkaliJVCu22kzXsE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IsBBA8QFvLxQMVHzF30vbYakhUQgQIaJSTm+nogeqVZl8imjICmyV7Viw/C1K8rvk
	 q0iIVLictrI0z3Oj+xYAHAsgJeqm+rZk53fWWjD1TFwKfxij7eBJgXuTR05FsoH8FQ
	 w0xQSBp5+ILvlonutMkNruM9LFu+3UsrGysq5tlCR4jI7Yhz3RhdFqvpeUkIg5s84T
	 7dEI4YnpbIy9s2aMdefrmwzVXOqw6/lHYMAZzYFfEmR0oiFXTwnDj/XXTsrfygF9gh
	 ugISVJF+eZ7a/MCxwZ6WMeaBUCBudSoOFsLPEnro+N4KSC5oEJZHPt4qbvTyke8s8l
	 0d/eYoRL3+I4w==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 68BAF7C834;
	Thu,  8 Jan 2026 13:48:46 +0800 (AWST)
Message-ID: <61e23c80136a6fb5bac79887f24399fd0686157f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add ASRock Rack
 ALTRAD8 board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tan Siewert <tan.siewert@hetzner.com>, Krzysztof Kozlowski
 <krzk@kernel.org>,  Rebecca Cran <rebecca@bsdio.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, Conor Dooley
	 <conor.dooley@microchip.com>
Date: Thu, 08 Jan 2026 16:18:45 +1030
In-Reply-To: <b10a233e-02c3-4b02-8f11-098f6fb8197c@hetzner.com>
References: <20251218161816.38155-1-rebecca@bsdio.com>
	 <20251218161816.38155-2-rebecca@bsdio.com>
	 <5aa36c56-798a-40cc-b0b8-be3f7c92136f@kernel.org>
	 <b10a233e-02c3-4b02-8f11-098f6fb8197c@hetzner.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_214856_167192_9676BA58 
X-CRM114-Status: UNSURE (   9.37  )
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

On Thu, 2025-12-18 at 17:44 +0100, Tan Siewert wrote:
> On 18.12.25 17:21, Krzysztof Kozlowski wrote:
> > On 18/12/2025 17:18, Rebecca Cran wrote:
> > > Document ASRock Rack ALTRAD8 (ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q)
> > > compatibles.
> > >=20
> > > Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Tested-by: Tan Siewert <tan.siewert@hetzner.com>
> >=20
> > How was the binding tested?
>=20
> My bad for sending the wrong trailing header in v4. Tested-by should've=
=20
> been only on the dts instead of the dt-bindings+dts.

I've dropped your Tested-by tag from the binding patch while applying
the series.

Cheers,

Andrew

