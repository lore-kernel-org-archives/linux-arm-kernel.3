Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9171A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z/NSa+gS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sRJBeGI7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=; b=z/NSa+gSuJldFC
	xkO3/dX0mpUItQzYi5Hwprhwx5t/Q+MoA26d7azg3IBYDNl4HCa/4nTbqnYAJ+RcwibvYtpQHIA8s
	ItinjVVBdEFXO8cHrSfeTXe36a7t7S7z/l3Ob6FiNlFe6KnKlmMpWR4R/W2SOJBm7gP0I04pjgO9q
	RktgzkyTIN1Dv5JDB9sei3uoVvlUE3n9JbayjoB5aTJcgxD43i+atRgG5zjM0V19BQKFZWnXJO+F0
	lAiZMgo0m5FOigZwpBLSAG3+U38R3f7qwEulWYs83Fl61TLz/Qbw/Ngt255HbljbJmG2N9fLvfDLx
	lNcYtK6esxreCI/vpkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8xD-0000000Fbxs-3Z3H;
	Fri, 23 Oct 2026 06:40:39 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8x2-0000000FbjG-2bMr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:40:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso335960f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737626; x=1793342426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=sRJBeGI77D+zISVMVSM/DAVwYY8FuyWjvI+wLfCVGHdkA2CmwlhNErO/C/3zwgMNUj
         hikj/axtVMrfHyY6ApXeJ89aAChnK9WqTHKUBtoAQ7CxJTNBSyNg5bPuk4onrgtPFFeE
         bekUReS8QEFLqboEC/K9469/gi+//JpIgr8RM2wliX7KvZ2ZAb+d6l5GpmUKWmx7MUlG
         p0AKRW3WGP5QE7AQGsLzqfZs62GZbVJrQ5AWpKMwq+Hf1nWIONkRml93dDkoQrrex3DE
         hhQHfH2iHVeO5QEaAoxdXb3CdBSIcJjh9SlUmETWru1sKtRU1baCM0LpL1NvdKsnInFw
         ib1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737626; x=1793342426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=YkUHrHjNod6YQDO511rgOsSO+Xa313/Dl0g4uRT2AuA6ahIBkbI6l9qpHFpIaBhe4G
         59CTov5WLUCoX/vsvNBJ1cy9WTkxPzTgdECwzkUD60iE7l2NUrjYKSY8mzNTmpGgvbUp
         UBFuHMuna7SkaTms2Vh2y4lzgkzY2SuYzmDjgeDMQalqGIVET63uLVPV0c5ErJnX8f+B
         nYPdVHzSw1fVi4RAh1usr5nAxj7WGnLzY4E9qcqkp/aSfOdxIC5yqEEUPHBFHzLSbHy1
         wNhh2ptY2dpESCoQHhMQnHKS0WK3tB2opCe0qy6iD8B6lfZaiPT98tMyBwxdjm6hRdzB
         yb5w==
X-Gm-Message-State: AFq9FYKm36FOF5AIXFFZRGYr4eiYNE9icBAEXhXdZfGcyhEHNji5H5oq
	vq3PwgUeSkToF/y3iBhqyEF109ZhUATV5aWtFjHwiR/LQvavaw/u8gFJ
X-Gm-Gg: AYBFou2cpg4W1qBsXYc/v7Trb5OaoCo3rt5HxiZyIvkDyMcZGNDVAEbY5LAF6vw3NxC
	AFrUhlbj2B5MvDAApS5Fwv3qGHAL0LjID8oT4v4Mut2qjnc6lQSLR9y+eNFii7CLYPJ0atrnVth
	z9rmkA7StlPsTYS67E6JI3lbJRH4g3BwSzLVxJLuYQ9CBqen/3Qi0hdm4AzrJX7RP6CYCIG6wNt
	nwZOSqMC9M+ErvK2M1vQH1hkOoTHkfJMCPHUKGCeXgRVy2w1eY+NLxP/hBhKbIZJvJ+ua5XrGlI
	VUDGuElt28NtcI9uRag533+6mFNx+RKxX96F1cAYEFiwNd0MpvHee69ZdQXIbzTgerM6EivqeOh
	N/NanMJzdTooDvKe87Ds6ayMCQXxkzKinUHS0FrYJJljJrk8Oc32aszDAr8GHtaUZSCw9FzdwJ7
	dY3G0xc/AP+JnF9Cbq40J3VEGBa8PUz8rt6tmP2soMAU7i+6g47Y9m2JgQkmkkObcoDEKGRcJkF
	M4A1hvZdh3y0WAdz6WozGAaOvNAscS/OLvJAvgkPEZm8KvAK01T703qtVq6djiCZlL1RiAvtLr/
	qt/0vWsLc/hcKDuxFLUc6/QyW2IbJfaDdCLmiCUBVVw2H++AjYYu8tEse87mPVoawx2xiDdmfuR
	yXU8=
X-Received: by 2002:a05:600c:3486:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a211eec13amr18677595e9.23.1792737626234;
        Thu, 22 Oct 2026 23:40:26 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:41 +0200
Subject: [PATCH v3 16/16] arm64: dts: ti: k3-j722s: Reference the power
 domains of the C7x timers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-16-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_234028_716678_B52A20AB 
X-CRM114-Status: GOOD (  11.84  )
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

Make sure that the timers are powered up so the firmware can use them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 611220ff2655..7639081dc913 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -166,6 +166,14 @@ &c7x_0 {
 		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
+	/*
+	 * Both timers on each core: core 0's firmware drives TIMER1 and core
+	 * 1's TIMER2; two entries also keep the platform bus from attaching the
+	 * domain to the K3 driver's device.
+	 */
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };
 
@@ -174,5 +182,8 @@ &c7x_1 {
 		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };

-- 
2.54.0


