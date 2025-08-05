Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CE5C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiRHXjNAPGVtINlaUFL7fByZmQ3TpCUgBsIaTyP1mjs=; b=5Bqasc97WQmaJELLEAkMl4kOHD
	pSJJIFQ0e3Q7MwMhAos3UoSBNzueJcmaByA+0tNBW1OtqTGuP3drGoCz5iq9e7q3Wjb+rMYjgnrSK
	FURF+xWkzr5f52PQUvEhy8RoYC4IV+/vcO22PyWGQH/NgTKlMJVpSN0/1jwUKZBPw5ZPxCNs0SzCF
	Zp3+4USKpkNaEK7Pc6UHsah1e+9/NnhuqsmeVSLgZMO3AtoDODf3StidLO0qj6DGwrEih4quNqKXx
	OY4GkgwZXKI+fhvYVecuCvga05CaElNhrS4Qzwvtzpqo9EUE6xKCZuw8S+BROu+F5Tyk9q9b96VgV
	P/2oPJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBhg-0000000ByrC-3jfV;
	Tue, 05 Aug 2025 07:03:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBYG-0000000BxAD-3Ofz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 06:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E0AF60007;
	Tue,  5 Aug 2025 06:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C360C4CEF4;
	Tue,  5 Aug 2025 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376815;
	bh=CmRWlV92762yR80zNL8c5OFgmvYfelATH19l779Etw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBGuSjFfPn/fM/3Bg3K27xG0zO2m70UPVdEJTfIUL88efMc45VygczsY1TOQCcw6Y
	 1Qld+TQ0yho08lcset08ZhSq+TZ0kJRxQGcR0SqPQY31hLOz58TPEXfYp+lzwCB6qc
	 yN1qcdsWVV6ZSJ4ccOqT2sWWTR88A1lzjTqX6ulH/he1oVEyTuY3Gi0BLfuCws4cHE
	 GHvYKl25aOA/t1ciolQcGUDn9NIn1cf4tf379tylWTAE3XxTHUW6D23aQ/VdlWvlAj
	 uiHs684hnob5mg5iYxPTav5TfGb9dOIejDVGymoboN/nmSpEZhZCO8nK2K2c2wcmWP
	 hBj3+gHbTJK/Q==
Date: Tue, 5 Aug 2025 08:53:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, srini@kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/15] dt-bindings: microchip-otpc: document sama7d65
Message-ID: <20250805-capable-coot-of-tempest-2cd3e2@kuoka>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
 <20250804100219.63325-12-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804100219.63325-12-varshini.rajendran@microchip.com>
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

On Mon, Aug 04, 2025 at 03:32:15PM +0530, Varshini Rajendran wrote:
> Add microchip,sama7d65-otpc to DT bindings documentation.

We see that from the diff. Explain the hardware. Is it compatible with
existing one? How much compatible?

> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../bindings/nvmem/microchip,sama7g5-otpc.yaml       | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

This applies to all your patches, because several of them have the same
issue.

Best regards,
Krzysztof


