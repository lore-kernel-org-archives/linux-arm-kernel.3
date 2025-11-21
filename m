Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1738CCFA753
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEwPaGvwHwjgZa/EQNC7gAHIwTUCVi7RCovDNgJxsho=; b=37XiLl5+Zdi4lFTXqhRAet6cQV
	m3Q6M2OPGBiNBt6b8IjhkpW3ue4vKvspxcJxgBWBl4IKFZ6QrVLsuDTXldCsNRtThGq1BUQtFll9q
	esYC3hf1PskpocyTvScDeGKgVC+EdAX4edMqX4KLKWem4OT5eG4u8VXvlnBgzMn/+dV1sx7fc+Dp7
	c4OO5/w48xnN+4cZhALjeqHVWr0MRE7c3Eh3yvdYw/xWtXJLOMqk1RIlddmaT7ld0qFE6XWs1W1Ks
	URAp7HttAuZDH11Z2FGm5gPGBzJwZBPyh6qn54B4P5Xi1LtHXp4Snod1GWDxdBoO4AFhNlEG50yl2
	FMfHi74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMN4S-000000087bP-0nPz;
	Fri, 21 Nov 2025 09:04:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMN4R-000000087bD-0JJs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:04:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7494E6022D;
	Fri, 21 Nov 2025 09:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A1BC4CEF1;
	Fri, 21 Nov 2025 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763715886;
	bh=mdWTS0w+dAGnTqUEF31kZZjQuTijMBMD7hWA2qO2TI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIK2C9boupkzyp68FmyqtvUkEKe/Ewi0ktOCPLMi9UbgxO/K//IfYTREufWaHfGsv
	 iZF0+9eSbAnzORngPUNCSbA3QR9pIJterlw/LsSUQgADlXbSEYKsh5fsbke2ELyfhq
	 n1gmmFUpe30NvteBju0YUTkCsemAKUQcyfyNGaVwiB189bB5xkdvxx/4IxI61MWW3z
	 PeO/PQZq0xoulqPJxM0KFGvhxj+3/4HfFnC6vmq7oAQOxquBOBWgMBA/pOH9VaU4RP
	 1lH3v5vZvPQrmaqp2urqxe8OqMFWnH4rM4J7KKH1TIzr4bU0XDaX4V2PMDcZn9OO8R
	 pljPZAVfHWAdg==
Date: Fri, 21 Nov 2025 10:04:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ARM: samsung: Add Samsung Manta (Google
 Nexus 10)
Message-ID: <20251121-convivial-wren-of-wind-cefe21@kuoka>
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-2-linux@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120144018.961604-2-linux@timmermann.space>
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

On Thu, Nov 20, 2025 at 03:40:14PM +0100, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
> 
> Add the Google Nexus 10 board to documentation.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index f8e20e602c20..97a5a678f43c 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -120,6 +120,7 @@ properties:
>                - google,snow-rev5                # Google Snow Rev 5+
>                - google,spring                   # Google Spring
>                - insignal,arndale                # Insignal Arndale
> +              - samsung,nexus10-manta           # Samsung Manta (Google Nexus 10)

Google Nexus or Samsung Nexus or Samsung Manta? I am sorry, but I am
100% sure that Samsung and Google are two different companies. Google
products use only google prefixes, see all other Google devices.

Best regards,
Krzysztof


