Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80660E6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnFb/IX3ljIxWsMngTBtcXekODzwjzg+jILeoqFZb7A=; b=B5bvELNZ5+/Ldp5dNXD2RoTgXn
	kGDeDDPYQoJMxqWVFedS2PInpc1HIDg2OLwAb0O8DgL9NsxBYJBTpJQxFK9jGVW+RiGP+Jqpa2mzH
	RRm5bDffL3OGkB3Y6erJZTGhDzC5PVR0A2+2dQcttmwWgNMpLgdLv0mRiCa7CxnnN1OCngn14JHwb
	UhufvDp4N/66KuV21XLYXCjTT7Bmvf4CaWr06Xi8EdfpoH4XLPlq6XNLztMtthdOVFTMYVjRKSt3B
	0qqXTVrQWz9/rHJJXOgYXJjLE1GxKcPSFHsDKlCg3zAamdWfFCtof4oWMchmMNjTdVOZ3E49YCYhw
	G5gzXmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fk-0000000FlA0-1tQf;
	Tue, 23 Dec 2025 16:28:52 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fd-0000000Fl6G-2b1K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 16:28:48 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 9FF411FE0C;
	Tue, 23 Dec 2025 17:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507323;
	bh=jnFb/IX3ljIxWsMngTBtcXekODzwjzg+jILeoqFZb7A=; h=From:To:Subject;
	b=S2anlDl21dcTQau6eVPjl9xfm98B/lT5hXIhlsNDw+YCmSzVqh/82dBzXtuiRpek0
	 gxxG7kCCG2MMFLpVrb0PvH79UaSokk3e3OwPDeXPi85rMqaofOdScXk8Fmcq//uzYH
	 EoODPGEwmFHmKR28fGMo/esPiE7QUN4HFOTQvzAN3WfHI7rd9Rjwm3A9n9S1PvSNXn
	 20OzctLHbbRyOsBw/aEcRh8dwoge05h5KAmnbmCIhoulTXix7pbv4hwXSFq+eMOjzb
	 qFK9vUakDsxxSwz9S7eVBjm477JXAjq6JxsqODgUAoFss7KJ/CKWjSTFAvsILzgQXR
	 /uYp667RrzdCA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/4] arm64: dts: imx8qm: Add CPU cluster labels
Date: Tue, 23 Dec 2025 17:28:28 +0100
Message-ID: <20251223162833.138286-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>
References: <20251223162833.138286-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_082846_589277_1220738B 
X-CRM114-Status: GOOD (  10.40  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add labels to the cpu cluster nodes to prepare for the addition of the
i.MX8QP SoC in which these nodes would need to be adjusted from another
DT file.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index cb66853b1cd3..e0046f798eca 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -38,7 +38,7 @@ cpus {
 		#size-cells = <0>;
 
 		cpu-map {
-			cluster0 {
+			cluster0: cluster0 {
 				core0 {
 					cpu = <&A53_0>;
 				};
@@ -53,7 +53,7 @@ core3 {
 				};
 			};
 
-			cluster1 {
+			cluster1: cluster1 {
 				core0 {
 					cpu = <&A72_0>;
 				};
-- 
2.47.3


