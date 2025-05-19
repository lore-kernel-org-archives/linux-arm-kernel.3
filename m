Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C0AC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W1wlPPM5KG2GsI5tQAqWvz/yuAg+jLg5ME+Tda7BDFs=; b=cyGqrKSKXfAUmwoZVDAQhQrbsA
	azIMFEUXC+cKuSdW2nLTwT07B0YR9JXt72WFPzsDJG/ucZJsurjn1mUNRU3i0jM8YSfRm2veuH6qy
	C1BhkOwX8F2VLhzS5cQQ+Dns5DAj6l+VHOuAdJ7YfPlxtzfMBDwUCkQBORhWxuad90CPHXZCW3Nw2
	dykryvJW8irAoaCPzSWjQ0lgZGdZ5o92A7pXpX/aQbPg5D1bcuNFxadC3kPs10d1YgXn8mDpAhf+w
	nY7lNFt0qTa6Gza3Tjnb+1bY3E1lnBm68SC7MLraOgEKiPFUF4QW2/0emJXovbWwJvJi4hga903UF
	RwyWGR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxd4-00000008mJF-1G7S;
	Mon, 19 May 2025 10:21:54 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxax-00000008loU-2ucq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 10:19:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747649974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W1wlPPM5KG2GsI5tQAqWvz/yuAg+jLg5ME+Tda7BDFs=;
	b=MP4oFvrmt8llfsRowSYmUNDPerHWjDpbUMCGw219WbVmd0TkKZ2EDCoVYddfy+B92fTLhN
	w46Cl0hEy9M+Y9DOxPwUfdmEK6DaoYHEWJJcfqp1gwZOszhFeL3Xr1cKkyfBk6sAq4hAo6
	0dQ+P1BSupP7mYic6TOVRNAn0vmjW2dEzrrC0i7sfQ1i1dHU6/8+07BHYdYQh555cJaHDb
	Mnywst/LcHty78ryXVQW4J6ewx35mwQUBUANEJtB+uWqkOg/agKiDIp6xGPONYRFJt/XPH
	5EiSv/z0LkCi6/ahSnB6l8yZFeh36cXcTVFixIQYbjBRY5LgJfPuYcIymp0P1A==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] arm64: dts: rockchip: Drop assigned-clock* from cpu nodes on rk3588
Date: Mon, 19 May 2025 12:18:28 +0200
Message-ID: <20250519101909.62754-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_031944_661946_A5957C75 
X-CRM114-Status: UNSURE (   9.69  )
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

The assigned-clocks and assigned-clock-rates properties were moved from
the scmi_clk node onto cpu nodes in commit
87810bda8a84 ("arm64: dts: rockchip: Fix SCMI assigned clocks on rk3588s")

During review of v1 of that patch set, the following comment was made:

  why aren't you using OPP tables to define CPU frequencies.
  Assigned-clocks looks like a temporary hack because you haven't
  done proper OPP tables.

Some time later, proper OPP tables for rk3588 were added in commit
276856db91b4 ("arm64: dts: rockchip: Add OPP data for CPU cores on RK3588")

So this 'temporary hack' is no longer needed.
Dropping it fixes the following dtb validation issues:

  cpu@0: Unevaluated properties are not allowed
    ('assigned-clock-rates', 'assigned-clocks' were unexpected)
  cpu@400: Unevaluated properties are not allowed
    ('assigned-clock-rates', 'assigned-clocks' were unexpected)
  cpu@600: Unevaluated properties are not allowed
    ('assigned-clock-rates', 'assigned-clocks' were unexpected)

Link: https://lore.kernel.org/linux-rockchip/CAL_JsqL_EogoKOQ1xwU75=rJSC4o7yV3Jej4vadtacX2Pt3-hw@mail.gmail.com/
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 548677de9a53..70f03e68ba55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -96,8 +96,6 @@ cpu_l0: cpu@0 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <530>;
 			clocks = <&scmi_clk SCMI_CLK_CPUL>;
-			assigned-clocks = <&scmi_clk SCMI_CLK_CPUL>;
-			assigned-clock-rates = <816000000>;
 			cpu-idle-states = <&CPU_SLEEP>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
@@ -174,8 +172,6 @@ cpu_b0: cpu@400 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			clocks = <&scmi_clk SCMI_CLK_CPUB01>;
-			assigned-clocks = <&scmi_clk SCMI_CLK_CPUB01>;
-			assigned-clock-rates = <816000000>;
 			cpu-idle-states = <&CPU_SLEEP>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
@@ -214,8 +210,6 @@ cpu_b2: cpu@600 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			clocks = <&scmi_clk SCMI_CLK_CPUB23>;
-			assigned-clocks = <&scmi_clk SCMI_CLK_CPUB23>;
-			assigned-clock-rates = <816000000>;
 			cpu-idle-states = <&CPU_SLEEP>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
-- 
2.49.0


