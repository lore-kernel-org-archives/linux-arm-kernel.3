Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A52D31A25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVsx3qNSkcj9I3K9N+kbSuQ4WAL6D7uJ5s2U0zr4DjU=; b=w92HnpdCpNjRThNU+QWr527+Oq
	kXTX827Zrh/jqOoCJalzoXYbekelJ6iDuQVS6PqC6joUhlFYAzGjkhQhFNJvgtS4DVlKG9FYxXK+u
	1sbKptPjFE+5MLbMVXcyyhvp9S4se43syj1H2I+XdMXmFWKopf3/bxfmgpenNIOYYpeaeLegq09P9
	VYuc796q01DZX8KOXHJY6Ju3/gGeb1/kFoCgBRvwjzdYZQdIcqSpZAaF+5yw1PTEsE+qG4ZeA0rQC
	dH4gp84ImWamK4uevSzd3yLcqlrDR8YGihKNgOEDgyGuA4MYZpDrweEKY+3TFpB28hmqI5wJERZy3
	69ZXokRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwb0-00000008PUu-3cQl;
	Wed, 14 Jan 2026 08:51:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwax-00000008PTh-1GDK;
	Wed, 14 Jan 2026 08:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9676843BA7;
	Wed, 14 Jan 2026 08:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27B2C4CEF7;
	Wed, 14 Jan 2026 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768380674;
	bh=tHwsOI/njW36fmYeCP5unv0K4fnE8sD5VIB2pzlG0f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RuvCw2+qQkMHeYnLPdoKsLmhApvy8m2/N9xCpUa34KbC5OGehFBObxp+b/JbQqXzz
	 9PHBHU0agGQkLhsvCOMzJgdOFHZFLAhLuLJwNOuIlLFuupmHYxFbrAfQghqt2NLyTg
	 ySrH9vGcTdPODhdSLPfSklzy6+o/hxv6ooMvkZaXJv91qDS6zbnmiupKrNl7+r4SaQ
	 OBR5ZwP+cklDbsPAwVuixJ9uvGrqa4G2uJjfUdmmjfisbYmz1AcEw8ugcj7JWA55NF
	 gD7f7G3bIgK8BFubJQswDYZa4oPMLFHefS89/2nyGCVBEsPRzpFBuQFio+dN4Y8FJJ
	 9N0s+bFCpXrew==
Date: Wed, 14 Jan 2026 09:51:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Xie <xieqinick@gmail.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, xianwei.zhao@amlogic.com, 
	christianshewitt@gmail.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	nick@khadas.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S
 binding
Message-ID: <20260114-slick-passionate-mink-216a3a@quoll>
References: <20260114062549.68954-1-nick@khadas.com>
 <20260114062549.68954-2-nick@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114062549.68954-2-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_005115_379730_A3AA3A7C 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, Jan 14, 2026 at 02:25:48PM +0800, Nick Xie wrote:
> Add devicetree binding for Khadas VIM1S board based on
> Amlogic S4 S905Y4 SoC.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>

You still have the same From/SoB mismatch.

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 08d9963fe9259..55663e0f7f915 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -247,6 +247,12 @@ properties:
>                - amlogic,aq222
>            - const: amlogic,s4
>  
> +      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
> +        items:
> +          - enum:

Yopu already have exactly such enum with such description, so your
compatible goes there. Look - it is called "Boards" - plural.

> +              - khadas,vim1s
> +          - const: amlogic,s4

Best regards,
Krzysztof


