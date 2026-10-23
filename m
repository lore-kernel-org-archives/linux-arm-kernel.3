Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60A606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PCGNY0EA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IbV4bgLy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=; b=PCGNY0EAF67Usg
	LfA5yCup0A1ywHaWhunE6nvUUuCO871ri8w4VQyQ/uNNq4XtAUxAPypUj77yx9jA+IS83oidi6PFp
	uGdu6R14U4qGzkwY7Mb9K0bawptXwT2FpLg/n0XorZfCkz4nVFMZ4x5yiQi7a1EBw83lOhxG5ahu7
	wbmLa6Z71ubkxivzbDe8GcdwRUA5x63vr4GneYy+2o8nl+tWH0t2Wk3ng7VKdAovUJCvoAZobBtAx
	oarO1kmZTjLOzQm2u650cbWcKNWXpJr4bs332yjUvd5ANZAGtfUntr8C70smw6oWZK7ktHNzlYCJ6
	nHvplnHEqk4XvIm+xzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8xD-0000000Fbwh-1SfQ;
	Fri, 23 Oct 2026 06:40:39 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8x0-0000000Fbgy-21ug
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:40:27 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso273912f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737624; x=1793342424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
        b=IbV4bgLyCMeowKHfLR5XWyOkdKvZyap0lMrFK+q2Xx/NgrRHPUS6sMWtGyJkCtV4vi
         XJtD9eAkWvOHWOIKd0IPuKwEkLa3DjNoBu+LBr+e7ZsU0QtC8CfaIuwbXpB30R3OsVaU
         ok+6/vNL3E7pB2E+aNBeqMezVrpm7x/x7oYSWa0DoJAuaeEhgAsgi0PRtFz+xtKokrxz
         AXyi1xTxETi64nMuALdMUj5+YSDCKxIMkKyiylAvrBqDI/Rk3IEJu4p2if6kWBb0qs1h
         kfNRcaRfpCuqUO0gegkHgO4LaT1M+xDmrLgEPfW0pzapbRN5vfvwE1+ngyrvLNxrGm9I
         /yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737624; x=1793342424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
        b=pobvK3OvrWRGh0jXiNRuOhlBrTcEBTo8dpeq5ox9v/6m0QeQ0s00kExYCDIEFhw4Tk
         08umNQXwkYXAi258D7eR5xrVtUCbZxRiDKTjfzwqZQC6fNKWu6w9zdKgILn7CdJXDuSn
         Ix8zVvyEBJh+7WXxpacSJTOLGgDOYWsmRiDtZCiVHYvKiHVBlNov0RexisGUdZ8GkAY/
         BkHtRPD4TzvSqqC7deqb3lkwkosdX2MAkhDx7C5BoLu3+k/TVbY8WnHYLS3ECMiNnMKR
         kg9BFJ32kquSYeFz3et76WF393vjw4Q8OK5Hl8IMM9XBsH0ySz2mSJc9EeD1/+NMmVSy
         MUbQ==
X-Gm-Message-State: AFq9FYKKdUdp3WVge61qpNo+EpzhOhfuR38IOKc6EJiSpemKgeGvkfUD
	kFcHJR+Mh1vduPp/2PjTRY+DqL11br7t+nSxRr5OIK+K6XP1QHyQWJgc
X-Gm-Gg: AYBFou1tzxH7vr6uyeDceUVh6OqrUHCgdpPRxvTo4JqWUxtZTjKkHaV6qdEKmYHlpOn
	won1q9KF53GYVEVqqOmCUC081XUaQO/f5yaBDCQPFnYqVAgpywUJBrg24hE+d1/A/zS+3OuPRdI
	EXju8BkonLNddnEHNyjv+7wfGjm5PzY263ktQWeeomVUbLrd0nfX7ynwp8vnFyrG2QzLZafjNrC
	LzYD8W5yrcXEHMxtuzPRpm9dTNopOW8BXORyVKtfwp4Vkl2lhj1yGKqh8L0W5rjaJZio3Oxfn/w
	U67EiWG04OIDBtZ0WR0o3zw7KZfEMuZ1mFkbHQlrUgjAiUDrAkwY1mHWWZ1c0CM0u6xz6hx9gm6
	5ATd5glnHyYOjTjoyjI3PJr8x1uvzSDHP18WwRBSlQdfOXSaLrWk6PUovdn7YQTcxF7IE/aZ2sX
	YCKSmkhIWRRBu2XBuQwoHo9E20iPxMDblxh0f2voCfsjOPbp2N+hiLbyCTaHO0ngSRFBs8fQxPx
	QUSDF93i1DGyRmcjceEU5uEeh0mxfWtxwEvQbCh86v8uzdaSX5HYGRZqr6cT5lPCkNNteC6dS5P
	OlJ8vnH2GdbVDoOQa5CzCydzkgXxiaeK/2LtLUeO0DET0utxeKIxLZpZKHPcvwe3aATYT3Daiyy
	StWPC+MSC9JWO+fQlh3wZBttW
X-Received: by 2002:a05:6000:4910:b0:48e:1c2:55a1 with SMTP id ffacd0b85a97d-48e385c0867mr1563144f8f.52.1792737623908;
        Thu, 22 Oct 2026 23:40:23 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:23 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:40 +0200
Subject: [PATCH v3 15/16] arm64: dts: ti: k3-j722s: Add second submailbox
 to the C7x cores
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-15-3ab40aa17157@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20261022_234026_572565_7296C936 
X-CRM114-Status: GOOD (  13.27  )
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

For firmware that uses something other than RPMsg for communication with
the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index a59c3648d805..611220ff2655 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -86,6 +86,11 @@ mbox_c7x_0: mbox-c7x-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_c7x_0_client: mbox-c7x-0-client {
+		ti,mbox-rx = <3 0 0>;
+		ti,mbox-tx = <2 0 0>;
+	};
 };
 
 &mailbox0_cluster3 {
@@ -100,6 +105,11 @@ mbox_c7x_1: mbox-c7x-1 {
 		ti,mbox-rx = <2 0 0>;
 		ti,mbox-tx = <3 0 0>;
 	};
+
+	mbox_c7x_1_client: mbox-c7x-1-client {
+		ti,mbox-rx = <5 0 0>;
+		ti,mbox-tx = <4 0 0>;
+	};
 };
 
 /* Timers are used by Remoteproc firmware */
@@ -152,14 +162,16 @@ &main_r5fss0_core0 {
 };
 
 &c7x_0 {
-	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
+	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>,
+		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
 	status = "okay";
 };
 
 &c7x_1 {
-	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
+	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>,
+		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
 	status = "okay";

-- 
2.54.0


