Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C0C606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ukYLLbVH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4eQB7yw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=; b=ukYLLbVHEW8lh+
	NIFOtMeby+OrXBrzKxnxovDg+0IPCNoqHAW9gj6KInPDJS5wUIDO0tYuqPJVXhFSwpXDAG5a6B4KR
	m3Ula/Y3h727UaX6NC1Io31SwQsynsekqCpDrCVVpCRTLKcafDxsF3vNWtKNQcX3FYkG6s0ZyZi6F
	VMN5tgUlBsYzROFhp8pT9/70LqNCth4juJV+mit8iCIBPKbEydmikqJ+DD3l4wbYkokbyYNFslDuS
	oRduru3du+1EUkl1qOUgZ6Y7s+QvRoL1M+jo5w7j6Qt5Jy9JNGk1cySGj4dmC1i8qDapucsYy+WOq
	IZQf3cYXtCqmp9tlJrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg3V-00000006RdP-2S8m;
	Wed, 04 Nov 2026 18:49:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg3T-00000006RbS-1e93
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:49:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9569985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818190; x=1794422990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
        b=U4eQB7ywZDbcudKvp8lMXP5fqixu50oeer0M6SMrfsabZX9x/MLaszAtnKx74FdyIW
         4JfXXb2sBkSazFXPi3mTVUSzuFgFbcaTR+vTH8KBZANbN/3nNyK0N4uF5a9nAHicQ4oe
         pQoQCMqHg6huCfE7m0RWdfL/LycdLFJc5C8REZscIFpZX1duaVpRlk+Z5ftqzAauZKAW
         wE3sw5dUEIkTuZI0B79VSE4nwF9iU+wx5AiwyhjW2+kSsps3C16a/Qu5I24VfNgg9MZ+
         3U12JQpji7KbJPvr1PNX01zzUngBVgM2F0fKIi8d68lW3/VphoMRNnletMN5Vb4N9bCl
         nzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818190; x=1794422990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
        b=SffdUsOx+xS4sHgcJo3QAGi+apL5uddNXJ4JVL4s3/C+ExweIOig1STLXgfytT6J3Q
         EG594xYE9XiRij6ciAw9CXmeHs2t98GC/6B4Y/ZzJGEaXqfGhZW08eAfUxO1mKcheRSy
         KUdeZoWNUrxhU94x9Vnm0bidotRd2TtUTmb8PLcRp6vcGaUhD12odDScDYql76F0/wLg
         o/B0zmj88HQ+JOHNmdDnBENhkddpv+8ay5xbdlkftQn4GBziFI36+Oh9CNtqZW2uFZXw
         zjL4mcgKDdhoynWFyBCciEtg6x7C3t7Vt+FzmVHasiYRrKXUiVVBiVse3GmdKEWOreel
         WsdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzibT1Os6C5P5rOeuVv2B5xyWX5Bk/EnuGAEyBQ2RADzrvDtYHc4pQb8UCyjMxXtfUaDZMjjd1TxjYKIV34DjXc@lists.infradead.org
X-Gm-Message-State: APuU4Z+uJHIqMpTmBhowS4n3NjISU2e5AKvdMQyBWMcEYk1FlvWgXWfp
	sanGHJBhNdfQDmr4Kwz2HrziNDefCTRJ7rw0HN5bQT0LvM76qv+znykc
X-Gm-Gg: AYBFou3ckVjYLlx4atOo4GIUslCu17YCK+jSGfrLBX5KQMsRGYQRF3rv9LPdzEGd8y/
	5KwvoNWHaP4BKgYmdXGKv6lZbT8ZwbaP/1r8069Yc2syWcUtQfuG7M7rzVTEZuOUy4PQCzOxKA6
	oLlR4KeQJRSgdxnMk4DAlHFawpe3bvW05s3kzj7gIZTM44rz8KCjCFpOMDLf4tgRhCHZW/hHI3n
	ct7JR37pwv0qNLZewLI3mSKaa3FpeKxPaaW/fSabTqDUlYxg/9bXMwm4mMvi+8x23GDmj4ncStf
	If8yyUYRhHem0Di1dmBxEfghk4r6k0xPrrSTTgNoPUx/jG78D+kmgg7+JMawpW6Soq4NhxIPHZe
	XDFKxFdOgBIBV+naGGmJp3Vihg0i4kSQra2LKNSpws6h3ptJoGUkXxsgaknJftSfvkUVKxPartr
	7mFlKGcZI4NO+8cwFZo/WBH1Ua2LOp9EUEM8hK/2uZyqMoFkoHD6eNkG/H7/c+yCwZqTw7vlqCO
	vFUWIk1PA6hr1jPaKCx3aas4ydTR19NQxUtHfk24RDXZr58SVgWbNaY8ZYykqVnnfMhKk+5aGqi
	GrNfeCCPfIGqKNuO1a+TrmU6P1un6q/+DB41/7SLUbMHtgvm4pRX74iWS6art9ISSAc3IBxAAa0
	uf6Rn3QzNCNq/E+klFw+n6r9nWqs6c+TWIOe/L6HEu4ixh0CFlrd6lZ3W2CgXo4w/Uho/41knJ+
	2FB8OOBuVMIKT38C02YpZXP3cjdGq9TeM6G8j2wXf3AQlzSMOig/8kEJ8aMmJzoVSvR3YXMIGxS
	kvtIgFkQs1G6ePq7S5cCMXjGD8EiS011w+d608+jkAR
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr197486915e9.20.1793818189742;
        Wed, 04 Nov 2026 10:49:49 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
Date: Wed,  4 Nov 2026 19:49:40 +0100
Message-ID: <20261104184940.882833-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104184940.882833-1-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_104951_457844_BACACEDF 
X-CRM114-Status: GOOD (  11.00  )
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

The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
so the CPU never scales its frequency. Add both, like on Orange Pi 3.
OPPs above the regulator constraints stay unused.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 2948369cd659..b7351b1db97c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.43.0


