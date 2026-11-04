Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4B7606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DDIOYg8o;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=bWYCGMD0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HJM7/PuFDUDOwqvZxCE1CMPyZQc4Y2DCZuVTcSLNH0M=; b=DDIOYg8ofsVdJM
	Pn9bnp7tHn/y1SAoVkCS+2FLT6m69ITuzvLRM5l6YX7a9Q4tpLHvkI8tjRmJmQfy4q4rABau77R+P
	3zvnpWv9V3FDWRdkA9ZNmrDN9vHxS9nyYRk8llH75e80scX1dB9Slw5O3TAJg4O+Ky6BezpYCdNsB
	4uuS5hpuzcHxtXRSNrf0yqHBb5eZRgKMCDXOI5HBYxmnwRcWcoztXXRAp3jz4Fei+EbaR1aagBFIk
	GYl4ep7zLFmyuUmbKsehgApQiz2NSySEdH5Hj0mbKqgcJdjh0kTprr56gcxN57bvx8vroNnYACKmc
	0Hx/Zhs3lvvdDs6eQGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdes-00000005uxw-17Or;
	Wed, 04 Nov 2026 16:16:18 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdep-00000005utE-3djc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:16:17 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A953E240101
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 17:16:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793808972;
	bh=HJM7/PuFDUDOwqvZxCE1CMPyZQc4Y2DCZuVTcSLNH0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=bWYCGMD0qJP+YwmDPWOA+XFnLEjJLabifZ/qVezj8x28+07HdAXuPlPE38aNz0+Es
	 njakRp7uW8MqLGLcvdXB8uIThbmyIkcX5Df9ndhLj5vTVPwr9X2Lz3HEzXURpdcP/T
	 lK2k7L1yud5POYULLH4HMcXeHF/1ARE07+i9veXB1QLLCOmKQKFiuzlWtSoCV2/I+v
	 ZmbpobO6RvHSXp+6E4qX+VEfcU6Gd93blhbP7LqznnUnTNXHaTcoY89s3RtZJwvt9j
	 85C1jM3CpNGEZgjREDgOv/O7tL7oPPrpIpYiN841dMwOR2sdHCy266bwcozhMtMx7t
	 FrjRqsA2QY2qA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKVtG5m16z6tyK;
	Wed,  4 Nov 2026 17:16:06 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] arm64: dts: st: list both watchdog SMC ids on stm32mp23 and stm32mp25
Date: Wed, 04 Nov 2026 16:16:08 +0000
Message-ID: <20261104161553.30115-4-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_081616_055920_419BC7BF 
X-CRM114-Status: GOOD (  13.03  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id of the SMC watchdog
on stm32mp2") changed the watchdog SMC id from 0xb200005a to
0xbc000000, the OP-TEE default for the platform. That fixed the watchdog
with such firmware but broke it on boards whose firmware still uses
0xb200005a. List both ids, the driver takes the first one the firmware
accepts. Kernels that read a single id keep using 0xbc000000.

Fixes: ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2")
Reported-by: Marek Vasut <marex@nabladev.com>
Closes: https://lore.kernel.org/all/1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com/
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..7526e86f5a1d 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -35,7 +35,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xbc000000>;
+		arm,smc-id = <0xbc000000 0xb200005a>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..143d83216530 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -36,7 +36,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xbc000000>;
+		arm,smc-id = <0xbc000000 0xb200005a>;
 		status = "disabled";
 	};
 
-- 
2.56.0


