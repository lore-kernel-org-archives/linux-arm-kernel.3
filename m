Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5600D78326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SqoU25aoCSve/bqILVNe5yfkPK3ql5ja78CYsjpArZo=; b=SkB3BLH+jkml6oq+Pztx/URQNj
	P7ox4ucoiMPxWCqdOn87mu2R+DghwD9FF1k/GJwDEjrWhbNXVenAj3JrrXUT27jrNuJQJCyoGS9PR
	iFptZ4IDLAoGZW0ZX0cvVtXo3hT/UAt+jEEWypDXvl4H3XyPsDhCTsTIB1MH3Ua5jCZ990kZU1ZJR
	caOzOLr22mtuLyfbtTFvZkuOH2bAjH/7s4S3KKMOvqcXfb6bKTfILUE7EEGAZr5h0pUlP4YshQ1Fm
	1O1kwwX7y5wdyzLKiaj7q8yDCjI2QIsZaapjPVnZLaV+ouSJwaTsTqSWThCrpfVLsuf67P5+GxSGw
	4x85qeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI758-00000006McM-2pKw;
	Mon, 02 Dec 2024 14:07:22 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI749-00000006MRb-39tH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:06:22 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385e2579507so926513f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733148379; x=1733753179; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SqoU25aoCSve/bqILVNe5yfkPK3ql5ja78CYsjpArZo=;
        b=CR3nmaKbqrUaCWKjZtoysfExUYyhZs/wTddSWasj8SI6JXQDaJlFfQqMdvQqUSZ//8
         6TPA7HhLrZEyo1cGiGINa3sDE3EIALBSMLyaKVcTgX7nTiH/pBBqp/LmCmrQ+E8nHR5G
         kwtgURLNEWEt3H9zHHKbTTG+QagLtxD8l3/r4eM5GpYz7f3B7oMccLvAJfpqpUfFSpSx
         C1ptpa8uUYiTRnnmQWaCncUv1UlBlH11TCPBLrnqmsbME2zLtumD3ZrZ3u4MHeg5WtLb
         0lJQen7jskMiNJK0CZ8Mu6EDsmC6iH3LQJlHqNUU4xxCpV5EJa4ZCAlpN1RvomvTUrMz
         s2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148379; x=1733753179;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqoU25aoCSve/bqILVNe5yfkPK3ql5ja78CYsjpArZo=;
        b=lhQsBOMJir9IzlwO9q4knkYMWlZ8ZXFZNvFKB4LiIAmEg5eAcpq3L1jF+2/ucFtKya
         bfNR6vYF3FHVj0Y/p6cCh3kP0IK85j7gRRcMPy5djFi5QR/Hwi3+CYNuvG5E4ljT5ZRR
         XmttY2Q7FxHQOhUcKahealgRm2aFmcR72oBZkS9mV+h8DvWX8UnnBjxYjRjsz+C0rLMP
         O3kWj5GzpQL7CPfUHdjxtIXEytL7W+8fbZABdVPdiv4zHBjLt0FF1v8NPYdwjyc9Al0d
         UkJpX0Th4MhGiHRrgjoKhLOWak1OaZ46TVahJgWjxE6pyzF+hLAgF5HU5FJgu9lqPprA
         RnyA==
X-Forwarded-Encrypted: i=1; AJvYcCXDfuuOyPYS5pZyNTULL0y9RDQx7oK2XHZJndr6aVCVnhMIbFdA6E4sgYXK3hfTsuyKFqdpFqzRmQX7FEBi8acS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh2AkYTIPcGkW3hd2EuyXfSEE3d3mE1DlYNul3BXSfyWBBvK62
	/g105ZrPKcDHW2wNd+k9XkBj5HQMzlaHWwC+8rINpVjS/O+BOOw5o5vAI91Ur0B73iA0rWlOb7a
	ywZGNYQkq8w==
X-Google-Smtp-Source: AGHT+IH/mcK3tOpThA64udYzGszDC0pmnTz2cupPs7OsiOzbR6kdalDJmGWvQ114eQhwNcd5X6wcHbn/kIuGcA==
X-Received: from wmrc18.prod.google.com ([2002:a05:600c:ad2:b0:434:a059:b358])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4916:b0:385:eda9:a8eb with SMTP id ffacd0b85a97d-385eda9aaabmr4970041f8f.29.1733148379252;
 Mon, 02 Dec 2024 06:06:19 -0800 (PST)
Date: Mon,  2 Dec 2024 14:06:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202140604.422235-1-smostafa@google.com>
Subject: [PATCH v2 0/2] Fix missing case for concatenation
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_060621_787564_0D1912D3 
X-CRM114-Status: UNSURE (   9.72  )
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

First patch fixes a missing case for 16K granule and 40 bits SMMUs
where concatenation is mandatory but ignored.

Second patch, imporves coverage of OAS in selftests to make it
possible to test all concatenation cases.

Cc: Daniel Mentz <danielmentz@google.com>

Mostafa Saleh (2):
  iommu/io-pgtable-arm: Fix stage-2 concatenation with 16K
  iommu/io-pgtable-arm: Add coverage for different OAS in selftest

 drivers/iommu/io-pgtable-arm.c | 72 ++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 24 deletions(-)

-- 
V2:
- Rely on OAS and don't assume OAS = IAS
- Re-write the comment and commit message to be more clear
- Improve selftests
V1: https://lore.kernel.org/linux-iommu/20241115172235.1493328-1-smostafa@google.com/

2.47.0.338.g60cca15819-goog


