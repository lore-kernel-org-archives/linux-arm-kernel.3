Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ub4fbRIK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=i+wnR4Ct;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qlCwyOIQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=; b=ub4fbRIKR5ODU1WBzAnKQXgdhX
	+rHgWvQUN5EJLqPutq4TKCueHmdHMwtSlsYDhFVtD3Ae0AY4XSuyeEjoqKjdpLlDYkwA6OpbUQc6X
	935C9ZtaHMRms1HGyXWMAGefDQjW+4+7RTRFWA3+JyNdQP9YY+lEMYUIsQqtr9fT0ErGCiAyVpZUc
	UekPIlcyktTrJ2Kk3PngGYW2r2gB+iXNEEbF/0/tY9LiuNoHGbXPG8lqKesnLKXuHeFKS3aAeoxJ8
	DwQUUV83ChAPuJ1Teth1CFi2S6XOUrEx2zyXofmVoo0JEut657j83S1k7w1MmMyLlX+LAfk1iWv6Z
	KoeJGnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRju-0000000BN2L-20jI;
	Wed, 21 Oct 2026 08:32:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRjt-0000000BN0n-18Rt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 08:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=; b=i+wnR4Ctb2NerXIbmY0MQ3lX44
	fHPCgeIrXNrg/aPnPgqi5K6zP1VRgvYQkJoZwV5pHj+rt8mL5Snv/a877rIMoUNO0nugDpduThHrx
	UUIU4C4eRTraAKnvNQweYnwpwxIMUkEiPlNSspvCeLdJnTrgQFIhLrQZPHqGjio5KjWcY9ejW4Xzu
	ka1y0Hwj42GPYE2CNac3V5SckOMFtW8/Dm2XToTvrbkU8j7htZ4ogO9AXwW6q7Z9SKNgk0pYTIvPQ
	OuvWU4QTLUdsm3hu6A0risDe6wRn44YqA9Z88Yzk4pAMPXuEwXGG6ZPwzgYolbl/ZLcYmXawH/UnC
	kHsxKOQg==;
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRjp-00000005bCi-33r0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:32:00 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cd69ca84740so115870a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571516; x=1793176316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=qlCwyOIQ3Robu1X4cChSrN77IdCbbiMMAcq5OPjzFsSax0TXr4efz01evrA4D0+mSF
         6iFMLRrSQ66FbnIgmaxd9vqSfjPogaNtLLLNlTRGEqAxxCUS+ol0yehD3VoIHkosmspy
         bFYMYRjdka91T0JFzf/NW6pm3tWJ3/FHpO/hkkOHk7npj4fHr40UNtIU+a+kgRTlUmKK
         gClS7cvW8zhjHy5iSCoPTUAu8BOpJf7lm/BpS8IFwxeGiHd1NjJug/bUmF+pR/NW7w0B
         vfwQGg/iKIJd96fEuwGIV2nA3gI+4wHMRlLwCbDOEOWWwkRFNmWx8NMKEg1H+mSN1r9C
         k68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571516; x=1793176316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=cjUJRyxa8BGsI1rBE2mE2BLxxRohZjxbvDnWonr1MDA5hVWfJxUruDChISqXV+gj2g
         AnPek++R8e7YBaRaf372i7VhsEUqIZGMLPqjVFsUgm4jl3pQgrz8qKt/eGBg1a5BJuAq
         jm7iXkqbvFg6S7H05Yirf3hjhBIoIA1bn3xj1MdMnYDAfLoEPbPew74TJNTj7RLW/OIU
         TrSHO3gihyHyzbQL00uATCr9Z46c5wQZPJ4q4D5FbqgmRpCwnY1oe9ozfzfacKkQH8Ps
         pYqGo5wP1PXBgmzN3ryTSpbzYQjuVLu1EwhuANE94bJfAxRfQEd3V80GrmFCooa22gMq
         v9Kw==
X-Forwarded-Encrypted: i=1; AKwUvByQwWGJVSVu5ehmZOQNYJci/p+deQOyGi3tSHXYPp/lz8huAM6vUlNoKsJWHMQM5J/zFdhrqeK56XmGtG2yJ0bh@lists.infradead.org
X-Gm-Message-State: AFq9FYISV7maeMawsujQUnCdUTkIdA8uaV1XSVXmiJgt2/7J6fkJmFel
	8XiAHsEjiAg/swFCUhEPZQFR4PkB8swb70wyzDpcI7/blsXu+rfy6f1T
X-Gm-Gg: AYBFou2iBYsKtwXZ99ndPVPPVAVMgQ0W3ZwIk/TXMZPltCRXNIQToPxOWUzVQkB4f4x
	TTzJKBUa817UlWrYUsI5yaAm/qmmIK2Sr3mHeWFghPYIhqH2Jo1AidglIP0b4/MMxjfNTkbV8rI
	hdUOAmpOYKOVLlvClHNlxbEnlWEzzg/8NZ/dhQGZbHuqkDZ+JdF8l6hYAS9Wt7humVNcucgUJUO
	FyiM5u3PiIwVO4+LJhIgiTn3l004U8Nj+Ep4YQOyekfNv7yy9wr9JREekwZsOlZOFFwnoBHld+Y
	7sD9UgewqceewClwAK0vkv698N/mirf+qssdBPXhazq5O4PecqEAytrdWx8jL75Ho6lTHHZp/g2
	E/NRJym0ebZStbumLZCc2q9DI1a6E+aL/GYvbotrBQyWvXFsJzn0dUGINMV13ysHtiHe5Y9Kpz/
	yJXPzLharP4hJy3g0tcB4i63uJ27mP+vSKcg2KKvGRMddkXXO+IfSikuhL3DK+NcxG7nMwCTbm7
	P0qgVZmk94/NkwWnqUlAFCPlFLlZCnv7+XSGUKlFjWVM/2IZtAnY5v3sgNMpFTbuBDY/A==
X-Received: by 2002:a05:6a00:21d5:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8a089de73admr1183835b3a.26.1792571515803;
        Wed, 21 Oct 2026 01:31:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:54 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 21 Oct 2026 16:30:09 +0800
Message-ID: <20261021083011.2170525-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_093158_080919_A3E156F5 
X-CRM114-Status: GOOD (  14.50  )
X-Spam-Score: 0.1 (/)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


