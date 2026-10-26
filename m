Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E65606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YqZNhQwI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NshH7fEY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HED2kevfhrwGI8UExCHr+WpHjCuw2FSIBaGbLvE11iQ=; b=YqZNhQwIGqrMJkKyXoesvaBoOo
	iEkTO9GSC/xkwsUeX8WtqH2xTnnhm6wg80hvRSkF7OdznsNPKXk/bpRCJkdvx4Ma8j9HOjjVQpVCL
	Qp7B8hI+nEHzNerUQQUn/2tytnYanbZCtyV2lU09xRxyd4GmHVZWCa+0hQguMxosNxA12WE9VFK0D
	z+1+wdTEFMAJhQHfm47mYFrnxH0SbHifQbjQZ7Ikk9Pde7woV2nEHUU70psJGVySHpHLdCU0A9xYh
	13fx7keximuxO6UX3QX0Dr0RDsWi3S4OanF/zccERr5w67MCqc9NUeDoEFCdU9ZtWPZk9effy9LYC
	EYUCBsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHTW-00000002AgH-2a2y;
	Mon, 26 Oct 2026 09:58:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHTA-00000002ALL-1CEN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:58:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEDB042E75;
	Mon, 26 Oct 2026 09:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251151F01181;
	Mon, 26 Oct 2026 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008699;
	bh=HED2kevfhrwGI8UExCHr+WpHjCuw2FSIBaGbLvE11iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NshH7fEYMysbqpjK0M5dWEIb5ohUsmMISWWZQ2wcifVxFJq9icmsimIRk4GrTrxmH
	 aetSm5BzdHJlc3kgOEUrrgfCRkWzO3xEiOXFaMcfvQ6ndgkyOfNLom9iXDkqPzPSvM
	 usAIOxjjTySSzxCiZmvnCDgJHR1o7/7t860t7S/AtwzCVc1ywXq07iVlxrofEruyMN
	 7nf0BAtlUGaG1BuK39QRTgukxX3qhJylrrpck2MswXDpcv7ou0O81SoR/XmuWH/yzp
	 6uyIpS3/cEpZD19svrigYARFeSmVZja7oLid+42ppvD5YxGESUzFpkIQvWam/vtihA
	 0fYMi9BwL/vNQ==
Date: Mon, 26 Oct 2026 10:58:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v3 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Message-ID: <20261026-obedient-aardvark-of-pleasure-67e5bd@quoll>
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
 <CGME20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030@epcas5p2.samsung.com>
 <20261023131501.3157463-3-selvarasu.g@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023131501.3157463-3-selvarasu.g@samsung.com>
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

On Fri, Oct 23, 2026 at 06:45:01PM +0530, Selvarasu Ganesan wrote:
> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue. While at it, alphabetically reorder the existing entries.
> 
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


