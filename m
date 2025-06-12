Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A83C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUQ1514rTDkJP2fr2VTvdf3I8igPZhdPPF6Fvysy6xc=; b=vvu4LGfzOJm7Qtw5jph0LSoQuh
	IYDs+2FHSUZMuNlk2h6Xgv1SdJB7lcv8wLdnd9REoygmsoBcYYph1x8LQGxLyYzLdqqHn0JTdTBxM
	3+dehgAAfgc8TPeNFZ4peGKXzuxwzB282qyLga59YH/qKTl1Y87Xie5SWTfpeSD9wmwrBmNkN6bGi
	eSopYUAwsQvQQBnyEw6ncVgBSModWRkNyLVggf2rQUR1fVClRl4Fi060eh7QJQJdOQ8FfMUBXvBpy
	MYug154+LtRaFGwlUDpkBXFhU7F3s8FCSu1KizbgNEWXfmedfTEpoxP/S0SEES8fp6uYWwhdSQjgi
	XllBFeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcpr-0000000CXDE-1xQX;
	Thu, 12 Jun 2025 07:58:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcRQ-0000000CSXe-1K8I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:33:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD758629EA;
	Thu, 12 Jun 2025 07:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D83C4CEEA;
	Thu, 12 Jun 2025 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749713619;
	bh=eMVf5i/rjXCwUDBunHluaNYVd2aReIzEbyrk/akS6SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIkEpOh/leHSAK/TmibTxoCw4LzvIZXA+elH9JggWfUGlAmGa/hCrKKiqM6/2FZnC
	 fM4ny4Lk2eimLk0NqGFpddofiaSaKKdKHL7yL0eRsWEnnxxTA5eKBUZ2YxZSc7bCmK
	 PnSAbKvcu81kRWQHx2YSELgpC6RfyF+qRR930MEg4sVi0FD1yYXM4tA5QOi+1WrDws
	 rEAygblHNaHdxRJdymugTgajQGLK3z39vXhArXjSdB9YkVBfuTswZFW0Mw4Pf0fZ4N
	 rr8ep5j6M2AKyqxLLL4EvEyPN+eyGSM2vykSGHEVfDnjayMP3ZRNb1kV+IS0gYPUrN
	 N0dUPBUyACviA==
Date: Thu, 12 Jun 2025 09:33:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, olivia@selenic.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: crypto: add sama7d65 in Atmel AES
Message-ID: <20250612-economic-teal-nuthatch-30dcad@kuoka>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
 <7aa1862f790ea19bf7bb55e07ec4b9295c5f7a44.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7aa1862f790ea19bf7bb55e07ec4b9295c5f7a44.1749666053.git.Ryan.Wanner@microchip.com>
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

On Wed, Jun 11, 2025 at 12:47:25PM GMT, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DT bindings for SAMA7D65 SoC in atmel AES.
> 
> The SAMA7D65 similar to the SAM9x75 SoC supports HMAC, dual buffer, and
> GCM. And similar all 3 it supports CBC, CFB, CTR, ECB, and XTS.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


