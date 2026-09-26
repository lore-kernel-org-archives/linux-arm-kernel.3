Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE7C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 13:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p97d/ak4knXUz9e9YDiwpBHsYsTroBo3Vbcsow2RJEw=; b=b2wI4hWIXeBW/Z8chGhZjHaaD0
	TdoUKAkH+RZacz0dzDjM0mRbZEak3v69j7Cs/mPWbE7TvG57D5jZZ+i1KqgNxJwNu6UilEnYDu/R7
	VF3VaT6otAb8pzC+hl017BIkfYE9PWylHLr5JHgq+vYMnZKYZTLIzeFY725cXq+R1DeM6Z/CxM4zn
	xpw3Z9EM4P4rEIm968S8GCUWk3ax8LYo9+UldnDVJhE9hgensOaw7OmyuikpS9/FwEwT30fFTc/vq
	sxrxOhpbk6N5whF0MOjdSdaTZ48JTOm/xb9w5n7aFkThtL/V6hRSgK0UkC9FZssLl62BATtS1wUoh
	n4BfDTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASHV-0000000FRBu-483O;
	Sat, 26 Sep 2026 13:17:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASGp-0000000FQe6-1oay
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Sep 2026 13:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p97d/ak4knXUz9e9YDiwpBHsYsTroBo3Vbcsow2RJEw=; b=VOySYRCEMT9tnUGTeFHy66ELJc
	P2aWsQFvqSsSiqTo7xNMi0tq3DLU+pqyBlE0sUP8uw/A2Cm2tu9XR9TOpa2O8cYtQE8S45P0BuNkd
	pj8y6nFq9X6G7gUu302V6QdE+OjeSGdqcgVxCKObGo6LEBqC24XZbKheoZih7zTy8KZL2dBvr778y
	LWvqFh9qMhY1F0USy6waqjSGBNLUmx+VJRXGY7XBaGRCeW35xlamfXMpy3tG88OP7KJ5ZtHFx90jZ
	0LAX6aQQl/G6LonaWCgClNMF5Mk2YJ6lAJdi3+4GOyKULcduCAg/bQIfYgwQPb1YFQ4aMOW2/G5CE
	4NiqSMmA==;
Received: from mr-2001e-snip6-4.eps.apple.com ([2a01:b747:3000:200::2d] helo=outbound.mr.icloud.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xASGk-00000000C4U-2D5o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 13:16:49 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 5B994180518A;
	Sat, 26 Sep 2026 13:16:43 +0000 (UTC)
X-ICL-RepId: 01a0dddc-63c9-70b0-a681-b744bbbef88c
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0QUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428604; x=1793020604; bh=p97d/ak4knXUz9e9YDiwpBHsYsTroBo3Vbcsow2RJEw=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=dvt6B6bqK/mmsQZ+jeO8V3JJcyUGNp6lIWjRyFxyq8dpH3iVXVV0PL5aMBhYQRcqbkVA35JxdN3+pQm+bJqQdB2FiJFGtZHHlkpv8uuFV2S9B03KVlWsgazddQt6m6n30knB5X+jt+iAtAKS/LCsmC/NHKo8KLXbK4Rq0fBdogySnLQZGn0N3kW0+iEDll06i4l55a1CsX8vntwJNBuiswLXp0l8jqNBAT2FwpCV4L9NmN/rnzYH0N0YpCAWLc1iCkR4aDoiJXgVJK0ssVg2nmmA4ht9KmvI6MyO/gfqUwJ3DFxS6q5ZnclYdFbWVw3j/DLLZX5ZJhQRMRQeYxb+Ag==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 5E0AC1800561;
	Sat, 26 Sep 2026 13:16:40 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:53 +0200
Subject: [PATCH v2 14/17] arm64: dts: apple: t600x: add avd nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-14-ecebe6a3648e@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX7JV4sfxmVciS
 UxR7GwGS39CEL+x7t5ILLIuUb6cb7WdL92KEo9GL154WovwEtTzreqFp6PYozjyCF8pUSmBW5Uu
 87IcEzPEnWaxUz1NAZogN7hruKkXup/gpDzrUPOWIErFf1bWMEZAwdvx8P6DPH/76hVqUg45+n2
 xQEyfHwDUTChgO2i3yTzS/2DuN99cxmYGZ5yR23/Vyy6RVbLSZhUZ58PegI8mv9IG4RS+3/P/rJ
 U8ZlhRgE6cw1kYAdV4tenTiWdwtA4+hNIQ65X9NmKsoe+D6vX3gIGFNwcOjhSDVsgINYXXXJ3cc
 AA/vh/mFTJi/CM3vnMqVOJLBchHvNmTXTfhInQtltNYqk9NuM7d8O3J9NRx0+8=
X-Proofpoint-GUID: 0FxR4sgThj92xGnUrP6eNSmi33PiYaQC
X-Proofpoint-ORIG-GUID: 0FxR4sgThj92xGnUrP6eNSmi33PiYaQC
X-Authority-Info-Out: v=2.4 cv=H+HWAuYi c=1 sm=1 tr=0 ts=6ab7c5bc
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=oI5ehSekA3XTy-s6cLkA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABkbk0oZ2rPnGKpCtOTpXm2G9m+sW9NgNdi9YBgSF9yXiZNjVBw2weRNpFJU5h1E4KNYFML4MRnD+w3SXvFUwG3cyporDs4A7SXINr2zqewmHcSeY6oYA9QN5x4oUcYP9mq0OZyn5UJzZPWw7eE7L0XKAeJoynrytNkuzkW6GaI01DYA42B9zzADUNvdmaHII8qWuvIvl2sK+3shdxzKJn8HHUblviSCum4MnHF0h2FB1OWxyd1UZETsPsv1ACwRncA/ly2PZlofrzQmxTdCgvMnLYH6kwskZ9zbIFTCD/z4FlE6+jlTR8STRLEVqF9NWJfGcrhTkxIzw8NKVgPzuToiSMRAPPkye93CoQ54dvgw9F21YQc5STm67jb7C8XjDVsU1j1zbmBk5YI3p4MXa8VG3+WezSYfnqq3peCuk1OStNWV/Hh8N83EJ5ezSA529uJsgUIPKF/qwa1Cc128vVt9l3w1pt+kiLqE++kZRC0kdRkxik9bVmnLQa3M8rJRyyza3SyxO+Yf+gCoh7JZI/lfgkf65icvc/QeE421uRSEO7n4qJPIGwLRK3ynj6f4j+FZ39f5V1F72ubx+zRJfCggyioD7VCqJPKqA/UnXeV/zIZ6roOA77UVq4obJxmereEbXCpvHgZ0zpC9oXE1zJH66yv3YAnXcrfzamOw3zXe2f7nene86hyGyQJrg+CC2QzpX0oudPVZHfhYpEgSUZUBDFQc6NNt+5CDOkFD6gkxp0/8P6/m6DWvyUIbMlGrYReerC0i5Ee5QmMjBIgV1+W61XeCu7mbigouDLxyUuCgcVuHETEzcJyQP/cKaTY/GEm/tk4LM+D+p6HCVScxmnrhObrXGvaelv5L+ixP8SF+ec9rk+E2LlykIHS1rry49iv6w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_141647_441840_62ADEF5E 
X-CRM114-Status: UNSURE (   7.52  )
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


