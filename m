Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qkGj7R2M;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=BsQ23G+q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygnBIUKRlm5yRY5vxRJ/fCPpjI5aCy7883sKLZwwlj0=; b=qkGj7R2M5c8+Q//MmXlgRg+EyV
	EHnc7uXFlNLmXEZxEesUlYFR36Bz2/vBAjkb9+OzV4D9sLDSy73/wPC7giUppf/ZwGJfDIhzhzper
	Uu2mBYU26T3OG5wRHn7qSlqF4xaGMuOitvDJpBlCd4GoLtZzVXPzq3Pgvi6Btoxr9FfgAsXhHDiRE
	vhQWRSASnpOHMuAwTDHRZpu4auKyKETX++i+gB6LYvjYegoDHtatyv63SyHcfMG9Z18qbd5yjhTQa
	Fzn/s/VC4VYAmBdWGjbT7MuvLdt/T/uOvcvchPjhyoSjKvRFCX6OSgp1OTw1u2fdGxp596wjR1C0m
	VkWyXE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6KN-00000009KDq-15nu;
	Tue, 20 Oct 2026 09:40:15 +0000
Received: from st-2005a-snip6-1.eps.apple.com ([2a01:b747:3001:202::4] helo=outbound.st.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Jp-00000009JXG-0TBQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:39:44 +0000
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id F149618006A6;
	Tue, 20 Oct 2026 09:39:35 +0000 (UTC)
X-ICL-RepId: 01a158ae-3b39-711f-85b3-31c53e2131d4
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0QUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489180; x=1824025180; bh=ygnBIUKRlm5yRY5vxRJ/fCPpjI5aCy7883sKLZwwlj0=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=BsQ23G+qjm+ZWFE3CMqeLd3ELKtk5oKCS+KbJv9Gyube2iJQB+i4KxoXhZf+Stwi7xlV4ecQVN/JobXvfyI8gNCImUpchtNdzDVvDBNn9nzfQ/+E/4gIhAlVwZlwz6/FbSiY8NSvt4IVaSJWG5lQL/y4PrXigRkx61qNkBfA4IlG39Hs2VbpBHKQNXkG/RfoueNZCA7oEdAA5Hq997l2wXq89ShiND3S0AwZQ7+YY/fCpEghIUPmoXSEKnHb/LbqOUiipQB/+wEee9ULBFAv8XCMlZK5mIJz2sdUEJCaVOuhKBz46VLc3JGGGbqf+6SEnlsYqlwCtpjvXVKxIc8SvA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 237C5180020A;
	Tue, 20 Oct 2026 09:39:33 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:55 +0200
Subject: [PATCH v3 14/17] arm64: dts: apple: t600x: add avd nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-14-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: i1Gf6_3v-IAEPoDKlZTAKYfNLyaGlCjj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXxGXfbAGwomti
 Z8OQe3s4texfLoKJBNDhZkYbiUUdkaCkfE6KVH9cX5lqBfvVySPkGi56faOxFq86Bo+BBBE+mfU
 b5lUX84xo1tlRTdPYQasUV/gs04Ral80F9os/1SVU91XfYeA6Vfnnu8n0pzfUxr1mYdX7wX8kiC
 FQ65l3MMkUhtwzQv+lTkrjwjceBENoxZIl8oSInu/8yeRxGHPgy9IhAOG6EmRGwqnPd8D+JoIMA
 7gQO2uefWBNA1mIrvPga3Wlcj/rMFt7z8aVUum0I1O4ODygn1f8i3mewlsj4MqnLWuOHBoUJscs
 MqHx9CHLsuKfge9tLZHnS0M3I+XFx8kr5qGy8Sq5e+o1t2+OKLUPsPcqCCm1os=
X-Authority-Info-Out: v=2.4 cv=Ea7FgfmC c=1 sm=1 tr=0 ts=6ad736da
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=oI5ehSekA3XTy-s6cLkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: i1Gf6_3v-IAEPoDKlZTAKYfNLyaGlCjj
X-JNJ: AAAAAAABgzvRWa3cmWnaY2aKKsCSBj8lS/73xG2PpC7XFRtx/qtRvcrz1noEE0Tb5P8vSNkumIDDoCgo2LFTEXVgkeSaaEnPzZdcrDwUhCKrurvoqpI+/DwvEl/6fyLx+hI2H3fYn2iGlXcyflYju7EArmfYeSy5S2xv+b0lSqFgG7RyJyFNK/NiHQaOP62y+fyEt3iGsw0V2wvbVh9fGnUZ24Lj6O3nkRfdZz7UD9wGFmRqmqWHe52shegd3xJOWvQppKF0dKZZjmn+42fc3hw2n2OvCWInH+4I9NnWez4aaKWG/mjhaa0QTIbjfuHOCJcI9logKQ5VUJnaFmaJVDU/22j4aJUPIbeIgVQoWqabqfvuQKNq+9l+KEAoOGZgAF72SMse0mFTGoI0fu4OmB4wNk6qPA5U37e4FxgJIWhEbhw1IXQk5Cl1CJpUqza0PFexZk6I4PKAT9MHpLzFXrirJb6UZgUEe00XDlsuzZhw5JqBiwOFcAJlPXEgsLPxDKTJ91TvDIHWho1sOMGDHaNIILwyeaQd+6DcY/9hU3ibbhnzJgbJRoUQSxHxBVcfysU7KFCaoYAbnT2zuPQAlCfsFCv7rHLaFJJKbO9pEAv57MqpUS65hIp8bmUPJEEzAv6V1DfAHY5gwUFGq4I6FS687l8+eahjQ3EZaiAvScgVDtZOHvojRT2XmCXuPJ5kbNQhNt5bJ025obthHrGbRatAe4h/Rhb9jO0FvgqYxuKnOTJneeXCoOVKidQGGrCxzwQThHBtQDJcHL/bpG3iQ0+C78aIdDm6ZVW24pMzIuCFj5uGm0baoRPkASEJGt2Psu1gBTg0vVp0Jz/ION1eYivR2p9HJCL72/OkLP7ZsPgkPpGsWLz17MCf3pA6qTEEhOsLNy8aiVKhPxJA/ZYcCfjktus=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023941_313831_4D1BC7C9 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
index 9676d5127039..c3edcb78d016 100644
--- a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
@@ -24,6 +24,38 @@ DIE_NODE(cpufreq_p1): cpufreq@212e20000 {
 		#performance-domain-cells = <0>;
 	};
 
+	DIE_NODE(avd_dart): iommu@287010000 {
+		compatible = "apple,t8110-dart";
+		reg = <0x2 0x87010000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1018 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
+	video-codec@287070000 {
+		compatible = "apple,t6000-avd";
+		reg = <0x2 0x87070000 0x0 0x4000>,
+		      <0x2 0x87080000 0x0 0x10000>,
+		      <0x2 0x87090000 0x0 0x10000>,
+		      <0x2 0x870a0000 0x0 0x4000>,
+		      <0x2 0x87100000 0x0 0x10000>;
+		reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1011 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1012 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1013 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1014 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1015 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1016 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1017 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+				  "flag0", "flag1", "piodma";
+		iommus = <&DIE_NODE(avd_dart) 0>, <&DIE_NODE(avd_dart) 1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;

-- 
2.55.0


