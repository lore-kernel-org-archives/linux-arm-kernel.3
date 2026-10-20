Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB48606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mxxl3anl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fXi3rNs+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAt+N+CfwxGGqH/GXlVvLN2X8FJUBl27+lXcZ69Smo4=; b=Mxxl3anl4eL7+BcVy4RqqNCHoD
	/L2biwMY6g4VmvV5ae3rNuNN1oe1o2E+VHTSry41uxqHZVJBf+Z6CMQXuq3hVf0jIA2ue23Gthwbf
	MfkGoLD4/4kxifiTXUFhIC/9NqZqo/F4KGjyanSxdbLH3KbZ0Pc9PCNxmGk4xSNeuNklxtqCRDaDz
	D769wPPt6uBB9Ap8HN58r9dyEL3ouM7fXw+llpOAGlg4NZWs/+IRF6dK1p6ViYi+ogNnEpzKGUXlT
	0/TIDJNleVZwhYBBWKCLihND0s1PIbaA6mGJo/g28/lcGw2B+hfDWkTnxOFMAAoGkwDx7xQMCYQ7H
	ArzL1u4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJIJr-0000000AkTe-2BJr;
	Tue, 20 Oct 2026 22:28:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJIJk-0000000AkR1-3PqJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 22:28:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1260355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535303; x=1793140103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAt+N+CfwxGGqH/GXlVvLN2X8FJUBl27+lXcZ69Smo4=;
        b=fXi3rNs+70wYaR3psviRXtaKS1P57/JrJjREUXlVW9cqD8nCZgvLboik8hzdYBYdQx
         Ma03BTo3hjORp0pB5RAi3sZhCiFPgQceXkZZi3VWDI/Qbc4bk9Cg7CzOC9CCRDUKvnNe
         OTQl+1ma5twPIhqn7jZ0wdBnQyZlSVinPk1wn9A9U4PHNwCK4NZXOv+FuNsDpzn7Kaev
         CmYIGrDTC/7UmCI5SDo5PbJHqccG9dveMAQpzMFlAyXlTezWLkDMWOUbdNXRUSiIJu+n
         QHY3ehkBE5H9V75P1RTGWd5R6cQBykhKLssAngfq78Tff/93G66BMvC9tFzL5Num3Gb7
         GImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535303; x=1793140103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAt+N+CfwxGGqH/GXlVvLN2X8FJUBl27+lXcZ69Smo4=;
        b=TgSm4dsXT3T407uh9/bEQRNhotAyEF5bfCBkJYfJFV0hgKlHdqkjeHf3B8gyPl9z7G
         4hoi5MzK477api2hrdu/W18V3fcDtM9pWdNKbf1yvOJaDV6XqsaQmIPCcBNI2uweCzBk
         e3RN4s8+Q4LuGKLxY/D7iCf7SihJ7rA+pHfUhwwAnFoaula1JC+D7xHu1i8tBD499rvy
         1T3qCsc9oT72zZuxl7pbpFXUWZpuW0sm/bXwtQRrPcbFMNBb/r+SjXLKnN700DawAFAv
         lXIw4yOhNA2nx77s8nA2vVDjNZ0cBs3pOTUm4znkeguIbTLtb7CJnPmyRqduYyZ2cNq2
         +Ksg==
X-Forwarded-Encrypted: i=1; AKwUvBzaRabBYv+oUqHw+lhHndWS8ourbCfBhNHX0X/x+WuCOfQoHOAA1CvfkN2CsPfVleBn+4Esz96WFRA2154XTnHy@lists.infradead.org
X-Gm-Message-State: AFq9FYJklckJX+dfJppQIUa5hAHmRI1CRzADa/UqBFKyVi1tw46OhxJd
	wDN/GQfYN2e9bH9rMJD7lpAJu7YljyYxRCxXZjL503Fpq9dHiTAdgnmAuWoU6zN2pjw=
X-Gm-Gg: AYBFou3/QTKvLt8aIJdLGk4So26J/Kxtj098M4vn4LUvLbr1wD99uxzuR6MQj7xC6tu
	8o6FN/stYu/hzIHQtO0iod0drTjHSz63GAVuGCiinS63dDYs6fBJ7TeIava48RplNdMkR+MkUh0
	IhdNRnt8RlwSgaWbfeiZppE1+qf07DKcpE530UOZqQZ4lzXSGVoPPqeTVJDQpvOJv7bVOV4V0hQ
	+Ly3jUR7ltqUpJmL108qG/0UGLcv0sdfrqDV3FY/fqkZokboL4S5HzDYZUe2yTt9cqX6NxUa52W
	YhqgIp/yp2s0O4vQ8fxeJczk3er7RO7uLpIkKjs/XN9+PnSNgkEql0HbTVHc/yZqyvaCK9L26JQ
	WaVQ5V+1nIz8Zvz0hhbf4mcNtHxlWyY+r5MeRcMbOVVv+IYrfvLagSS8RmOsO4MFD10K+02ZI0b
	k2FG6ZIfl32SX/JTJOg5rpC5aYOaCPyzEoFR8fJDhStYpDAgBoCCAtMUwKaItZPeX5fDCorYPPH
	umKUoKmKv9OZs2txaRjJVJbUOJBlZj2MYCEapzF1x3pxmPLLFiDhLsfZKnm9vM=
X-Received: by 2002:a05:600c:4f91:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a1fdd0c00bmr1857655e9.7.1792535302752;
        Tue, 20 Oct 2026 15:28:22 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm9661935e9.5.2026.10.20.15.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:28:22 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 1/2] firmware: smccc: provide stubs when discovery is disabled
Date: Tue, 20 Oct 2026 23:28:16 +0100
Message-ID: <20261020222817.1231643-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020222817.1231643-1-julianbraha@gmail.com>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_152824_867531_C718D13D 
X-CRM114-Status: GOOD (  10.49  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add fallbacks for callers to avoid needing #ifdef guards when
HAVE_ARM_SMCCC_DISCOVERY is disabled (32-bit arm).

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
Changes since v3:
- reorder patches to prevent build failure for 32bit ARM without PSCI

Link to v3:
https://lore.kernel.org/all/20261014123539.2259230-1-julianbraha@gmail.com/

Changes since v2:
- split out changes into two patches

Link to v2:
https://lore.kernel.org/all/20260823180832.1246363-1-julianbraha@gmail.com/

Changes since v1:
- remove select and dependency on ARM_PSCI_FW,
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64

Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 include/linux/arm-smccc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..75f9d3f1723b 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -324,6 +324,7 @@ enum arm_smccc_conduit {
 	SMCCC_CONDUIT_HVC,
 };
 
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
 /**
  * arm_smccc_1_1_get_conduit()
  *
@@ -363,6 +364,12 @@ s32 arm_smccc_get_soc_id_version(void);
  * When ARM_SMCCC_ARCH_SOC_ID is not present, returns SMCCC_RET_NOT_SUPPORTED.
  */
 s32 arm_smccc_get_soc_id_revision(void);
+#else   /* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
+#define arm_smccc_1_1_get_conduit()	SMCCC_CONDUIT_NONE
+#define arm_smccc_get_version()		0
+#define arm_smccc_get_soc_id_version()	SMCCC_RET_NOT_SUPPORTED
+#define arm_smccc_get_soc_id_revision()	SMCCC_RET_NOT_SUPPORTED
+#endif	/* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
 
 #ifndef __ASSEMBLY__
 
-- 
2.55.0


