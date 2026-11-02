Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE11606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YE9wu0ii;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqKvkUph
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/geg4fn5RzdAUH4lS/NHAgce/2jiQ9EPWoRaLv0NohE=; b=YE9wu0iipTqxm6Wx74aHlzfU/a
	VbnEkABLnHVofvRD3vuET/F/1oL7MwpTyqbOqIxK/+i9XBRP2vdUyfZKY7lUmk3UWFi1nAOrMC5ST
	tD9c2DaYE47pCku6KlwBthT3XQGKSSOZJsw3TeGN4KawCH4po5vxON22YTJ2B9+4Nt0DudQGiXfZV
	pvxpZNeXo3sRGpYFoTwzOMSUgT6/swB0DyeeI4FKxgGmOzvMpyUxxXp2ovzZnXKSsOwuIcaJbaMnF
	rofNlBK7VwZvwVKiUYyJRG+PfydUAQ4b5Okmrbw2wXF51GdX7kVcj/rwXRY6U+loE/SUUDRLjXxol
	T/Uz7B4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp31-0000000G8jR-3yZl;
	Mon, 02 Nov 2026 10:13:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp30-0000000G8jJ-2CX5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:13:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0489843BCD;
	Mon,  2 Nov 2026 10:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA191F00A17;
	Mon,  2 Nov 2026 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614429;
	bh=/geg4fn5RzdAUH4lS/NHAgce/2jiQ9EPWoRaLv0NohE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CqKvkUph1JMI+M3Quw787pbiUXVd4OsSacpUh7DBq1UMHojPYBWdwypfgOu8ApXDX
	 Oj0ziUigXpLbJb7ApnHlmo3GVQnwvyoKkQbT76WPr+QALqQgF6YtEanGFVVR0FFheY
	 NNKjV63p85ATE8OIcyp14Ng8KLHcqIa/1sEYmwDvNckCx6QOXfNu5FgNna7zkacIxB
	 t2dnD19uAqegTS9/3NM+pVFpVdhZxNjXv+YpSxYUUOsW7KO5vuVw3GZBLxS0PFdSOt
	 uN38sGBOMAfem+9bQ1J23Gi5nEc7+NlN+e5oVwisv12htcWVD22e/EfB20nT72NC2L
	 G4fW7k3cB26Wg==
Date: Mon, 2 Nov 2026 11:13:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: samsung: Add lucky7 board
 binding
Message-ID: <20261102-origami-shoebill-of-fortitude-ddf566@quoll>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
 <20261030-for-next-lucky7-v3-3-81e02272ce69@member.fsf.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-for-next-lucky7-v3-3-81e02272ce69@member.fsf.org>
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

On Fri, Oct 30, 2026 at 08:33:58PM +0000, Aiden Isik wrote:
> Add device tree binding for the Samsung Galaxy Watch FE (SM-R861/SM-R866)
> board, based on the Exynos5515 SoC.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index db19a686f490..c80fac4fad7a 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -157,6 +157,12 @@ properties:
>            - const: samsung,exynos5420
>            - const: samsung,exynos5
>  
> +      - description: Exynos5515 based boards
> +        items:
> +          - enum:
> +              - samsung,lucky7                  # Samsung Galaxy Watch FE (SM-R861/SM-R866)
> +          - const: samsung,exynos5515

This looks misplaced. Entries are sorted by the fallback compatible.

Best regards,
Krzysztof


