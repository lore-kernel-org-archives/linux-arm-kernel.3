Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E11098793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22ZPIRvlYCrswgtwd4fGeLcC3pajXKmPw3uCdobj4b4=; b=EBDTr+nYjC6SSxpZonmQ8/+Qla
	N3pmKk40WoktEh2b8AgXPwDhYWIfoszr75BH+Xt4iFZhHz41Z8ScC2S94FddYQnQ97ctyXqT9P1oR
	NlVeZsVD8murngGunG7IHdiPwVl7Hcthanbt//E5FJcwAE5sPk269wE8yqqzKFvHQjesWkuHymg+c
	vLRwsurWPrC3j4wBJ5cgzpTlFIJEb2Nvefn13xjcP9yZPn+xOS26WFomtaPtoxOk0y9UDRnckbNXe
	z+0r4C7UE/ui6mWIMr+syFoXzohUKIpmBz003faCu++0ghV8tL9Qjoa/qHZL+jvaiYJOIzS0BZYM3
	4LCamFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKy-0000000Cypo-0vVq;
	Fri, 20 Mar 2026 15:00:32 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKd-0000000CyUe-2Nka
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:13 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-486fe3b9441so7200055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018808; x=1774623608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22ZPIRvlYCrswgtwd4fGeLcC3pajXKmPw3uCdobj4b4=;
        b=SV+eW5c7pBRX0BonNfp6VlrVIPdQ0fP2auYnB/l7/ZKXZWv6GIFcsg9Hnh49jpizTZ
         zD8N1/Nsl817ur9xSlyyIxI69yQHD1xJI+l/MxtvCjvAb95p3QFSE/sA9cjZm3bi3164
         JWtsty+GesDISz9MM2SNZpK8flGkrzSLKAOPzp0XwiDa3zWM8DW6purSDZccS7TrlCRK
         QYo3glBYAFqLF1K6uJbZp7z1EAo6LJIiRNnL190KFHWEvo8DNGkcl+fFvJX2BO/44Kf6
         e8hQwbeB+TcaZTYWY7wyb6QZmBlNgZEkW6Of14kqksiz+qnWHulO/eV/IypBeHGhj3Zl
         GvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018808; x=1774623608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22ZPIRvlYCrswgtwd4fGeLcC3pajXKmPw3uCdobj4b4=;
        b=MbH6Za50ZyGy8Tj2Z5rLvgWWA3O/Z/0T8Qs0N7UjSFX2JHdyN5OES4Z0pugzyXMmPh
         Ar0HVxlCBYuUR7LX99F53OUVPv5NetfxDk71753w9NA1H5bAUcRhlBtl9f8CiXyl5ov6
         tCCDef5HJJ8gnniD7pm9xntP4kQOnQB/fY2UR9Xo0FnXMgEcKn+JFP+K7lsJbNruUMLK
         ipYLmlG+bf/SE2iXaj6Yxp12y+49QO8eMy5sK7Wfujzsj4NYGjFg2MAtRCGCxgCMExpe
         E0GLVpVoPDjUI3gbXGNw2uiAJcn6tqjXGoFT11f1IKcyhLgmSWriaMgwAaO2KmcerkF9
         dGLg==
X-Gm-Message-State: AOJu0Yz7tngZsGBVltSp5zh1ST3uWv5HP2co7FJuaEhoszybc5mFoiEx
	BZXw+amWxovcnO14E5WwrocBWEwCp9r4aO4mXxxR88v8JXHA/TiSF3M1elKrMqarzkr1E0wJLg=
	=
X-Received: from wmej5.prod.google.com ([2002:a05:600c:42c5:b0:483:6f09:9913])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f86:b0:485:17a7:b9c7
 with SMTP id 5b1f17b1804b1-486fedb551dmr52900775e9.10.1774018808233; Fri, 20
 Mar 2026 08:00:08 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:44 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889; i=ardb@kernel.org;
 h=from:subject; bh=X4PynXinCgtnG4ju4w4ZcwweYSkVMNJ0BLV72qdGaw0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwuOqFzV7PEyd+lTWXMvNXC+b5vGz/NNK1o2nmQ0Mf
 l1mtbHqKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNpl2BkeD/30OcX73f4uuzi
 npme+cGe9cL318K/OkU+3+fdMynBcxIjw2Y7lsv3p6UZMvgV9xStK7dMnnivY/qvWRF22h3urZc 28wMA
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-24-ardb+git@google.com>
Subject: [PATCH v3 09/13] arm64: mm: Permit contiguous attribute for
 preliminary mappings
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080011_692203_6E1E1B62 
X-CRM114-Status: GOOD (  16.51  )
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

From: Ard Biesheuvel <ardb@kernel.org>

There are a few cases where we omit the contiguous hint for mappings
that start out as read-write and are remapped read-only later, on the
basis that manipulating live descriptors with the PTE_CONT attribute set
is unsafe. When support for the contiguous hint was added to the code,
the ARM ARM was ambiguous about this, and so we erred on the side of
caution.

In the meantime, this has been clarified [0], and regions that will be
remapped in their entirety can use the contiguous hint both in the
initial mapping as well as the one that replaces it. Note that this
requires that the logic that may be called to remap overlapping regions
respects existing valid descriptors that have the contiguous bit
cleared.

So omit the NO_CONT_MAPPINGS flag in places where it is unneeded.

Thanks to Ryan for the reference.

[0] RJQQTC

For a TLB lookup in a contiguous region mapped by translation table entries that
have consistent values for the Contiguous bit, but have the OA, attributes, or
permissions misprogrammed, that TLB lookup is permitted to produce an OA, access
permissions, and memory attributes that are consistent with any one of the
programmed translation table values.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 1c434c242641..b52254790fda 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -980,8 +980,7 @@ void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
 			&phys, virt);
 		return;
 	}
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 }
 
 void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
@@ -1008,8 +1007,7 @@ static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 		return;
 	}
 
-	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
-				 NO_CONT_MAPPINGS);
+	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
 
 	/* flush the TLBs after updating live kernel mappings */
 	flush_tlb_kernel_range(virt, virt + size);
@@ -1155,10 +1153,8 @@ static void __init map_mem(void)
 	 * alternative patching has completed). This makes the contents
 	 * of the region accessible to subsystems such as hibernate,
 	 * but protects it from inadvertent modification or execution.
-	 * Note that contiguous mappings cannot be remapped in this way,
-	 * so we should avoid them here.
 	 */
-	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
+	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, 0);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 }
 
-- 
2.53.0.959.g497ff81fa9-goog


