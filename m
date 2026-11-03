Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF4606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hbyqeTl3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ys+pFhOP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=; b=hbyqeTl3pGOrSj
	r1zsQ1nTDK//pN3JDWOQVfRxeom0NxysXF5sC0Qcomki0JPHR0YrkO9UUDoqd2pV+kjgvRGvFZ1AR
	qbqE/XqbxnSV0cCEBRFzoBc9+/q7HwuJGNn94E/+0Ya61ZZw8Zqm5frH+95IOWb6ERyLqfYW9rYuo
	bjzvkaJowAXFO6u7F/FnKIT+6+SajIsj29/9VAWA1mBf07v846gPK4b1ZVMvoMppDvxJ1RKQncA7y
	ci33Yv3WmiPzCNhqHX1xyFF6JA/7ZZUu8sscuFwInPxFvmCgPWYY3XPjHGjyc3h/9K3TrSPje0iDs
	9JKF5x2coHAymHlA1oQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA4v-00000001bU3-1mz0;
	Tue, 03 Nov 2026 08:41:13 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA4R-00000001bIb-1iXE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:40:55 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2765058eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695242; x=1794300042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=ys+pFhOPMKGk0tsth9qx45vO7SitqMh0g9+vcZFm++/yGb384Qgwc8iJqblJR8Evp6
         HNtCLneaF7dMoTf0yxRRm0inE9A4iilWCXxtlF6og9m8Z/TqEfLcEKpRytd0G9SetNad
         erFmjv7u8s3uNGX5UaDMsmX9xeBVK7XSPzmPmc5J9oUJFq2X9ZmZGU8zSa09pPqapZiH
         lEN79hYAHOOCLACcZRGBCeJJJ9tVinyWUs9xcm+J3g2FUncfhnvTDA4BugZWURnXj4lw
         m59XJ7o69wpFIi6NbjhJbw5LnEe5nrSvnm6YmyGq2b/Klt6NXocbme6VtfR3MrZ1yE4H
         KSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695242; x=1794300042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=f1zfHkR8/cSSgQxkKda15UZgmlCL4xjsQ14CKddztWMZ6rRI6mR05GLhbRSn2XBvme
         C9s3O3ABtxq+Ko9HtamLTtjNfk/LBsnmyQiEVwFEwkso2K0lu9f1+DfVQRl2d30PYSgX
         vxU/yMt4zSzVwW6m7emXiwG5SrCN41fpqVhRW6A5ICHDejIbpav0NGXXFaKYgSfYurd3
         4ti7ZVjOeBY3Jj64gTv63oWs7nGjgLVKAyxXElHwSBQcCtv2gLOg1D+tY1H/ImFochKr
         xgLc3giHZG+VnNnCe4Drd9e2VvUDDIHY717J6JXmmomILKBvX1i+jyucY5W0+oxXr2QX
         AJfA==
X-Forwarded-Encrypted: i=1; AKwUvByY10YkNSUpoOK43te3EFs4xLSOk0YuXmgaFxlricSXxcUVTaR1T4cD7Gfx8HgZt5tgXG1JstHMH8zM+7KhJ6Dm@lists.infradead.org
X-Gm-Message-State: APuU4Z+7skBDmge0+QfymQzfP4jin1tsVksdK4xPePeNs+sf/AABOCkJ
	t8eZyuTaMkkbjkEJAooN2jKgG8FeOO7e1Mm9e96THwWCDsOKTao/j/Kw
X-Gm-Gg: AYBFou3nbXSd9xjXgIoXsTyrE/hC8HRMpoBN6T2n56RI+CVPL2OUVOC1bNRJADcO1Nt
	fnVj4k2Ogbqe96BHMfsxtobN8MkTUMg3cIJMK7rF1iAidsTb9VMFq6KzYauFYMiG5GBfYUvjv3S
	9frlXX6v163gKkN3ir9z9Bfxj+F2+VfWHMh14dct93D7vX8Mp7dN6DmWyYBS4jpPXw4tGs1W/8F
	97E7cR2zY73/6iXHZujvcS7i23PoMumcUQBnbhgrxNhdLXrdHJKI5earOO6T1aD1xFbrOmN6JYE
	N+gjp2DZ1IhXS6CiQxo6EeZIwLzlX/6UC2bNL87b0s1rYTJDqXiXeQwU2855yTEdHwNS/sZemhB
	X2l+ZAx/Dof5/1GKPozdF0jnT4CmDz8JZ91W3kwey18UYtpK9GazdjwM4QowgPpUteS6X/jQTF0
	RN0cU8A1AIVN++gkoQybFhRXWk2CioOptx354F0SQHqpgF53k7RbBiTI3MxNHTfeRpjNgIEICEH
	RmAAaGboM4KLK+IJ1euY90qVDQYw90d2PskjjMg6Jdg9+Atrn8W8LzmUfvYDEJwnScUlf/gY0ul
	oquonTyQsrm0DsnhH9lXsMBhND6PpHlE1u0Pb510RRP1XN+dDexz+KwALLlMniByuboioIi+4bR
	UDbTO9NQ5Iq5+VnkFZcWc3go8SrWXudQk1NpTlSfILccFClmlSryucWRBimYtCPTlkHXdgrx4vW
	CqcmAZdE/cEFeFa3K68SssCYGPNx4acMPTxdxL4TXNouLCYl/Q80c=
X-Received: by 2002:a05:6820:240b:b0:710:8db7:5f57 with SMTP id 006d021491bc7-714f2ab5e9amr5840218eaf.78.1793695242282;
        Tue, 03 Nov 2026 00:40:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:30 -0700
Subject: [PATCH v11 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-h616-pwm-v8-v11-5-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004044_735736_10DB5F99 
X-CRM114-Status: GOOD (  10.61  )
X-Spam-Score: -1.9 (-)
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

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b80ae0ac5eed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -947,6 +947,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0


