Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3EE606BFB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ub+67DF+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbfLVqRc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fgba86xwfdZqqRHiaO5L5Vm2/4yrwcvPZGNzBFrMW20=; b=ub+67DF+unc6grXgW60puF4bp1
	0u6vPoHsA79tVXqCHpJNInYCUrdSu/URKzyTezSNbnNI7Nn1qYLIbJDdaEAiks8fMLqHuNUQw99dO
	+TKMJGXDal3F8Ua2N5fhdxQjQXOFxZ+zUqyqq3gqWtgPD+oI+OXby3tVJsdqhmJ2lT9FRuBMz37qk
	4nmoOO6dKBktiFLHS7md0D+ZUebxLlnNNzMH1rLPT79SoUyEhHAQD4bpNYMy2oFbq4fs/N9hrIujL
	SNa05HnOet2bTHZjtCi53jpKQaWacb/dq8CrBD5xW6pklfbozv2fgkl8B86Gxe4gU7Tdc47oep6ZV
	MdlDN2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXl-00000001vVU-3zQL;
	Tue, 03 Nov 2026 10:15:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXY-00000001vDW-3be7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9645243C9E;
	Tue,  3 Nov 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793700892;
	b=3YipTnSjcXyT35fYY4XMJ/l4PxXyW1xSeohm6HTD1nOhxMKAlmNJqepNz3ofX15Elwyt
	 I1pJ/2zk5qFYfAbMfs3baSD/aY0xhZvnaAXihdLdtodGto+wwao9VbnrwsXHBLZIVewVf
	 J3SZ1fPW5/NWg/ddpcmBl0/mWdVDyXHIpKN6iBDbgBfHy/qq7wXlvR+K8wZVk1b+IcxOB
	 Oywyu54+KukDxPbpwjVZ7eoiIBVZsgQCZFgovocn96KdXeA0EYpT59snEYHfGUsZEHUx1
	 WbOueD9WLLbJMtvw55FmJ44bZZTOV958BORBhaxLKyWMA3xPNJ4pe0M+h0li0w3eWrA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793700892;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Fgba86xwfdZqqRHiaO5L5Vm2/4yrwcvPZGNzBFrMW20=;
	b=dkjSZpiahhqeXfigZvfGDh7fyACltTFf+jJh0Dcg/VXWNd23ne024dBHKeTf4GF2EUWz
	 1/sNzq0GoOcGUaP0iNA5teoS+WhqNKqokIRzwEDzCq9k4oL2oTT+AQiDyjuyVImv6lO2S
	 c8K7UlJdW/y6hoAqXkeuUNRAHHznz6YGyud6Ly1Diu4j3YTTh9YG5gMZ1/637yTUWl0gN
	 fSlqR1ezSpE4o56kEE4WbfitTHKfC2D3K05VBAhGDMnjQVpWcLiSJ4R8ZYLV9S5pgzp9j
	 4HabftMHJGFhLC66lqC9fgMXoBICZkqonLnn6r6IALRqJko5CSzVdbA9jwny3Xupf/Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DB2C1F00A22;
	Tue,  3 Nov 2026 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700892;
	bh=Fgba86xwfdZqqRHiaO5L5Vm2/4yrwcvPZGNzBFrMW20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SbfLVqRcJ+1Vn4fFE2+i4Lbh6POTJz4qq7m3BxSwYm5qOvKh1PayyfkqXTKr1enef
	 b85cFVBzyq48vdx0l0f7J8k6ityXl5vHeCO3NK5SV2MqicdpJcMufc4EgiW+oKI7tl
	 4ZtQx52rqaHpj0lMT3/hA0H8pJ/lzCvvWNUVVIG/a+2AX5RGxwniTdrvcAfQX3ttEa
	 RLO+c1PJDdKPpQZAjnNB/ddkMAwvLjRgYeheu+TCr7v7UMsKwh6U92rMJENOMb1tVZ
	 Onj2g7Omt/aCXGub2z5Bnggx+5NqT+IdFz93y6Hw093cRD5i1mqfuOUBXPGPY+4jKK
	 UYhTYn1uYFfVQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D053468BD;
	Tue,  3 Nov 2026 10:14:48 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 21:14:46 +1100
Subject: [PATCH 11/13] arm64: dts: apple: t604x: Add PMU Device Nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-m3-plus-pmu-events-v1-11-a8eb6c1139fe@gmail.com>
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=82FeCkY2XmEN6t3vU4Vm+A64GuN208WcUOTCqWVFzu0=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYsl5uEZU74nbdTu92eseNXkWGSfqiDSuWvjI7vOL04
 +vJkmd9j1h2lLIwiHExyIopsuibpmlPZmu4VLrMdQvMHFYmkCEMXJwCMJF+I4b/7ip+59j7rmn0
 XHC6l1O15O2NjW166+xSDJcckNg6q1WKneGf6c7vDWWGL0OlGHVMud/OPH/Zn+F/zrJnLfeMmtd
 ZrP/DAQBaZktP
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

Adds the PMU nodes to all t604x devices.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 arch/arm64/boot/dts/apple/t6041.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6041.dtsi b/arch/arm64/boot/dts/apple/t6041.dtsi
index 9110d05c896d..2c72972d1219 100644
--- a/arch/arm64/boot/dts/apple/t6041.dtsi
+++ b/arch/arm64/boot/dts/apple/t6041.dtsi
@@ -314,6 +314,18 @@ l2_cache_2: l2-cache-2 {
 		};
 	};
 
+	pmu-e {
+		compatible = "apple,brava-e-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ 0 AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,brava-p-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ 0 AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;

-- 
2.56.0



