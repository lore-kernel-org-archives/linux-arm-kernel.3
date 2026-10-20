Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94CD606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BwpWjZxk;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=nMMmrHRg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZto5RHnoIIXsMNucqBB32BHeVmq97VQN2xU7krx+gw=; b=BwpWjZxkgdKWJKW/3kvM82QG7G
	aAkFhRJWqGQf5NKAbQEOR3DvhIzr3Nm1R6+nnN/Xe6NfIes4goIcUq6bw4nPqO/xcH4TxaF041o6P
	wYdTMAx1d+VvB5OJcDrFzeTw1uwSzpZjAa7UPuhVCQeiwHPz0ddwoSRiRHHCvIoFgMpBpsKZ+JgLm
	q1xiEmUQpj4zqYg2oZtMzGFfQ1XQxlvzWW12ayZalgncECUc3lCWY6GsbId62e5GnNG/NSLiZN7V0
	BbMuK5e+HVgp06zgFHoLNDyrea64K3ZrB/sbt8xhnDgpWst33T6PLeycLC4m/zm2IgAGhr5vXw9k3
	/vSmiryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6KP-00000009KH6-0oHx;
	Tue, 20 Oct 2026 09:40:17 +0000
Received: from st-2005i-snip6-11.eps.apple.com ([2a01:b747:3001:202::5b] helo=outbound.st.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Jq-00000009JZx-1jlX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:39:47 +0000
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id E427418006AB;
	Tue, 20 Oct 2026 09:39:39 +0000 (UTC)
X-ICL-RepId: 01a158ae-4aea-7922-afe6-f5582f243088
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0YUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489181; x=1824025181; bh=pZto5RHnoIIXsMNucqBB32BHeVmq97VQN2xU7krx+gw=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=nMMmrHRgJyPtHPw3OT+Fc9Azj6tSlWcmdjaY4fPPFCE7yDrU/Xf15wRTMi/v1wfLPkHtZoFOM5HZr/hepJAhzPO4Nghrjg6kv7OT5o0MT1m5/vWGSyKqclJW3NLJErctCNsC4whikJguAcd1kX7RdsCylODqTMW/bXBdYKZxWbul8ffgJDFxyfgwwKnhnstsIC4XlcY43967opYeiG+gBthfIsEhTtRWdDCqPBVlviCccaLVmp7XD+UC82SsfjF6erWCQTKfHM7ASYs/b3BFHJ86aBOGFjabU9rsRNL123JXmfdnvzlHZNzEyjeBdS4DNNxbpbzrMW3h5IorlYoBbA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 899121800111;
	Tue, 20 Oct 2026 09:39:37 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:57 +0200
Subject: [PATCH v3 16/17] arm64: dts: apple: t6030: add avd nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-16-85cbaa2125d8@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXynguuy9MAq5b
 x2syupJn7gHsfFJcfDC6JiraZwXoIEsRN6F58CoYTcfgSYZ0CllQRhDHNces1VAlhnxv7HDG0YV
 jNGxASTZFOyujFC+n7oVRA6b23+lCJEF7vn0asbi7/+gJvIB+OhMMg2wjhPXXOiYEmKviJwU4vf
 kMUTo5tPET4whOPho5HAn4oja+KsbgAeOy41wdkKQ/vM7CbyzjkqTnF3xIIo87Z+6NYur/0N0h8
 6Kf5cQMP4nKlH9FYf0aaXuM0EuHAa57ed98eaofnzqY1s9RLTMB9j2hZ1TsZyzJD1oGHIDfqVC4
 Ip3y+YWq53GH9JyKR5VVj2KZS0ANx992JHmh7ouHLaSjd1LqJsKWrUW5rSPqRo=
X-Authority-Info-Out: v=2.4 cv=f5NFxeyM c=1 sm=1 tr=0 ts=6ad736dd
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=507KCcAgMSliuwDla_sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Ee18LwRM0CskmgwHdZA62QmWuE7CGLd9
X-Proofpoint-ORIG-GUID: Ee18LwRM0CskmgwHdZA62QmWuE7CGLd9
X-JNJ: AAAAAAABSf9T3H0VsbuThMpgBIZ/4n87gNJiV2OH4WqFj8AqKXmvSpW7oJFd2GBG+SMdkuJ/8Lb31vevmfV4wHbSO7sfgsku1izo1gd1d1KvFjNgr5s1e8BIMb2J/jfxh5hDJ0WacZA86ajgLl+in+y8YULhWigS9dj0Pts9rlQ6Jr8nNZyxffGc79z8Dy5JVSTSh4ImrBgPQaHQ4Ps52f3Wl08wgSQXTCQsEOoq5ymOM+iSLWIcKf/j87WpWcq6i11Zyc0NOZuwydYv/qRvUkhEWkmAGPJzy+pEW38MIIu3Kc7gPEP3iH6EV06NFf3xOHb6juwhCpXp72DoQYtBw99IIB6NXhqbekdueeZ8YgYM7q/jYBRcFTEKwcZen3BapvjK/s2yl+LtVGM96dLEeuoJYqeObJT37MXb1iUvTuTj3xBds7QO4O4vtcSpcbbdNZNFi0tqE+HYnkgXjtEZvEKJCCUQWrMZqwyULHNMIJVQzmPURvXQJ3yS6tKozJVFM+QNYlA/zUq+0kFpLfPQ0kqvH5q9dqiVx0MZqS6vKwl9dCslG0gsrM4BI/cdN3N0nuzoU1jCIZm4r8waDTqKulgqA8mZONbRymsH0tVducQD7BiPP64QUFeG2fBkcnrl16l72QCBuYHP11qmFExxJShPrLnx1oc6ZeQ6L6KqlXPLtVlFb2Xsfb/7DBsjpQYeIFt5ofJSu1CcaKsUvDAlKzMkTI9aoF52DQgTTOhDwBxpoOi559yiTF5rPDT7ctVHWv1PMynJoi+kClkNc5zer0JNpLpRd6ISNhSKaaiePuvMgLFLZPtoWHCe7WoxF5EatFyNH4ORlQtTJbEm4nLmlZEzZcItAhe+0k8ANQ92AgMJpk7HbTLV0dsPfRzET6ZP9iIVwMWK3J9b2n9L8jo+5ylNt5UcPqNIqw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023943_901820_F803A23D 
X-CRM114-Status: UNSURE (   8.63  )
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
 arch/arm64/boot/dts/apple/t6030.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index dda9568af11f..805042bd9270 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -361,6 +361,38 @@ pmgr_gfx: power-management@290e80000 {
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
+		avd_dart: iommu@30b010000 {
+			compatible = "apple,t6030-dart", "apple,t8110-dart";
+			reg = <0x3 0x0b010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 795 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@30b070000 {
+			compatible = "apple,t6030-avd", "apple,t8122-avd";
+			reg = <0x3 0x0b070000 0x0 0x4000>,
+			      <0x3 0x0b080000 0x0 0x10000>,
+			      <0x3 0x0b090000 0x0 0x14000>,
+			      <0x3 0x0b0a4000 0x0 0x4000>,
+			      <0x3 0x0b100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 789 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 794 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		pinctrl_ap: pinctrl@347100000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x47100000 0x0 0x4000>;

-- 
2.55.0


