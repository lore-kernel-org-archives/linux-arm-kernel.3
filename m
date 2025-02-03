Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA08CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEHI6fKlstrD1dJJta8lfcv3fS6nvl35ceffKmGLfis=; b=BEWx4CCXNCUeUIX3D3F8pSfbAr
	JttLXgYgXyNyzU/dh+mWejfOHWwc7Ph371d9l9ZLv3Zlnvkm7RisD7UyxpJkWxDmkUJUJtbNNRf0t
	zWkjwcgv7dsm4Xi2BWT2EvgUkWn8ZDwpq079bQuW1BjGHqnqUIK5ffNZ01Y9dMEXoqLEU8nDNMT2S
	QX2VVeuQkhwYKcQhky1j5Vf3hhXnVDIrDe4UM18dvd/lGIuA73nt4dhAMPhDiickeCLkxkyxYN98+
	6M1IhDtSwJvzGB0GuGWdsJGi6+ePzyC79MvWPhgKPoI3B/h884vL+eiG8w3uXQdo42QNrcuKsLfoA
	hDcUoy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1BR-0000000GFtV-1xfL;
	Mon, 03 Feb 2025 18:28:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1A6-0000000GFaU-4A3a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D820BA41ACA;
	Mon,  3 Feb 2025 18:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876D7C4CED2;
	Mon,  3 Feb 2025 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607229;
	bh=U9fT7WD89sfXHwxYnXo6/SN52jUszCmb683sKFOLaTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgoesGlMCmPx1BC54ufGwzTD2FALfRfXi6oCuNPuoPlom7+NSd/e08vGzJ80tR8Wy
	 3MIluTD0xy9E55SGaGohE/d/tdrmb33QUvg3aZjGXHMW41Og2ZR7Venbe8IP2ckzgP
	 nf2o1aO9jUCMQhKknv9rnO0jSD7wEVW4FRqULNxONC0k1N/kedTNpqksVvMKcvuSBB
	 1sFxHHRj3W3xZHbK9DtzJv1sqDfyPXqj+W+v9q1QdJ6UZM0uc0Z0IeK992jV/jFnb5
	 hPuUoXrrR3bIyG+Ztkrrhi+xRYGnStuTl6mEHm2M1OuW4uvxFxMRb7MM6xmoizWVNa
	 /lLaGFAXgMvGQ==
Date: Mon, 3 Feb 2025 12:27:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML
 format
Message-ID: <173860722807.3351261.2109614863314200591.robh@kernel.org>
References: <20250203091111.21667-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203091111.21667-1-andrei.simion@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102711_092853_995FA3F9 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, claudiu.beznea@tuxon.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Mon, 03 Feb 2025 11:11:12 +0200, Andrei Simion wrote:
> Convert devicetree binding atmel-ssc.txt to YAML format.
> Update the documentation supported file for MICROCHIP SSC DRIVER.
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
> v1 -> v2:
> - squash MAINTAINERS patch
> - place this yaml in sound directory
> - reword the commit title
> - reword the commit message
> - add #sound-dai-cells const 0
> - add required
> - include ref dai-common.yaml#
> - fix the logic for the required properties for DMA transfer
> - update examples by adding #sound-dai-cells = <0>
> - drop unnecessary description
> - drop compatible for sam9x7-ssc because is not the intent of the patch
> ---
>  .../devicetree/bindings/misc/atmel-ssc.txt    |  50 ---------
>  .../bindings/sound/atmel,at91-ssc.yaml        | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 105 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/atmel-ssc.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


