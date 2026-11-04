Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968A606D805
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dPKQy2S/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xVTZ9+Yr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=; b=dPKQy2S/neq06o
	wtaRbj+/hTPlrxNqGkmpGtBNoTspJQKeFnmUfoCLyn/hDqbSyYUzOgb//m7Y82B7dRpX+1jzmsxBd
	rmghsIfG2HtIptEgmpHnjbr9YlqEuBxLLlyQMvsjcu19r+eNu523bwAPriRjDEQ0ushn5NRZKhA/W
	Nn+i1OefJpxadK0uvAMxSrFad5rcJR+zP8YHrwDioQPNdFKEQjpuqJ4z+6HRngktx2iOqh0Jo6HE6
	h4z79rtbTUXzjYpuQ/AN2NAtibJNwZD56rlgqe5mi+STgIZpHakwrmL5+QHSaeX2JslPH5WaVs3xP
	flkGTc2pl2kG72mY3ESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg3V-00000006RdA-1wVP;
	Wed, 04 Nov 2026 18:49:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg3R-00000006RaY-20vl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:49:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so7762325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818187; x=1794422987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
        b=xVTZ9+YrIUm+R4DIChKd847v0jeLxY/wqWtCCwq7q15gD83hj9COsI84Kknx7RVFMM
         fEHI1ZTAT7/bkML8+MiazoL+K7C2IMeX+BVu1Kx3lvGJZMR7s4J4ycQEUisuY9cpoi8f
         kUxOkHtIo3P+is4uz2QiHJO8vCDSfkS9YIxrGkQjsCSw3jHjNLbbRo2arff/2RS9xptz
         t/VB02NCIxNmj5gWRQSoauHyrlbVt+NmB4YRgM2KZo31rJ0fLuI73yO3o7L/W5GyTJbH
         NSLF24gDsDcyyqxHbEbMQezcCjyGBAFlMfObv0CpnEGuWES5Kjomb6vU8o0pzU61JxSm
         JNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818187; x=1794422987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PHCbRvvMmLrPh5VFq5+SIP4ujixMpIDMCoNYb2j3tk=;
        b=Ukd+zaL+SWVec4uK6Asy+3iQ2SG2pmvj+JkRY5fNdtfPO/MwdZlVwtJ/U902Te+spz
         Ycmoxw4lF/0irlZyw7LPDsrpdXzFPFQUNHw+iQa257xN4j4au1ClD9m02/VCIueSJpu1
         M+KcXK/Z8urZA0USBf/2DWIIdO906+o8Y7khGiYEFOc90yKyoPVPSGEr/nNavGHsx1pP
         EHHa+kd7B/8Mx4uIXlhOngyxub5eQiDFQO0WTOiKl6pt7BndZKiXayIQHxIp9x1Lvf8S
         IEMJ+ryclua/Kn/J+ievurIH+wekA4YpJeExQiriL4kjg2PBMvYY+9sF7DCcZQdwRcuh
         Xzqw==
X-Forwarded-Encrypted: i=1; AKwUvBygaBGeR8DJeMIAD6aew7hN9dJhcwyPgxnTNmbqcKNOFICG7vyhcCqg2rnigRwi5EgExBGE5lhC0zYKJiNf2k0S@lists.infradead.org
X-Gm-Message-State: APuU4Z9Y/eSDdy6OIacNmGqZWuajH3/q22ACS0GAtD59UYz8ivfEJBbg
	4Qo5E4xwF499wNmoKyz2StIlElkuEiX1XhNGcH0f6Ul+ym8CtIxne/QQ
X-Gm-Gg: AYBFou2TAvU0zg3HHdMC4CRs8cyqX0NNKAi2LbydiGsE71AQz3z0Vsm3bI0HKvvil1l
	LJzIZHXqeZC7rp7oH0/KZg8a6oNU37mWrbE0YM9+0i3DuPTjjYsO/w5cZfK2qboFN+MuWx0nV4q
	QOHIQ0gBn449H3eXusp/13NPRitDmFa+5F4rxN74Y9+ZsakrnhLtY+sVkeMf8G0LUmK9PueeYyq
	SYLI0QipPXw5LTw1/Q/hD5uLhn4OQgQ5QopsjGMr8+zMVKP5VmwhFMkLrnUnlTmLZTbf2DMiZhe
	T3ITKrKGx8a7sBfJDoZdN8+KMoWVWq9MRThM8m1HfK27jB8RV/RaqaduZnysEukn+K0/5oWLXLK
	8lXltLCPVr/+OUsAqvs6W4bVJByIg5nxj4fVK7y/6ta2gqt5ga3rDOHzfyDqzLOTAFtZgIbpWPe
	Vbt/NE0kQS/Y/SZkPr6B1kBkoBpcCimkJ+1YpZErxDtilIFMSJT1PwE7RByxSfVe5HvwTS3B03B
	L4NL1iXJwOmT2EHha53ECc3CNB6Y83CzJnFv8lyHNtZ8PtFNFwjXUX/dtOrDN2pjT25TWTBkWXW
	03r6OhVl849S/lMBKG92SjBhrtRW6pSmL3GFEUqASkDV543Lfy7jtGPSRy3vjS6HvHtE6QCdBys
	/GskZ1TkuDCiEjgxeyekKy/g0xsu5FyFizL3Nl15qtgdH6xLmkLyMgD/1qUnyHx9C0WYvTJ/fR8
	I7H40e/J/MqF4yWAtmldkB2/4jCu4a3l1PKSY9hQtRlBfoKqX283jnL6ameAQpAT0EV8Wt679RJ
	ji76Y5bKuDM1Nc6pu8i6Y1M/0hyGCX2fUeLxhU6cUJ/SGXjrAc3RM9ThVJ4Jd47dQ==
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr364814095e9.0.1793818187271;
        Wed, 04 Nov 2026 10:49:47 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:46 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
Date: Wed,  4 Nov 2026 19:49:39 +0100
Message-ID: <20261104184940.882833-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104184940.882833-1-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_104949_532544_E0134F4C 
X-CRM114-Status: GOOD (  13.24  )
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

Only the Beelink GS1 and TaiQiCat A01 include the H6 GPU OPP table, so
the GPU on all other H6 boards runs at a fixed clock rate. Include it on
the remaining boards, so devfreq can scale the GPU clock for either
better performance or lower power consumption.

The table also works with a fixed GPU supply, as on Tanix boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index dc7381c944c9..ce82aa265cfd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..2948369cd659 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f4a5a2215ea2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..f08077175549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.43.0


