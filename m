Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD08CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 19:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARNulbwujzqTC6TBIyUcN+Sxg1gArb1tBFDYw0Up1wE=; b=TsmkyRuqkLka5cfbbsTEcKkPzI
	SUbR67Rd89ezapKChvMlhYyZtNJoREu05N6BUe9CBNRG5lZY5Yw7cJFRDeMXp+FemZkN0oYd1quAB
	71dTbGmmb6NBXqMCZWoI6B5iy8WZ3OqsUwLn60xXB2Pds0AYL9Ahp/a4LS+xDFRs9VYDSsJwB6Uck
	X3hC9d7WH3f+0zrAdRbgk2xO8tviY1ktlpl6jSOUN9NBAn6S42x1JKOueM7+EzrN9ITS8flrrDGFm
	fNaRG6BS6qn1JYvqyW3KmGO9FTQGAzTuP8Ex3jGAZpD9Z3j5NCpSNGzwEHyOX8TfL9BoIvKqITTMb
	rBbEqreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03dH-00000005pqe-12kf;
	Sat, 20 Sep 2025 19:52:31 +0000
Received: from p-west2-cluster4-host5-snip4-3.eps.apple.com ([57.103.69.154] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03dB-00000005pmY-14gu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 19:52:26 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with UTF8SMTPS id 948721801B24;
	Sat, 20 Sep 2025 19:52:22 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=ARNulbwujzqTC6TBIyUcN+Sxg1gArb1tBFDYw0Up1wE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ig3ymr+Z+eqzf5M5oemHs6qSw2bHI6kP9uNx6KcgXQa9r74tfZp94pp1bRmrlAM9GQGn1sJcw02QgWy2w6NDexI5TEZ4X8O8eLfI+G1CUt4z4XdTjufcGzweuuwvB9IAfNPdqTF1ieychu7P12NHEsxbjMQ++qktZQo9OEjK8eM+TVdLir13vjvVPQWbeCItwTeMqmq7AhjGauprOuQS/F1lhbu4YBqbdxhrofGtgQDtqh2yVoEIyq4FjvMNAupuVx8+PFII2lGpkEZL1gGVYY9nCa31m8g+hWAeLQb7RKY0tk9UvMl87wJwNWYEKQqfZR+BDIVlKbxYmeTKAcTUSw==
mail-alias-created-date: 1643268037438
Received: from localhost (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with UTF8SMTPSA id 2449718001A2;
	Sat, 20 Sep 2025 19:52:22 +0000 (UTC)
From: Bryan Hinton <bryan@bryanhinton.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	daniel@makrotopia.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200
Date: Sat, 20 Sep 2025 14:50:51 -0500
Message-ID: <20250920195102.2733949-3-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920195102.2733949-1-bryan@bryanhinton.com>
References: <20250920195102.2733949-1-bryan@bryanhinton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 43BJrrDByWVIPkQyTa670jQr2J9PN48K
X-Proofpoint-ORIG-GUID: 43BJrrDByWVIPkQyTa670jQr2J9PN48K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDE5NCBTYWx0ZWRfXxZxI4GWXbEsL
 Pin0amTzsu+Gfn5Yh1yU3KuNzcd0LQeLbaN2gUx5RQ+VO5p8Qwxfx59XeEeL2S4WhYC3n7faxVI
 xOYkgY7bUntNjSApyOMsc0xUfTwhv4FgpEJmuHpe+q0DnRWC12yH1kPaZqVKMBguWBO8XhOckMd
 WeKn1j7xiovRJfSCfhVggxDSAv4ejbgIF/yZRlMF2FyVbSbXPrAbYuFKlqWmbm6/8hbVkNgL4LE
 1JmwvuTD3KG9rmc9j88fNoZe08nGcAmYrk11CnU2ULyHeEOf4SsCzwWzFMDyK57hMiq1mxYFQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 clxscore=1030 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509200194
X-JNJ: AAAAAAABZyS4qkue9UJqaMuEO9aLsllPNgsr19EgF0o6Go+lbA0OpU/ZdC7ZCpg0WtAKEpSMlAzriZ0PC2hEffbbKoIZRkmByvbzpFEBIGaY5NlGP2x/5WqylzT8mSZ7cuCUl6+LDd5rj88xIHaxv7Hh+Va62O+RbPu53nYWkqiFa92qtMZBlqqyaCauGEqgW5LDi+T9KHCxffUtdcowshQfUH6K96XbaGyeARnIkYF8izk4CpQVHTv+imtsoucY8njD5axLO3dNnMX+wwGLaCnOyBIOliTeD9iRG45M/H1dpAeL3xwhCvGhl+9W78PLYlCtYz0GH5qAPvAko7eGbGFxzdYPbVqRP4UojdfW51VRJ+7v82TWw2Z/Wu9t8RQcAHlWnvSsmGbKMm7ZX6O2ioGjjrszlbz40lTLDV6UUCb0fgP/aj8YWTndujDH+t3Dh9oDhMRafybne5Eb/dq64k9wfQMnSCc44LYd/XH8G8QKWkHNzhjuoZF1XdgC2fZl7uFqnDWsVvd43SigHkjBY7NGyNVjb2j/ZJsW/Ly6Pt6pP4PnK50ikDfpw7wzfXtsNe9XUsBg7DdpQ2y1VbB9i6HUAlUE42t2eQqy8PnaueTDU8M8hLwsrwEfvRs1pKlPMVyQUCzRv6rs8MoIv0D40bbNe3f8Hl1zChqQCjbgR8zSdbKLL5IRqpVFSQdg6QV/CfuM8WbNdGmyB+G/eq4XDB9oMu0SiQRCE9CFb8xUIYUXtei5q+mx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_125225_298698_C0E817DB 
X-CRM114-Status: UNSURE (   9.89  )
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

Use the new uart0 label for the console and make the speed explicit by
adding current-speed = <115200>. This keeps the DTS OS-agnostic: no
bootargs or distribution-specific properties are added.

Verification: Boot-tested with mainline Image+DTB via U-Boot on OpenWrt
One (MT7981B). Serial console active at 115200 baud, and DTB decompile
confirms serial0 alias and stdout-path set correctly.

Changes in v2:
  - Dropped redundant hex value comment on current-speed (review feedback).

Signed-off-by: Bryan Hinton <bryan@bryanhinton.com>
---
 .../arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 4f6cbb491287..638ed76107e3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -8,8 +8,21 @@ / {
 	compatible = "openwrt,one", "mediatek,mt7981b";
 	model = "OpenWrt One";
 
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 		device_type = "memory";
 	};
 };
+
+&uart0 {
+	status = "okay";
+	current-speed = <115200>;
+};
-- 
2.51.0


