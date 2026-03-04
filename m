Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D57EF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-id:
	Content-transfer-encoding:Content-type:MIME-version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f8nmjH0o71gVTcBoCc9bpsGh59DT0B52MUM4FwYNG4o=; b=Vk29oLMBpEIws52dIEV8d4e2gV
	lzB4enXCdG6SgWV/1ttFNTqV3WuuJDgKCC5NP3rPmdsGKImNaN/edRl8tK8U/tJvqRqoFV8rz8OZD
	SHSXOt8ALVCQTRQofSQAd5647L4OPATlsEneaZepxtHrVFfMe6UpYtizQ22AGtTyd32ZnOQ4nk3AO
	ZLDstUhbGzi4u+DJm+8cpZPnIzTEvOwKCgkcbp8umj7YLLDNNyBdXBKTnCbIZYpHTJl6/AfW5dVTW
	VQXxRUVTYEO7p4Kp0nGZm4oT5WR1/mn8zTohZnDswvMR1MyRF24Xe4V7GNkhC1GOUI+bywCX2Vf9O
	ezrr5J8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmlc-0000000HI5c-3Nk0;
	Wed, 04 Mar 2026 14:00:00 +0000
Received: from abi149ajj127.mrs1.oracleemaildelivery.com ([129.149.100.127])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmla-0000000HI4m-3y4S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pta2002-202603;
 d=pta2002.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=f8nmjH0o71gVTcBoCc9bpsGh59DT0B52MUM4FwYNG4o=;
 b=OA8DU6AtohmlOw/mcXIdpgudx2jwgOEA7wEmE44/fYQHTz6Dt88CApv4qZRPruZNJT41HbCjHzdW
   nhBW2jjj/xlO0G1MktSzk0VpYMZVsHiaToNf8T0FYg4aQ/Cb9DO5fizsOAswb9F7KaldtzXe1qJP
   8/Rcd7ckPZJ3NB0CPfiacWS4aORND6yBB4T7fFZJXpaXqRchOdpde4ti4caa3UNkPVoKvmDA0id6
   64rpSvEPEDrZtdLQkzJGfUT4WAWsi1//PUJCTdnjSD6EO9WPzCSt0/CWXR8vlwZvgE0zI4qzPJdW
   N8WmIcfnBXhHPZ/G8xhtnrWpPVhh6rXwMWKzug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-mrs-20211019;
 d=mrs1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=f8nmjH0o71gVTcBoCc9bpsGh59DT0B52MUM4FwYNG4o=;
 b=uZkkm/GulRaliAmZBAIghrWi+8FSRp+PZ51lBvX+C+n7YX5IJb28NSF4zwahkM/QxMVT0hKn5FvZ
   fcmOxDHuF0oxSCc3yRzAckwq88TH9Hk/MC50RAqKydEgob5TbR+AELUlYZMmneFiFM3nM0z4so3L
   uPVmTn0GXbDHRZo0+/oLcjtJlONermkYZdrZfsULAQGHMRbJWtw5ET0yR2V6lDmu7spAxFrbcVO/
   9USQVMgFRhyn60cqjxWceYoCAD8+r2thpMzt1kps0V6XcodYTAjTFW4dPzipQtpvOaf2SolGmHPR
   7VsdF3bymYUR2m4Ugewi17auQVVOK5SGrNqh0g==
Received: by omta-ad1-fd1-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TBD003O3NZA0MA0@omta-ad1-fd1-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com>
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Mar 2026 13:54:46 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Pedro Alves <pta2002@pta2002.com>
Date: Wed, 04 Mar 2026 13:54:45 +0000
Subject: [PATCH] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Content-transfer-encoding: 7bit
Message-id: <20260304-radxa-r5-itx-hdmirx-v1-1-f77bf1f7ce03@pta2002.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pedro Alves <pta2002@pta2002.com>
X-Mailer: b4 0.14.3
X-B4-Tracking: v=1; b=H4sIAKQ5qGkC/x3MSQqAMAxA0atI1gaqHRCvIi6KTW0WDqQiBfHuF
 pdv8f8DmYQpw9g8IHRz5mOv6NoGluT3lZBDNfSqd0orjeJD8SgW+SqYwsZSMBpnLDkTh0VDLU+
 hyOW/TvP7fnnBuFVlAAAA
X-Change-ID: 20260303-radxa-r5-itx-hdmirx-f4645e64f8c3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772632485; l=2284;
 i=pta2002@pta2002.com; s=20260304; h=from:subject:message-id;
 bh=a20VMlDpaLH9AXgrhdHoV4Pssvg7BkUbHXan6awwzQ8=;
 b=T4+sgz4tWkB8i0u16hTDGjXuLsMdrYYl15JeSAdNb40ze7ydGmZe+dJlrjHy11G8r2aDvoAc4
 FfEVkl+3sLQB8E2pj3XSkQVo40wODZC7G/oYYxB7dVSAMTzUJNzTgrJ
X-Developer-Key: i=pta2002@pta2002.com; a=ed25519;
 pk=leagPTMCtYIB9nQJfoZ5+TYiuZUercAQHfGnFVTTaiQ=
Reporting-Meta: AAFw+0CP0PnaoJ46S1wWgOjfMw4kceiZ7uqB5ClL97jTJ2qLoufiwQIhvJ3NQU+T
 V33OC6+yp86+syDj7IVM2dZaJCEsMkOjKhlJVWqXdu1yZHaX5YUw4EJxJWd+9pk2
 dRn1bXwCStWQU+tMUPQS0HTHiHQuUPPlWidDTjg8sB+cJaJblPmXgKOXMrCcQx+l
 SlRpS3qo2ioBWmc6hFf1Qjv4gxVY1+H7FZ5Wv1k1gCHjspGCdQnah4r1ZA9hTZGQ
 i+rOHkskRllar28Ev44d2WrH81OjjV7Ic7k1zXPicvitY2xIXEKMQKTvTtr83wXE
 sML1gmcSBgSC88b4GPQqOMkrK5X3QCZ23QSgmT/GlEDs8HYUxvzMY2FqOFJeQqOZ
 jYhaTJ6AVXmhD+SwzcsmqlOvrX+wSj7ualPewlbsCpAI0zLgWqPpgmEUrJY0178E nJ0NiEqA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_055959_002401_C93DE9E3 
X-CRM114-Status: GOOD (  13.43  )
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

One of the existing pinctrl labels, hdmirx_det, was renamed into
hdmirx_hpd to match the other boards. The _det name seems to have come
from the downstream kernel sources, where the other boards also have
that name. Changing it to hdmirx_hpd in order to be consistent with the
other rk3588 boards in the kernel.

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
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 172aeabba72a..9f4f31d1ca94 100644
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
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+
+	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdptxphy1 {
 	status = "okay";
 };
@@ -746,7 +758,7 @@ vbus5v0_typec_en: vbus5v0-typec-en {
 	};
 
 	hdmirx {
-		hdmirx_det: hdmirx-det {
+		hdmirx_hpd: hdmirx-5v-detection {
 			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260303-radxa-r5-itx-hdmirx-f4645e64f8c3

Best regards,
-- 
Pedro Alves <pta2002@pta2002.com>


