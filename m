Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3FCFEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIOB4IAQILS4ea0lN/SzMx92z4CE/klvhfmUrrzq4FQ=; b=C7Cw9wcugmeSRpShG56ZH6Ub8Z
	Sb4a0g4HhPI10eS0ekkr3yWPoerOJDmnr+4zWRShktX7/4P+e6Z4juhzJOkY7BJMyuBHjxmQ44NZr
	7UINLEN51Lwk9bpo/5BXKZN3DRhycUY/DuNxSpqYQTHmVb4F5we/T6amh9DJ7P8+jJbWzTIhZa2nZ
	xBsqcdibmFk27HACLvrDsTQbzutjgBxjCrPsoNPFtwvJUr/I/qcBdM0KPlBsG/EBFrR3+ON+6FotI
	GOg1GX0pJz9iD6aPcsxMMP6zdP1vWo4iyd3QU144jMyPELPOgzAqcUXjyQMd4E2A/h1Xv4jns5avS
	4C3Cn6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M7O-00000003E2S-1K5o;
	Wed, 25 Mar 2026 11:09:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M7F-00000003Dwx-20hO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B15C043342;
	Wed, 25 Mar 2026 11:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4FCC2BCC7;
	Wed, 25 Mar 2026 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774436976;
	bh=Go7WZ3gcy8Mcy4Q24LtNd7MrJD1wDx22gsVFUUeGqqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ah+bvs5LBZAfoOwUUla6nusmiyaLZFun4TQEf9gwxch8iy9kUhXSiDmYpn1ILo7x3
	 4kHLvwCEQu30TwZk8XREPfUDYLirwTKR8tIHElQ7kBeewyNAFyEBU57cAgX3dMfPDK
	 v4w97PHvWHUPhdl0ntFAM34hVSnyT/0h7OPp331xO6qQnPrRFqayfqL+OIDF7OlOWt
	 nE+8Us4EJGJRAgCF+LCSe9ys5T4/KH9vF8DNFYOoyqK3qPoIGq/rIOJxlmke6ACJ+M
	 DwiWjXBXfDgEe5L3Xvdu2CONgRtl2JoijrqYuzj7NrzSYBLL+lGmwMV5DJY7rEcxB8
	 8v/qh8i5fdoyw==
Date: Wed, 25 Mar 2026 12:09:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: ti: Add verdin am62/am62p
 zinnia board
Message-ID: <20260325-persimmon-mouse-of-courage-bff7e3@quoll>
References: <20260324093705.26730-1-francesco@dolcini.it>
 <20260324093705.26730-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324093705.26730-2-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040938_372513_F5A1E0E5 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, Mar 24, 2026 at 10:36:56AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add Toradex Verdin Zinnia carrier board mated with Verdin AM62 and AM62P.
> 
> Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 4 ++++

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


