Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E56EC01A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POLNFygr9p8fZfOfb3eriMgHUsPEYJYUgt8D9irofak=; b=wKKDrmc0lkxRPspn7TLZn6x6Nf
	U2ifNA2B/BOxp2DM0EvHHfALpxDhBqiAe0J/8qIb5mwMRJ0Gm6sO7ZWzqJ8trOtdc7ESVroCjreBz
	KNkBbn8zNFSzcuSzmDF2OzSzKuEfQGoK5qYK/tfPHpCDkFScgGOaWpsK+AEpDbhu/jpa1x7676k9p
	qUbxigICfeDWPqgTevuR0DRw31MkYXhy71bKfCVW3t84s+aJ5gqKVnY/h6+ZE+QnYRU9/+GBAsHiz
	cgpfab5WX+MdjGIyp8EeJv4XRKsAc7sTcfSuemlt3scrD30c2/xe9BX9V0T72MJ7/HruvJmL7UhF/
	1unR+XCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a6Y-0000000GEyK-0VW3;
	Mon, 23 Mar 2026 07:53:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a6W-0000000GEy4-2SKV;
	Mon, 23 Mar 2026 07:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0ACC600AC;
	Mon, 23 Mar 2026 07:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BAAC4CEF7;
	Mon, 23 Mar 2026 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252419;
	bh=rKXtNU80tlF2bEc5y8Hf3EEwlFTdBjp+OHDgdQ+xW4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rpd7r5i3Hay5+CRrN9PuS0ZKpZiSE77pqaQ5052CwJjfxzfAU9TKjSb7cNc11mH6T
	 76NH1urRy28GGx7YoUV7A6j6UqICuhqPEzPADEoJAm1aMpm7YIJYP/mZbVTCD8YSJa
	 ogdsevIJRw23t9i3j1hkXA1Hg3WKF0Abx585kSbk5wQccUsVhocDQaXXupaOAwColI
	 R9FCu37yQCrI8FiMPwUrpUDDOe4l3cCHXNFaViga79LC/xRuDHZp5NMmCpf4Oq1rDq
	 P3hYybNi/PqiXvO+cwnD4YLquk3WTFm9SsoRpAKXGWmilDUwVagNLxIb3eiEuyDIfd
	 5Ho4WRVjZdI8Q==
Date: Mon, 23 Mar 2026 08:53:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
	andy@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
Message-ID: <20260323-saffron-cobra-of-perfection-731c8d@quoll>
References: <20260323013408.429701-1-nick@khadas.com>
 <20260323013408.429701-2-nick@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323013408.429701-2-nick@khadas.com>
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

On Mon, Mar 23, 2026 at 09:34:05AM +0800, Nick Xie wrote:
> Add the compatible string for the SARADC (Successive Approximation
> Register ADC) IP block found in the Amlogic Meson S4 SoC.
> 
> There are no known differences between the SARADC on S4 and the one
> on G12A. Therefore, it uses "amlogic,meson-g12a-saradc" as a proper
> specific fallback.

You should explain here why you are adding that comment.

> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> index bb9825e7346dd..70ab4e140e71b 100644
> --- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> @@ -27,7 +27,11 @@ properties:
>                - amlogic,meson-gxm-saradc
>                - amlogic,meson-axg-saradc
>                - amlogic,meson-g12a-saradc
> +          # Usage of this generic fallback is not allowed for new devices

Best regards,
Krzysztof


