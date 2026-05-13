Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99795CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xiR080QbM62s8vT4MbmTv04ZkR7uTTVOpbLdEGUZspk=; b=QAZbMrTtFt4tAYmvnavUaisx/L
	Fmlw695HRdcDfsYvMo5UaGWAn70DF5WvTNKa7/vOOb7zneWAFLhv2EI3hmXLpH/3iKPaLar1J7oEj
	3h0IQwAzvdTonZEYHOsYcxNl+p+x9FB/n73RjxkmwnB4TGZ6KAA8dQeaDBqqKQxDv1u0vL0l1jR0l
	Js0x301hHpKK4ZXKa12HqmjYJ3yFaQeKUp0xxOLfp80WFZImoHhj2lx8maxMJ4Hu6j8s6V/E3O3Nw
	ugLOVZH+ChOyNyWqQxbxbqY+XVjfrUAG7H5/q4Y4kkJiQpqQXDHAU6980FkgNoaKId+SEeYBARr6s
	MgPO0CvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHVI-00000003rjL-1725;
	Wed, 13 May 2026 21:52:32 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHVF-00000003rip-3w7c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:52:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48d1b294dfeso64338845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778709147; x=1779313947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xiR080QbM62s8vT4MbmTv04ZkR7uTTVOpbLdEGUZspk=;
        b=dTjt15dsnid+x01hH6+HZH0jsJgeU1HFjtT7eDUu+aoMD2ZCAv4rxu9FdYJYEa+Sid
         Wscn1hOID1btCm+/3Ie290G8VooR+o4IqZOGBqCC8DJHWiD3csi99lgNhha+u3PiDrvC
         pSUsBBh77ekGQXwNfzJrYeW6KDkrl0+PB28IoN8je8qkyXjDve1lHCHrjxHBKCLp7VOC
         TihDZMTAGVWn2Xm3+2y8HQYzlGwLRLFHexasbiJ6S9XQQb8ROQcJU79CNPMn0viCk9eY
         4FASO89kUQWmmbFMMJrOAV9c+mcIA+yVCQZvky+QQjBBWj62l8vQVGr90K4CUqSQxCbo
         JBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778709147; x=1779313947;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xiR080QbM62s8vT4MbmTv04ZkR7uTTVOpbLdEGUZspk=;
        b=NAZSXgluIf5K+9n9GuTsrpycx9wdPI1YerOZrokKibe6DFkpdDYRIE7z3kHl22FrE5
         +ZmHunuq6cu8PIL7q6geTNqf8bLZOR2e+ymDQdkGLMxe1EuI0byqHm8pPrMAyzd0omvx
         4nQtv/eiTO7ZdWFAQLVVfnh5yIs4W6EMoRLbOtWXJ5f99rdnB0lLfHWhwaTzL0vqikuF
         3HQwVe5rAMTmCVnBiMAvYObOEzUagTki7a6UbJt9gdkQI3n855E8JR5MIl6k+Zo0NJeK
         7rCsz/2vqHHSR4IPWXEmg3qviJF3pc/G659EE0Hhda1IqytL6xrDWxtHnbQxy4XZ4Mz1
         qP3A==
X-Forwarded-Encrypted: i=1; AFNElJ9OrE9k4FHeb0ko1+QV1VWa14u9SiuMPMnbHnV5ikQQ/QmAxZtW/d+/wkuiVupSS/z/1z7s2JSjGcT1G8A05wpR@lists.infradead.org
X-Gm-Message-State: AOJu0YwlTQ8hV5vzIykcp2TAIovi1dT8voTUrtH7Vgoni9H/7WtCz9KA
	wGaNZbWhnwE5+cQE8T4PTJEDdTq7TtDJFmOAuVyvG7YiBmx1G0vwVU8ZAVkHkhvbyG80wyU1RHg
	nH6UdNTGCk9sZzQ==
X-Received: from wmdi7.prod.google.com ([2002:a05:600c:2907:b0:485:c45a:fcc2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a48:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48fc9a0ef80mr77492595e9.11.1778709147564;
 Wed, 13 May 2026 14:52:27 -0700 (PDT)
Date: Wed, 13 May 2026 21:52:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513215203.3852661-1-smostafa@google.com>
Subject: [PATCH 0/3] iommu/io-pgtable-arm: iommu-pages and cleanup
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_145230_018605_2E1E8402 
X-CRM114-Status: UNSURE (   9.71  )
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

This is a small cleanup coming from the pKVM SMMUv3 support [1].
However, they are not pKVM specific and useful in general.

The first patch is to fix a theoretical issues with alloc/free size.
The second patch is the main one to convert the code to iommu-pages.
The third patch is a cleanup to use address conversion consistently.

[1] https://lore.kernel.org/linux-iommu/20260501111928.259252-1-smostafa@google.com/

Mostafa Saleh (3):
  iommu/io-pgtable-arm: Use consistent sizes for page allocation and
    freeing
  iommu/io-pgtable-arm: Rework to use the iommu-pages API
  iommu/io-pgtable-arm: Use address conversion consistently

 drivers/iommu/io-pgtable-arm.c | 88 +++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 27 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


