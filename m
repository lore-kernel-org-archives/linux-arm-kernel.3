Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D562C60A2607
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mb7SU8gN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vH5jVB4k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=; b=mb7SU8gNdzb5/rHlIjjw+wpTcL
	7etPRKhQP062ys3yOvBUtBMF2sdFWMsSdSpw8ts7q1OMklDdqeyD/hL/aPWblpB+NYJ8UVpIRRWDZ
	TPafzGtsAm4Ym1WrlttpB2KRJuIYtzxsFH9Y6AQCkSo4+qDAIGKW9yQ/HKW6XEC+NxUTbzrnjFlCe
	1ZoIHb5prO2aw1eBEbwQiEj13qr4JN6eyjHXyq/iw/LnSMgFVXl4cDd6nnhCvJCVy50OV1WQFSWa2
	S7mM1IZPOQ/WFxdBiY48cIU9bpxVimlznsTYgS4WAYn7Km+yrpDHQ8ty4w5vw9arAIblRx99bymzJ
	T1nAZDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg7y-00000006SgJ-1Qy1;
	Wed, 04 Nov 2026 18:54:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg7w-00000006SfS-2UGr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:54:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so10938435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818467; x=1794423267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
        b=vH5jVB4k4gOdGnN0+VqwYq2gFFaqWz4xI0c0Dj914jnUBZyf8ty0fX/O3F5pB6gEZo
         ShkEP5mnk48QYpItVfqd3TA2sVF90sliAziHi8U8NGPtNkmh05pE9cIiHiQ4Dxl24nOI
         49Eu+z3utlCZPiiCe0/auyyDOY8raR2EJ2dnUEYPyc2T6fh6dGjCXQcT00AlaqX7z4w3
         HKsgIGi45enfkc2iKGheiTa63hMcpNtnFZd1GXT9nM8oiO8Kl5gnVhLdr44Tm6TpaA+Y
         EvgvZKOaVXOsuAQvkxLL8Cdh+MHDP2em+iykfINwkGkshDlH4QhWnuYbWVOEfklXCMMs
         V/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818467; x=1794423267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
        b=dP4StXRLax78KmtXul86OC5UrvzCkuiCXX60+FqqcqvcJLJPQek9II1fUxYYjNkXTW
         cXvRjPS1iipJT05AZ5f6oETR7ivsLdWS9m1b2SUp7eiXCaEZu6JhzbIxzm8ZRXXl5aF0
         rKcdEm6i5gyQRpu0qoDUZTIrj5s2jj9/EfZM/rQ5lRafjQV6e1JEFvq/BeWofRaSAmrU
         tUGJCMpU9ktKwedcYJacCgafvC/jJwmHeBeRGA/XajzUkTWrNWQfk3VOjqS0jDvy/57l
         rGG+b7ww1UncYnIj1aAhT6vjlLv/b5B9o12VR7lxHA4bxqla6rCH9crXPfgr+7YTeoib
         7B5A==
X-Forwarded-Encrypted: i=1; AKwUvBwj42BPVx5sK4E2DCk5OLWNNtcDB1kwY/aCG5kMsZTOHoFeTCW0VyAfmcqu/OYdTv6soevLU8goK6JopkEELgDi@lists.infradead.org
X-Gm-Message-State: APuU4Z9pwmtdu98UUSAeTrLtsGCJ08vRp/dd89yIzd7OrhImvMOhbgVG
	wD36r4Ld+d736Oi5Awxmb2b9etib9tQGkR9P2ffO2BVXu/IjQjxyyAQE
X-Gm-Gg: AYBFou1ueaXfjzS804BcGchnuQLTKZwR/D4Mjb++I3XNPjbBANU8lg1+ijtWc7L4PM8
	RIC/cVr8I4jtHeB5nAT/Iq6vHZFLZU8ur6sHIm6zNC0OAU1cKtiPiDSog4a+W94f2zoHM/W99/M
	IWqe9MNe/Okfn3MIdVmlv3e3wiCMgHzZ+ZJtE/taOAd31Qtr8s/vYIvbeCVpIDx1gvrK5+wtGXW
	NIUqIOs49+v16ns/k3qpJy72MnYBcJKfq0Ww0d2TpkcnnqS8nti6x923IskJ7x7Xkff5yIuvsvt
	Jmj+tsmuo+UEw+9wMTmsfUPpkTG+Wsld6+4vlWs+JwfTKMeBgOM1hXK7JdaFmN9c4kLaMHPvNo0
	/GwVv5JLt3Z0xCY7/hm1KsFuFF16PyfyGY3SREGLbEaRg3rBO9jnpp3GWq4puntUuhn3+OkAhYo
	J5ECyw347DElFr+RNw6+Lmc4O7VPNPrG54V0S8vhYjmm3pXEnsEc/kxREaiblYjDexiAUNWBVV1
	A30TOJqnARccg8m9J9wO+0Yu8kVFfvV/oCk7eTHQDb2C719QNOe5uoAE5X8OUIPO5vMPU04Rqvw
	f5Lez2SHntZX6yn1yCnHrj772Ig8JmcyMNwrmnugtr9d9mv4/dIn3G2HaCvG3j7SNawMieBPSKz
	m7chjWyppZz4B75Q9a7YGYKOVk5X/QTv5jCru9J+xT465cFVICjAIJ/RAADhHFbcYNH2cb9xn+x
	fC1j3uJv/FPbY+bxCLNxBQFU9oC0wTV2bI3TCav8zk92PheVDgWoo7RFM1iEXNH0kSRGwRg/abN
	JNHF7Z7l92cmXHwj47CjUFsGL26QgXB2Qlax5jAije7OjT3FiClE3asP/b1sQZLMg==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr378666935e9.18.1793818466426;
        Wed, 04 Nov 2026 10:54:26 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm4687805e9.11.2026.11.04.10.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:54:25 -0800 (PST)
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
Subject: [PATCH] arm64: dts: allwinner: h616: Add CPU cooling map
Date: Wed,  4 Nov 2026 19:54:21 +0100
Message-ID: <20261104185421.883883-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105428_646536_890D8AF9 
X-CRM114-Status: GOOD (  11.25  )
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

The CPU thermal zone has passive trip points, but no cooling map, so
nothing throttles the CPUs and only the critical trip point ever acts,
by shutting the system down. Throttle the CPUs above the 70 C trip
point.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..e4e0b999473e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -1105,6 +1105,16 @@ cpu_critical: cpu-trip-2 {
 					hysteresis = <0>;
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_target>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-thermal {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


