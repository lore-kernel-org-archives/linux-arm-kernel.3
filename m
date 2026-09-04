Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D42C79F88
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbG5tkNoyC999CbeFUHbHjzpSs9HHc0dLmddOFM6uZc=; b=cE7gDHVzCvyinbfprsaJ3hjMBq
	CzcqBgYS5xq34Nv7yZPifvWAtZhAAOdWVr8Gb+v+OMYfRPd+7EaE661zPMeWagBosfOQJq2R/QKLB
	oIJUATHDSdJzzi3d3ZuqqRQmO8bwHc3FqcmoJJ+rLgE+97nJrU5quakMwE5pAdvrJSagEzSBdr/7b
	ahsu3bSQEf9nRQSm1fsp45Is4SwQ1gjxaN1ZgdeaQjq9mXlmzc7VIhJWSK/pbEmWzEEsQcjm+vDgo
	lQx5slAa6OzNtmuMWo80vHKRS29W+aQr4sYrLBzL9FKN5ItHbL4XSjAlNbYs4NmIPv/vF2qqX+SQo
	SjGOdVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfg-000000026eP-3p8m;
	Fri, 04 Sep 2026 13:09:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfd-000000026Zg-23YY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:09:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so929795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527368; x=1789132168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbG5tkNoyC999CbeFUHbHjzpSs9HHc0dLmddOFM6uZc=;
        b=ofPp/74QYDR0NkMvdGUwg+SRdZ/EdLxxDkuL+jBns558h7KxvPo5sf/U8KIB6sZduY
         Du4BJaQST347D+5tlxOm6dgzMO+Pe5boEfWbb3ILkStDyWAENcFavpxQ/+ik9liWJK5L
         jyg55K/Zo7CEoT9DbU/g4gwRnxXMgUYJHUg74TsdatI6DFJE7oRuNkWl3Fi4aCFN7weh
         hTCV3+IJjhjvrkMVM/LrFDsl7OKIgZU12BMhOKKrm6eQXAmL00QwrRI4QHw3sj1ULo89
         7bj7kOxEm8Mhsbpfd5u7DsOMHgPIWrfmMD5Hz+mtv/GjfqyTG2aSrdPQyRRGoYIuCNpz
         TsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527368; x=1789132168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbG5tkNoyC999CbeFUHbHjzpSs9HHc0dLmddOFM6uZc=;
        b=cUszyYsl2OR+NjatV5dDnx7t2fbcmMG8o8mCpCf3QDIrXfQtYSo8aRzNs/IgbFxMhN
         qB0nN9oB6t6LFeFc0dAz3/hYSzQffxR0bAfnI7PCg1qXHoSgWfDpMrkWFh1Ou+ICkbTJ
         ty/VIR5e/SXVjlHxStiw3Wx4yaq6dQ0KT5J+H+QiKR3FpzjtHi30cgftOF2iJh5UySYG
         bOgwi6vppVQkrogMFDlewrkdZ/v1Ud6PZQzZ4DLpn/sFm5o3DL/OvBVkvyjCxHFf9qne
         MSLpCco/hlirlCNQ3admkzHsEpYI0+S1Bk0kUwBEg8ca/+ljoQYpkYLMJeF2DYGdZvM6
         ZD/A==
X-Forwarded-Encrypted: i=1; AKwUvBxFE6qnmOY3WLbDolJaFTZjbbyCCsgdAhBlOfjc9ZYiKkSTDh2KEgn1MSaH5UOj4W5sEsoqDD2tBtxgRhyZ+8Kr@lists.infradead.org
X-Gm-Message-State: AFuF++lpsqnRymSDRdKXHZ9TRzoiXDpmSoaDfEHC6/JG9qf2X6vvRlYi
	DaMrASUZ033P0jbJB+zBRjDls8U2nNtRBx3qC2bPw6gQzJog1KTWs415
X-Gm-Gg: AYBFou3N1wNLJ4QPPeZcZ8ZA2PtXrmBgjysuiZZ6NuMZ73q7lvGqeAJ/3OpmXK4p4vO
	CWxhp7I5T4Mr6LpJijA3WPcVKmpdrn6xyjniDEi6v7Ecgc7xLnKOcNLLvLNKz+vxG2BCUZ4E8K/
	0ePjpXesrh1CWFy4TBSB+W2t/Qekyt94QmoOsay+xEwx+9twsYgBIA1EbbD343lrPIu7PKotkSI
	RI58YIQjkaM40FX2Q9PCEygBeJ9Y20mr3ZuxydoLPJMWsX84tw/XSD+nXr36xqq7I/H3W1Abw91
	2a5vENNYfZLaysKkyyF6wjx4JsYxf0Rwkao89kTK03q6T9k/xqfARqmG5UEll7qE7aukukCfY9m
	q6pArK2Z+Ar+7twXHRkvYDktDW6FNpjfJWfbn7zbbgdzV8uP8zGRBo0ylV2x0sgJwC9JwLFpIAn
	KLm+e6LP+ohkA7Wv/wT1Guv+D6GtAgYwO6j9zyem50QbEKgZoM0w3IPwn/Hk9SPILhgcv4cFFCi
	0dzaoqHIauyR9LLakOROrCwqSDFoe0VL8gAo/z/IxhGxuDvkmiTy/QyaFjGA49k5/Vb
X-Received: by 2002:a05:600c:a00d:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49cf7f51dcbmr42170965e9.0.1788527367548;
        Fri, 04 Sep 2026 06:09:27 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:27 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 3/7] arm64: dts: rockchip: rk3588: add an OPP table for the NPU
Date: Fri,  4 Sep 2026 15:08:54 +0200
Message-ID: <20260904130858.27803-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060929_563160_3F1B843E 
X-CRM114-Status: GOOD (  18.88  )
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
back as SCMI_INVALID_PARAMETERS, so the table has to name those rates
exactly rather than describe a range.

200 MHz is included even though the vendor table stops at 300, because
mainline pins the cores there with assigned-clock-rates and that is the
rate the NPU boots and idles at. Leaving it out would put the boot state
outside the table and give a driver nowhere to return to. Its voltage is
the same 700 mV the vendor uses for 300 MHz, so it is conservative.

The voltages are the vendor's, and the upper half of the table matches the
GPU table in this file step for step: 700 MHz at 700 mV, 800 at 750, 900 at
800, 1000 at 850. There is no PVTM or binning here, for the same reason the
GPU table has none: mainline uses conservative worst-case voltages instead
of per-chip nvmem data.

The table is attached to rknn_core_0 alone. All three cores share one clock
and one supply and cannot be scaled independently, and the driver hangs its
devfreq device off the core that carries the table.

The full SoC range is described rather than a per-board subset, so that a
board which cannot cool the upper rates drops them in its own .dts with a
/delete-node/ on the OPP it does not want. A board may only delete OPPs
that way, never invent intermediate ones: a rate that is not in the
firmware's table is rejected outright.

There is deliberately no opp-suspend property. The driver has to resume
every core before it may touch the shared clock, so letting the devfreq
core drive a suspend OPP from inside a runtime-suspend callback would
deadlock against the driver's own governor worker. The driver records the
boot rate and restores it itself instead.

The consumer is the devfreq support added later in this series; until then
the table is inert and the NPU keeps the fixed rate that
assigned-clock-rates gives it today.

rk3588j.dtsi does not include this file; it carries its own derated tables
for the CPU clusters and the GPU, and it gets no NPU table here. That is
deliberate. The J part is rated lower than the rates in this table and none
of it can be measured on the hardware this was written on, so inventing a
derated NPU table would be guessing. Its NPU node stays disabled, so
nothing binds and the cooling map added later in this series is simply
never resolved.

The same rates and voltages were arrived at independently by Nicolas
Dufresne in a proof of concept that was never posted to the list; his
version differs in that it marks 200 MHz as opp-suspend, shares one table
across all three cores and drops the assigned-clock-rates pins.
Link: https://gitlab.collabora.com/nicolas/linux/-/commits/rock5b-npu-poc-4

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM checkpatch dtbs_check
---
 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
index b5d630d2c879f..3711727020ed1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
@@ -151,6 +151,47 @@ opp-1000000000 {
 			opp-microvolt = <850000 850000 850000>;
 		};
 	};
+
+	npu_opp_table: opp-table-npu {
+		compatible = "operating-points-v2";
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
@@ -188,3 +229,7 @@ &cpu_l3 {
 &gpu {
 	operating-points-v2 = <&gpu_opp_table>;
 };
+
+&rknn_core_0 {
+	operating-points-v2 = <&npu_opp_table>;
+};
-- 
2.43.0


