Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04F8C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gigkPs+UENfJ6S76VxoXcUExljFxrNqFW4T+9fUWw3k=; b=bSxJW3gtdPJiJXD3eiQ5wMD/yk
	zau5rJjvI4sDuLK5YVPBZfpZ3biqIqxbnDt+tgWM8dql6jwReZtoVen6r4h9B5iNndf0AP90kbxOF
	UyHbaojPVd6p0WJhlHT7xZjgQP4XDMEGNlV50xEBfXE2smiT6LmrEUvxFMjOm8XslAJn0vFR3SIR8
	z4+drUhYsdDfDBOL8ShrurOeJXGgjcF+9OVSHoRcFm7CCVwGq0dbqFi8Tl6TaN2VxE6LmxwlSWB4Z
	xXsWmxixI7yBkIuisBm5JN7F1wEsMJlHPa/h8Lx0JQPIV6XjTXyswy9UeAPNc2l9RJGIkFY8M2e7l
	L7Pw/nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lOI-00000003RnX-2EL1;
	Mon, 21 Sep 2026 21:17:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lOI-00000003Rme-0eua;
	Mon, 21 Sep 2026 21:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gigkPs+UENfJ6S76VxoXcUExljFxrNqFW4T+9fUWw3k=; b=Y53qVMBsWSp6IzrM+6UUTouovJ
	7nBMpZ8itHtMbWuuuh7LXWEd6OS7buXKlmrVgwvfmuZoUEGP+b4kVy418fQ4fharB2p5v+Wn7f6Du
	l5JrqaNGDzgU1MQOYQtPQMs8J9BSJiALQDhqM20ZB5H29m7qJBqMYTQNz9s6/YKlTklgbXT8TqA8Z
	MjOnPI59YSWFArF0OW+K0zNhw+xX0ow1EpxE56v/8rIF5UIiiJzp9gkACKNWsyrKu6QX/qEwTBQLN
	VhhFU/OJ0hsGcMIMHKIu1em65uTu0cLEPkN17Ejr+GUeWInBtskS+WLoIWkmbuN1IXHxDiRETzePk
	EzE3tiUA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8lLz-0000000Cpoy-1MZR;
	Mon, 21 Sep 2026 21:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790025306;
	bh=vMgJeIbDY4gfZKXLLhtV9STSMmBqMwbwlOznf1gK9P0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jNt2o1Vv2tCeQC9rWc00B2bqwZZ/kf4tWo3IY1HbX/LFLQebwc17Q+XepLSvHQdse
	 PHaCwKDWNmXNZQWAVc77F9m6RgDXRJhKqz4/la9rHtJ1wESHql0+MFijwxbGJ/fdN7
	 EznEdejbA1s8mGCRH92b3t+Yides6Xhgfu9oDZfoV+qZtKkaWCrCtnulE14SoDVOvB
	 aq0qbi2rhdQ8rfKVLGYfiZi40W51kQ1o7dHscVtU77MT6/zIxq2m28FS2fCu7uycZy
	 SLPZ5Q7PrBoDpHNK3BlnDqysxO99le9aBUqCMx3GxkUkHK0O0ElS/f+bg9wIOlHxdp
	 0YjxW2RZMJCpQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F86C17E0FB7;
	Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 57969480031; Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 21 Sep 2026 23:15:06 +0200
Subject: [PATCH v2 4/7] arm64: dts: rockchip: add DFI node to RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-rockchip-dfi-rk3576-support-v2-4-04f847016321@collabora.com>
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TXuERcBa3lyF5yru0hC/lwhYh6FDQ895W7w6eKt3Ed8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxnlpTaK1WGqKIfj9CyRu3SmbzDFOtQ6RwR
 YukDdKpAZ+MVYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZ5aAAoJENju1/PI
 O/qamHAP+QFSPWUF/svr4wGcxpuH0VlMAAlQlbFJWZcGUcZ5xAm8BdROICo4LJn6dRaAX8R2kMH
 DjVu7op1Clee0V73X7xIRj3YvFNjIlyw+1azKWgBVtAmFxtU7jEgaEHSbDG8cz7OoLvq/KOufTQ
 I87FKKtVeuorKkHZLFlz/Vcnq5tmflbTTsGcdSGv1NrUVqzjSjm6sJHr6v1M/UKhJUV2NN3GA+2
 yohSXJjzo1pPKCrNyKSgvUYUsJdAhGbeATdxeGqSJK1lK5EJi+vFKidm2lVSehBE7xk5ZzIO07Z
 aNqlxQPler0buSrcRnN7sbbwUDCQ2x6DJqmPT4/anXLSsDLp68SJlyCo27KfU3b+6GaZzg1x/eK
 5/2CkFEPpPLvwreQx7B1COB3qyPh3KvNgNlZ6R395i6qOu1PnJvD31W+ahvt84jYIy8Sa27I47x
 aJTbgqWBtn9+LE1Cg44YLdFWF9ljxY4VWcfqjqcAL8JJjWL5EZEsuDOR1nXsHAbk58SQWRWuUTF
 GF5uZcu/9lws51cvaQTWC1U8txSnNBXrDF2TrtRlKwMeWYE5Y2RQwwsix3b3yCDQWzMpfhKZeWZ
 9q9TpHrw/Fryk0IUiOvWC2b4s9t5hJ4HSCm4UljJ/o9cI8P9HxNnNF9rUl1HWTfCzPes2oMwQno
 FeWPRWKWb+Ff2QJL7vAwxaw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_221518_297930_A4F8A475 
X-CRM114-Status: GOOD (  11.88  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Like previous Rockchip SoCs RK3576 has DFI hardware to measure DDR
bandwidth utilisation. Add the node for it to the SoC's DT.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..197b8c3b76b4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1832,6 +1832,17 @@ qos_npu_m1ro: qos@27f22100 {
 			reg = <0x0 0x27f22100 0x0 0x20>;
 		};
 
+		dfi: dfi@2a000000 {
+			compatible = "rockchip,rk3576-dfi";
+			reg = <0x0 0x2a000000 0x0 0x20000>;
+			clocks = <&cru PCLK_DDR_MON_CH0>,
+				 <&cru PCLK_DDR_MON_CH1>;
+			clock-names = "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1";
+			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
+			rockchip,pmu = <&pmu1_grf>;
+		};
+
 		gmac0: ethernet@2a220000 {
 			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
 			reg = <0x0 0x2a220000 0x0 0x10000>;

-- 
2.53.0


