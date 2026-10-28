Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2889E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j++9rHNI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgZWipTv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2s8hbBcIbYi5ITvf/mtBJDRTfD2CW57Z/I1IxHbdhm4=; b=j++9rHNIl7lSxHz/Vo7QOduXEY
	bBhK3HnGb4NGhuwjdijpXX03GlxKo7czt+52NdXrt64tpVv8Q/+Wd47Vd7hLOEzjYVdyIp/syXDF4
	oA4T1oARCrnD8kNu79NQDFgYS7XXb6Q/EyFgmLh+7JhtdqVMKlpoNR/Q/3svDyRlH6ZYDtQG86sTC
	BrMqtsqQ97cpDg4ifabTvr4XW2TMguFfLtUplyhfblAzcKB6O8ky9vF80SkpTguNVNyNFsH+6TK8F
	C+fgesbVxFlQn8K4u8i61fMh3oQk0t9xFc61C8ssZ67Boz0/hCKU3whetn+cHta+hT0tGWAVGW/4V
	ULZ4B5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Ht-000000070HW-2Xdt;
	Wed, 28 Oct 2026 13:01:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Hs-000000070HN-06o8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:01:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77194600C8;
	Wed, 28 Oct 2026 13:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2AE1F01825;
	Wed, 28 Oct 2026 13:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192511;
	bh=2s8hbBcIbYi5ITvf/mtBJDRTfD2CW57Z/I1IxHbdhm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GgZWipTvEB2/3Zvj039fdzq9q108ATG0cgEAjSluQmUkmz7AUaZhdRhlf1zAfjElz
	 W7VIXrUS8QKRtAo7Qjn15vUqp1VwdWFm69dHU8rG/A7S5Jdu+vJRh9r110TKuy3OzT
	 mDJNfL0xDSErMr33tXEr9AblKxBv0zWtuFC3K3aRwuCSMhhQT/MHrvArSPOoGpTGS3
	 zLlMK5ahRNcfNd7Ax1rc3PT//9SlaoxWgmCthVYVvUTEO8i5XEj+/Z10VRjDw1Vgob
	 uFIwY8y2BFv6pp3i8nDSCOsNLM2+XXiUDgArFxD/igAvYlEb42Qyg3INFdBNKLlAnB
	 Lp/t7LaTW4mZA==
Date: Wed, 28 Oct 2026 14:01:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Khanh Le <khanh.le.xr@renesas.com>
Subject: Re: [PATCH 01/11] dt-bindings: pwm: renesas,tpu-pwm: Add support for
 R-Car X5H
Message-ID: <20261028-phenomenal-delightful-cicada-eb7bbe@quoll>
References: <cover.1793026273.git.geert+renesas@glider.be>
 <8b2c7719c301a445891fc6c5309456327ec8a94c.1793026273.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b2c7719c301a445891fc6c5309456327ec8a94c.1793026273.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 03:55:17PM +0100, Geert Uytterhoeven wrote:
> From: Khanh Le <khanh.le.xr@renesas.com>
> 
> Document support for the 16-Bit Timer Pulse Unit (TPU) in the Renesas
> R-Car X5H (R8A78000) SoC.
> 
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


