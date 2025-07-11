Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D387C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vz5YsJmOqASc99lAV92Bv/0Ub/DFOo4HH7BqZdIvf3w=; b=TWLhhqaGccgKyz1yLOvhrMLNd1
	4XNO1dVdgssAfjH9/wHY9ubvR9J+PaKxx/iykJyr+t/YJI9qrgTq8EBd7u+0OKE/eXhgkxrOqaLgc
	7wueI4FFbSTkbFrB49qyuDZ2zJwLGeCC8gdG/dvso9SVno2XcozLbHgYiTW6+JO6f6UTFYROnWLbY
	aVwf307a6Upl4WnQxV7NvVcwo7cPPD3uiZu9Q0CtEIgAS9AAS2eX1XKOGA1+FRabf1jgNRcYKPUGz
	cYVEANpjwMYGLOuZTX7eN+E7a8ofLRsYHjLiYl1h+X+9wdjdxAquaa2+s6sRRYISzomDz8EVM/nSU
	fh6ptA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Il-0000000Dzh3-0dhe;
	Fri, 11 Jul 2025 07:36:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua83m-0000000DwaU-0ENt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 343D06115D;
	Fri, 11 Jul 2025 07:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55095C4CEF5;
	Fri, 11 Jul 2025 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752218440;
	bh=qjaqR0kSbPDYshLZiiQBS6nGZWK+K9c7EmR0Co1wVUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdZSsCXN0hU1lu72Na2ybY9udpgGtCrPaHDwuWmTcZIA1FPxgaWutRCBfTg8p4fTw
	 EROCwhSmEt/f24g5Bom8Bl2UPXMLpVNZnWdjjEFyOQR/YzUob3znrXceHMPRhO5gNY
	 YenBTDIxzA+raTu2qIHFo/H6JkIlHSAib+IMISjhMATB7lPfwN+tutb74byYtzgvn0
	 Af7Rp1W5kvuTzMazKgoJei3ykddUkXSskMhFBBCn1IZ2FWHahmtO39psOabcKUoBog
	 dgZSI6HpsquRcGCVFlon1lNegrSYTBP/kb7BqIru+RZa3/BslIp4N1hXKowkNuE5V4
	 H2jpEfetMjd1A==
Date: Fri, 11 Jul 2025 09:20:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Subject: Re: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Message-ID: <20250711-shapeless-adorable-lobster-d2efbf@krzk-bin>
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
 <CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
 <20250710083434.1821671-3-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710083434.1821671-3-dev.tailor@samsung.com>
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

On Thu, Jul 10, 2025 at 02:04:33PM +0530, Devang Tailor wrote:
> The on-chip RTC of this SoC is almost similar to the previous
> versions of SoC. Hence re-use the existing driver with platform specific
> change to enable RTC.
> 
> This has been tested with 'hwclock' & 'date' utilities
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---
>  drivers/rtc/rtc-s3c.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 5dd575865adf..8db24b6360b8 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -384,6 +384,15 @@ static void s3c6410_rtc_disable(struct s3c_rtc *info)
>  	writew(con, info->base + S3C2410_RTCCON);
>  }
>  
> +static void exynosautov9_rtc_disable(struct s3c_rtc *info)
> +{
> +	unsigned int con;
> +
> +	con = readb(info->base + S3C2410_RTCCON);
> +	con &= ~S3C2410_RTCCON_RTCEN;
> +	writeb(con, info->base + S3C2410_RTCCON);
> +}

Looks a lot like s3c24xx_rtc_disable()...

Anyway, if you keep ignoring the review, no point to provide reviews
here.

Best regards,
Krzysztof


