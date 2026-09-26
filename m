Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D03C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 13:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uM8lK9QHZOmgqHcjsGjt4gycxhVr4FZYZfCwcTDATwM=; b=AJKkv1XutDinYz7eB9Zzv9Jcl8
	5pSA8hNR3LjLUpMZ8fd5qks4509cc3wHJTaitGO2c2K2uxKCWVzuY+J/RqG/4+t1ghSqCLwtuU+AN
	mjv0Jbqr1X9HyoaFMv/D9UT5Tajk2YSgwOyk6ll0AgYxCKveEyTPAk4pQfoHHjF76NkiDiFpCfm4i
	Ezj2yaP2wZO/RVxe2uZRKPJTIguNWMi7NsejkaOf66D5Pj/a/3T1qYQlfD80bg0MGMTu0LOG4lCp2
	p7tBy7Q95cXqYoP1SZT637t/DTjHZWb7abZ5QJHWamtGE02A0q4WPpzXajrqxueSYy8FGcd7luow1
	4Y8jI1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASHV-0000000FRAN-1H8Q;
	Sat, 26 Sep 2026 13:17:33 +0000
Received: from mr-2001c-snip6-11.eps.apple.com ([2a01:b747:3000:200::1f] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASGi-0000000FQWk-2aPw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 13:16:49 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 9E341180056D;
	Sat, 26 Sep 2026 13:16:40 +0000 (UTC)
X-ICL-RepId: 01a0dddc-58ff-7a80-b634-1c4c7f20929a
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QFXR8RTxweGwVGA0MUHVAIVQ4EEQpOB1VSK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428604; x=1793020604; bh=uM8lK9QHZOmgqHcjsGjt4gycxhVr4FZYZfCwcTDATwM=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=xA0wvA66wNeaHqEsM5Vr9kOWyfCTbhWnLrWGT/sTj86O2a+6wpkA0bBE38MlRnV3QQIgqGnuQEXEnKe9YYAEuWW/UlozqLzDXhYIlS+cBg3yQkZj20fI0G+TSOuh11PfZHyfkbuSlijJbuSU78ubRZk6a3rhydDvHT4ZLBLrV0nbKOVtKky1licG+OP8EHyJ9SUHAdAUe/BCOMbt0yKvh4+H5xV48pshT96BoeRhe98VieF67/heK91cXc5KB8ryXZpJUL/mhwgM0ho3pLjMZaacDYgbpEb0dTiFM0Jf8Lo2jjkwrQ+yrht26LNuxi54ANNlaYTTeBrywDIAndAAAg==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id 642A118019D0;
	Sat, 26 Sep 2026 13:16:37 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:52 +0200
Subject: [PATCH v2 13/17] arm64: dts: apple: t8122: add avd nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-13-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: wchUSShTQnpjCCMzhMpkRvNmOXTMa2dp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX0PSdUmlQNOqh
 aTb6nzoOtpuM1ErnbSH6Y7Ppprkkgz0BaxW832qgiyxVEgnnTpjiV4PnIwduK+/AGDq+GxF33jY
 4UaW8zk59dhlt58OVGLS/dGMa7pOA06ei5WmYhMMw3J51r8LKBe4dtww0HWrUpryY+gfNB15URC
 8ATPklWOBQpjlq/0Rxp/75ZRq80iqrutI6NUcjsZ4i2nM46Il+En9mJVYh25nM+iLCD30jNbjEV
 zog1dDZFBtzzlnpUtm5+NLYtaJ6jQhSrU7StVFpfVmJcC3KQokWHD4laVtiTflYobfWAZKVIhJy
 erGwqmqlx4PEYpfES+LnalN+trWHiy0VntI9WzBfWSBmmKKspaRJs6z7nN/2Po=
X-Proofpoint-GUID: wchUSShTQnpjCCMzhMpkRvNmOXTMa2dp
X-Authority-Info-Out: v=2.4 cv=Vbn6/Vp9 c=1 sm=1 tr=0 ts=6ab7c5b9
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=rETEL0j7aIRCupOTUFwA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABqRY8QLEStsnc7Ub1A5R1K2q2/7rJnaA9otZnvtjtszo6EtsjUx28wiZ4BodV+t6LABY74VSpnf2g5YoHDJhkkhzpWHp8bT9/WRoXrztff9XL3bPGWeX/Vyu55Me0PnrUAG8UWq4lTmy2ANNj2kaLdfMgkilxrHrtTnVP7cN95pyJfga5eBQ7Rmd+VI57d9VXWw+qKfD/hRt9zKYoNIuju6XVX8p9ov+NqSgfwRUbLeoBw/3CvnYCCFCDVnJ1ltCC0uz4A7RfCSmJ4Ea930DZ1C8QTsujvFP6maKK8Ya9y0hBgIG8SKhTu+UmezzHqaynufgNf6IK0Wc4+AIASulg+FQoiEaCrIbPGQBoqYDJ55ngWfhDRn5m8ZAQMkR3hA54LQNVpjVX3pJwZWUIMi6/f2qkEEvA//E1J80EAKOaP1EYym40ZdWTvtPrbL97nmGsr2rcnwDY1L6wHl1tQ6HsSfoCQmfHw4xT3LOfnp1tElvZwajYSvJO6yMXj58nk/Og5Zsq0DE1d0XAbVcgbq1HTGCVClHlbDE2uRyto3bRkQ8RdZMlF6UcNGQzj2Qum6jVb1erJBmJI2rK/+SWzKcOAJccgIsHrsT1SS160cI3J1cVwPuZNmu/ZFR6WheUqAXs2d0/Ny080AlArWGcF+faynfHzccKZIxdls45nssV0s7A5nPGgt2oDXkKYOBFyPcG02PKC25dk+xJRl5s6rPwYfMHtmVXM92aPDBJ0XzfHrMmvyYy2voH2BQ+odUfV2JturrUlTatbAfGoolX8hmAGOY9XZM1xbOEhq43aRvrGvM6xMCV4Dp8368bQle8Pjy3CHbeWUWlGbS8fVvzm9Cpx5ASCmZdq6XehvLjYCbeqLVHG82iAKiPISwSHo+i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_061644_722627_AAF0FFDC 
X-CRM114-Status: UNSURE (   8.21  )
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

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 1ee61c5b3409..25e47755e095 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -186,6 +186,38 @@ soc {
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
 
+		avd_dart: iommu@289010000 {
+			compatible = "apple,t8122-dart", "apple,t8110-dart";
+			reg = <0x2 0x89010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 686 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@289070000 {
+			compatible = "apple,t8122-avd";
+			reg = <0x2 0x89070000 0x0 0x4000>,
+			      <0x2 0x89080000 0x0 0x10000>,
+			      <0x2 0x89090000 0x0 0x14000>,
+			      <0x2 0x890a4000 0x0 0x4000>,
+			      <0x2 0x89100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 685 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		i2c0: i2c@2a1010000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa1010000 0x0 0x4000>;

-- 
2.55.0


