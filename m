Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E984BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 00:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9ZeQCh35puBv44uaN5n9NTG0VCJ7xzTKeG6j0klt68=; b=JnBhOe3xzq8f6ielZ098kuEyEm
	9VjN7zDYi30auItXR+eoahhdnfA3Na3QOskj0zq6e2QuDGZDVdwHuGpvyTEA7e4iVhWffpo4WagKG
	I/mH1duXr0zwr7xxVGjWXolWBARYpi4jGytAlrw/CpPm/JC7KGmAAWXuh1R+eYMzMe9BWZZibapf5
	2fdoiWW/J5qd3NVf8szmzEVQC3oy3Ngoj+jUWkdmf8N/wfSbjuIUC77rBG8s9HryUhNpzCGMkgz8A
	MaiYvgW++HPp2pxX1PcYS/e/Zvv7Xpx3j786Y7DUGRyG8qcKYj+qRNEs9E+rLz08k0PNfYsNref/l
	jE1QCV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzl7f-00000004N6M-40V4;
	Sat, 20 Sep 2025 00:06:39 +0000
Received: from p-west2-cluster6-host5-snip4-1.eps.apple.com ([57.103.70.24] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzl7U-00000004Myg-3gRz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 00:06:29 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-10 (Postfix) with UTF8SMTPS id 34AC618000BA;
	Sat, 20 Sep 2025 00:06:26 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=U9ZeQCh35puBv44uaN5n9NTG0VCJ7xzTKeG6j0klt68=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=vg4D5vFngtIASvm5+9ZXGm4v2Dktb+J1NIynWhPCttAK8+o8infv3aifkk6hx2JWTPdpZ/eSsjCNAqEyTcZKv42y0+WCRXmhvRPOk77QxfpazxaTUqZyDAvEPNhsQ+4fUxuVnl56skPMnV5Dv/7Ok2GpFiTSTUbfJYe7ZKyFpBtQnGu+fTcgEseg44d/ux7F7HiB8HdSiRbVJYiOpsH1S4aaAOIABV3apllBd5d992TbuwxtsT3/OG14yHAPCcpwVCfUFq4dfqtIRRyywxPyNGJNdUiRI4irZGWu3qxfDOgAgyzXi1Yz11rC6u2ElLY+dK32s541+VSyvNVHKxxtdQ==
mail-alias-created-date: 1643268037438
Received: from localhost (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-10 (Postfix) with UTF8SMTPSA id 7ED25180017C;
	Sat, 20 Sep 2025 00:06:25 +0000 (UTC)
From: bryan@bryanhinton.com
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200
Date: Fri, 19 Sep 2025 19:06:12 -0500
Message-ID: <20250920000619.2643457-3-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920000619.2643457-1-bryan@bryanhinton.com>
References: <20250920000619.2643457-1-bryan@bryanhinton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EOBQ2Tfsbbv0mlTv9OXdHSO1BDfAAx94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDIyNyBTYWx0ZWRfX/Rcqg8vC9N7t
 iDiMCiA6IZv1Fb3ANLChfzwDyNquQlBNjmH1F+bp28H2/EVnqpVN3DxGsm9OtWJlX8iNRHFQi3t
 ksBN3R+FTwupf1x674tE5kuGeTVn8XRZzK4wr9b35ZGQXgmDQTEw/FzZO+zOuoaULl+95ajrUXR
 pZxfb5SDyf5/+2Vr1rEQseAX9nZQNWxGxDmoYUyodvfIIwUZ0XqOtz3hnQrUE16KEaRroSR2Pac
 tzF/Dz84YcjJycv3yw+SH/Th0HHbH+K9VpLfIMDkdjZmQaMv1yiGgp1SjhnwvPMTsNaGVH1+U=
X-Proofpoint-ORIG-GUID: EOBQ2Tfsbbv0mlTv9OXdHSO1BDfAAx94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1030 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509190227
X-JNJ: AAAAAAABjQoI1GTOYZxNLTAFLe/A3b20ZKDUCJC9eTtNWwrt0CGMCJqDa8I95QkqXHtnygYshP771JWqF8/M0mTvUAXw3m2XFH4SlS7GtwzBMednVOsx8B1H7/NHC1b5EfWrRBOUgv0fb6x3ym73TQLN+ZhRYW5Sw6QeXkWvFkImHFcgwMLfsQ3pH7OhfdQDsi+n+ZT19Ogl9rijFf0hmxDKQDiucrO6m7TqyXddpq+YbZtTotXu8AVae3Gr8aAJsGaJK6BrdeFpdA5ORtm8ZybNjvvS2oOZy8WHhN/8pRzFcf+UxdUmk90bVwrLgorlp47QRJUJ0BHccB6SBv9q86P5NDeTKwIJs8r0b321iGqzNC8Cuf0A3l/0LnUH0iP9vZW/FGocYMAfnTEK2nhGw2apsX/GMOXhJS6ZB/yk1Nbuf0IOro2CfRD4x5XjAo7/qBTQ/YjzyIYn9G9Spx4R8PK9RGRrlgy2PGf91uw595OF3mv3vJTPI9Q/bbbYaC1aP8NK4q3lljZgyUhtkPMJjl68dyPv2v3OvzghtqBd84JZ4xKs3F5peg5PeVp17QHFRSj4xoffCFPgnwC62I25R9mJutf13Gu+C1rGRBzxN/KtqT1tnb9c+FKtNuEdlWI3y4JDpjB3hR1fI6Vb3srUrBo9VbEYvxXVVh1Go9jfq2cgpy6d8mBt9m/KESj3NEDUnbnCLEx/Wi0OOzIml7g0hVTVV8s=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_170628_916855_9C1FE8AA 
X-CRM114-Status: UNSURE (   9.68  )
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

Signed-off-by: Bryan Hinton <bryan@bryanhinton.com>
---
 .../arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 4f6cbb491287..1d2c3a21019c 100644
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
+	current-speed = <115200>; /* 0x1c200 */
+};
-- 
2.51.0


