Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CA3C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8EcX7ha+OGQ9qey8lE2lj7jcMUTVuGEn/ADcxvMEid4=; b=lU80xIGRMaxq9zAfvZUANepQpa
	lRknfd+Jp7Zz3qFfL7oDjh88sQoF5LyRu57J2bGauLEhUHcBYeBmZxZ5jMRcgMVqfAGgXY3f4pf1N
	laOuwtz6v49OIPceloA3MT2MIWGJq5IS9gqDe7aYtr1w1vh85AFVKtJkd7jRzHnvEef5VS7fPVXz4
	xpLOqoKpgRUc+IR7S5r9eI/Xaf+ejx/OEgNB8DL9uvLsu058KmFXYaqM/BR//2QLwdK9G29xurD7D
	wuU41u1W8cubM7NjHBWYY/xTbhOlSgvEGFWOnlirr2trJ1UazfXhLkyLphuH+bc3CROvSY4ksQGbV
	ijs8edGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsjf-00000002P7V-054G;
	Fri, 02 May 2025 15:55:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsXd-00000002NEC-3csn;
	Fri, 02 May 2025 15:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746200587;
	bh=eBAnraOpFs24oa8cyCRi8zE49i9v3WmI83Gfc+9VYrU=;
	h=From:Date:Subject:To:Cc:From;
	b=CcbBc+cPJUJUUYJy1zR+8xwwsmi5CT00hhIA4U6hqXH+Jtp2mTuEpDbP5Tz3y0hRY
	 EMXGwA+s1tLxbLSOqQrjIdLLGYcTtq2o4v4fH3KVMtG5lGTn+Adggtj56bVYD6H8wo
	 38YMRcsqg1qOltyDqaqGQsbV+cP3q76KsfsYqIw1QO0ON/8a1zft2wHwzENfnLB6to
	 i12LyVP4O02xuvZ78B9xspba73Kt/iVYLEa4EfJfNw1PgmYUN4ROY8SnmMpjsXf+9Z
	 28TpGBOpPbpcL+350f0W5w5Ntrr2TBomlOmLHhrvZyGrM7ZNBXuLOMMBTVuIBKOYvP
	 HUiDSOAHh+mvQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2727B17E0858;
	Fri,  2 May 2025 17:43:04 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 02 May 2025 11:32:10 -0400
Subject: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHnlFGgC/xWNQQrDIBBFrxJm3QGjGKFXKV2omaYDGsNoQiHk7
 jXLx3/8d0IlYarwHE4QOrhyWTuMjwHi168LIc+dQSttlVUac5uMdSi07Mm3IvjhH80YS95845C
 o9i2XwyccJ2dcMDaGaKAfbkK3fMde7+v6AypRQfJ8AAAA
X-Change-ID: 20250502-mt6357-regulator-fixed-compatibles-removal-16737b35cbc3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_084310_053870_9B01238E 
X-CRM114-Status: UNSURE (   9.15  )
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

Some of the regulators in the MT6357 PMIC dtsi have compatible set to
regulator-fixed, even though they don't serve any purpose: all those
regulators are handled as a whole by the mt6357-regulator driver. In
fact this is the only dtsi in this family of chips where this is the
case: mt6359 and mt6358 don't have any such compatibles.

A side-effect caused by this is that the DT kselftest, which is supposed
to identify nodes with compatibles that can be probed, but haven't,
shows these nodes as failures.

Remove the useless compatibles to move the dtsi in line with the others
in its family and fix the DT kselftest failures.

Fixes: 55749bb478f8 ("arm64: dts: mediatek: add mt6357 device-tree")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 5fafa842d312f3b01e7d71ddc04ef48ca52bc89d..dca4e5c3d8e210c1e118539153e77e2822066da3 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -60,7 +60,6 @@ mt6357_vpa_reg: buck-vpa {
 			};
 
 			mt6357_vfe28_reg: ldo-vfe28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vfe28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -75,7 +74,6 @@ mt6357_vxo22_reg: ldo-vxo22 {
 			};
 
 			mt6357_vrf18_reg: ldo-vrf18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vrf18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -83,7 +81,6 @@ mt6357_vrf18_reg: ldo-vrf18 {
 			};
 
 			mt6357_vrf12_reg: ldo-vrf12 {
-				compatible = "regulator-fixed";
 				regulator-name = "vrf12";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
@@ -112,7 +109,6 @@ mt6357_vcn33_wifi_reg: ldo-vcn33-wifi {
 			};
 
 			mt6357_vcn28_reg: ldo-vcn28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vcn28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -120,7 +116,6 @@ mt6357_vcn28_reg: ldo-vcn28 {
 			};
 
 			mt6357_vcn18_reg: ldo-vcn18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vcn18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -142,7 +137,6 @@ mt6357_vcamd_reg: ldo-vcamd {
 			};
 
 			mt6357_vcamio_reg: ldo-vcamio18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vcamio";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -175,7 +169,6 @@ mt6357_vsram_proc_reg: ldo-vsram-proc {
 			};
 
 			mt6357_vaux18_reg: ldo-vaux18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vaux18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -183,7 +176,6 @@ mt6357_vaux18_reg: ldo-vaux18 {
 			};
 
 			mt6357_vaud28_reg: ldo-vaud28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vaud28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -191,7 +183,6 @@ mt6357_vaud28_reg: ldo-vaud28 {
 			};
 
 			mt6357_vio28_reg: ldo-vio28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vio28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -199,7 +190,6 @@ mt6357_vio28_reg: ldo-vio28 {
 			};
 
 			mt6357_vio18_reg: ldo-vio18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vio18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;

---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250502-mt6357-regulator-fixed-compatibles-removal-16737b35cbc3

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


