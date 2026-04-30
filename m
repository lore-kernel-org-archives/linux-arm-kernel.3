Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4986ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CE7ryhQPSrXB5CO15AITdkHOu/b63A3t1puDBO48YFY=; b=ShJ3v4jvMpNUAILNURkMB9xdZa
	z2eGoJf0pNojz+1ryWleGm1bFYf60GNsrGeWLqQSNbN7fNrGS0X2fTfIugvEHg2NuuLTkQpBUqjWf
	o+BijywEVdWXuZqCD2wUtmRQA7JzVtMhPDal0NdwDbeZmXIFTVyQOcnmVdmoR+3uhegdQn6tvDC/S
	yXb94IP55wnkoWuKvnxDhIhUmenggCKk+nO3Owe+7fETcLV/7Sies5hhckej4ybjFNZcY9rkL6Vub
	LOXgsWKAv9khXSZ633Eo4+1sgWWaTTvK4ToIa2hgp5NePDzcx8tu3vmdYPtkpSauGpKnRxjwcZWaO
	WatjI1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOm1-00000005D6u-4Aoc;
	Thu, 30 Apr 2026 10:37:38 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOlz-00000005D5n-3nhc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 10:37:37 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d03065782so450305f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777545453; x=1778150253; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CE7ryhQPSrXB5CO15AITdkHOu/b63A3t1puDBO48YFY=;
        b=D4XdDSdydLNjw779SokUUeQ5++d9+8gy+kY+E4RwzOH9dHcymJ3D2gJZf8qY4jN6Dp
         97hYw2GBMXbv+8oQtoWnEPNIPSEnKg4ov58zqvdSGydEXhBc353mZn585kwOuQHoLcXN
         ND2Rkk43fAzyZz/WoFWyjWiRcMvvK9TznPR+xihLnAdR+/EcSTVwTGhQUK4Wz7g8lXs/
         jRwgwCaeWkPp9iRXPFnq6WdyyMhDk5iSCFbIamWsDtuKURxH1tOT05izD0Aa7WXWvtrQ
         V83RHbIE0Z1Rrpi5E/jHYhV6HQNZZsCCrTYcanVRLHFJXnUIaRfjg5S+Of+z314rf1IK
         5woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777545453; x=1778150253;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CE7ryhQPSrXB5CO15AITdkHOu/b63A3t1puDBO48YFY=;
        b=aBHp/dmZdOemjfma7Cediqezud7DkEc6Cjs7E+3Z9eI3Avi+KoJnNNkHpQmTOg1UII
         LxB1Xg53V+jZXFL89OcI3FMe5iLcq4h1BXF3v/yDfcXMI5VfuppGOGsOHJgfQQOwCEcm
         Aa4pOk9iwt1/OGRM1o9sVHNi049NKDy9RhPeQv+z3lq5CXp/OfYXo9HuCl3vrimNhnB3
         +ILu1xTEbqww4nAa+Dm5lPiUDkstLqDkTY4Kk7bE1ThFy3i0ncdp/0i4toJnZbaZqhWY
         ypjraIantDkEFRK6Wcsmo1sFW53E8kfWeznPqZEMOYGuG8ECPw65si6Melzm2xosHfoN
         t5/A==
X-Gm-Message-State: AOJu0YywUo+wVlcql1bCTG29eEI8+g6aXJr/3lzJ0exMd1JunRBN2EdM
	/iprTTT+FD3wmASHDLEAaxkZR56LAVW6JK+0Jx+i6yTXHrlFrMZeVMQ7CtnGSMS6F+dCkbid+pZ
	SlbkzGIYflgBLKEbaHLGe27dUuylg41eButzhlfXymOD1OzO4QCeEHumLISnx+Ib1VttuX8aZxM
	NGsyxNjnB+3s46FXW5XujjSiyGjtxNjkneTzL+/nTkPqMgbOvywoSuQAexmoVYMopJGA==
X-Received: from wrbfm1.prod.google.com ([2002:a05:6000:2801:b0:43f:df99:cb43])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2906:b0:43d:613:4036 with SMTP id ffacd0b85a97d-4493eb6d792mr3587302f8f.37.1777545452617;
 Thu, 30 Apr 2026 03:37:32 -0700 (PDT)
Date: Thu, 30 Apr 2026 10:37:24 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260430103724.2151625-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Harden clock for nvhe/pKVM
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, vdonnefort@google.com, tabba@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_033735_951528_574E83A0 
X-CRM114-Status: GOOD (  10.12  )
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

Sashiko(locally) reports possiblity of division by zero and
out-of-bounds bitwise shift in trace_clock_update().

Although the clock update is untrusted, we should at least have some
basic checks to avoid the clock value getting out of sync if the host
is buggy.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/clock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
index 32fc4313fe43..a7fc61976fd0 100644
--- a/arch/arm64/kvm/hyp/nvhe/clock.c
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -35,6 +35,9 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
 	struct clock_data *clock = &trace_clock_data;
 	u64 bank = clock->cur ^ 1;
 
+	if (!mult || shift >= 64)
+		return;
+
 	clock->data[bank].mult			= mult;
 	clock->data[bank].shift			= shift;
 	clock->data[bank].epoch_ns		= epoch_ns;
-- 
2.54.0.545.g6539524ca2-goog


