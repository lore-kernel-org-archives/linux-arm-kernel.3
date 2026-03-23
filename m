Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2E7EC01AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-id:
	Content-transfer-encoding:Content-type:MIME-version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QqcNY84HU56C92q/VUNsNqUbrdG+Xf4zqhVnZIVoFdA=; b=Rhno2wQZ/NtjISZLdEA4NSrbj7
	dwjwjSyqtUaODo1JwAWq3Uj1zhMKCRt3wM0JqiKw9z8ZFXsTosBukW89+eNL7FSJ5MJ0dZ+nWQivw
	FF5oW9slQBAhAZOtPF2hpAAywMmg3APuwpdQ7ECxmWdwo+AN0qSMxd/rUtgbGoTXxI7dN4Qa9QMqP
	wVYkf4X/OiGF+3zphXAtOK6RnjrtKpRbVQcHG4LPGCP3R03M17ZVrVCuePl/6uMbV1T1XhvnhzvsJ
	E+rCM2kAk48x1Lb6oKiq0rqATk4SUjLArk+UPTgwYStt5UICgtzfxXKcPtq2PPV8BdDmQj8J0jE5D
	SPBfj2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bXe-0000000GNGP-0svw;
	Mon, 23 Mar 2026 09:25:46 +0000
Received: from abi149ajj127.mrs1.oracleemaildelivery.com ([129.149.100.127])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bXa-0000000GNFe-1Lt0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pta2002-202603;
 d=pta2002.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=QqcNY84HU56C92q/VUNsNqUbrdG+Xf4zqhVnZIVoFdA=;
 b=e1yWlPVJbEnJe5IzaN9whqgkcHvWWr7kUyUfHsxlFKrHELHCCUh4otT3N4afx1hxWU8EgOX2FFVM
   JIWjKaUDNOij2eImhPH3PHvurOYRCQPMDkhdyBCRABgZJf6S10k4mW3/b3gou0uzoGCmViIM1Bn0
   pQNhvCJ4dDVOdzZiCjcmLJLSDykb2Z4NkE15YTFFYpdT9FXU1KNhyVQ7l9KqqI0x4Shjt7trDXmE
   BAAXBCF8jOMWsXl4YgALEFcrb3PqglCUtg1g78rLix8WEYrmgKXwA+M6CzrDSHVMaJfgjThlrYs7
   fveR1mwrhG8lq69lgkK1jbtWekaHEtAJH1LmMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-mrs-20211019;
 d=mrs1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=QqcNY84HU56C92q/VUNsNqUbrdG+Xf4zqhVnZIVoFdA=;
 b=RA36wbqLQZrZloUJOoKNHQw5F8lkjdaGvvndw0GQMoQXxuYQE+7Pz+DbmrMPzRB7t+gkVXWofYix
   uybtEDoQbR1RNqod+e1ykEkbooMtVdPg4PVhQxISov+oih0XgOileINS5/Xdb8H6u4GAH+ky/DkH
   4i+SpMfdktFBZUR85kWbRZDYusBVw87O5EV97vpHFHygcdFFdWVXlMFtOQv/tT/+ON4v6CJgTuob
   aGuaqFbeK3sKAoI1t+I89WXbWObnhFql8kij39Y9/UlLCEt5yR4gUptfjh+jtLWhh0M9vxnMFc7F
   /cGz5dS/OQiDYRxuUogaeS1soPTKq7jI/i1Czw==
Received: by omta-ad1-fd1-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TCC00CMYI6NJX30@omta-ad1-fd1-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com>
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Mar 2026 09:25:35 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Pedro Alves <pta2002@pta2002.com>
Date: Mon, 23 Mar 2026 09:25:33 +0000
Subject: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Content-transfer-encoding: 7bit
Message-id: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pedro Alves <pta2002@pta2002.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257934; l=2272;
 i=pta2002@pta2002.com; s=20260304; h=from:subject:message-id;
 bh=jtuJ3sDSTRydL4QDqtLQQf/RxGRON6GfNn+9/Wpf6pU=;
 b=u+oT4e3lQ1Mx0jJN9zwHOslJ4vLhPOFi3qoN3g3AHn7FFUgVyrilOyNoIzDraMN5SqUeNOFF4
 /KLBNb9KgoACNjDJsmTE0GdWftgOVYCBf2Mmox0xIMzxmltyicTF/Fg
X-Developer-Key: i=pta2002@pta2002.com; a=ed25519;
 pk=leagPTMCtYIB9nQJfoZ5+TYiuZUercAQHfGnFVTTaiQ=
Reporting-Meta: AAEZj3e2HI7KDnQhf5vUwFKE8bI//bFf2o2wX3x9dOI4xOQ0+M5dRFepE216EC/6
 CouR05T8cWH7WqfaWBvl+NownUX/HGcqxfXsi3xBWB8W3sOlSQFDUybJGtG9eAMd
 fUowKbntZLyNpgeLPx6R+0vSf7uDFTT3G/CDp0uJrE/W5pGt4lUuVYDKRJb8Vubj
 4KpHBN7TxA2ldsIZdkKubZM2AoNNkhYtir3r6BXxhqk8r0iRGFq0qRaXA9jhtT4n
 CLSEjjaWFXgS8Me4dqMeFsdYWUvkBP95VYosvqNqzZdYjjOCXCLwaqObHuMy4bHh
 kAY7xIko64NPtjEB54ENNQ6QOnmoDKbQgQqyz2MoBk7B3wKt9QWjRuZYntRXrlW8
 6+98shNiqsHefL2TmJHjEFtfoRbQWKUliuWDJ4TIPkTT2YEnokeedpL/2BQqZ7dS AzvEmM5t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_022543_792553_7EEFE802 
X-CRM114-Status: GOOD (  13.02  )
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

The Radxa Rock 5 ITX board exposes an HDMI input exactly the same way as
the Rock 5B, but this was not reflected in its DTS.

Change the rk3588-rock-5-itx to configure and enable the hdmi_receiver
and hdmi_receiver_cma nodes.

The hot-plug detection (HPD) pin keeps the hdmirx_det name rather than
the hdmirx_hpd name used in other boards since that is what matches the
official schematics (HDMIIRX_DET_L).

The configurations were confirmed to be identical on the downstream
Radxa kernel, and this has been tested to work on a Rock 5 ITX board
running kernel 6.19.3.

Signed-off-by: Pedro Alves <pta2002@pta2002.com>
---
Tested with the following commands:

v4l2-ctl --verbose -d /dev/video4 \
  --set-fmt-video=width=3840,height=2160,pixelformat='BGR3' \
  --stream-mmap=4 --stream-skip=3 --stream-count=20 \
  --stream-to=hdmiin.raw --stream-poll

ffmpeg -f rawvideo -vcodec rawvideo -s 3840x2160 -r 30 -pix_fmt bgr24 \
  -i hdmiin.raw output.mp4
---
Changes in v2:
- Updated dts spacing to match coding style
- Reverted pin naming to hdmirx_det to match schematics
  - Didn't end up changing other boards to match. There are quite a few
    others, so I'll probably send a separate patch for that.

- Link to v1: https://lore.kernel.org/r/20260304-radxa-r5-itx-hdmirx-v1-1-f77bf1f7ce03@pta2002.com
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 172aeabba72a..8e0eead7d223 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -349,6 +349,18 @@ &hdmi1_sound {
 	status = "okay";
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_det>;
+	pinctrl-names = "default";
+	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &hdptxphy1 {
 	status = "okay";
 };

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260303-radxa-r5-itx-hdmirx-f4645e64f8c3

Best regards,
-- 
Pedro Alves <pta2002@pta2002.com>


