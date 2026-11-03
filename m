Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB516070A80
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qrLg37+N;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HW48AcTm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BJNyGdSOOirOq9LaEv4gLULV3sAodWivkwhlHUUZpk0=; b=qrLg37+NeC8d1cTUHHALy0ByPq
	t0SaEDVamEpOGDLBuaED+BQAPsbajSJ8itK0eiBW3+EcopEfICY9Q3zY6MaQWSlcfaspHfuQ1BQJV
	8zklEWD7fjhdrzPOTY/FLrDGirgZAe4AsW/DzGgmkA6DoaXlA2Js4vIFm20XnIVT+chTjiq0aMN/w
	XHFGXuHnio+c82jnPOiWlSjQNCAdUFiioLIKzR6clTvYIKdHyN4wajUQJXt2nDjI/knoKoKVZu/hc
	2SvdPwVXkm7WVz3Xm2ujs9iJRbZBKXOgC2S85kKJWegq2bUYW9RTmlPm3X8gS6aufDmHBngqTLCpj
	W8pEHcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXa-00000001vEW-1piz;
	Tue, 03 Nov 2026 10:14:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXV-00000001vB4-3Fa4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:14:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AFEE40D7B;
	Tue,  3 Nov 2026 10:14:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793700889;
	b=Bez9/PTgtvxt2BOggGHD00KW4Dv7YI/saRq/4O73rvbLviRxuTzkKzjVvdivtjK9RvMh
	 6ZULhl8tFvxBQe9xm5jNCX1J0syl0SnWmQ97ESPaNNnaldhHPtu98/5TaXQBQjy8e5IDr
	 lSBUGiX6W4c9Aigl/ygEkL/TuOKGN6NQx5lOaG8Y2AJ1WgVjB3xCzuhAGpJGV8dTSJhmN
	 QEbualFEG+8c5db+tcN4/7gpP+8ndc4IQGmW8YhiPHy5tGqQfMqdCo94ubNup8fBbNvHx
	 SLrONoWQrM7UtbEk5PeKipwzCdgVZ9nyRQHJ+TIIoSFV0DF+PwX9D5N4zHZZk3eeMOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793700889;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BJNyGdSOOirOq9LaEv4gLULV3sAodWivkwhlHUUZpk0=;
	b=vOkPIntng+PClrKuSeE3wbMgoRJcHduSaGlSNWFHv0n/cBvSIdL6RdmvDkPIGh6UYywB
	 sD9D9ffP8CNkiir6syqkKa0c2kh89+ZC+5HGqBKybc4LvkWO3zZfBxaqwecLXMgQeXONx
	 lwFdt0xFdt9fedqlybcT0gv8XY0xMcvCFW2k8tLQiTgAJeJEVQT7YSR9yRbWCv39IEdoD
	 jt25cs+5IzZKDI/l5kAp29CQsrV1YSLS1/QtrZDaeuAvBT0MEGgMYmjeQqJwvuV8oxnfZ
	 ZnPi0/gaQjEKW5UyxZp5z3EUyQ594YwV1RKbRmN8PFD7Q+L9iQctR3fks2ADeY6rMtw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A8AE1F00A29;
	Tue,  3 Nov 2026 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700889;
	bh=BJNyGdSOOirOq9LaEv4gLULV3sAodWivkwhlHUUZpk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HW48AcTm/KWAEvYZIyTKDYqblUBcr+ZhKRiH9oRKmSAgretFVnSAWR73YdZlPyC+l
	 HXngzouVQ30m/xhlYJ/r7RKaXbnS+gMcv5zMd7MjZrgmhsRaeOoAmNu71UqQ1pxFWO
	 dSEnyW5wASeg6Q5obivmlBWw3oEZrGWvqtGi0bAawBt4nNC8K6sk2NBLKhPeu146hl
	 179UKkZ3xEfez0uRuz0ZshPGDfiZ3hW5h5sSA9BpsiivnQDlqJg4QPx6iJ7ZF6Wun9
	 EJW5+qHUBC3KfKEbmYUDd2Lkik3fYopItmciG1P1mkhu3f0bktjueMJgwvajbXu8J6
	 Iox+TB5Vb6Avw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9190746899;
	Tue,  3 Nov 2026 10:14:47 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 21:14:37 +1100
Subject: [PATCH 02/13] drivers/perf: apple_m1: Remove unused variables
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-m3-plus-pmu-events-v1-2-a8eb6c1139fe@gmail.com>
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=tqfKByDug9XSrpXX1trL6e24TzZYUYwCyC7bLswrs2o=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYsl5uEcl+dSZ+X5hXZ335TA//YpED/579NTH5antr/
 o4e26K2K9IdpSwMYlwMsmKKLPqmadqT2RoulS5z3QIzh5UJZAgDF6cATGRVIiPD9t28Vy6kuPtK
 avEa9SjJuCe3Xpnr5Jm+7Isq375eX7e3jAzt/CZvnz5dJTy1LLDc9curdb4fvlUfL+sXtP3u/sP
 zcBkPAIF7Sp8=
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

These variables are calculated elsewhere as well, remove the extra dead
code.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
Fixes: a639027a1be1 ("drivers/perf: Add Apple icestorm/firestorm CPU PMU driver")
---
 drivers/perf/apple_m1_cpu_pmu.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 1f73c8a77462..de4026c63afd 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -421,13 +421,6 @@ static void m1_pmu_configure_counter(unsigned int index, unsigned long config_ba
 /* arm_pmu backend */
 static void m1_pmu_enable_event(struct perf_event *event)
 {
-	bool user, kernel;
-	u8 evt;
-
-	evt = event->hw.config_base & M1_PMU_CFG_EVENT;
-	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
-	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
-
 	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
 	m1_pmu_enable_counter(event->hw.idx);
 	m1_pmu_enable_counter_interrupt(event->hw.idx);

-- 
2.56.0



