Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939C606A5A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rlUdcHnR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/YOkRzH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nWXGfPUOc13SuA6FFyuHk3rQc4/OvREkwHvZPGh/a5c=; b=rlUdcHnRvGfR1G2TqHWiB6WzWu
	+J+wZROkVQEamv/YojE8fPRj5hwInT1AmFGWRWDm7dqYJV7IhC3O+17AgTEadrgZ22cwmc/4JHm3t
	RuWhCxBNwbVvWjPrzrBDeDqJqv/pov0SV8CR/DD6n+X5nEnkQSdDXVBTaLsyRSU3p8ifSgFDQN5UE
	C6KsQAz6gsLui/fhMfOwbB7pVvEhBfNUyjKin65fUb5WPRfJfKFxqmxs3Oj+zyWKg7M7vBL41GfK3
	G/CE/bYksa1JIJsiRzMZxeQt1RwHDbfCUR6xAdAdVcarp9Op9It0y6F9uFmVo9QtR+WEJTi4HxXLB
	2TI2RPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvQi-0000000HO0v-2QAz;
	Mon, 02 Nov 2026 17:02:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvQg-0000000HO0A-0nt4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:02:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a215e64962so29292915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638960; x=1794243760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWXGfPUOc13SuA6FFyuHk3rQc4/OvREkwHvZPGh/a5c=;
        b=B/YOkRzHXBoJ/TT9XhzzPDREuL0Zj8/8gaMNeH0CQs2I+C10OsP8vxtPm25MGM1hR5
         0XOQgzxtGedoqPGZIMA3tZJhGaySIRZQOCwYeamQkM3ysCgnpIjIDdE/EtN4jwEdF3R2
         83hkmaH79YfCTu59AHBBTYgQPSa7px7T9+c/JpoH2YBMkBbuBGADjcA88obQH+zm6H8S
         0QiCdVewAuW17Eg/wTOD5xKN2qgUbGRr0N4q9UzF3R2zFHwGu09sV8RoNF6VqQ/1ubLC
         MtsgfWLtDCJwxfa7UdG0TOBhk4lA3rS2w+38fFSlNKmVH2auVxf06DLOdm8xikjq8z+K
         OIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638960; x=1794243760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWXGfPUOc13SuA6FFyuHk3rQc4/OvREkwHvZPGh/a5c=;
        b=OYtCDt4Yz8hqYiP/4VEzzW9UQsFlu7xtIqs0pZnXZNAYejUb/AUmF3WNna5gckn3gz
         5XxoB/9CEIdaxhRtHaG/SYbDwtUZOtDBg38RGZ9S6fvhvCLrvRd1uaJUfjQhCRbJrBN9
         KWuOGLlZnHybHR6eLQHAHlRom8flUSS+kBPCAEwrplac5qD/A1bivjsezKLQBintpB4M
         skYoCxKEOYR7vUfoNkytFI6Eceyg+7XOvh9tdFE5WuSoA/3HIG3n2MS3/b44UnKrGQ1A
         S1mU9H92HVjbmuxaE5AXqJ7E7V3H5Orz9KDluCYfVfLhO7Bd3rxl2bCB7jxlJU2fBrH7
         xw4A==
X-Forwarded-Encrypted: i=1; AKwUvBz05nC2yM2qYp74eGrQ9Po2BpRznMbyxDjpsAu3wTZCUEPPqvbZRgOxnbbqEhp3LQgxff3z2AtMZFRB2xZLXjR3@lists.infradead.org
X-Gm-Message-State: AFq9FYKhReP+K5LsHRXqlgZb/u1QKGzRHfk0CJ3jBLQGSr/qQr2djSQo
	ZV1TLwuOopqE49GWf+Cpr26vLy/1z7WmJrGf+yEj3aXLHEoTyasvN0hJ
X-Gm-Gg: AYBFou0YRtOFI5QIi3nZ7liWvQA2xp0KjFnymOy5gxoorBbAxRr/SsqII82zgGPanMp
	k70VfqVze670sQqWhM/ty0eyazCntQ42bYNa/JzrHGdAVd31QCOKf4aFmn9dgMw9lLhJ1l9x89z
	TpX8Bafn0YfscMNCJnmGFB05bl+Qjuh+3r2aP5hgrU1oyyADgovkHfPtYeyrMEcHCsBikYDSMRc
	sKj32nENibqWmGx8f9fwQ925jBz8G1JJtAOGyUBRtlx9sh3p4DgF/YfrZZ4hlTMKtpJCH1PK6P6
	sz69WP8CPi7NRIDFBxI8pBo9Tw0w1N48NelYnR8bUSgB/MZx5LwMu89t6BrPN41WZjs8MgCRlc+
	bbZMtph5htEESHLuMV2ekeyeCxTfAxbfzKo0OnXOhdGdn3zoFrp6XFOqKL8X3nzmhDXYgNUyYhp
	/wKlyNpXIZOVmueniUd6nnXHhd+vUj+MQmyCqgsnCey7O0PxtIej3del/8qnzc5Ee/9D99EOshE
	kIPAyiCjeXgW6jUx/k4JqGXDCXCjFHQdMDm+iHYqEI9i6J7mnRPFbZTlkr31sAN2igfiqvS8byu
	BptlIYHZ+ghhk2SGvv13vCbAYUisgGTVGwLO2x3G6uEMSwrvJoM+A7hbY/vRFl9woCW3+dw6zDq
	fqRiWF5fd1fF9D3evGJbxY8XKnpzOkvyzpZIa32ENXg5EdGQlpBKG1AM6PU3gcbgaYwuPd0JSh/
	8617CwkqxvCIjl
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr261658075e9.16.1793638959973;
        Mon, 02 Nov 2026 09:02:39 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm700105e9.2.2026.11.02.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:02:39 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sander Speetjens <sander.speetjens@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] firmware: raspberrypi: Add bcm2712 revD compatible check
Date: Mon,  2 Nov 2026 17:02:24 +0000
Message-ID: <20261102170227.1719206-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090242_252402_BAC45928 
X-CRM114-Status: GOOD (  13.50  )
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

The bcm2712 revD doesn't contain the base SoC compatible of the revC
because they're not fully compatible, we need to check both else we
don't match for newer devices and the RTC doesn't get enumerated.

Fixes: dba67294e2151 ("rtc: Add Raspberry Pi 5 RTC driver")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/firmware/raspberrypi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90fa..ab1c77aeb199c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -240,7 +240,8 @@ static void rpi_register_rtc_driver(struct device *dev)
 	 * Check if our model of Raspberry Pi board is from the 5th gen
 	 * as the RTC is only present on that model.
 	 */
-	if (!of_machine_is_compatible("brcm,bcm2712"))
+	if (!(of_machine_is_compatible("brcm,bcm2712") ||
+	      of_machine_is_compatible("brcm,bcm2712-d0")))
 		return;
 
 	pdev = platform_device_register_data(dev, "raspberrypi-rtc",
-- 
2.56.0


