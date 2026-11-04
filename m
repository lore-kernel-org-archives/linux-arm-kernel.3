Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE8606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RWL5wFE4;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B9jQUyba
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zGI141Yv9NE58oB2X+pDlabk+YgIi5wX/jsZU8v8Pp4=; b=RWL5wFE4/KLl3w
	ZoHastXeJ5Kgevo8S+9lqijpX/LS5KDwk/7hKvRkS3uEcNhzZMzlZv06OaxOhVZ9bha/lNW5ztSbK
	6mj/BTu4mS6uaLRot49/fDJc2/fqNI+r+WiuNlkxh3V1E0BNifOeIDqwN9gzNIxYjg6kHrZGXo9pK
	WhMjVYuIu/eRyT6zvhUgwqw7S0Mm0ldXPE3ST1UxIbjXg2mg4FgZt7z7n/bp8OOu+j7OMZwLkbe5+
	yzPPyCSW77WuzZLk4WMb1H5c23N/2w8jynW4+pRHRkUyay3fJ9cRmWEn2bCv7sHAu6oosYOwUtW2G
	HpmNnCXpZWBVHrdDMtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWpt-00000004oDD-26KS;
	Wed, 04 Nov 2026 08:59:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWpp-00000004oB8-3TgH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:59:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 628A71A144B;
	Wed,  4 Nov 2026 08:59:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25E8060770;
	Wed,  4 Nov 2026 08:59:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5956C103290E8;
	Wed,  4 Nov 2026 09:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793782745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zGI141Yv9NE58oB2X+pDlabk+YgIi5wX/jsZU8v8Pp4=;
	b=B9jQUybapG8VyvGtxfdc988sJ1wpJSrRRaIjB0f4qfG9UkAzdIuWysoxrFlVg1gs9uNg+O
	rgWJQ9kNG6cN0wXpHsT1zTjsdilkYYtKw7YLwHnaTwmbx6i8/91uR9gT78efnP2R7sh0Kq
	8IUjYwcLBk2vNVunpBTWAGOwCdLsWBid1rulPd+vo/CCuGDijTCCngpzHyN69BEHxJ18vK
	8P6llNfWIvU2fUgxbpTY8JUT1dbI/gGKmN6jAXreJbdZZA2GszkzNKan4Nzop+vZlAjxUF
	HopBkl8lC4BS/e5UjqgUl96GbhAEY4BBG9IjGeFyi1l1WUSct1mATaeJsBffdQ==
Message-ID: <7c4eec6a-66a1-478e-8d9c-15394061b8da@bootlin.com>
Date: Wed, 4 Nov 2026 09:58:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2
 ioctl
To: James Clark <jjc@jclark.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104052504.1886335-1-jjc@jclark.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261104052504.1886335-1-jjc@jclark.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_005910_012782_F9832F39 
X-CRM114-Status: GOOD (  20.13  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

On 11/4/26 06:25, James Clark wrote:
> Commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to
> ptp_clock_info") modified the PTP core to validate the supported flags
> of external timestamp requests, rather than relying on each driver to
> check them.
> 
> stmmac_enable() and dwmac1000_ptp_enable() ignore the flags, and
> neither stmmac_ptp_clock_ops nor dwmac1000_ptp_clock_ops was given any
> .supported_extts_flags. Since PTP_EXTTS_REQUEST2 always implies
> PTP_STRICT_FLAGS, the core now rejects every PTP_EXTTS_REQUEST2 for
> this driver with -EOPNOTSUPP, where before that commit the same
> requests succeeded. Only the PTP_EXTTS_REQUEST ioctl still works.
> 
> Tests on an NXP i.MX 8M Plus (FRDM-IMX8MPLUS, GMAC 5.10a) show that the
> auxiliary snapshot inputs timestamp just the rising edge. The reference
> manuals for the STM32MP13 (GMAC 4.20a) and the Cyclone V HPS (GMAC
> 3.70a, which uses dwmac1000_ptp_clock_ops) say the same.
> 
> Encode this in .supported_extts_flags. A PTP_EXTTS_REQUEST2 for the
> rising edge then succeeds, and one for the falling edge or for both
> edges fails with -EOPNOTSUPP.
> 
> Fixes: 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags to ptp_clock_info")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Clark <jjc@jclark.com>

funny this wasn't noticed before, this looks good to me :)

I've tested this on cyclone V, stm32mp157 and imx8mp,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

> ---
> I used an LLM coding assistant to help prepare this patch.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index a37405534beb..31a66e855d6b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -277,6 +277,7 @@ const struct ptp_clock_info stmmac_ptp_clock_ops = {
>  	.n_per_out = 0, /* will be overwritten in stmmac_ptp_register */
>  	.n_pins = 0,
>  	.pps = 0,
> +	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,
>  	.adjfine = stmmac_adjust_freq,
>  	.adjtime = stmmac_adjust_time,
>  	.gettimex64 = stmmac_get_timex,
> @@ -294,6 +295,7 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
>  	.n_per_out = 0,
>  	.n_pins = 0,
>  	.pps = 0,
> +	.supported_extts_flags = PTP_RISING_EDGE | PTP_STRICT_FLAGS,
>  	.adjfine = stmmac_adjust_freq,
>  	.adjtime = stmmac_adjust_time,
>  	.gettimex64 = stmmac_get_timex,


