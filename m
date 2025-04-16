Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62C6C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 08:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CxllXsS7oZKhmgl74o8BLeNmMQKxBZycllNwlO7QoVM=; b=ksq6/HR+knlO5T
	MI9JxtMuh7+qPzjpckgi8G8mwZdO8ER8t9jm91hJ5q95TdtUC4XGqE5cEmL8Bc9jqxbe90GLQNzqy
	b0gO6CbPTsFTdXV7BdeJWFau01tE+ac8d+cE6WkagVAkJkOUjxN+Q8ncP5P+5JcWZtN4WsqS4p3YE
	oh4JZi7FvEe6YYuxJ/tJB68nUlZmLTqPF9y9OjnChCjmPdaIsL7/bj+uFmxIPqi1haoHm1HasT6Xq
	DXlp8AzC4XiD9DD+OsCQvQ76VTy26U2LLb3XpS6v5etMU36Li1rnpYOtTkcik0E3dHNlnWchCAnof
	UVphu1A1bI/6+hKEqH5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xnP-00000008kBv-1MqI;
	Wed, 16 Apr 2025 08:06:59 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xhK-00000008jDk-2ufp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CxllXsS7oZKhmgl74o8BLeNmMQKxBZycllNwlO7QoVM=; b=p6rOFRuBNqBL9Vs+KMLwfIwpaW
	yz/TUWI06KiYLjDOWRkW1thUO1NCa0FsczE1IdP8yWQJuNPoj7zLoeTV/bcNnNzwnrrQZxCAF6hWN
	rR3nya2bEWTJ06hsRLUYISaUNvMGmmJL2xQjFg9UXnzbuNs+F3O8tZDTNTPjcwkWcdfZbNyJ4y44h
	MNkHBN0Q6sxrv8XtbZop2V1nmDZtMJY4YBCj2ZV5ufdu+NQuPvRjnUCx6msKVoK7FpDyGaHfZtkeJ
	fVmHWHaHPram2mO/vEo3QW8W7xM+RzwRRrwC4Eq7LpM/nK/62FTZQlA3nyOmTRNvV4g+dWKgbKTzE
	D7ct5GZA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u4xhH-00G7yK-1U;
	Wed, 16 Apr 2025 16:00:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Apr 2025 16:00:39 +0800
Date: Wed, 16 Apr 2025 16:00:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH 0/9] Remove per-architecture poly1305 shash glue code
Message-ID: <Z_9jp6J6YKImbzyg@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_010042_729603_0B43D1A2 
X-CRM114-Status: GOOD (  13.58  )
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
> This series removes the per-architecture poly1305 shash glue code and
> re-implements the poly1305 shashes on top of the Poly1305 library
> functions.  This ends up being much simpler, and it is how it should
> have been done originally.  This follows similar changes to crc32,
> crc32c, and chacha20.
> 
> This series also makes the Poly1305 library be optimized on PowerPC.
> Previously the PowerPC-optimized Poly1305 code only supported shash.
> 
> Eric Biggers (9):
>  crypto: powerpc/poly1305 - implement library instead of shash
>  crypto: poly1305 - centralize the shash wrappers for arch code
>  crypto: arm/poly1305 - remove redundant shash algorithm
>  crypto: arm64/poly1305 - remove redundant shash algorithm
>  crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
>  crypto: mips/poly1305 - remove redundant shash algorithm
>  crypto: x86/poly1305 - remove redundant shash algorithm
>  crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
>  crypto: poly1305 - remove rset and sset fields of poly1305_desc_ctx
> 
> arch/arm/crypto/Kconfig                 |   6 -
> arch/arm/crypto/poly1305-glue.c         | 170 ++----------------------
> arch/arm64/crypto/Kconfig               |   6 -
> arch/arm64/crypto/poly1305-glue.c       | 143 ++------------------
> arch/mips/crypto/Kconfig                |   6 -
> arch/mips/crypto/poly1305-glue.c        | 120 +----------------
> arch/powerpc/crypto/Kconfig             |  11 +-
> arch/powerpc/crypto/poly1305-p10-glue.c | 134 ++++++-------------
> arch/x86/crypto/Kconfig                 |   8 --
> arch/x86/crypto/poly1305_glue.c         |  99 ++------------
> crypto/Makefile                         |   3 +-
> crypto/poly1305.c                       | 153 +++++++++++++++++++++
> crypto/poly1305_generic.c               | 149 ---------------------
> include/crypto/poly1305.h               |  13 +-
> lib/crypto/poly1305.c                   |   2 -
> 15 files changed, 242 insertions(+), 781 deletions(-)
> create mode 100644 crypto/poly1305.c
> delete mode 100644 crypto/poly1305_generic.c
> 
> 
> base-commit: 3be3f70ee95da03a87d94c4a714ee679a5c7b34d

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

