Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF93CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=; b=hIV7ZF7tYsgUWMt+jw8/OGNCHl
	HZDpfgjA/vQICGZBZ5Lo/2rvhfy7Xr3FikNlysbxE4QpMnBysq1/kH6If3cFzrEE5o3AHpfwzPfP4
	OFY2zvCXSuH/XEx+3V6f5gqcyCCmumlgC/NnkvK0qbCURf6jMy6dB9/pWk6uOULFbH5EE9fMXPx88
	AfHLAMhJ5liOWgMzQpNQfYz/Kzb63uAJCHHrPXh/osQVeVrLNG/+Oec1qu8Exqjmz41VUYPcV8zm4
	rqiFjtBo3CCpDrJ8szEh630azXz+zQcLb8yjCES30W+iRobWaxMN1pciWEY4AGCiKhZLHLB8yVaUr
	dfs+AAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5a-000000046e8-2aey;
	Wed, 20 May 2026 09:19:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5W-000000046Zv-3bZq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=; b=BKeE2oO/j3ntlpu4WzyeKuiC9r
	0vaMoPsJtJNfArSlL3Uu0+q/MIzmU9yDpXpKVmpeabH+rnMSpVAoWuIjnLnfiX/ko8vglPTyIkq1W
	/jCstxYBAH4oYugLMN5HAHXIzgThbBLOnFUHiG5VKi2fTyzUcSQskVpm2dC4WrydyGDDV8AfkcFib
	j2C4E0fIVbZ0IT15ptVmIAkv6UhSJQXiDXNeU1FnBs77V6eX+xjvBOt2sx14uyJT/V/3dqe09F6k3
	gx41bBSIToYvJyKXeYccOg6ScjY9in4zVhNxfFCqKyClLx8nbT+AJkMLHcYUF8D/GJkocbBAc2cRW
	y1cUNMFw==;
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5S-00000006xBa-3iIU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:19:37 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so2171811b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268771; x=1779873571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=;
        b=UrGsCwAhe5LLei38v2Ny6ro2CWr3NLMkRhyohqx6MGpVdhjA3CpAuf2ig8kYkgfZL/
         H3YSk85j9V8FnWc38Yx1slfE2CAzqk7KRVtX/WoheUFOIqBHekakX9eGjhfI6FLYNuTW
         gCsiOvQh/eC/azlRNQKz4gPS9AOz1v9AUhgZKh0CYG8h+AQjbREZz5r/mgJ14nWcQFRn
         fu4vjXDqLJ4tNjMh5W1OySlK9Q/1L5UmeiKP9B4A6Dse7iVfsMlDAk//xjpa3W1uikUX
         t+SjONPZuAkyNsPYoRfHk4uhVCmTKXIzsnE+18q9jzbud5jGr2I3WdLjsJcOKrgAvcG7
         xkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268771; x=1779873571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=;
        b=OYyXwQXSZwArVEqx3VpDFqKN0OybnoSIVBjMt7/0HFZXafYJ4G9LIvbDZZFUj99dEi
         w9uHBT7/ze+kCcj9wBTNltjCiZe61vJp5PAccDyO9Ep+dZv8Oht0KUbALd0CXSNOAjfd
         A2M+xUTuldVi9HkYOtnZYd8PTW8mNFkyWceydKG54e+zGBi0Mi6ObfH3fiFB3paex8Cv
         IKEurAuFJ00Jo/OVk/vHSkmRop2raicl2d/E9KqgnZDNmAOJTZUzic2AHzRBBp3flHX8
         pmHGfjMrXGTr4++BpDRchkz3YGJM/hTMSSKcyOXcN3zwbVxGAJpOMX9knChPyO7lR0Mt
         qRIQ==
X-Gm-Message-State: AOJu0YzbbdgNkA9NnJjAihQTfXeAidh/gULz9VYwEWkBfQdfYeeNYs2R
	tdHBor2NkOawY0qwo+kVte8etdkWTwCscY+heUa0w0qLt61A/zrGeQHhoAfA5FtNVux2brdY
X-Gm-Gg: Acq92OGDYUZe4IRX+iU2eTYcLRkzA0tppTBuPQQIeO9tzW+EWR1OAd/uxdvTFvNkiJg
	ACCjGcByhQ/IhKdMNp78otw/XAnUCZXO3mcml/sCDLsFml0shhI3SSvtxJtaScYGohxH2MrQsXY
	jBXGEIP6bN+ydkRdyKRC50pzwllpxdpWaailYN/s9BK83BoBvXhwM80uEAjljZK/KJi3EsN6tBU
	WbZGgGqCQReINeA6x1Bwb5RTEzTZe07W0dqE2Ai4eMLHbED92ZC9dDxXEwUzXDpEO+noUNxaYj3
	FPnmTryDFAtlqQKp0PXcR1YKA4opzZRnNBL7J4FIg88QEQjEMwpnNu+xsltsp94hBSQoScnWiQZ
	PI+jYUhBFQEtHftKxLorYdnbUtyu84irEvYMxOOsV9TyoB5R/9kF1lkufPaxqt2gchJZPInw5O4
	opv++b0Ji4Df4SG0ThuZA/hLyXaylJuTRSG6tYYpPAa+zWEc8n
X-Received: by 2002:a05:6a00:90aa:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-83f33ccd856mr24019073b3a.39.1779268771454;
        Wed, 20 May 2026 02:19:31 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:30 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 3/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 20 May 2026 17:18:39 +0800
Message-ID: <20260520091844.592753-4-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_101935_212285_0EA1EEDD 
X-CRM114-Status: GOOD (  12.14  )
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

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem so the kernel can decide
whether a reserved area should be included in the kdump vmcore. Most
reserved regions are owned by devices and do not contain data useful
for kernel crash analysis, so excluding them by default is the right
behaviour.

Reusable CMA regions are different: pages in a CMA region are handed
back to the buddy allocator and may contain key data for crash
analysis, so set dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Link: https://lore.kernel.org/all/20260506144542.GA2072596-robh@kernel.org/
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
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
index 03f52bd17120..eddec89eb414 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -579,6 +579,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


