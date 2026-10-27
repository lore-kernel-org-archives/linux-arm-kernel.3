Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6980606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qBWIUq+g;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBCmDAOO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V2unCDaCesF7t0tCAr5s7QNJEM7FuHcgeX7X/YYseTs=; b=qBWIUq+go0FlgLKwznhNjKRuE8
	8jZNk2tyN9Jwus5qkKCpLQxDomB5dayWCJiQhkiBsRjAg2GO5QaRe++DuoMrUbfVWjIAeeEsk4CI7
	gXG6L+rnrX/B9ggVezKpXIfMBwdMwfudVv+rMQjJnZtThGIgsUd9ZwLkOs+9dQZQKP7yIMoLX618T
	yeAwDO3ECxyjBy3+xtK4wx5shQvKDMP0RhGdNZd4xVG9chHUHoJPLby8zS9xRSmWNebx/OUUkZII2
	mo16/47u4KJO7eYOucJgsqnKMwYbiCzAngHs6pndP9e0KHtefTL9NVYhBg+pZl09Ruybt2nO7UJOk
	18sbAsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbvq-00000003wgp-2eTh;
	Tue, 27 Oct 2026 07:49:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbvp-00000003wg9-2XKr;
	Tue, 27 Oct 2026 07:49:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6424060052;
	Tue, 27 Oct 2026 07:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB37C1F01825;
	Tue, 27 Oct 2026 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793087356;
	bh=V2unCDaCesF7t0tCAr5s7QNJEM7FuHcgeX7X/YYseTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iBCmDAOO67sb0Djvtmfo2ldqbCyvm8yU4IKQCZ0pEs1bcqtdhkQpD1mqApsbC459t
	 Q58V4/XW1cdGmDbFH97Gm8uafVK1fo+0D6kn+l+acHSMgmgXQXx9o6AORojhYEhZcs
	 vuZyxZWH1WvaWypWG99Hsf3xZTTHHhONQp11BRuIlwuAstD5fk+fkhmBRr3NNbmOyo
	 K3gEn/Eta5KdV54q8nZl+AmZgggSDdD/FBqHQKO/SKgaSUUz0AncpaMg6gSIELsNnY
	 jSFY5keXFW5mbplvc03P6LxKCcbA8PAG0APF7xsG0qaUeumkdD82i73H8We1al44k1
	 TFcNJKYZGUBHQ==
Date: Tue, 27 Oct 2026 08:49:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add
 Exynos5515 compatible
Message-ID: <20261027-misty-artificial-nuthatch-9fd82b@quoll>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
 <20261022-for-next-lucky7-usb-phy-v1-1-2e47f8484bf4@member.fsf.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-1-2e47f8484bf4@member.fsf.org>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 05:46:36PM +0100, Aiden Isik wrote:
> Add the compatible string for exynos5515-usbdrd-phy. This PHY is
> compatible with the Exynos5420 PHY when running in High-Speed mode,
> in that it uses two clocks, phy and ref, so document it as such.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


