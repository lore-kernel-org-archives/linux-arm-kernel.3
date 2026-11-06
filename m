Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40861606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Cp21gFp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+PWisuf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=++HBOF+kCz+VVIlw+glqyAPaVDTlCd+VNyUS7SFDn9s=; b=4Cp21gFpyPbb5PhFYGFPW7/Mvq
	qPcr3ODSSIN9jcrFDL32bxs5R6IFv56ZXvvEcR5prZtLR+/ZnNYtJFQRk0a6gqzfDJaU5OBGDJup1
	klxXjM4aeQdBHI3MVSuAhIZFDO57Xx+ruAVpCPRHHAAiaa2KMcIshIWEo+Gitj3smVeNGS85cW29V
	vhapQfn2PRDqlUsYnvt1pdQCkqaUTThW1pPesNuX8jASuZ+qP0vcsLW2yKcu/jGYsjRXbNQsjCxsL
	z84Pl1JhCfpHE8udvYTCe6JdBPejhVH9Ouo4F2BfYb6a/bhUPvIPxLzvn4U0e7GVej4NOVf/4A96o
	E+LktmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHlK-0000000C5ai-1REm;
	Fri, 06 Nov 2026 11:05:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHlI-0000000C5aI-2JVN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:05:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5114441497;
	Fri,  6 Nov 2026 11:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2321F0089F;
	Fri,  6 Nov 2026 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963136;
	bh=++HBOF+kCz+VVIlw+glqyAPaVDTlCd+VNyUS7SFDn9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f+PWisufDn/+cGdsVe6bPdVS2FsYQ4HNnxCFh1lFNx+plNeuH4c+bqPA6eDWJyjjL
	 H2hmVoDWMVCvHzV4IsLCvcrK9EFb166aASX7plbBp6TkgoD5wi4G/s5VMZmEZUZUR5
	 AHg3gTy30MKBaNeeRYRpvv+B0uygvg74trdBWKiH3tPq56xIcDZMizoHvoqm/gmZbD
	 p8O/ImiDuPB7pGsEw45Im9BZcA6JrLs/t/jIZHIg+28QRCNdN8WlnbJw/WvARMj1kj
	 Fj39HAslJ8IwZQz+0fRT28JaLG8jYGh70z92bN/HKqXIBXq7d2afvSWr2wpc5kdhRt
	 ipLHae+l/Uxgg==
Date: Fri, 6 Nov 2026 12:05:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 07/16] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
Message-ID: <20261106-rainbow-eagle-of-climate-f11b33@quoll>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-8-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105110715.2486432-8-ada@thorsis.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:06:43PM +0100, Alexander Dahl wrote:
> The OTPC requires both the peripheral clock through PMC and the main RC
> oscillator.  Seemed to work without explicitly enabling those clocks on
> sama7g5 before, but did not on sam9x60.
> 
> Older datasheets were not clear and explicit about this, but recent are,
> e.g. SAMA7G5 series datasheet (DS60001765B),
> section 30.4.1 Power Management:
> 
> > The OTPC is clocked through the Power Management Controller (PMC).
> > The user must power on the main RC oscillator and enable the
> > peripheral clock of the OTPC prior to reading or writing the OTP
> > memory.
> 
> Confirmed by Microchip based on vendor internal documentation (see link).

Your commit msg should mention this is ABI break and its impact, e.g.
Linux will stop accepting existing DTB.

Best regards,
Krzysztof


