Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9692C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Knan138NdmDVR2CPp6B1Qzbr7MQKu8dC2FLjkzzbmvI=; b=f9Xr5ftTfwH9wD
	OIWaOP8yd2MqtcUbmAk/fb0xFiYwZM1kYa8FC0hRMFcEWv6prJWRMwxNRgmZWXT35bkwYTW4FbIj8
	ff2/Tdsj0dJ0mA6Oo5HE3NQ8aFHC5qsRMuK/Ml6j/8vhSQfO8BRadxVw+TqZsVnINE/WgVA9GnPY/
	qa7gdq9vhRTuKbf9EWdKB6nDW0V07c0ToExCXMksII1oAMdlSmGy+KZKE+UNWg2ogyxYJZmgawVGr
	hrsV5e66m/SgbMZAlunFMOgS14h+jwB8QT5412P+vIBcDaQjmx2RzuYeGJTBb+sm3im1JDcjFJSnn
	iG9tqdj9feYcjOe7oP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cMa-0000000EyKa-1kK8;
	Fri, 18 Apr 2025 03:26:00 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cKj-0000000EyBy-0Cbe;
	Fri, 18 Apr 2025 03:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Knan138NdmDVR2CPp6B1Qzbr7MQKu8dC2FLjkzzbmvI=; b=Ez6H9+aeRufRaBW4KKs6TPV5rc
	/oGb4UfCcPzduHjQnNyKHxy1droB9vh99WEubgJTKYlrwvLCjkkgjHxnJvGSHFEaDyNsclRpwc1Qs
	Cff94MmADxhIheCuAX3VjYAbtcKNwLjxn8YHYFZmQthiylFdl7PKYwOcyZUqwFbEznpb/pqqHww24
	acLyNI3vutChyZ5dcDugMElCr+iaDZqZGGzOMWF1E3KrL2c9R/ivnrdJPpi1EHCbMgucJtJiv4WjA
	/lmyWUibeMw+8o8sNujxq/GZWsvpcObxg73E3FjEzh76LAPfRp9q6WsuheEUa8W3mPwpRoLiAxFLw
	MiZJjYEQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cKf-00Gebr-1J;
	Fri, 18 Apr 2025 11:24:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:24:01 +0800
Date: Fri, 18 Apr 2025 11:24:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405182609.404216-9-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_202405_089668_826A84A2 
X-CRM114-Status: UNSURE (   5.48  )
X-CRM114-Notice: Please train this message.
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

Eric Biggers <ebiggers@kernel.org> wrote:
>
> -static void __exit chacha_simd_mod_fini(void)
> -{
> -       if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
> -               crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
> -}
> -
> arch_initcall(chacha_simd_mod_init);
> -module_exit(chacha_simd_mod_fini);

Why did you remove the ability to remove the module?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

