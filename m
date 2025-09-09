Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A36CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obcEsUMNT41HmKlq/F4o2va7yeuwFKc2luR4LLZxcbg=; b=xDnGCqcdiv47+CoxoQ3L9PKD9r
	0xX+VcZI7V9IVjwAji+nqFE5qOHCMyijoElV7Lt/y81oFD+MdzSeITrcGI6wPUGT036WeCNc649kM
	6N+6ZiNSTseG/mwL/OdwmbK4seyGWKCWH1tNYSlUpNh21QOFceo1izbREQtwVWR9G8C734TEfmTTj
	VWkELiKiTIeMn2Ro9OHowc3lPmTx6iLklJg/Dez0te7RqYH4gRrzoqYsFHg21Tpda2Pey/5+fhF+h
	2sWok7BthE/TCADbO1Mb/eeAFHtbsGqZwvYxjLziLHNBATt6QEjfnHLiSH+2T4fTLxohBiqJIUAke
	pHy77rKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtN1-00000005R57-2jPh;
	Tue, 09 Sep 2025 08:06:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmTj-00000003IIf-1pmf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 00:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1366A43408;
	Tue,  9 Sep 2025 00:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE810C4CEF1;
	Tue,  9 Sep 2025 00:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757378698;
	bh=U5Udt4w7yPFZCT86OGl/Ot0b/JCIBL+lIFPb2Y9M3mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFz8lzgqGVfGRr5nutYDK/3Kh8HMv+XMb5BfgLSQEu0yDv3DNZdB3+h8q5tctyFD9
	 z5t4FOz4PRe4sjNaWr5XnKYHoqxUX6nJKqBEBrwTqe8EoDsG0N4wzFzeiIuBe9msM6
	 ikBy20p3NPYTQLPUX6bbLH+q+nPxwY7JcSsz5wQwGFaaTrnIEeymaaKlcwMMEEBjs4
	 cAEcqR/ULuIffRnK28Gq2lhmEz0gN11/ruIVWjopQKvvMfJfMYpBkKLUrSj942qso7
	 /GYEyIkkoHMcFYjVtI0XLiDQBAWElJy1lR04j77LSlcwqX2gEIRG7rODy9cvbkvcWW
	 emrAeX3JwQDwg==
Date: Mon, 8 Sep 2025 19:44:58 -0500
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andreas Kemnade <akemnade@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: sy7636a: Add missing gpio pins and
 supply
Message-ID: <20250909004458.GA2311693-robh@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
 <20250906-sy7636-rsrc-v1-1-e2886a9763a7@kernel.org>
 <288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
 <c879f3e1-f64c-4cbd-97ec-646d06488d8e@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c879f3e1-f64c-4cbd-97ec-646d06488d8e@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174459_493827_25D4C8D5 
X-CRM114-Status: GOOD (  12.84  )
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

On Mon, Sep 08, 2025 at 03:34:00PM +0100, Mark Brown wrote:
> On Sat, Sep 06, 2025 at 02:01:25PM +0200, Krzysztof Kozlowski wrote:
> > On 06/09/2025 11:09, Andreas Kemnade wrote:
> 
> > > +  en-gpios:
> 
> > enable-gpios, unless it is something else, but then please explain in
> > the description.
> 
> > > +    description:
> > > +      If EN pin is not hardwired, specify it here to have it set up.
> > > +    maxItems: 1
> 
> It seems reasonable to name the property after the pin on the device?

Yes, but in general we've standardized on reset, enable, powerdown, etc. 
rather than all the possible variations of those names. At least with 
'reset', standardizing it has bought us the ability to handle it with 
the reset framework rather than every driver implementing its own GPIO 
twiddling.

Rob

