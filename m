Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56393C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whazl9Cr8OKKBhetdb/FWk7It0nd2O2kqxLKYX3c2r0=; b=4Af56UHOf1obI2724LlVZ+x8Pq
	qTshRJQjl0FjeY4mbDtXvhI2kdasi1msLifIBwA9yOgXa+DWN2u+0KEcI8UBkQ0vXlyLC9eAgh8Q6
	bkQ+ENabX9qmFI9FiriAl7ZN2gZbnDkhxDGs1WEXk6g8Uturk7aVkbXPMlyMmizf3JEJtN5E/JAlQ
	/K+1e6u0rB7xN8DGKxTAwPh+XmC79q7NQTEW+r2EFt7wjAQMLCcBHn3djlsZAD+azdxw6jxC3k2re
	iueI3v9VzUb0NiIqGlgZs0bEbHyCKsPznzdALA75Mqws+kHElmOgDm1col28REf+tsS50Yu8v6utR
	v9dr5jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdmc-00000001brd-2j8N;
	Fri, 17 Jul 2026 08:18:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdmb-00000001br5-2a4f
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=whazl9Cr8OKKBhetdb/FWk7It0nd2O2kqxLKYX3c2r0=; b=FrN0OH5HGvpESxsI/t2DDagzy+
	w0rUX4UFfKDP298985UsuSNVne1YW3ZncncSwWxyWTGyOQ3Y4+qFX50eJXnvacha8Z1WRsLCSGxQi
	VuDrtaDMjgH0S/4PSPpvxgmx1CdpxmG2ftXCDCZGkVYfHB+CQdItf2LQv+3zGnJeJG224orZezCLq
	yhoXFrftXtr5da51+roBlTgA3pCIL/grb2pU+2mWCxJKT9ZPBJg7Lbi5Js9cDlwYGqbxqUCiQo7+R
	raG+4ysqz2azgA+eX7vn/5ITs175+61E9OpsIZq6SgOvAVHHit0ltVXu4V2rTz/A1nMPBXlllE6O5
	qHNfaKjg==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdmY-0000000Eeud-0RD9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=whazl9Cr8OKKBhetdb/FWk7It0nd2O2kqxLKYX3c2r0=; 
	b=SO/3J9kDH+hjq3iBt+U9mdvrIt1Ybr6OhKzw8fbW696C+HienV51YxDb3eNb6747fjkil0mdH0v
	Y5nV0tX5uTJIKtskWr9yYI4uWEWAJFDBxgK6MDTZjw8QEcMN6rPkC42aYkudUnsXsla3YIc2XG33j
	R9p11yCKnEDWoNq/8rmkRrwKP+NczTA18olJyheVKN5axCF0tQsu90YfgiBjUkC7AUWpp5VQ3Tz2Q
	qlDoNq9nNzS4OB9MPARrLglP/NGDgvdLgGZ6B43E0PSmGTrHCZDoQvpIDs1IV1OwOL3hfzEjkM+Lj
	A9l0SOwDTq/gxLkyfdbmJkZh1c51scCwnKfw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wkdmS-0000000EODf-3tXq;
	Fri, 17 Jul 2026 16:18:49 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Jul 2026 18:18:48 +1000
Date: Fri, 17 Jul 2026 18:18:48 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: demiobenour@gmail.com
Cc: Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <alnlaCXmoLRAlr96@gondor.apana.org.au>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091854_358464_0CBCC845 
X-CRM114-Status: GOOD (  19.43  )
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

On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
> From: Demi Marie Obenour <demiobenour@gmail.com>
> 
> This driver is harmful:
> 
> - It is much slower than the CPU [1] [2].
> - It Has a history of bugs [2] [3].
> - It does not have exclusive access to the hardware [4], causing races
>   with the secure world.
> - It register its implementations with too low a cra_priority for them
>   to be actually used [5].
> 
> Therefore, disable it to ensure that nobody builds it into kernels they
> intend to ship.
> 
> In the future, the driver will be used for processing restricted media
> content.  However, the kernel does not currently support this.  Since
> the driver will have future uses, allow building it if COMPILE_TEST is
> enabled.
> 
> [1]: https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
> [2]: https://lore.kernel.org/r/20250615031807.GA81869@sol/
> [3]: https://lore.kernel.org/r/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com/
> [4]: https://lore.kernel.org/r/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com/
> [5]: https://lore.kernel.org/r/20260524204537.GB110177@quark/
> 
> Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> ---
> Changes in v2:
> - Add Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
> - Add Cc: stable@vger.kernel.org
> - Link to v1: https://lore.kernel.org/r/20260712-qce-broken-v1-1-85e2bff17871@gmail.com
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 -
>  arch/arm64/configs/defconfig        | 1 -
>  drivers/crypto/Kconfig              | 6 +++++-
>  3 files changed, 5 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

