Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E482606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CrYLnh5I;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=snhkS/ic;
	dkim=fail reason="signature verification failed" header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=4dIw4kaO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+UfxfAj5AhCtq4HcXmGAqALsIonnT5XRHjEbBTgxzUU=; b=CrYLnh5INY/8Kkg7dmbXxW3/4I
	Azhb9bJyhD6caggL6V7wOdYr7NuiTKFtBDEhEPYSCFxSJuP3jzLv9lJy1uAXsI1jwnfThL46dhnQY
	oYoRiy5ZwIZAa7Z+w5RCinJRF7dk586DH93KfejaLmDLId6Mgt8xelos7lR1TDiDzl9+PuuYegnR/
	yLrpeo8UniiPk+fxV36lqDdHSSqF5fesa6MGekJwu8q39jgiwqOlCa85Xs1Uoeqpt+9Dw61MkJXfY
	d7sRjhJUXE0X5+ytpPobXPwCVQ8fifpJnP+aCztNYQKewSk+vNUVRZvUoZ/WUZSibnpTZao2P1r2Z
	Z7fd78XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhzj-0000000B7hR-0fj7;
	Fri, 30 Oct 2026 08:29:51 +0000
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhzg-0000000B7ga-1rtt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:29:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793348978; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rYx4kIkoFq76G5Y7UPv8ncfw0x6N0vseRIn3fDGX3I7hcDbeJbu5mx+jITfEdBJ0BY
    yfgfn6JgqP3UElK2LuBUov8/nX9MhPZ6gmPJP0/u+BCsX9Dcbr3QUxAwuhETua6IEbJW
    WVCWMWXBbf5JPNq2FxEtHHq1NzULfOBJZD4tHYN7bjzx5eAdDHiqwEm1Vckw8CAfTrPi
    rWgxozOgIQCm+xznUf3G8nkdKvI64U9q2oK5rPOUprmp3PdRRIdTzOfLfJ5sWz/r1gjw
    Y4SDD0RrZeYWZe5psETCieWUmoLnJ+HyplDNIsppNXEP/zgD4dUV1MV3UUUr6g8hRuiB
    tmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793348978;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+UfxfAj5AhCtq4HcXmGAqALsIonnT5XRHjEbBTgxzUU=;
    b=fwFdBT/49AoSDBIatiyr5WKrbA9VoSbwG/qTcilmbueX/NAXNTMB5gpVo53/FxKXB2
    4Wevw/QzgiMna6dvhnRusJs4wZ31Vjuc+it/C4CYki++57YYfngtyQWUtDokudd8Wv37
    hM0E0B0cbEzHYzIHs2MquQwIfrU/VF1luVicnSrPJTrZfLpUhdIX3FqkuKYOorbFBzN5
    YkitmeJje0wgrsdBhiZfoktZvnCctcW90Sd2bZcQy+243pRTu6Ify1OfrxSSI5kmt5as
    9bQXmVb7Rhs8ZSIwxN+HuQ+3FwZlFovzb+HWWfr2C6KVukgtBkHD2VftSjZvWesiK90B
    khDQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793348978;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+UfxfAj5AhCtq4HcXmGAqALsIonnT5XRHjEbBTgxzUU=;
    b=snhkS/icHI6iE4y++VpYmUuzfD20bb8PR47FXYzEbE19SU+RQ2h6zpY0DVkpUrvVYP
    cOazogWSGAFqOThiNYlugCjIOuWdfRWlWZNywoJ+13toAwtdVknk7pnHtBUPcQXohZ5V
    eAMWGZ2CcFNVcHcMUpQsWHKNxt2GYXSxzgVAGTKFANngNUnsjJHM2E8ZFNdJH0zcLn44
    pVmWYZY3dLRdScz0CXnaQzT/U6jMuEO5Zdzqjrog5bvpYaW4uT9fqXhabloADEnFQ8cj
    fK43Y89mBqKnVthYhAUop/dXUbX/rpVuVFikGhh8BRtpvGctDchrBIuVAiZ4yf73Tdra
    ogYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793348978;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=+UfxfAj5AhCtq4HcXmGAqALsIonnT5XRHjEbBTgxzUU=;
    b=4dIw4kaOx+qCcDHlUUPhJHLnZ9RmWtMKksk2TnilTUx0KmRBOuu0UdfrosBowZXTtJ
    VIC1xN5V7mx1KRoCHeBw==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk1Z5IDmIqDY7xpnOs6mGD64frXxHtrE3e66udIGwZnWwLgga9o="
Received: from julian.home
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id J82cde29U8Tc7Ek
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 30 Oct 2026 09:29:38 +0100 (CET)
From: Julian Vetter <julian@outer-limits.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH] ARM: fix big-endian check for IO memcpy and memset
Date: Fri, 30 Oct 2026 09:29:32 +0100
Message-ID: <20261030082932.193164-1-julian@outer-limits.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_012948_744937_48B5811C 
X-CRM114-Status: GOOD (  17.57  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The commit 7ddfe625cbc1 ("ARM: optimize
memset_io()/memcpy_fromio()/memcpy_toio()") switched little-endian
builds to mmioset()/mmiocpy() and intended to keep the byte-wise
_memset_io()/_memcpy_fromio()/_memcpy_toio() for big-endian builds.
However, the check uses __ARMBE__, which is not defined by GCC. The
define used throughout the kernel is __ARMEB__ for big-endian ARM. So,
big-endian builds have been using mmioset() and mmiocpy() ever since.

This is a problem on ARMv5 BE32 platforms like IXP4xx, where word
accesses to IO memory can end up on different byte lanes than byte
accesses. Fix the typo, so big-endian builds use the correct byte-wise
implementations again, as originally intended.

Switching big-endian builds to the generic implementation from
lib/iomem_copy.c instead is not an option either, because it also uses
word accesses for the aligned parts of a buffer and thus has the same
byte lane problem on BE32. ARMv6/v7 BE8 mode would work with both, but
it is marked as broken and is expected to be removed, so it is not worth
treating it differently from BE32.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
This replaces my earlier patch that removed the byte-wise helpers:
https://lore.kernel.org/all/20241203083838.3260036-1-jvetter@outer-limits.org/

I have done a compilation test with ixp4xx_defconfig and see that
drivers/pci/pci-sysfs.o and drivers/mtd/maps/map_funcs.o now call
_memcpy_fromio()/_memcpy_toio() instead of mmiocpy(). This is however
untested on hardware. I think the problem didn't show up on Linus' hw
test, because platform doesn't use those drivers.
---
 arch/arm/include/asm/io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index e6bd9e79737c..50e142f817f5 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -308,7 +308,7 @@ extern void _memset_io(volatile void __iomem *, int, size_t);
 #define writesw(p,d,l)		__raw_writesw(p,d,l)
 #define writesl(p,d,l)		__raw_writesl(p,d,l)
 
-#ifndef __ARMBE__
+#ifndef __ARMEB__
 static inline void memset_io(volatile void __iomem *dst, unsigned c,
 	size_t count)
 {
-- 
2.53.0


