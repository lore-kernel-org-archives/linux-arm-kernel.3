Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADF5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fXOJ18aj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=au0+6OYa;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=tc8tUyuH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWKKiCcB+cIw5mjLwZ109Y6WQBeHvSpKP6wajX95av4=; b=fXOJ18ajRBkWJWYicv9duwn4HQ
	UBCH1GG31Nk+tICDzw9OaiUbe3GhtNsnr1lmG9K3jyzl2zqw9SMM9tdVaSoFwo/aPnhvu+aKHqPXg
	zUbBguuSqAdFgr9a6qOWs1c2JwASLUZrPOydz8DFTNQgjRJf0klVKdimbza2ZBjH52YQ1tosKsByY
	pMAZ5u+N3jnwdTqVQ9GbEVQdL2VxGwYNsFitbwxl7RuMomnPamri4p3tSqSnV9DQYnBB16yOmgWUn
	GbU9L1jiJBa8lbjP35CH+BQ2ooNGpL2gzehenDUjwoyWrfGrwJ6G23HEg4DUBIytmjgpkEct3Re9p
	zjbsntmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Jv-00000009JhK-0flR;
	Tue, 20 Oct 2026 09:39:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Jl-00000009JQh-0ikx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Oct 2026 09:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lWKKiCcB+cIw5mjLwZ109Y6WQBeHvSpKP6wajX95av4=; b=au0+6OYa9wtE218xhxxFM0sqSe
	y3pDbJMC3msHQZkVZcKKEw5Uaq5aqxpsHUbO6lmsrud1nWOWqiikK8a4sc7hbChKrMk4TEMmAVMug
	91w0W41xtQDlmiCwm1jM7+f+j8zTmmaBizytrhRteaFa3CJbjuy2tYzBnPezuD/a3oOOVw9T6c3tt
	ut4QfD1cjdN8ke5UQnNnJ+ymERXs8Y3SbPfOlea5RbOCqpP2fuoB4UHTc999nXVhyEsuj4HqAU0R+
	C38nUItouxnuUgUa4+36/QFJ68uXwqW/lSXLS/wlHZJZ43KXIkluCTznbbtsRWKKY417yJH+QJxE7
	NIduYvVg==;
Received: from st-2005c-snip6-11.eps.apple.com ([2a01:b747:3001:202::1f] helo=outbound.st.icloud.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJ6Ji-00000004XPD-0vz2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:39:36 +0000
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id CDC9D180011C;
	Tue, 20 Oct 2026 09:39:28 +0000 (UTC)
X-ICL-RepId: 01a158ae-1f94-75f1-9864-4c4edc63b978
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0EUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489170; x=1824025170; bh=lWKKiCcB+cIw5mjLwZ109Y6WQBeHvSpKP6wajX95av4=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=tc8tUyuHz1hJ54hFpCD9CIc0X+QUqxbwtse0eTRX94V8vV+3Q1Pip0kx7gENFUi0munHwPcUXnpesddwz3rOitNOJ2IrXY2BVFg6USNyMB94Qa26y30Le9oBH56O3Nui1A2f/RQ8QqGojIdMlI6YzVTyCHaNWBvQ1ujGHjUGbzoOmhl7DcJr4o2oHjrJIP+TXSfZx2y62/3d+/mFaqgPyf6FizPBY2GrWxyUeB358IUOPrNUJ+Y632RTQxDt3D+awEmNwZUXmYjxBVyNydbbbegCp4l1I5Zxg5eVOyKOj7mh0pSYpPqJfc/mkNyWE/CnsCdqqWPcj8nJ9627DMFwzQ==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 79D661800099;
	Tue, 20 Oct 2026 09:39:26 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:52 +0200
Subject: [PATCH v3 11/17] arm64: dts: apple: t8103: add avd nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-11-85cbaa2125d8@icloud.com>
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
X-Proofpoint-ORIG-GUID: 965y-1dmxP17w1Cj6rL1T66rqFwBim-N
X-Authority-Info-Out: v=2.4 cv=Kf/fcAYD c=1 sm=1 tr=0 ts=6ad736d1
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=X6JhwUuqzQq2NhyfIN4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXw2RtQse9TnwE
 7DdRYUOxGskTKeNc1fZNkjaXbgFA6mImXLTjRhmNkWANsL8WnnrIvIfTUDpl7JJ8a/Jrjr/aJ3X
 qF3X900tnYWA1JTR5FiOwL5R+sTyuV1FcSNhSaQ/GQbS30of7jCfh9MeaJdo4CQN69y/VGm3+YG
 w/5TE4aUKUm8jE4w1pG2FFMeEYY1aGar2vkyB28DsAl+hwuhlxTyu8t1m0n9V2jrzNly1h7Ys0I
 /lPCvfqRethZGK8AWWFD9jL8ZN0SgrWZ0vr7SXz9D/E+uXkRj1wh8Kj5YWvMNujNZYlHb+ynSeX
 bnNWwOILo4KAMFe5KjYKvMWDjzrvdxdTl1L3vbKIO3Ulzz/ZildCCFDvbe1P+g=
X-Proofpoint-GUID: 965y-1dmxP17w1Cj6rL1T66rqFwBim-N
X-JNJ: AAAAAAABojQKdI2u79cpxhHJKRpi/F6GWyqbEWCscfE9cWZZjf+dCPP1iugpqL9PN603dHyF1+dxviWb6jWpo8+SVxY3FPVQXjjhnCE5KaN/Ka+pBIOE8xBcm2I2xw2Em50LS9wuJ8yyX8amwSJowa9G9qdALoqToB5Tg9KpebYYKbYaYeevb9tb/yKHgjU5jQpBHWAP1fmQUU9u0jbRxDph+JAyvV4Z1E+ETTyivIR+NkjI6YHSuHZqA9rW7Q1vjrOsElcmtQWbIozX3922P7nbpnuQWrEsfaQAhwhAQs99AXyEhJF8uSc9nIOFrq1jUVEripLnWsWYzTFJid+0DhlXcKBVEXLmKNrkfWg3DRG4BK9mTCd2SkI51TUh9mvYsctp1cpUGzZfJd1yBP37sA2LgNqQeOQLGwDjVxG7v08lG5tLuX3ctZIOQO3YCHTqm5FjcyRqLWUvjPC5uCjqCCQRNUXZvHhOmpDbdnA0rStH4HZh7t+47f8WAWpy9M6VlC6ZoASMmPoztaS0UFhaeZWTXbm5nnZ+VtcZlLAhiH7xBLVUZZ9Pzf3LwqbjvdCgDlc8rWSWeLegzjdL0P9Oru3PhY7bmExlQu8kzN7sfNoae8+Rxh2NecUGaMRfx2YPnH23hwSWPfm3Ot8iib9OmwHibIi35oCeZRo3avitkqp4/pkWgOwoOpYTuG4BXKD3WmdIbwzBpWbdH+3cLXBLqY2p+IOn9cOMEEGcQ8lHYpxIaMFdI3k/b62wuEHir90ySUUc7N0KwZcDIsKcN5KGw+Rx8LcFTZGG8wVJ5GW+LmbFq5bYMlMxQ3tD1eUBd7OuQQU3hb6q1L3WE/PoUnusYV/4HdN6rdBulPkRs+od0Suw/w00YrQhfvAkvDhVlwpMRU4jzEJ9eRJ4xBm6s1woUs5Fpi0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_103934_485663_4560728E 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
 arch/arm64/boot/dts/apple/t8103.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 5b68bf0df4e6..530290e7cb32 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -984,6 +984,38 @@ pinctrl_aop: pinctrl@24a820000 {
 				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		avd_dart: iommu@269010000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x2 0x69010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 547 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@269070000 {
+			compatible = "apple,t8103-avd";
+			reg = <0x2 0x69070000 0x0 0x4000>,
+			      <0x2 0x69080000 0x0 0xc000>,
+			      <0x2 0x6908c000 0x0 0xc000>,
+			      <0x2 0x69098000 0x0 0x4000>,
+			      <0x2 0x69100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 541 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 542 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 543 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 544 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 545 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 546 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		ans_mbox: mbox@277408000 {
 			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
 			reg = <0x2 0x77408000 0x0 0x4000>;

-- 
2.55.0


