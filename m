Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E96C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/lMPPdyVDY8UDcv/G9hmnqUs4LxNskElZuOnfztMlQ=; b=QN8gn0tsSp0lU5Q9uj9XQ1oqWU
	NlOa5Dhmvrg3X5dxk22q6oaxoHrB++3GwWpvwQW+TgxvpHaiHaj5ibvkO5pMe1qe7boT6FQRxd3K/
	8etjLen09DyXHnEmi53xYuewS+lMU4CqulCwXGeX3FlHBtlUXbiB2SrDK/4Lld8lsnNgJJtmi1Bh8
	VOX+8SylBL69cwMepxQ2fLGtryZTY8YiP7dubaFK/nU7FLM3KMNl/igE36/5sJ05KveYvDGVMkTJ3
	oTzj2RB7wkwznBjxC+Blz7iZTHd/Wf20a89AMeH4BPxz7MJD9/1HEei4fkqhzU/QdtlQ9qleoQnRn
	BrEKHpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vS7-00000004af3-2FxF;
	Tue, 22 Sep 2026 08:02:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRc-00000004aJM-2Mtc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C/lMPPdyVDY8UDcv/G9hmnqUs4LxNskElZuOnfztMlQ=; b=Be2jh/OCW3KcVt2I3AgaZ13pda
	rYB18T52NKm34vyZsGqy94Pjc2f2seuj+wDHkLC8SHRMfwaQDnEBe2xujMJLWwIS3WQYE/ngsZrbW
	v8Lo6A/JnCDMX4VrQjd71Oy76hhsjvKZ8qVVDiddSx7OyfVLcgmCz9mLSnoW3jxclQYp+ssKv7tD9
	cVQaj0jPnH4cz9R1+qdZCrC7rzTWqGhlssUk7zkZ8JwXzPN/e0izR5/beiJLs39UUszUZpqno4wx8
	Op0Iypv7ZH6He2GsTIOGjLcV1t7TXPwoXEZ8L+1tpSS0GzNcwtG53miMk8VzAqaB/X5tiy222JAba
	SzsJscVA==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vRY-0000000DEfY-1cQ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:01:39 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49fbdc010d7so1073885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064095; x=1790668895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/lMPPdyVDY8UDcv/G9hmnqUs4LxNskElZuOnfztMlQ=;
        b=cgqy1+nXw+3a6BIFW2F710r+AZsTe9i+A5CqzzAKP11IExXkP0BjfjnT9cCXLiay27
         YignXYQDfX5DVlWG3js1g/YM3Sx/8XN4GjKQ6eXdzcNwpe2gNEhTZL+jj8ouMTgPUhBH
         f4gfpfbuu1gptOhTMkK3r1H6WOLjNGLVueqM1jHva+nRJuijKdZ0ab9qLr3smPjJ0biM
         tnN1pZ6Dc6AX9gEy7fid2LIlTy4lqFNLYHPFOu5NkYk7+PZjC2uZeGemrHLEtyNQ9JX2
         wC8aJZE/t59hFQxJSXkWI64akyaBALeUnqFciLJ7iLZS2Kdpkbt2Ad8r+Qd/82bpe8wF
         S0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064095; x=1790668895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/lMPPdyVDY8UDcv/G9hmnqUs4LxNskElZuOnfztMlQ=;
        b=fotee22WyR5UWaxF1IrRWKAQwBOjAeZMCs96IAgm6W2k6kpDqCLrnsZJPIHyGNb/zm
         tPfZBH5+GmSP2AoyCoaZmlcLrYg1UnTnHzbWoK04bl57IXlb1zaLb6pkhJLXZ3sX/dto
         FXD9vHsuU5qT2KP88x7oQIqrso2y7f0kSF5eELRHAnQ2sLBOq+NIVk/tnkYds1U60hNI
         8fYrdWc4vB5xlMYZu26nLWE9Q7eudc0zvMsO73Kc1Kk0ZuAkR+PQX82tMku4gkkgXWvj
         JJbJhR3w9XOMopjFb6jwc8AoVKC/DGHcg/GEgbx++oxjN2VpLCesBeYA7jLh078phOkX
         WqrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeZeKe/Xfe3jqAzmrHs5+S75D0xlqpM3v55fU5tHOud7OLvSXI7jUTWS+qigmfiVAPkF2tD5usfEvaXzRwyBVo@lists.infradead.org
X-Gm-Message-State: AFuF++lJh+7VVX6v0wZs5//BZCnkPAeeMsvEGMtqTRA5A2rrxOhVdphP
	DY1eKzbvLq7pEevPiIUNCtdEoQ8j53vj7UT9H6QnaQlrM4piaaVcSni0
X-Gm-Gg: AYBFou0X31GxQMda5zpJnYNT2tpghQoJJfEdMIfdxx5TKnBAy7p/pjnNb7Ie/XF1drt
	pFypm6vZIJV8N5z2HeZDz3KYAoXgahTbx/fC8beFP3HCry7ee7IQmApNavQTODfbTlae6TS5hlz
	7unjZ7riTwL9f1/oKL3J/yTpUkIp9BnQjSUD9pTt6R+nz5TuY45eMzg0iwaxx5yzKPlATYXEGwD
	Cu2Q96KkJkv6q0hAEpdFASTBZ+Jj7t1PbrJcJkNaQb4oIqrMUaLIeHsggpch+kB1Ny1nfp3gEWw
	X4TjeYBlYgdIgKUhCNE8KfXv1CUgD9eOJ/TTJvAchEIwNaFAnzDpUwQ3L/sFdBYwQrZx8EkxcJZ
	gf55SVLdsPk754cey3JNHMUbkNZCoGidw9tmuOdKpmdkILdGfecOe+7miFGpUuhrUCBKOGxK/p/
	p2grjl9Av4cQBxJcABYVyhKwMHcrEVkeZq2qrb/VncLoP1QL2Zn+8lPiHW+ucsy1iXzm78hpxW9
	IvxTD0Z0vCj7oanoHOWPPQY/qWvt7LC4mhbf4DAXNmcgnnnftw23aXK4pF8wRmOwC+HUytf0wwz
	RUh4SjzqfNOfOw==
X-Received: by 2002:a05:600c:354e:b0:49e:479b:c13b with SMTP id 5b1f17b1804b1-49fc7dff668mr165633455e9.1.1790064095154;
        Tue, 22 Sep 2026 01:01:35 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:34 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 07/11] arm64: dts: rockchip: rk3588: add an OPP table for the NPU
Date: Tue, 22 Sep 2026 10:01:10 +0200
Message-ID: <20260922080114.44662-8-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090136_660190_B5840EC9 
X-CRM114-Status: GOOD (  23.76  )
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

The NPU compute clock is driven by the firmware, which only accepts one of
the rates in its own PVTPLL table: 300, 400, 500, 600, 700, 800, 900 and
1000 MHz through the PVTPLL, plus 200 MHz off GPLL. Anything else comes
back as SCMI_INVALID_PARAMETERS, and that refusal never reaches the caller:
the clock framework does not look at what the clock's set_rate returns, so
clk_set_rate() reports success and the clock stays where it was. The table
therefore has to name those rates exactly rather than describe a range.

200 MHz is included even though the vendor table stops at 300, because
mainline pins the cores there with assigned-clock-rates, the firmware's
table names 200 MHz exactly, on its GPLL path, and that is the rate the
NPU boots and idles at. Its voltage is the same 700 mV the vendor uses for
300 MHz, so it is conservative.

The voltages are the vendor's, and the upper half of the table matches the
GPU table in this file step for step: 700 MHz at 700 mV, 800 at 750, 900 at
800, 1000 at 850. There is no PVTM or binning here, for the same reason the
GPU table has none: mainline uses conservative worst-case voltages instead
of per-chip nvmem data.

The table is marked opp-shared and referenced from all three cores. They
have one clock and one supply between them and cannot be scaled
independently, and that is what opp-shared describes: one table for one
clock, the way a CPU cluster shares its table.

The full SoC range is described rather than a per-board subset, so that a
board which cannot cool the upper rates drops them in its own .dts with a
/delete-node/ on the OPP it does not want. A board may only delete OPPs
that way, never invent intermediate ones: a rate that is not in the
firmware's table is refused by the firmware, but the kernel never learns
of it, so an invented OPP would be refused while the kernel went on
reporting it as set.

rk3588j.dtsi does not include this file; it carries its own derated tables
for the CPU clusters and the GPU, and it gets no NPU table here. That is
deliberate. The J part is rated lower than the rates in this table and none
of it can be measured on the hardware this was written on, so inventing a
derated NPU table would be guessing. Its NPU node stays disabled, so
nothing binds and the cooling map added later in this series is simply
never resolved.

The same rates and voltages were arrived at independently by Nicolas
Dufresne in a proof of concept that was never posted to the list; his
version differs in that it marks 200 MHz as opp-suspend and drops the
assigned-clock-rates pins.
Link: https://gitlab.collabora.com/nicolas/linux/-/commits/rock5b-npu-poc-4

Assisted-by: LLM checkpatch dtbs_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
v2:
- opp-shared, and the table referenced from all three cores (Nicolas).
- The opp-suspend paragraph is gone. In the v1 thread I said v2 would
  argue that the driver already puts the device back at its boot rate;
  that is again driver behaviour used as a devicetree argument, which is
  what Nicolas objected to, so I am not making it. Whether opp-suspend
  at 200 MHz describes the hardware is a question for the DT
  maintainers, in the cover letter.
- "give a driver nowhere to return to" is gone for the same reason.
- The paragraph on the table being inert until the driver patch is
  gone (Nicolas).
- New: the firmware's refusal of a rate is not reported back through the
  clock framework. Found by reading clk_change_rate() in drivers/clk/clk.c
  after a test that requested a rate outside the table.

 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
index b5d630d2c879f..59ecaef5101da 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
@@ -151,6 +151,48 @@ opp-1000000000 {
 			opp-microvolt = <850000 850000 850000>;
 		};
 	};
+
+	npu_opp_table: opp-table-npu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <750000 750000 850000>;
+		};
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <800000 800000 850000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <850000 850000 850000>;
+		};
+	};
 };
 
 &cpu_b0 {
@@ -188,3 +230,15 @@ &cpu_l3 {
 &gpu {
 	operating-points-v2 = <&gpu_opp_table>;
 };
+
+&rknn_core_0 {
+	operating-points-v2 = <&npu_opp_table>;
+};
+
+&rknn_core_1 {
+	operating-points-v2 = <&npu_opp_table>;
+};
+
+&rknn_core_2 {
+	operating-points-v2 = <&npu_opp_table>;
+};
-- 
2.43.0


