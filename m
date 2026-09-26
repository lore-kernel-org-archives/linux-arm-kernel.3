Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC41DC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 13:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QI6kPeeonoawwALaFMGTqe+JAFSFYB5AbZKekxqPKcY=; b=aZXLPpHRyXa6lDQLPcPHGJAyq0
	x4TLupChjLrhVl/M+DlRmAiuG5DutVK3g8rAqxSCbIbe9eyoYUwTXVga9fy5O0CKeZM3w6lVm6gzz
	zxoNheVMLYz5Dt0zrhJWI/GvEDQp36C2awzSyTUnj3lqr4DkdTc6GtcuuLhBNWqzy9MwzVvf2mUt6
	vSRrs/gq792bSaq/TjT4d5jFuVR3ws0t8/je5PX4sRaCzz5LoxX5KigdJhNCgjt6KFi4uUb3G7l+k
	QbNuUNOeE0UsX8YoypKnNmP9OKIla/yFpIydewMx/3rZeGDVaeevxZUsy0TOXRyrMyD0XgaJxLoZx
	MiNqHAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASHX-0000000FREu-2BAO;
	Sat, 26 Sep 2026 13:17:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASGy-0000000FQmk-08Z2
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Sep 2026 13:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QI6kPeeonoawwALaFMGTqe+JAFSFYB5AbZKekxqPKcY=; b=mYj9yZhFcZoINyHPPN4up662HP
	qTa7ZAE6XfunpiuFxiSNc5icC816VOVJEkagMyyXgwWoxoRblcyNCLc9Lm8+XRoRgSXdYuCHCG7YH
	HWTL0tMhK60wFdwjolh/tXGQU0tAiPbFqV+kcYes7Ve0RhDX2ljHzrZPneoIwZ9DspEWj+Hjj4w0T
	LtF78MZIijVzVOhkPBRTmxXx1SYvfIEG1s9to77mjveX1ZuC7A2ATQ0oBTu4NzI4NJvHvEIne0TNr
	4RQ2+e8DyC8XJ2UT90fnNg5VTeLzbcjs/zqc6T6FB9XNdxLlGBHemM2bgzXWADRVjkADmFDiEAPRo
	99/Ws9vA==;
Received: from mr-2001k-snip6-8.eps.apple.com ([2a01:b747:3000:200::6d] helo=outbound.mr.icloud.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xASGt-00000000C6b-2LqJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 13:16:58 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 8B954180519E;
	Sat, 26 Sep 2026 13:16:49 +0000 (UTC)
X-ICL-RepId: 01a0dddc-7bd8-7974-94bc-7add4388f8e8
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0YUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428613; x=1793020613; bh=QI6kPeeonoawwALaFMGTqe+JAFSFYB5AbZKekxqPKcY=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=SJbJEinz1iSZfPLl7EvYat0B/bZ6YCOx2ofppEmyhMbEZ2/MgebfbLatzhmxDZjQ0Kd6NkV5MoipMPgmM5j4SjHbW1urzVKtDt8N6IJTGWRHttHNGxMjkfpZrksD1SunK39+JUft9qV4hrzfm1iMJSoj1BBFBudX3hhM1A/wsr2bIfrqZWYrAWlHeupH4TsLiHpRKnNEz6X6LnNZhxQLPSXQpGP+VCI7kOvdjdqiwXu1h5xkdxhWcdLX8cUoHeQjlZG9kikYUSoMVCVreCku5o6/3KZINOzn/VroL2VR80XLo+xi1uNAbf7j0hVihEBcjcdadve2Z5FawuSvXKeIVg==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 5CDF9180013D;
	Sat, 26 Sep 2026 13:16:46 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:55 +0200
Subject: [PATCH v2 16/17] arm64: dts: apple: t6030: add avd nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-16-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX749Gdv5TASMK
 Zhh6779qMB7YidzHmQLqB/d98rDWo6b/YDvFKdFpYiT9Kt6nZQ45VAKg6fMAAolprkiquipQjps
 4RBade+rkDqERybPE2iYxjujhdJi8SvhMb7aTlBjR5DOKMK3yuEc10czeTwqJdS/wc7/PK8UpbG
 UAoDBRwqGNPjKFR8lo2npuE7gs+e8rtuOaR5PAY+WxpUYDjowHzyCSweJwvg0K5SOGQp9VIupul
 omoZMg+Ur/ICNXbidfh+ewSdYLUSzojCJsQgHGhTAh8Maq5bz2jccbFJdbRRkpMnvwOvOGhaS8Y
 7Xx9aPg9mGVFiUTaS9MgaSLYZkEy5fON3b+e5EkiWHDX9OLZ2gRE1OQ87ohndY=
X-Authority-Info-Out: v=2.4 cv=IdeKmGqa c=1 sm=1 tr=0 ts=6ab7c5c2
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=507KCcAgMSliuwDla_sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Q0mDSP7_eq2Ozbf2-JxV_5UZwvGyfENj
X-Proofpoint-ORIG-GUID: Q0mDSP7_eq2Ozbf2-JxV_5UZwvGyfENj
X-JNJ: AAAAAAAB6mXXXKeRyPsxjtl+IP5yxewR6oeVR1ZH66GomMhxZ5uF2mf1vHO9CvPy3fP/ErB1VYlGpwzZRnfRuX6wxa6FP58XPaXrHU3mJHi1ynIgWJ0/Q3epO2HbnR2cOPw+R0mLWczmhT6AbMGFl6PBNwkJcfSCugWAgpC9DcjITpjGCnQmzcIyUO5GIlx2rW3ZjD3SPUmeWMdISsQadxIY+T2dycD3da2VyKOVuCnQLDSmwXpcSzxKfD2lB2PtP1xOvUGYC61eIPXs6qe31ILQhM00cxUWBoT83q6K8LpsHMzLWKZcAcQNpdP7r0qjFi4jZrmnyyuJwpTU7GEgoxAT1H9ed3ob/REudyaEL2r9hiyfE6InT356aD15EXeqKoeOEm5iAaoBgzR45gVr70HX369zSq/W3jVWjTvSB1U+i7c+VphWqIAec02f+69J7Rq73OsvmEZv3jq+TtOW8fy1a6qkLWqqxBGmlblAl8xEb3VIti8YsFZeEcqf5GDdt49/tVJ2QInyIvo3yj2eLxrxshme3rLuwnIpMc7HeOqWNbeJ9Q6PyhBS5v/E9ZvaPKrLECG+nSH96R7GSaNm6xQevpO8fHCLY29xRyACTOfJmLvu66xtts0g9KRAj+8QwHrqq77pEspEU3ViPoRl+kdljTTZG3MhEXCOazJj5JV+VtyCkfURlpKGvjpc2SATVUxkoAXVaV6AL8XDXUSEw0e2nWhcLN+/6j4XeCm3mxSsWc/k/+A9mXogCXBorp8LeR37V8Oju5VTfVv/dqMkEUHKPJXdjTKRQO+H6ZMv5foZPxFpw82I46QpaGzRq8miJ4K/wRkkFw9Sk2sjtYhbyD4RT+rYFUocbPrUp1KlaX7mPRqcUGCRG82KE70s9ut/GA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_141656_293325_DDF1172A 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

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


