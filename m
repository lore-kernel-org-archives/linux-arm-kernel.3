Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5051606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0+FFhVpl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ijS/vwY/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ogr3bCQsBHWeawLHi45mAgAy8w/Vyf5t319SCZZaenM=; b=0+FFhVplbUGJdb5J4s7ZtJx2YY
	YkawkJB6ajiXY39E8Butt++C/x0Oxn2crhiHhSVpVpVjkIS1iLLA46z/UVFvq9oWhzbxb35PF1fbe
	ayvRWAfxyJc97Bl7zZ6HePRowr49t2cu/z6JVBZn8rAXQ0xgTLFU/Y/yFUTDZV4ArilboPvvw5X4k
	pscbZx+0fGuQQU40xjZ7fjqVnZ9b7kcBfDlZJgqNvE9jvg3RbcJrlNjUv97DIjBc/6yCRxlPaHDaJ
	abjGeab9ReSgX1H1Bq7ugaGssJyudlyAJXGmdfGA4lkakzucQVHf60MYX7pMMZk4DHI0ZQZuLj5uF
	HicTJKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgd0-0000000Ay00-2YdK;
	Fri, 30 Oct 2026 07:02:18 +0000
Received: from mail-lr2-x08.google.com ([2a00:1450:4864:38::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgcx-0000000AxzS-1Sy4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:02:16 +0000
Received: by mail-lr2-x08.google.com with SMTP id 38308e7fff4ca-3ac5c86570aso118501fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793343732; x=1793948532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ogr3bCQsBHWeawLHi45mAgAy8w/Vyf5t319SCZZaenM=;
        b=ijS/vwY/jKXMD264ZLTAQIZ7RerJtFyVK4g227P9WDAIGit2444GfOK/8zGDWhLdLt
         EQ6ykZO1b8U8CTRyWWeJfVMqaSCp5LnOsOVaP4E+aLl9FR0mNte4YQk3z7Vs08/RfhSm
         O2TQrN0ji5YCzMdLhSIVzYW7hYa5j716vATfwK36w/x2Hs0aTPBGuu9eN6aP2/ac+lvj
         AEKo8CEbkG7Y3y7zMRLWRHJEoV0FviHo2NuxBNK/5no2VAlgPHVJ+MLO5TGLhu88BZ0h
         EjM+PJgHWiVz2mma9Gx2r6jOMZhShb3Ccn3BY2PxfnwlsA/sfgzTgndBl5lcGIo7kH7c
         JZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793343732; x=1793948532;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ogr3bCQsBHWeawLHi45mAgAy8w/Vyf5t319SCZZaenM=;
        b=dzBQUn6tsQ2bQLGOxja+YKxiz1CnfuM4MMWZtRzGY5NyVUHG91gkwppf+309b4WK/X
         +eGkQ1Bmig5eaRqcSQGesavPvQZSlOyIWSqW+rY5GZRHBClgZ5ub9kxaTUcM44TSVGpn
         L9tagkQkNGUzXYkSRC68CFz/Am7Y/PDouKYW+Ko+XopMaiWD6YYwXCAb9wVr4C5MAplR
         khnnOvPlz2+TeEy7Kt+OSqfxEUhQENEd+Rz7sni5PBBgmI4rZG9SJPfKBYvYWlPm2Hbp
         jb8rB/ODQegv8MKI9RlLx+N1up4rM8OfmgQ7wu04RiTOAhYNBI0tVxz8n2Bt6N6x2tgt
         iLpQ==
X-Forwarded-Encrypted: i=1; AKwUvBweNPDX8yg81nrMq8QhUepSht3chGnf1YQq00ynhNRCIwldyPghdzW13zERb4lnYy+l/UG5Qw3G1j+96x6q8cfW@lists.infradead.org
X-Gm-Message-State: AFq9FYJJnO3Hs50uXHu9shpscWWIvPML4GifMk2rsTE/UKb4sXD5UU3G
	KBVsJdNPFiJekNlKcYggRCCqOnTia6bncCOCJ0kd1Q/vh6HmKProShH0
X-Gm-Gg: AYBFou1nWnEDB9pBBHmy46tYTwKeRKuD3NS1ca6CZuVqIE2J9MlTDNYK+j3PKGUGxaF
	8use1JW+7y5qTbP80R51TyBk+RTIEo/zCDgr6W+q+BlqyLGBdOBH6jGZjaptlWaYpVTRACmONnb
	uEIQg/AhkBLk1KofrJfE/7Rt11ORfwCFTMeqI1dIcuj1JwtyJ5FKeP5TNEE66APPGbY/N3o5rj+
	5cwUHJ88GT1Ff8fsuPIIEYEeRtFslFgzsd+FSFdYOBrj3V878Bn8jjb5nMZs+qfY6OdGiO1WkiA
	gRDCpNJzQqj0CVC7oskkV9/1hAoBcPKfvGBzm1jLU1N7Lay1H+iLKwwdE2tlyLvE7olUfU9uVx5
	abXvKOxQlwm+iclc9vvFpp/UrR4WRvL8LJLfn17fJvjbLS0q0SKY0KYjPE+ZezVfx74J0Ps/uQ5
	QRQZgfaFS0BNSSh5OqVc2O+NOo+VFANf6njfztoM2RYZ5649w7aUJ9u8As7uq3fvyZs9cLWAQRC
	5sYxBEq9fRIt5dlAFDD/A+hYCXaz+3DcvBzUKeQXWSRAVvIlO3CCAy2QU0ooiIspbEjaXblhAcb
	3iTX7A0/V6FVoYUrMih/lxUCqL9X3qCv2EODVZnpQ6plh+GaFWkVN5ZuboePynzgrbI=
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id 38308e7fff4ca-3acb7aa83b1mr2253181fa.13.1793343731854;
        Fri, 30 Oct 2026 00:02:11 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf31c35sm1413961fa.36.2026.10.30.00.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:02:11 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Mike Rapoport <rppt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Mike Rapoport <rppt@linux.ibm.com>,
	Yongqiang Liu <liuyongqiang13@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15/6.1 v3] ARM: 9359/1: flush: check if the folio is reserved for no-mapping addresses
Date: Fri, 30 Oct 2026 10:01:51 +0300
Message-ID: <20261030070155.9857-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_000215_408718_4C9E8426 
X-CRM114-Status: GOOD (  16.17  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yongqiang Liu <liuyongqiang13@huawei.com>

commit 0c66c6f4e21cb22220cbd8821c5c73fc157d20dc upstream.

Since commit a4d5613c4dc6 ("arm: extend pfn_valid to take into account
freed memory map alignment") changes the semantics of pfn_valid() to check
presence of the memory map for a PFN. A valid page for an address which
is reserved but not mapped by the kernel[1], the system crashed during
some uio test with the following memory layout:

 node   0: [mem 0x00000000c0a00000-0x00000000cc8fffff]
 node   0: [mem 0x00000000d0000000-0x00000000da1fffff]
 the uio layout is：0xc0900000, 0x100000

the crash backtrace like:

  Unable to handle kernel paging request at virtual address bff00000
  [...]
  CPU: 1 PID: 465 Comm: startapp.bin Tainted: G           O      5.10.0 #1
  Hardware name: Generic DT based system
  PC is at b15_flush_kern_dcache_area+0x24/0x3c
  LR is at __sync_icache_dcache+0x6c/0x98
  [...]
   (b15_flush_kern_dcache_area) from (__sync_icache_dcache+0x6c/0x98)
   (__sync_icache_dcache) from (set_pte_at+0x28/0x54)
   (set_pte_at) from (remap_pfn_range+0x1a0/0x274)
   (remap_pfn_range) from (uio_mmap+0x184/0x1b8 [uio])
   (uio_mmap [uio]) from (__mmap_region+0x264/0x5f4)
   (__mmap_region) from (__do_mmap_mm+0x3ec/0x440)
   (__do_mmap_mm) from (do_mmap+0x50/0x58)
   (do_mmap) from (vm_mmap_pgoff+0xfc/0x188)
   (vm_mmap_pgoff) from (ksys_mmap_pgoff+0xac/0xc4)
   (ksys_mmap_pgoff) from (ret_fast_syscall+0x0/0x5c)
  Code: e0801001 e2423001 e1c00003 f57ff04f (ee070f3e)
  ---[ end trace 09cf0734c3805d52 ]---
  Kernel panic - not syncing: Fatal exception

So check if PG_reserved was set to solve this issue.

[1]: https://lore.kernel.org/lkml/Zbtdue57RO0QScJM@linux.ibm.com/

Fixes: a4d5613c4dc6 ("arm: extend pfn_valid to take into account freed memory map alignment")
Suggested-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Yongqiang Liu <liuyongqiang13@huawei.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[ Roman: folio_test_reserved() replaced by PageReserved() because
commit 8b5989f33337 ("arm: implement the new page table range API") and
folio infrastructure are not backported to this branch. ]
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2024-26947

 arch/arm/mm/flush.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index 6d89db7895d1..ef848bf0df28 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -280,6 +280,9 @@ void __sync_icache_dcache(pte_t pteval)
 		return;
 
 	page = pfn_to_page(pfn);
+	if (PageReserved(page))
+		return;
+
 	if (cache_is_vipt_aliasing())
 		mapping = page_mapping_file(page);
 	else
-- 
2.53.0


