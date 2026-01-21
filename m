Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAFBD262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEfLvXgqnvQqeTtoD3qyMD/hfBd4d1SFxE/aoJkYIfg=; b=jO3XG2KdTwyM4j2kLE0NhJ1J3l
	I8iCgBqcIfj6LjZPoc9ySJ/uxDvrTk1iCOL2z7+PIBj7l6MuAPX3Z7kWqKDL5kA1F9CUht8ShW+NF
	U0RfLvUVN0ToR/zqHG5Zj7bvGChUqeQ9j6cJrfSXl4A4kjzblY9puo6t86bVvPFiwfyPCaqt38LLE
	DhnQ7IRdnN+MBs/emuzlrkNSSoUAd23fGthF4fIsYtXgs2wOdwfZV2YBB7pbOkLK0HPOSIYo+3vEm
	BQcwUwOo63Bv/lXqIT1FNFEcYCw7iG2oZMNGkY5Lc7CE+W+1CmhXXUDJXu3nY6Kd/xEe7E+1kuYqO
	4stfkCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTM9-000000054Fv-1IIU;
	Wed, 21 Jan 2026 08:14:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTM6-000000054ER-0pbC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:14:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCC4960007;
	Wed, 21 Jan 2026 08:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C49C116D0;
	Wed, 21 Jan 2026 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768983260;
	bh=LUd6a+A/qmpOJ4h1J+lALT0u6YXdBVWgT++FjFAtcAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noaZ1R7tUFKK9vwfLJTtv/iJ2yo6C0dn6JZRcFS92NhtVmdIg/BYhAgUJ0h+g/UdD
	 SDe6I+rjF/1g/eig0E0opc/l9nWvM4PYNXrJH9FzBN8t3FEjxqoErfbHssu895OUNq
	 6e1KHmgdtJ8E0V39rWYrWeKw0mRu7d1KRqfUMypq+GMuAboHg2peNMhT3k88pikfLD
	 NklIRpuWvfro/o4+5bjEOMxbRaGmBzklhdauYeAVpnMfOAmlbRyNaySxtW70XG168H
	 IyoLPJF/HMHHLFt5urIGseiyif1aS92vJBJ5xaKyjSlOVQnENiTV46m0iQuKXHvfSX
	 2IIxapw68XDIQ==
Date: Wed, 21 Jan 2026 09:14:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for
 SM-based SoCs
Message-ID: <20260121-snail-of-magic-order-e83d16@quoll>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
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

On Tue, Jan 20, 2026 at 07:03:28AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
> the SM coprocessor. Thus, the programming model needs no handle to the
> GPR node. Make it optional.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


