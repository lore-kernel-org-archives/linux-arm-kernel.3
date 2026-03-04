Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06315EFCE49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-id:
	Content-transfer-encoding:Content-type:MIME-version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QqcNY84HU56C92q/VUNsNqUbrdG+Xf4zqhVnZIVoFdA=; b=FsX1mQZWN5Q4ZNvWJuBvi9Cbes
	pGw+ef1HkvD2fmneJ06VD/SlErxsPDSMA0D56VOU0aa+gzOVxz2KbXfMGQg0vcnZzvhaLXrFydEa3
	0E2NeVL0TkjmlGAqGgkWWeBX0seA0bLU710E80yl7EHyYVCfvENZ8n+81gi4+RAKz/91I3QRaEgZ1
	pT5czteeVD/RCadINBQTHOieXg4wpJ1bW8ZRgZepz/wtaKtjNW32bydPu70eWL4j8nRW8medfEnuT
	WMJiJq4G/jEeb4uNlfSJiqCs85EBYd95NulLzRC8KVOXTdARaN0MJs6iaZILI2SbD8pm/Om1o8pfb
	3clxM4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxt5N-00000000TCW-2rTg;
	Wed, 04 Mar 2026 20:44:49 +0000
Received: from abi149ajj126.mrs1.oracleemaildelivery.com ([129.149.100.126])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxt5J-00000000TBU-1aKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 20:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pta2002-202603;
 d=pta2002.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=QqcNY84HU56C92q/VUNsNqUbrdG+Xf4zqhVnZIVoFdA=;
 b=uxKSbOJSH4ml53K2c9ZzxD4Gs7UFk/F1g+JgcmWat9UzkDdqpn1tQvusDg6djD4RWJM73Qjll5B1
   /HQQOI8uyG92dlXdDw20eZ0x+jg5WL79KSk1pnDbI/L2L5cUbYCoPzyyyhNMgSnqYpdBYpWsTqLu
   0ervyjydyDYUR4YV6M6k6T4KvDyrj8fXAfiLum9awE0uEh10MOXurBaGn5SmG6CM3aBtpRzxG2JU
   T2K5HnKiSEgSzAeNnFMZJz5j4e29jWwHERNUq/lBCKSs53H1IBxMQJl1iOvUa+cGnk8DHeExXXsk
   2veSzONW34Nd01b/dK5Gvh9S8ghQPNBJLget+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-mrs-20211019;
 d=mrs1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=QqcNY84HU56C92q/VUNsNqUbrdG+Xf4zqhVnZIVoFdA=;
 b=LxFaNA+mE6eYqHTVVZXoVXxxRVD7IVyy/BrBEylT+j9i8XagZ3RaKlf5WT2f/lExbt7Qmh663zRM
   NzSm//yvMpUX1XAZ4Ge2ZOlMOCWj3/D7dC6bvgagmxDgtKnoiawKTb9JKz/Ota5t5/cp/F63hqDq
   bGO0Bz4bnXg+5O+oZLFfXujQF9Gp4+kcXVaJJN0diGGPy+Wy1bzcRmnI5/oKxb+DrRSBl8fSzSwG
   I5Zc6QXuoIe3gRSaU4J/1SAzyzld3wXfFIGC+s1PZjm87R0ziEl2NnJR9z5TvGdAmFO7AtwceUVn
   zqEubjEoKjAzOaJplKt5plfr9KVeN0T0sZx1nA==
Received: by omta-ad1-fd2-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TBE005RN6YGP0D0@omta-ad1-fd2-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com>
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Mar 2026 20:44:40 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Pedro Alves <pta2002@pta2002.com>
Date: Wed, 04 Mar 2026 20:44:39 +0000
Subject: [PATCH v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Content-transfer-encoding: 7bit
Message-id: <20260304-radxa-r5-itx-hdmirx-v2-1-6567e9e3298b@pta2002.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pedro Alves <pta2002@pta2002.com>
X-Mailer: b4 0.14.3
X-B4-Tracking: v=1; b=H4sIALaZqGkC/22Nyw6CMBBFf4XM2jF9AcaV/2FY1DKVWQBmSkgN4
 d+tJO5cnpPcczdIJEwJrtUGQisnnqcC5lRBGPz0JOS+MBhlGmWVRfF99ig18pJx6EeWjNE1rqb
 GxUuwUJYvocj5qN67wgOnZZb3cbLqr/313N/eqlFjbNtH1LENpOzttXijlDmHeYRu3/cPbRHbm
 bgAAAA=
X-Change-ID: 20260303-radxa-r5-itx-hdmirx-f4645e64f8c3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772657079; l=2272;
 i=pta2002@pta2002.com; s=20260304; h=from:subject:message-id;
 bh=jtuJ3sDSTRydL4QDqtLQQf/RxGRON6GfNn+9/Wpf6pU=;
 b=bWuzjkfSGwG38Yb0np1TmOduH+RX+yiRB5PsCDCZPQ7ZVeJZVfkgc9Pks/HDmhjHLh9cWSGD0
 FwK1SVJ5rDqCblHoWkVIPpIFTHLZz3et+1xZTUIOQe6nsriCIqE6xVL
X-Developer-Key: i=pta2002@pta2002.com; a=ed25519;
 pk=leagPTMCtYIB9nQJfoZ5+TYiuZUercAQHfGnFVTTaiQ=
Reporting-Meta: AAHDjmJjvCZUCcZYIX7JF0y6IfTTYzSwJJDp0tXSTosAK1Fg2saYxHqqtPk2U2cu
 1AADq0lNRLQvx62sAxrOipYGlv9v6DU8CbOW6dKznx7eYLQcbQ2Cult0edQqTYVG
 U7qaGDDhA8WITAxjhCChkb3TWM/DlYJ5y+xrGYqtl1DTOyv6W4GZmoud6psDRbaU
 BXs1BS9lwOaWhx/SGl/tzBl0pSpX/oT46MRMRFjNgkLBypzMIK5gcbsbqxe6fUJP
 QxVdTPfp+H3APfNK/8MF/UsBGg5Kp6lOfxzqGu4h4tGqfmgP+riYXIkmsGTjPwRJ
 A3C8vJM0oq99zcyFz9UHeb7hcJz9gR6DqrWDLHAfpX+gs0Lf8nBNYQKn2lIeNiQG
 MQ++BEcHVg2pHeYxcGsJVUrmjLTxmv6skpwlr29A4A7S0Y6uP3612DwW1EOzAqje jc5C24Cfzw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_124446_811029_05ACC347 
X-CRM114-Status: GOOD (  13.63  )
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


