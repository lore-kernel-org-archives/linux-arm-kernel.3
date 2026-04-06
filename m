Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB8EE9D818
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 05:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvg4SuXf3k4md8aUpwKezbVWEXncGBLb7Dh29+zMEVM=; b=toM1gFRsYh2Dsjr1PuVx5ZXgNn
	TfjJZd12/uLcOyhVFlMKTqjuyK31UB4XEPcEsjtNLuF5TVEpo7ChkySxytmultEKAnsfUHqmR/jeD
	wPjIxzfp3eqbCKvCzDAbUaKrK3ZvIrk43xqGiBUBTQGZSmTcJTlze9i5VBMWyJHZuCUgioDr51Ahd
	t0kjj74DIXFGwCoD0j8maWk9WaaNY3iBdrlr8r13JzJTrb+DIsvbWawQcYPbaO5Nt2lCAvIKsCT49
	WBDMEWqa/fywcrFq1fQrUEyhOyXYNkVtfwByt00/btj2t0LOx4bzXHAC5Di6bCfgNG9kqhLeYGVTv
	lAIR8xFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKd-00000004nYQ-0BJC;
	Mon, 06 Apr 2026 05:17:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKa-00000004nWq-1b6g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 05:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66B934454A;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A8F6C4AF0E;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452619;
	bh=7FBGHZTJRYu7L1MZ5c7P0lIeIwAGCDaS6zXq3pgU3Sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ENChF4luYillEI6DRW83uDLF8UEgOixjlbgTU5eSslKsv9tDgI33di9HUDKJ+cgYD
	 eGF9BhnDhCZOEOn38V/h8NlABZvNif0FdN8rfaMx8FLmwzKdDzLATWqucTyDEt+YTU
	 NfqT0D6XlhR/7pleQPny0kaqLpEyKmAKg3VIHHeekYpv6PWvU5Cn3XZV5e2uKZ1mQq
	 qDbfH/Aj3X88BrZjMYWLRwnxp0oy7Zk3g2Lnk9fbEXlxVJ/rZYB5vmyH17rAXJEXdb
	 Zoqmz8iphTzCy/aLz+Ip/P7SN4/tQJsKgXOgZSTesNINxWwO+3uJzbfykhq12XQ79T
	 +hr/jBFPFeP6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFE6E9D82A;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Mon, 06 Apr 2026 01:16:59 -0400
Subject: [PATCH v2 3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth
 pins
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-m8-dts-additions-v2-3-c4c4bd50af48@me.ssier.org>
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
In-Reply-To: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1119;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=JnQJ8Lwcd16goIqpZG/SlQGLNsVxrLW5+bmwKIyoRFg=;
 b=PuxMN998SjM3n8AkupJDk0MwSmg3U53VD1Wtgv9Y2Xsxpa+Bk0VlFjw+2D2yWCrC3/Yc5zIpW
 V1d7whY1IphBl9Dan+JWkS5spgDZWvipDozucZNEdbDdyy9IVmPZFEQ
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_221700_497460_B8BC5AE6 
X-CRM114-Status: UNSURE (   8.89  )
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
Reply-To: alex@me.ssier.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alexandre Messier <alex@me.ssier.org>

Add the required pin configuration to enable Bluetooth.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index f24882dbeef3..2edf407db567 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -354,10 +354,19 @@ cmd-data-pins {
 	};
 
 	wcnss_pin_a: wcnss-pin-active-state {
-		pins = "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
-		function = "wlan";
-		drive-strength = <6>;
-		bias-pull-down;
+		bt-pins {
+			pins = "gpio35", "gpio43", "gpio44";
+			function = "bt";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wlan-pins {
+			pins = "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
+			function = "wlan";
+			drive-strength = <6>;
+			bias-pull-down;
+		};
 	};
 };
 

-- 
2.53.0



