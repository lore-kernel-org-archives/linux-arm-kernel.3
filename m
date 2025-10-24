Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EFBCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 19:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZd0XM9nodjf0xY3dLKmqwVSLidBysE2v03Z3OAAOHE=; b=wDjRbWrpFYhZIqmaFdN+gxLYXL
	M278fz8cP3oxgk6Hkw70KKVXyDzrHXhP7T+LcfZn7GN/QWM3nZFMu57wV6fQom/BNrT7vNqlZHfEq
	O/ZKtK6+LmhFSzRZTdfQt8JeKDyWCYqAdtzxfyLdIM/9rQgeyq+1bEIqND7DR1QF7UQYYpp2oAJX7
	XJVXr90G/KXUlK24CqK835zxLYFW6ju0ONTY3JwkkGwZ5sbUr8oD35QfyXQwTBnT+iI1+1cUkRrXg
	ONb0yk5X5BRSk8fvkuMWHXL8BAjiMpSZ/5TWjSe1ZSaTg0WOj57JCc2CTYwo6AO1LWvLOmNPtY1Ea
	ZdaDdbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNMK-0000000AMtT-1xZw;
	Fri, 24 Oct 2025 19:21:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNMJ-0000000AMtG-23Ik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 19:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D95926028B;
	Fri, 24 Oct 2025 19:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D9DC4CEF1;
	Fri, 24 Oct 2025 19:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761333714;
	bh=zajPlJnvLIMbpj18tt9XU5F6klgXeRifknETT3f00Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYE4+xI7/IgZhpd7y0gND/WB2m9og01WSNl8xqVgmsKloP8wozlAsva8mAXNLOLhj
	 +n06GmuvHtqMxpASGF78jb6nC8nF7fzU0gO7d1tWMFPBsjv7LPSa9L2vbzLPfDbACz
	 zNjm/0XNRz0G7Pk2+YW8tMZRevxOYMhFXzG4txrul0hxn4ITKe0+hvMY2u0zDiCKme
	 I6lc9edBxfmWJuX9hOL1lUnMOsAmIUdgdGJfRACwha5AjkgcrUFjCfDUFZR8wlRi29
	 MPbqftOf51ATChWK2hvnE7Zed+gIcFXlVGCjwiKcDgZc3AQu1gb8g86XbRfs/Am7uf
	 TAdNdCZD9JRMQ==
Date: Fri, 24 Oct 2025 12:21:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 00/10] BLAKE2b library API
Message-ID: <20251024192152.GB2068@quark>
References: <20251018043106.375964-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018043106.375964-1-ebiggers@kernel.org>
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

On Fri, Oct 17, 2025 at 09:30:56PM -0700, Eric Biggers wrote:
> This series can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git blake2b-lib-v1
> 
> This series adds BLAKE2b support to lib/crypto/ and reimplements the
> blake2b-* crypto_shash algorithms on top of it.
> 
> To prepare for that, patches 1-4 clean up the BLAKE2s library code a
> bit, and patch 5 adds some missing 64-bit byteorder helper functions.
> Patches 6-8 add the BLAKE2b library API (closely mirroring the BLAKE2s
> one), and patch 9 makes crypto_shash use it.  As usual, the library APIs
> are documented (with kerneldoc) and tested (with KUnit).
> 
> With that done, all of btrfs's checksum algorithms have library APIs.
> So patch 10 converts btrfs to use the library APIs instead of shash.
> This has quite a few benefits, as detailed in that patch.
> 
> Patches 1-9 are targeting libcrypto-next for 6.19.  Patch 10 can go
> through the btrfs tree later.
> 
> Eric Biggers (10):
>   lib/crypto: blake2s: Adjust parameter order of blake2s()
>   lib/crypto: blake2s: Rename blake2s_state to blake2s_ctx
>   lib/crypto: blake2s: Drop excessive const & rename block => data
>   lib/crypto: blake2s: Document the BLAKE2s library API
>   byteorder: Add le64_to_cpu_array() and cpu_to_le64_array()
>   lib/crypto: blake2b: Add BLAKE2b library functions
>   lib/crypto: arm/blake2b: Migrate optimized code into library
>   lib/crypto: tests: Add KUnit tests for BLAKE2b
>   crypto: blake2b - Reimplement using library API
>   btrfs: switch to library APIs for checksums

Applied patches 1-9 (i.e., all except the btrfs patch) to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

I folded the following fixup into patch 7 to address
https://lore.kernel.org/r/20251019163249.GD1604@sol/ and
https://lore.kernel.org/r/202510221007.WnlC6PmP-lkp@intel.com/

diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 5c9a933928188..bc26777d08e97 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -37,5 +37,5 @@ CFLAGS_blake2b.o := -Wframe-larger-than=4096 #  https://gcc.gnu.org/bugzilla/sho
 ifeq ($(CONFIG_CRYPTO_LIB_BLAKE2B_ARCH),y)
 CFLAGS_blake2b.o += -I$(src)/$(SRCARCH)
-obj-$(CONFIG_ARM) += arm/blake2b-neon-core.o
+libblake2b-$(CONFIG_ARM) += arm/blake2b-neon-core.o
 endif # CONFIG_CRYPTO_LIB_BLAKE2B_ARCH
 

