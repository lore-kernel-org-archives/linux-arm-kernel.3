Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F622FED3EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izES7TuRIXzQ6SUewf1iIXv7GKyY2SUe7GIM+61ZPCU=; b=30DYs7YeH9v2M+UduO1jdNTCt9
	vWeLkbHNRmna2k5wDY88R7mOMkaVuPnQHyyBuz0N18wuTiWAn2tzxJqBnUuDDZ9i4gj4cR/PhQLIp
	VhdSnChIVUYBobIlH/2748cdlWaycX2bEfFOA/zNGRZ3itBKV67JbBCZQmaSYl58HTusxLf6rMfLm
	lp7C6bZ4v0zqlx7vIe5jDDwsXCuVDZBFSaA5eJhtSuVUxeFgr7atfb+Kr/I2m6kWgO6grooNYWUFi
	NO2/wr/lf+aGftIa+rGL0dWB68uuVtJKT8u55dz7q7n/iFUFav7RUFeNqDwlimAD1gMliNtZbqz7P
	89EXF5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIkx-0000000DP5i-0DwN;
	Fri, 24 Apr 2026 15:47:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIkk-0000000DOvJ-2GWl;
	Fri, 24 Apr 2026 15:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51D06446F5;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2538CC2BCB7;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777045656;
	bh=elZM1nnUL8tGPNLZHklCcbm+/PN5OiNdRt/TWuoll84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rGcu+pf/PBo8iw45HPRBBM2kdNMRjzLBgsEsWKWQaY/8EOpZghSKD7JDXzslsfcvq
	 EEeE6J4LgMYu9g630TceePMEGtd1L5PKmcVE+JiPF2/K6sZnIgfoInJhtBgnjbdQO7
	 eEAMesjfEcxYyB+NuyDUErB8MhgdVPvpfBvcS26Q4Kd2IG1z25ZQXcb6c7wG+SSl+M
	 N5MpvnNUJ609oW5o6sdwYI5TydgZz8YKxL1TH86vZNS+kzFgXKVMOH4LO47h5lpUqq
	 u7EDeSkgrqJr+Zj71MvW7HTUo9sYpbnx8GQ90txQlfk7zfLNPPUfdOmgUf9ft8HnPj
	 ELglw3Do02xgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D106FED3EF;
	Fri, 24 Apr 2026 15:47:36 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 24 Apr 2026 17:45:13 +0200
Subject: [PATCH v5 5/8] arm64: dts: amlogic: t7: Add cooling cells to all
 CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-add-thermal-t7-vim4-v5-5-9040ca36afe2@aliel.fr>
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
In-Reply-To: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=XrCMAL0ahuPAin/Bi3StAQs4xZcZCs3qAU91y4l1Ouo=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+brCf2ff0zY+PFZt2VQqo0w+9I8jojUB/Lynx3vlDsyf
 Fqbnq/dUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAExEJJmR4XpcoiXL1oUxNqyZ
 8n92z+s+fftZ1xwDjjM3L9nOz1h4fj0jw4Pzhqs8bmx5/4oxsdFzxW3vrbpZlwU3r/azeVJ664r
 TA0YA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_084738_637222_691B05E8 
X-CRM114-Status: UNSURE (   8.30  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add #cooling-cells = <2> to all CPU nodes (both little and big cluster)
to allow them to be used as cooling devices in thermal zone mappings.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 560c9dce35266..7aec65f036a9c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -63,6 +63,7 @@ cpu100: cpu@100 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu101: cpu@101 {
@@ -77,6 +78,7 @@ cpu101: cpu@101 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu102: cpu@102 {
@@ -91,6 +93,7 @@ cpu102: cpu@102 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu103: cpu@103 {
@@ -105,6 +108,7 @@ cpu103: cpu@103 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu0: cpu@0 {
@@ -119,6 +123,7 @@ cpu0: cpu@0 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -133,6 +138,7 @@ cpu1: cpu@1 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -147,6 +153,7 @@ cpu2: cpu@2 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -161,6 +168,7 @@ cpu3: cpu@3 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		l2_cache_l: l2-cache-cluster0 {

-- 
2.49.0



