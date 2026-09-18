Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C98CC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6VefbtsHJ7I4h07saTtcrarG1Wa53XZiIB66Lz9ZuM=; b=odrxE70m6yhFhKeKl6H4rWtC53
	vM++LCpaCJqnlCKBjty2PyFVDZW/acyfVfi2Xl8ObgjdnYPJxLZf0/b28VUQMMgpBWlIsSVbhQKb/
	1t/0sGL9+zQbxVqnEf5BXojPsZMk5xg9ANnu4Lds6XxVoZAn8xzHntcqKkquCHpovgPshKQC//qC4
	2Xg2H3yBRJ3mL9O2y14UpbOQonr8cXYcr2iKAu2fcUfs3nCAvUHKatpN4G+ntPdw8cpDb6F4b7NBT
	buWKwCTeI/e8G+2cgOgTfxDIWedrUXv8gVsQwsdd4phiryxpYbPzDzpupCEWqVDbsOkFG7ndbmkD3
	YxOYn8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YRr-0000000ESYW-3YJN;
	Fri, 18 Sep 2026 13:16:15 +0000
Received: from mr-2004h-snip6-2.eps.apple.com ([2a01:b747:3000:203::52] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YRm-0000000ESRc-13yR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:16:11 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id DBD1E180187D;
	Fri, 18 Sep 2026 13:16:04 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-ed1b-7b2e-a36d-1946784ff1ec
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGBV0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737369; x=1792329369; bh=M6VefbtsHJ7I4h07saTtcrarG1Wa53XZiIB66Lz9ZuM=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=049qh9FNIufGO4G7gKITPeJTHKuvL0j6Xx5fUWMS/2tzTgH2Hpk3vego3oPBZ9lB2UJ94bgnfQLWFoKtpUAWBgvQM0rrmufduLaLjnL37CBbrxYUL84aQ0mnpVyldU+Y8AktgCDyLd+xBaHzfjQa1ppz7PTVOOFYsXfu3v/oIdk6NkWqkFWN2/KKY8yZZkQfLnDEc0L4P/qhNGudUqebC/GezIT2ICgSCPc+GrimlQ8XvMigoaBRxrETc0T7f07ikFrMJ5WwJInk01hkqB2+k/cUnRyQwYuhDS3agYuW10Hk2LRcOcn2ZDMlNpCH6HmlAEus7X/jtcnH7xD90h7nUQ==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id F41F318003FF;
	Fri, 18 Sep 2026 13:16:00 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:12 +0200
Subject: [PATCH 07/14] arm64: dts: apple: t602x: add avd nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-7-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
In-Reply-To: <20260918-avd-v1-0-49977931f455@icloud.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Sofus Forstreuter <sofus.c@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX588aZ3KYV6wg
 X8haV0Pcti2l5eSp8AD/8MJhXircof/+GasuOuCHzQIT+T+bOigU8ZD+6K3CFfMxRN824P5lBAR
 XhLv98VgP9upJS873i0ux1rkHdFjEX8m44Y9rrxpm8mnPjoVk5V8Q9282ylOgMl/JRTz2PBg9PR
 f+a9dwNKruVmMvfP1QVjqziXxsFxmq+UftF6bWQcYJG/85BEnACfFDpfU2S23Z7rm83nShT832m
 ysR+KsKTM0qd2hAFJ/6f8pbiiBfiDLmFgXTEu9ajj7Z46EtXpy1WhKyfoknIFd8qtooB3QBEX0m
 oEm6UxDP2j9Ew6NQHXw/aIFu1B27r1Q/TFsgfNSQXnFb6FBNWHcw0Zxsp2IR20=
X-Authority-Info-Out: v=2.4 cv=DIeCIiNb c=1 sm=1 tr=0 ts=6aad3997
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=UcMGxPN7aOZqZ3wHYxQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Yl4RZ3YIdaJBHUuIETWnsy915N6kVXIw
X-Proofpoint-ORIG-GUID: Yl4RZ3YIdaJBHUuIETWnsy915N6kVXIw
X-JNJ: AAAAAAABI/t4w5EZW1dmIGamvZ/3T9+UqM+bgZ2ODOl4KhrjM8JnwkfzrGG/3M+ek5JRgMnSCmpSTPdmH/Pwl/gibkr9QslF71IyVwFcBdVBrPEoi37OLRFq7GPlcpxaaNaOCCiOAKc291b22F/1zvt9qIZA+rFNhHEWD+Bt0riEziOI0RrDockHaQrgHtXjlP+a8/IW8dyR/Tg2h4Y7i6rmx7Z/A3Zl9hgXex0ukAEo+dcp2YTP0/sPKMHYljlZInOAj8ojdLLmYxJH+oXMbXRE+Vo7jdJhxcCnQa9zoTDMIpNScEMcmEM9QkmlzXvY1evHsL6/bRQDVygaCZ/cSNQa/Iz7peZ8F2jmWM2buRN9m9fZUuQJ+8XkEw+6eqRTbGCQEohltpRsAFsY8cCz4xQ4nc0S0xAz4lpvfqSI+znsWTB2z6L/LkBWPYEYklsoCPaeb0fue0KuklEWSPJIPrUeQVmRDNCd4JXdAN3xLBBHTz1etzGRAaL0ZEkDgZ+wzJtjKAlUTYRrnUidGxR3OSMs3RRThIRidd4aGPcF3BqXvlnTgCe+jFMyvFLvg9OxZp7uxYu9+8sGPspLYCzeAY608ES+celvE2U6TzDtwyFydRid33cRl8UPdEVd/KxvOmxaZKiy1RhGI6EphA/Y6nQQUQzhvW6cXXcbaYJ6PcjEMY8Hls5XF0dKQeTqo00CZaUPPcNMqp8eUoNkRtRM0kGyJcnztmok7hYWyY8fYxfc1oKWATevvuoyRLkrqa8pGeDcmkDsDfr8gYvfU6ESBSnAiMaWCsoM1GDD0emEs2l1TpjI9qVYEUVWSkilrraq6iJFB5MP281SgvCuUyC3jrOaHzfwDAvFa8qxEayrAHF+fChx6q0TbthQMc96CpXzljg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_061610_328632_8AA2D1D2 
X-CRM114-Status: UNSURE (   8.68  )
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
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
index ae3d535c5acb..4b169a2cb9c8 100644
--- a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
@@ -23,6 +23,30 @@ DIE_NODE(cpufreq_p1): cpufreq@212e20000 {
 		#performance-domain-cells = <0>;
 	};
 
+	DIE_NODE(avd): avd@287080000 {
+		compatible = "apple,t6020-avd";
+		reg = <0x2 0x87080000 0x0 0x10000>,
+		      <0x2 0x87090000 0x0 0x10000>,
+		      <0x2 0x870a0000 0x0 0x4000>,
+		      <0x2 0x87100000 0x0 0x10000>;
+		reg-names = "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1088 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1089 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+		iommus = <&DIE_NODE(avd_dart) 0>;
+	};
+
+	DIE_NODE(avd_dart): iommu@287010000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0x2 0x87010000 0x0 0x4000>;
+		#iommu-cells = <1>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1095 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;

-- 
2.55.0


