Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09B3CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OUoMSDobP791Iy/GDdsUAqD0YEESiZhVC1pnhE1ZEWs=; b=23wLCsPeKpDC8QR83MntLP5cQC
	mVsIBisSSVSL6a5v68PCFKavYStq8UdQTJgoUnpE8GfdTt0QU8LloMilMHuaPzjCp1hbG7gyzofNe
	tqXIjFonjOYydonGTZCjgR67lnq9mRFoHqFOnIpaBcDEuv6FKVGnarUWMc9/TOk+A4J0JoxG3wkcA
	y1McO5zZLCNulchFBOeHP3PeyQTPIIrkUh3YaSqPR/gPQVpUlDMCsElwUNCoMp4kyjsGLkonMxQJj
	0Ih/XZt0IKiRhEnNYvoxNcdun5ckVXudYCMIEsvG/5IKgdF8P56/WR1G0mCwONdrCFoIu9mku17JT
	ICvBWRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW8p-00000003Qi4-32z9;
	Tue, 29 Sep 2026 11:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW8o-00000003Qhf-0VDm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 11:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=OUoMSDobP791Iy/GDdsUAqD0YEESiZhVC1pnhE1ZEWs=; b=eOyklAWasFzngH13bMaglEhhil
	44hhlT6W90LFiRW3CTwmmwAlrgAfnYKpo5tmRr61TWvRtoWNI0QTN7bqNDmeC8KdhPMCdbT182huN
	I7bl7qqRmapSGK+/YxFZKPoFqvG2/Kvm0XlFb5KSU2nk8OheL1QxD/Alj02RSZhDZ/dWBd19JjxYZ
	dzngoikX8oVE/lkDI6ANZeEemPMytEivZkTQDFj6j1vCklXf3KbeyQ/ht9dQ+G6ATkNkkgH0MD8jg
	VXVxYWIOIoQaFugvmHrbsFYzmY7VKMRrOmTDR84EA/oUtf/h6bE0ZKMzPry9z1RPfwXP+Y/2WwcgN
	00hqMU4g==;
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBW8c-00000002ZAU-3wQ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790681806; x=1822217806;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=ATzPLgJoa/6F43m2ErAHXBxPfR4mktO/NFP6DJgxMxk=;
  b=G/QK74DA04yzwXI9kzAce9hLQveeCqwFrRvLu5tEzCpIYlI/r5pF4FeV
   NEiwpEw5BXlmVlniytMUvt983m0aK7BvQUkQPMWFhKlfSdveGCDxp7Rdr
   Ja3/fSJlzh1Bi6mVtVwix3I9SUTCGR/U3xBcoo6b1ClhHF35zKkZfZLaL
   vp8yBzAUnBgOfIJRXItsFzjNum0Rbqw/lUwEAltFfxDUNMrG3/MYMaNp6
   SR5S7uVEsFN6upC1NjYQBo3i/xRjvncT9TiLt+ZV8vHyBANJomnqZ9nmE
   qCgCrjMiS+30Gm2MhgHDo1gQnbaOi8mrq4SXrA9527l7+HP313wJg8Hdp
   Q==;
X-CSE-ConnectionGUID: L4U9HXcxRXevWSdlWqCn8A==
X-CSE-MsgGUID: ayeStOS7Q8WF5QjV4F3Neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="260366722"
X-IronPort-AV: E=Sophos;i="6.27,130,1786978800"; 
   d="scan'208";a="260366722"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 20:36:41 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F2390C00379
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 11:36:40 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9DA10C008B0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 11:36:40 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A21861800D7F;
	Tue, 29 Sep 2026 11:36:36 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Tue, 29 Sep 2026 20:36:00 +0900
Subject: [PATCH] arm64: rsi: Correct type of realm_config::hash_algo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com>
X-B4-Tracking: v=1; b=H4sIAJ+iu2oC/yXN0QrCMAyF4VcZuTbQ1TmYryIiaRvXiGwjmbIx9
 u5Wvfzg8J8NjFXY4FxtoPwWk3EoqA8VxExDzyipGLzzret8hzEShgbVBO+yYCbLN3r2I87rxKg
 cyBj52NQxnVxqnYOSmpTL+Hdzuf5tr/DgOH/bsO8f76d9c4gAAAA=
X-Change-ID: 20260929-cca-b4-rsi-fix-hash_algo-type-rebase-e341cd50d600
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Sami Mujawar <sami.mujawar@arm.com>, Steven Price <steven.price@arm.com>, 
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, 
 Kohei Enju <enju.kohei@fujitsu.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_123653_476021_3888E191 
X-CRM114-Status: GOOD (  16.60  )
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

The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
realm_config::hash_algo is currently declared as unsigned long.

There are currently no upstream users of this field, so the mismatch
does not cause an observable issue today. However, a proposed series
adding support for Realm measurement registers uses this field and
exposes a bug caused by the incorrect type.

Change hash_algo to u8 to match the RMM specification while preserving
the size and layout of struct realm_config.

Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 include/linux/arm-smccc-rsi.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index fddb77986f70..2fb6ec5e0298 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -128,7 +128,10 @@ struct realm_config {
 	union {
 		struct {
 			unsigned long ipa_bits; /* Width of IPA in bits */
-			unsigned long hash_algo; /* Hash algorithm */
+			union {
+				u8 hash_algo; /* Hash algorithm */
+				u8 pad_hash_algo[8];
+			};
 		};
 		u8 pad[0x200];
 	};

---
base-commit: 6c360697fd4d17a53ed977a1341add3520a19269
change-id: 20260929-cca-b4-rsi-fix-hash_algo-type-rebase-e341cd50d600

Best regards,
--  
Kohei Enju <enju.kohei@fujitsu.com>


