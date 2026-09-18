Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7416DC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QoH0tIGAZoy458UC1aKy8+60rV74RRaJ88zRaksxQs=; b=hw8x5ChCiuyFqEoIAskjVntpt3
	jzM1/luHqZv7KToQ9LOLAYts0xMqESZ0kkO214Z91dn7HgRmaii+JS9BobjTMiMyOJAXDY+fySdSA
	O+9zxZmqcc9O6IVJthIgHGnC87PtJolZs6tCgg2S/dsDHAf68OZlZxxBvaltUf03jtF5t79U3BWdT
	Ljs2n1kpNk6yjmgR7usb4S7ctyXGiQCT6u8fus65yWYUj8qPphFEs2/hmGu13Fu8wKZ/gnO8lKjcG
	UacrC4uhVFiespw/ldvhwCEYXQ4VPClk4a2FtCDPV8m9Nb+YMeW2c+iQAiBTTKd+w1KnaLAesBT3X
	Q7qmeFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YRr-0000000ESWu-13ga;
	Fri, 18 Sep 2026 13:16:15 +0000
Received: from mr-2006j-snip6-2.eps.apple.com ([2a01:b747:3000:204::66] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YRc-0000000ESIx-3nqT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:16:03 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id 0FF2F1800097;
	Fri, 18 Sep 2026 13:15:54 +0000 (UTC)
X-ICL-RepId: 01a0b4a8-c6b8-78b0-8674-63efad00d692
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGBl0NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737360; x=1792329360; bh=4QoH0tIGAZoy458UC1aKy8+60rV74RRaJ88zRaksxQs=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=TkjhlDzsljxLyQgFh+1dvffg7YZXQC15fGgKjmzgPYAJaNx3/gZ07d46PLL2m24TuthVFzE8exB0HEZf2/BepnlmZU4R7oeumg1UoMH+aPwsp1TVsA4I9CVBEyCR0gawQO1aryXlVVWWCv6Hy2rJZBhhFZodPNl6dQNPRDVb8i+24uHQrp38RICmmkYHQivtG3pjabgnBp7/I6+Um+ihSq0Sp4ut7pfKOGNKF9jT/diJ6lbBBxnJ51ApNrU3UKD8qZDdNuUcIRiifjrk07zJXEaSeXC3Dpxxr91gGgD9UuhG/btAZJf+IGhuX0WhBNV/f7sdvFgMRgl53KQQtZyUqg==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id 334C81801868;
	Fri, 18 Sep 2026 13:15:51 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:09 +0200
Subject: [PATCH 04/14] arm64: dts: apple: t8112: add avd nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-4-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
In-Reply-To: <20260918-avd-v1-0-49977931f455@icloud.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Sofus Forstreuter <sofus.c@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX/6hqvSDNOEFW
 AQEC/64wOzbSZS0kZWa1QXf3JxZxCODXhIsmi7rjgEBf7Oq+cDsfeQtZ/2NXyzIWTzwpSHZzZeQ
 Zj0pt3yw6exZ4+ONqPBS8sS+fVQV4J5t7RjXIO0tejom2YyZztJAs1YLVtYUL4Rwm/Ts41DVFoa
 XCPsZ8gz2ZaLlFNzSTBfpoBCvVL0SoADZmMTQHgQH3fgoIa7llbilcaCYpvQzbynMcBU+mIKAnG
 kR3LHn9eJV/B+yojoj7l+Jam3PcG++HrLHbeZJ0JFLZnc0Qmk918vHQwNkmqDlR+dMW8aR5xsvA
 iMK2fgr2IqOUC5sUI7CZ2P8X7l2SHL/3E9DUK9DQX4wthwt/cemyLGeW/QwEok=
X-Authority-Info-Out: v=2.4 cv=YsAChoYX c=1 sm=1 tr=0 ts=6aad398e
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=i4oxPFHrzJf6BXMseXkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: v62l5HK5i1OfFYVImCLldcRTIkEegq7C
X-Proofpoint-ORIG-GUID: v62l5HK5i1OfFYVImCLldcRTIkEegq7C
X-JNJ: AAAAAAABWAgaL1HfdqKGlhoXK4fE8xcVMWmUQsM7yS1K+PUywCbSaqpKl9o6gfBrK3p/u7jr9T0GIRYNeogxFoYFHBQnoZAcsSRRN/Tw2CBetlCCl+tCh1IaFHuW8Gnkn1/+XmdHTZI7do55vM5/uJ9zjDwPVE6SSFt5UGo/2NfFJx4LZUfdKLnllYsA3SRDb2AcVB7Pyc5+oUp7hOOAnXqzC7k42eeXcj5TbAG8JcaIMVwXm4TMG32k6WRq09dtOvBZ+OHbpp2m82DvUm3CgDQ2gQovJu3n2grown0Y0ZdKugVy+OEdP1uRRWK4Hh3vY1Dl9pvOhczGrbJ6qXamVaRIP4s8G6frMrXWr8vsWpxyqXvuwPcjuHpkh9n579qpGcPiDAxClDtpjDi2/lG842aKHqB1/STEbH+/aOu46Mnt9eSHMg0qlIGwvpfVp8sHlw277lLl1O4gN/a/iewJs6DDNPWIZyV8+QUaROgZBH6Su/Bvbj4+MOGHo79KZckHzpU0Tkrj8nuNpteComMNh7uDnvNcBsattuB93vRiDPshIw8PWHluFA8cpix7rrEKQBZjVTLJJJMHy9FaptPiCEpsx+l9KbUnpNpFEcKLcvwPmXtwq+2K9TH5YzCYOyS/3bg+yCyoxiUrSooBq/ecTnmTL8eUk2LhlJO1togjsc/rwOHYhNpJ1PvfjAXtDmWHt8a5e333tjybL6rCwQUGixtDELSpzjv0FXi/nKG6w0PGuNOyYsb16on6mb6zAFufIZNtGwrmRmRxufDVaNZgLefBxE6D2hGTd9G1nWzvBU2Spf2qis7eyPVNU+6ntXkLpREm4CEKCVX4O4Eu19b5KKxP1Y4Mvdc44XDHbsdMeXQDYsFMZ6RuHpmN3zdj4JU6sINNOLk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_061600_962944_45A00173 
X-CRM114-Status: UNSURE (   8.37  )
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
 arch/arm64/boot/dts/apple/t8112.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index ec248ca052cb..83b1bc27dad7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -987,6 +987,30 @@ pinctrl_aop: pinctrl@24a820000 {
 				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		avd: avd@269080000 {
+			compatible = "apple,t8112-avd";
+			reg = <0x2 0x69080000 0x0 0x10000>,
+			      <0x2 0x69090000 0x0 0x10000>,
+			      <0x2 0x690a0000 0x0 0x4000>,
+			      <0x2 0x69100000 0x0 0x10000>;
+			reg-names = "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 668 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+			iommus = <&avd_dart 0>;
+		};
+
+		avd_dart: iommu@269010000 {
+			compatible = "apple,t8110-dart";
+			reg = <0x2 0x69010000 0x0 0x4000>;
+			#iommu-cells = <1>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 674 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&ps_avd_sys>;
+		};
+
 		ans_mbox: mbox@277408000 {
 			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
 			reg = <0x2 0x77408000 0x0 0x4000>;

-- 
2.55.0


