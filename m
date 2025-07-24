Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F999C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwpMoVkmgfGPuBUR4q/sCj+QtXDfSxqwDeqwR+oEXQ4=; b=BGYXzZKzlbdEWHIA4wzBxEYl76
	uzpMi4YL7+fVkhWK7mKtkxMhwFfg0CFkij+q+cpFdX9DRnP5XL/2KYyipSjl24CZDwmkpieSjqLDR
	xlJIP45j8FTguI4cxTJH6+NUPsfCE+oPzhnQ+eYqcTZpyuCpfbTBrQ4dmanzAGvGMfN8V7CzzOWpY
	LaNkiJisoVEIEN5/7Etq8r/00pmMdprK2dFaFSo+m83Ci/5YUu3Tm1cmUclKy7Q/juLON7iW+TGKr
	0Wkz5kbu6LeT3CevZ/d0M+ek5wTeK6+/rrsRSH4tGNt3GsgR7Ba/iTcx6kf92yEK3D9jx0hM+xFzs
	DKTcIb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMr-00000007YkC-1zzt;
	Thu, 24 Jul 2025 13:52:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesok-000000079y4-0Zdy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8593F442F9;
	Thu, 24 Jul 2025 10:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2773C4CEED;
	Thu, 24 Jul 2025 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753351489;
	bh=dB0n0iSlVZ5AKtNK8uk2suHWKAUZYtSH8+sIis6kxPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqEpHWvhKPb5HP5ZjhOtxwslFq30VBcABOjHySAM/pVyUJ6thjQEXU1bWF14+ivH/
	 rpo8sPAh7IlUvFevGMUhHewRr+36+ym1469hC2nAHX5k0vsosJt4TQSkU4bSkqhBRq
	 RzmOLP03dBsVP7RO9ORiRrFwJxYWATBmqfASFK2aATfDnZAacb5cEBNy+GM/DYP1uD
	 lw7iL2I9kaLr9cem28LJnw5R3MnT87C1pMyGpIdFBs9pvyxKZUEG9YJnlXUs+1YIPy
	 v24o66zSZ6ok7ZfMp+6OKc9NCE29+3eF6CdH6HUW1xHy/EL6pdLIhKIx5KtsjQcysC
	 3WqIDbQWfoTLA==
Date: Thu, 24 Jul 2025 11:04:42 +0100
From: Lee Jones <lee@kernel.org>
To: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, o.rempel@pengutronix.de,
	daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
Subject: Re: (subset) [PATCH v8 04/10] mfd: at91-usart: Make it selectable
 for ARCH_MICROCHIP
Message-ID: <20250724100442.GX11056@google.com>
References: <20250702183856.1727275-5-robert.marko@sartura.hr>
 <175325995961.1695705.8338983998485530536.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175325995961.1695705.8338983998485530536.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_030450_192725_57037710 
X-CRM114-Status: UNSURE (   9.97  )
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

On Wed, 23 Jul 2025, Lee Jones wrote:

> On Wed, 02 Jul 2025 20:36:02 +0200, Robert Marko wrote:
> > LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
> > avoid needing to update depends in future if other Microchip SoC-s use it
> > as well.
> > 
> > 
> 
> Applied, thanks!
> 
> [04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
>         commit: ef37a1e2485724f5287db1584d8aba48e8ba3f41

Reverted as it caused issues in -next.

https://lore.kernel.org/all/20250724115409.030d0d08@canb.auug.org.au/

-- 
Lee Jones [李琼斯]

