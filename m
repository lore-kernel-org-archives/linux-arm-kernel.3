Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE360A3801
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0sVtYbRi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C+1X4ZUp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=; b=0sVtYbRiVKUboh
	GX7BFiL88kTqphysZ/wx1zvtUyRx2CcWG6qCcj3E5nWQ0FyyFMlSFFcttp57q7TiOS/Kn/gbGUe/f
	4Nnv0jO6lsIuN1F2M9CJfQWsC9GmtmvXJ9Y/s2wP6HtCU32srAEr4eCw77hCoiUervY3Z9lHVwHOC
	4/DLu33v1MftNKz3zpfnKn2ghYBTaZMvhxyl5uyMjMq53PPbYCBQKG6xWAMnRP4bwvqjxB2hLhzd8
	M1dHt4yqR/T+cztErlTa6fPL5cgKB7Dt/NHNU+pEH1fWFB1vhZaceTP3/2Hfrkdx/hwHw3yDzPgD6
	GViwfirltvNfo8VFqVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpJB-0000000DrIU-3hiR;
	Thu, 22 Oct 2026 09:42:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpJ8-0000000DrH5-3PIj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:41:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e977109392so10076975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662118; x=1793266918; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
        b=C+1X4ZUpWiUltioh6FsSwZPqoxCMTnZzHP/4avH8gstWriOb4QwyF9WXeWp2Ilh8W5
         K9Rja1Aj5CJLbPm8tfKXE5XamU0o2tTrebDaodeo0uY2u1Q5EHP/v+A4mmlmkoBnqGyw
         ZxU4Z6mWbTc6WqTkFUJAr7BlqhB6wt9HLoSSCn1QFESQyI9yHTDKQh+87QULBDVG7muL
         hdTshSnzbP1OufSe571yVlTBm1L8jyCnORuNGbcWtFOjrCwWaRhF1ZRW7floWO0NmSvs
         JBvbaF9wSifyoG+nYcK8l9/iMLOZ5PCDQLQSQVJGtGgWg8GE5/PUS9G9OuMSOfCAg4TT
         w6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662118; x=1793266918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
        b=i9kP9rl4pRp6IMiTWFlTm7/qcvwBUgQbv/VdgqcMsX7yewtQftRZsiWmYjzEX/I/Hg
         8dzK2TkOymaL4KxlQJn4P0bthugMU+NWbL3m4YR6JOcvQ8p1rtBQMAIvuiQRe5mBxE6G
         53kPG4nEVgq30HacN4bZadsxYd7HJybXV17NjpQddNGEqbTjgUyfDHaC5KTvIEFK1qrc
         dH+9evSuYzCh8zJmseq0Y51eIxWCpgX8vziapdehE0ia9C3E2W7gt8V9Qnq9a9nOfPow
         Em2Dcv4MrRZ3Ph1MzQQfnfaHfWw07vDXNmv1TPSa6wsIFFqQSnkauO3th+LluoyqaY5N
         L4QA==
X-Gm-Message-State: AFq9FYLMoT2C1cl7gYXrsRo2LHCWN4cpoNo8EgaUeUFEtJmoA4U+SMUh
	qCjQ6VALLqYO/NNCI+Gxzi3L7iT+LEtOZkX/EE4YVdilWySvCNSmPTgjNd3A4g==
X-Gm-Gg: AYBFou1VmZGLhTK+HjSHSJILUPOCwtsqQA9sQMsOy1JyLiDQKKVm6y7d8H5ynwbwlxZ
	s89szirSnunKkacWCCrs0LeDBPgGxgMgbOIWQqlZvYHiJyEGInr3nc1j/B6P5yjAI2MW+Y8ayJ8
	+0vlQs/jtqaedD/Nw7eO2c4vTQnwJQOoravblmc+j09cZcF4CE17EaYcBkk+jNICB/eh8ef9Dq8
	k3FRCCjheOp5iRmSYKplWcEE9nb8BWvgo+35PheepKVsfgMTEp6iyQlh79VAeW7mzi8r4NNCMWB
	CxuSkSX49wv1sWlDC2sbk+8+BDgL45PsC1UJPzqVUpP2FG6UAmXD6d9CAyJJPWIEEJsd5i/0jZY
	/qOmXR+TuQzBTlgMKHT5P4tWfQ8Chlz1S1mgJByl1L0S9RLkmhalKmuBHqeO1/UnNvYhLdRyPU1
	sqkkhi9doK0GJUE/Gg1r7UfP3hnYPhkBoBEf2nRgONLg+memHnQNMTOX4d1/ZATlJiUts8v7HGm
	A8wPZDlM45nuMFbb/ZJ+3u57cCMYKS8ucQVwApqQtInnlFi
X-Received: by 2002:a17:902:f683:b0:2e9:5c55:c46a with SMTP id d9443c01a7336-2ea4396c346mr37258705ad.7.1792662117740;
        Thu, 22 Oct 2026 02:41:57 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:57 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:12 +0000
Subject: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_024158_915582_2C03AA3A 
X-CRM114-Status: GOOD (  15.08  )
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

MSM8917 is a single cluster SoC, so powering down the cluster means
powering down the whole system. This causes two problems:

1. The system becomes unresponsive, even to common interrupts. Waking it
   requires an interrupt from the MPM (MSM Power Manager) or scheduling
   the MPM to wake the system later. Linux currently has no way of doing
   the latter, so the cluster may never resume operation.

2. Entering power collapse blanks the screen. When the state is entered
   and exited repeatedly, this shows up as visible flicker.

Even if MPM scheduling were implemented, the second problem would remain
and it wouldn't fix the system being unresponsive at idle.

Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
is less aggressive and can wake up from conventional interrupt sources.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..06f7e7f57c 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -112,10 +112,10 @@ core3 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000053>;
-				entry-latency-us = <700>;
-				exit-latency-us = <1000>;
-				min-residency-us = <6500>;
+				arm,psci-suspend-param = <0x41000043>;
+				entry-latency-us = <240>;
+				exit-latency-us = <280>;
+				min-residency-us = <806>;
 			};
 		};
 

-- 
2.56.0


