Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A07C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 05:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/K+U8RtoxLD4AghOpbVPDReXNYLDr3EnrdkatDMFKI=; b=depNXUM6Q3xlAOgymKvNpA86p8
	N3C6AQYLFn6+0w7sby2VVtJXrm/ujtAC3e1n6WhNMVZuhDmeL10lSdUgb+2hbpKl9BmKMKfvK4msp
	Yp+JXJd8Yzf1DklYSjbA/RxlR+HlyET9TPzSK87n735tZ+piXBEwm+bJV64ueI+H9NFAwXXfokqVg
	jMEeWBEQDYdZTbDMmhWAnMep7uFS4RCQcGwkPiT3V+EJfU3jHD/Ff+dsEJzfouLCQ4x4JlVmqg2o0
	r9VcyuHmZ23DPKUj2zMAtNZBGEb8chOMvDRC+snJPr3BwOuwK+hIpQXHRnmYBB2kwZtJ58Bv0yVkT
	Nfq47dmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgFSs-00000008zau-2CDd;
	Sun, 05 Jul 2026 05:32:26 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgFSm-00000008za5-3rFr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 05:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Q/K+U8RtoxLD4AghOpbVPDReXNYLDr3EnrdkatDMFKI=; 
	b=X+WJuUyWUjHYzWpqdqapexUVrgyBQZT1Pc5O+SOae4rK/M+b/qEX0B2uV0ZT+jxEO5Z4bu+kOjB
	n8w7tNN5YNn1KemIoF5C8t7mQ77lxuUsKJ/0wc6TzawVTKuFsNf2HHoQyh4W8ZYeRM5jOND6boBr0
	EbtzDSgWkgEYyxC37aQh2qyimIdfIQlPqyEpag6AerPj4UoOsEeFzbs7MvPkmkiCk52CWfDtjVtiO
	FsvCNLTt2bB4mvRDaxVyBsaPOBnO5290J7Y1CKIF9FoL4GEBVg6VRltkYXbCz+dpJvIMe5wVTw/uX
	QDPiSMg34S9wNBK2LoaXW3xA+LTFEqFpXNMg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgFSP-0000000Aje9-1lDo;
	Sun, 05 Jul 2026 13:31:58 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 13:31:57 +0800
Date: Sun, 5 Jul 2026 13:31:57 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Olivia Mackall <olivia@selenic.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: atmel - drop __maybe_unused from atmel_trng_pm_ops
Message-ID: <aknsTUIswYXFKBm1@gondor.apana.org.au>
References: <20260606131755.10132-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606131755.10132-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_223220_984666_A09F3D61 
X-CRM114-Status: GOOD (  10.12  )
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

On Sat, Jun 06, 2026 at 03:17:54PM +0200, Thorsten Blum wrote:
> Since atmel_trng_driver keeps atmel_trng_pm_ops referenced and pm_ptr()
> uses IS_ENABLED(), which allows the compiler to optimize away unused
> variables, drop the redundant __maybe_unused annotation.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/char/hw_random/atmel-rng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

