Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rXHKVfYE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8foUJMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jdyq0Zfmu33A//X/4Q8SrSfQyWMMoDDtV5zWpBiENk=; b=rXHKVfYEKmm8oKPBeIQaWsPR87
	N4y7vI/jQ2ig3BIBsi7Sr/dpIBn345yU6yuHGmSSXC7kOCSNkvlOiRPr6TnO3iwIhe37RI+4LZ3/E
	UvDefqmDGG+xGBlSfTB4kKmb5InBRkwpPw05bOzlonV/+XiAVgOYB44G5GpC1fvH/wUInZkZsYPpO
	9kvmLa9QZfm7Oze2aMnSbKO8jVMDKE1GTjjt/fbE6B6POUPa27OhaOzoWbYa+BR0Zj/MamZ7TUGwr
	cdjzntQVjl6Bf5cLskfY2hVI4wODwQEX1XrTK3JA+viU7nQ2Gz9Cm7+LbWHn1XCSt2+JxbpBqc3jH
	Ri8BPIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCiB-0000000AB32-2RYS;
	Tue, 20 Oct 2026 16:29:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCiA-0000000AB2U-0NaQ;
	Tue, 20 Oct 2026 16:29:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19F2E601F9;
	Tue, 20 Oct 2026 16:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7161F000C4;
	Tue, 20 Oct 2026 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792513752;
	bh=+jdyq0Zfmu33A//X/4Q8SrSfQyWMMoDDtV5zWpBiENk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8foUJMUqu5P8nKNaWlNLtBvXMXfnCOSwrfbCydwXzOCOwyOLWOebj+1l10GTer8h
	 zsAEyQyGQeia0G4wyPi8tP1/HOz3S1r6tDqL0O0E+QAaxHrxPasJbjvusut16walxr
	 2LyYRwbJnG68aDBb+FHDuG2OVSWQfJkotjPte4vOcuw+eISVmy0eBtTPL2Mz4eLmKk
	 aidzs3wwJ0pkxCpHds+sahsI6kBunz76pRCaGuflKNYQ/kkZ5XJlFS2UGfO7rcRBKR
	 d5Dd+DhMu5yPj6Lhbah+g+UMaR3fghb9giemCvasfEds9TP68TCT0zTjQU5q2mkom1
	 GaGDfgsY9luRA==
Date: Tue, 20 Oct 2026 11:29:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
Message-ID: <179251375007.3988760.929772865298588176.robh@kernel.org>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
 <20261020-upstream_pcie_rc-v10-1-fba209af8656@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-upstream_pcie_rc-v10-1-fba209af8656@aspeedtech.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 19:59:49 +0800, Jacky Chou wrote:
> Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
> The PHY provides the physical layer used by the PCIe
> controller when operating in root complex mode.
> 
> Describe the compatible strings, register range, clocks and
> phy-cells value required by the PHY provider.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


