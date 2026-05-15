Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEF3CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqd8gD0dbbKy/oHe14fkFvFJbliuXT+OOHtb/+bjx1s=; b=wUj/yRD1EoHKjeZJwYuZwr6/Rc
	1vZoQp1yKHUfcZyWJWbX1zAIHcuYhMJHn2J8D6Z2GFoD6iZD1FUCcDpIZHSXckMCQxUh8jzG8mZHl
	szgJX90PwXgDXPwDWx8K9Qx0/Jf//IZd61pAuklixKiTj3F8Tm3XzM3KP8VXZYGi7+Se8bW+6HGoj
	R/6zTsAG19DSLVZlqpcw+M3hjGbMjL4aeCfKtksIF4wjOBkxcajWyxDRrwFlB2aVCguqJPRTJzsF4
	ctKiq0Ow41iMwlozSWa/mWgrN/XghmuByjVUNouL7XizBU8JaBSo6nxPX9TuVEfQlbcY9FzTE/CLK
	7pkzFZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpjy-00000008292-2Xlu;
	Fri, 15 May 2026 10:26:00 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpjt-00000008282-3cp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=sqd8gD0dbbKy/oHe14fkFvFJbliuXT+OOHtb/+bjx1s=; 
	b=j59AUqHpSEzgMC6JzLsiuiw76tS6GRjzddvf2Fa55ldBVLq9T1qmmBNjrcXNLBvxahaQI7bP4As
	dKLq6d+l2KxzOOEdGU113MBIJygd5AYzJl6UjISMlh5XEI8T7EHt7UZLPbzWH5aiw/lIAScR90POr
	VxTPJJ0Mt2JlF+ppOtUJOTIQ3MbIUV5AN4JlLbmcRDFKaawsmKWxNIRgsfe+9NSBem75Cuj2Yy+hW
	6Pb2M/RPd/N2ZcG2PafWm/sE4g165/IRDWUPXP6FSE6APmfkboAhJ6DjDAzp9OG9kiuJmA8QtjvFn
	Xsh6oXIVhhA07mw1kLoMJWC3OELY/Z5xAEBg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wNpjd-00EOdR-1x;
	Fri, 15 May 2026 18:25:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 15 May 2026 18:25:37 +0800
Date: Fri, 15 May 2026 18:25:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: atmel-sha204a - drop __maybe_unused and
 of_match_ptr
Message-ID: <agb0oUVEh0LqaTtB@gondor.apana.org.au>
References: <20260509101155.2095-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509101155.2095-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_032553_910655_3681208A 
X-CRM114-Status: GOOD (  10.83  )
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

On Sat, May 09, 2026 at 12:11:55PM +0200, Thorsten Blum wrote:
> Since MODULE_DEVICE_TABLE() keeps atmel_sha204a_dt_ids referenced, drop
> the unnecessary __maybe_unused annotation. Also remove of_match_ptr()
> because OF matching is stubbed out when CONFIG_OF=n.
> 
> Reformat atmel_sha204a_dt_ids to silence a checkpatch error and
> atmel_sha204a_id for consistency.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

