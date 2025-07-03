Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB4FC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UCy4q5xKcMwftiWM7kw+wZbHrxfZ9k+97qP5MAETPY=; b=PL/LRop31g40oq012Y+4KnsVeO
	mqKW0xx0I808+V0VqIlRlnNN4+ZmEn+VpE05woxISwY0VzZN25KoZCE9kkRpROyFLDJ2tonL1oiMZ
	kQPH7Cnm7m7hn2pCQcoMIM421f+03lnNH8qih1eK+CO/92JHC68jC/tN4nPV4AjeVlHLzajBKG6UX
	SsG69g7sq2Sg/HeypDpGA9H/VfIH2OSsiPYxpJcNDUe+0cI7l7DLeIxTB29p5fRkyFA37lkKRA9ui
	4K3+lVHSPqtTsglgJddst4zWhGjqzYrgWEqe8XOIxubXDNbhvWA7PdasZv21Cq7EGCMyvUZd3RAVK
	DkNDrSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR0B-0000000CUHi-2bgv;
	Thu, 03 Jul 2025 20:57:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM7Q-0000000BsPZ-0Pqa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75EF45C64D6;
	Thu,  3 Jul 2025 15:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3FEC4CEE3;
	Thu,  3 Jul 2025 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557499;
	bh=bY+Xljp0l6L+Y1+hUN3hWFShFUuv2QI+G4X/M1K7w7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eM1gWYfQIkW+fVVPM2em1oRqEQ/5mkowKAFrekz9Er7UNVQHAHduRnaOvLJDG8Jrs
	 dKaYD/l77Of5i9e2mRm+KRWxxPiMfL06u7VujnWsgHELUb0yyGJLM8+IqkVaGe1scO
	 Sw34WtAk+30NA/4zVKXXwJ2cPb1+VXaL67PMYLeGBid43RU4p/RFvm5sHqFAqGjITy
	 +QQ4m9jnmjDxVTK1fSP3kBacVuTwDg2Jm0I1dzZW8Y6+yig9owsNAOFTvnataY97m7
	 c+d55bQipQdEo2ncbN3fhEhPRgCEMIkOFJxuvNWgUDQ+DqzLPWGnGiue5EqTlKVrxl
	 4d5IzBLs5iB1Q==
Date: Thu, 3 Jul 2025 10:44:58 -0500
From: Rob Herring <robh@kernel.org>
To: Meng Li <Meng.Li@windriver.com>
Cc: krzk+dt@kernel.org, linux@roeck-us.net, s.hauer@pengutronix.de,
	kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev, shawnguo@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Message-ID: <20250703154458.GA1470571-robh@kernel.org>
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-2-Meng.Li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608030616.3874517-2-Meng.Li@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_084500_175563_3751CF3E 
X-CRM114-Status: UNSURE (   8.22  )
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

On Sun, Jun 08, 2025 at 11:06:15AM +0800, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied since this hasn't been picked up by the wdog maintainers.

