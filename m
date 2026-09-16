Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F358C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=payEqoM1tt7cXO6DPJ23pvWYjxDt/TMkkk/2jV3eSmc=; b=uugTpD3wiJOx2B9/bQnaYEocx2
	kUAwTJMXjwtqXVkMPpKKymPE0p4tLqvOPrqb8cKGkmYn0AZTwP7wQNQTVW96vMl/lVR5YXLfgEdea
	q0gZ6Tp1+qFRLeYSJJuONkilcFXB6kPE2wSZgaCZzCUJlsH8aN31yw31t83Cs9I+1soL/3yYwZngx
	52UlECqmxmMhZl5osU9I+yulxGx6n8/l8G7IC/kZ72jrjAUH3JQJZyV0mBQt59LZDC3xyDTCe4pgU
	GnApTGhFXUzUy/ihD6Lz7LFK5lkPoVMW8e/1gxZp0uxu+1qlSXEQUsRb6rJLRe+ta+nnhYC3UOPNw
	JKeT7rMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6p98-00000009Cye-0Oc1;
	Wed, 16 Sep 2026 12:53:54 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6p94-00000009CxJ-3dG1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=payEqoM1tt7cXO6DPJ23pvWYjxDt/TMkkk/2jV3eSmc=; 
	b=bA9oBbaR538zvmY75y7VkC3r6IzWRP51+euLRh29gg+M0XCrbcW+CiqSGe2bsQYeoEo0G3WweWB
	zgWvCnFv3IHHoKGD15FI0HyMuDsfFHclEOg5Vnmj72t6Ece5z5Ny8GBZ0VGlLiCPGo8ALSnasUnO2
	rboWcAFapExQQeII4/5XbQcj5nyM2YTX9WVUwkHAN9j2AWlujzFY/b6r9Otmz0amgYJsJA28+rZxy
	BTDCSPu7EsDwtwRXGpACoUp5TYR9ep+CKt+x5Xhg8ijxt4fHNq2NiXYKKyptcey/hPVPt7PFbUs4+
	aNygkQoLXABMQ4oTP2M6y9d3wGivE2hVtexw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x6p8p-0000000EcYS-0e8d;
	Wed, 16 Sep 2026 20:53:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Sep 2026 22:53:35 +1000
Date: Wed, 16 Sep 2026 22:53:35 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	George Cherian <gcherian@marvell.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] crypto: fix typos in comments
Message-ID: <aqqRT6L16_qBpYuM@gondor.apana.org.au>
References: <20260904114345.27509-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904114345.27509-1-hemanth.selam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_055350_997750_18E957F1 
X-CRM114-Status: GOOD (  10.13  )
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

On Fri, Sep 04, 2026 at 05:13:39PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/crypto/atmel-sha.c                       |  4 ++--
>  drivers/crypto/cavium/cpt/cptpf_main.c           | 12 ++++++------
>  drivers/crypto/cavium/cpt/cptvf_main.c           |  4 ++--
>  drivers/crypto/cavium/cpt/cptvf_mbox.c           |  4 ++--
>  drivers/crypto/cavium/nitrox/nitrox_main.c       |  2 +-
>  drivers/crypto/ccp/ccp-dev.c                     |  2 +-
>  drivers/crypto/ccree/cc_buffer_mgr.c             |  4 ++--
>  drivers/crypto/chelsio/chcr_algo.c               |  2 +-
>  drivers/crypto/hisilicon/sec/sec_algs.c          |  2 +-
>  drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c |  4 ++--
>  drivers/crypto/omap-sham.c                       |  4 ++--
>  drivers/crypto/qce/aead.c                        |  2 +-
>  drivers/crypto/s5p-sss.c                         |  2 +-
>  13 files changed, 24 insertions(+), 24 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

