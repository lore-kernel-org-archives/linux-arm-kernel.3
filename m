Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B949C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbT/VBy8/jyTVyfcMlrMZ1rcuYWd/SqJbq1DiU5dIYQ=; b=q5EsM/N053Wqq3HK7ASxh53Hyz
	Kv7px5hS/8jOsJUi617If65UYpS/4wHi2LfYur7R6sfvjObwcmMjZiICCi/TboAw1m59sAKE7uqUD
	xxnwHCz/r8umdS8NO6xw9Ao9lutaL4x43BOazbyz87/9XWPvhEMSRe8cNjDNY7bUdW+OZIXg3XH1j
	++OjWKxT/+zcGE3cZHTIZfEFmMwn+LB/AOWhOW4+DhFoNemMb7qH3UC3TIrAnrIx4ETJhspV98PGU
	1xQbNutoZ/VTCdV1cR2vVpOXhr8uPUURRze5z85vySOxyRzzxK3SbrU91r9jCDHliCBztaSh3Ykdl
	P2yQHamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRqg-0000000AlCa-3qZN;
	Thu, 30 Jul 2026 14:35:02 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRqd-0000000AlB5-2g6f;
	Thu, 30 Jul 2026 14:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785422097; bh=YbT/VBy8/jyTVyfcMlrMZ1rcuYWd/SqJbq1DiU5dIYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Wphgl1a6iPqW8jaXPjQINjI8VPIoDXywirAvj4L2MXD1PyLNA3zX/ki1pjeA1mqRR
	 yalruNkiO47hKXjAJOnFzr1xO/2eBVwhn+iQ+UWuINYH0L4wun6rQgMQQBJLoCGItx
	 lmwPpxlNms97ZSW9CCaUof5ojpihLVyL5ctK9xuI=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 8B38245A; Thu, 30 Jul 2026 22:34:51 +0800
X-QQ-mid: xmsmtpt1785422093tylrip7vf
Message-ID: <tencent_AE1A1199FC8C9ADC680C6458134A46B40309@qq.com>
X-QQ-XMAILINFO: MC6m07AaSFhrvwmDTwhytxEJhh9nxDyjG7kdMzLWFRkZI5yPgzPYsP8xckGLFj
	 5pHd/omhx2VtQrCp3o970+DnHWr5CHS/jvErnPaGxxOCa8gDxp99d1KX/FDOEZR2Gx7SM0fDq6Q+
	 vR1iBzwq1ahtr1oCDKJ/yXipYb5fbmDeVeM8ns56KN/kpHRfhbl8BEJUNMVuuVXcy8uIxiXQQtR/
	 QNTruEuS8jlyhiNq0NBo5LndRYOyheuHvgFAv45Dnr1m6YHoFHP0IqeE0n5tnCWO/8TJRKlr6UuA
	 TZXsu6zseoiWEa3YXvLlSJ0VtKTUpaCH/S2NP8EWDVYHJkgQqiqvVUAiZocY4XbyYNLFLrb7335p
	 9uniLOQMzoIpe1iDUfyh7n1oJLU3yWFUld1dHJ0hrtuyitiO7j9f9OJBQSa/+qaMbSH4djPr+dBL
	 PyKplCDYqtdjwORfeYWlqs2PAll16+JFMgN8IkvOGpySAkMjVEaYiIjqdYcS9wNj9KI0NidgUDZm
	 jrjoviR0elcfd+bXskzUjDzBD7qygKXcZOBEW3QaZalC42Uf2D0vLttZYVCG7m79IcsLKTEvui3m
	 3VpZ/2cfZnT+3sT01E9kUYXah7DQtg+UXqFNPIy+G962tf2Xm3cwMGjZ9wjhrOCNdBMohOx02Eow
	 DyMn8ISuYkIerKfvdfH2KG4ynPn9zOmNhd2bMEAsShBglfaz608FsxBASjRJP9GLxvv4lLNpBA6I
	 Z1ZG7SXRr8i7m6XLAjQ3KnaSWOhGiTKlQhKFXdhha4aBLrUZhptE2S5+5mP2GDWnm6dPkepF/2Rw
	 RIFngKgaeQOa/nxnvLZrisMcWZwoTSLwEbYjVdSmoR66P/LZkPd1tJFkkpOKksm9IuX/C+5Y0dzV
	 vzFaWSwRAfz6/BNkpi/gIDzNt7IO6Wvzi5emNuhd/0jkSgQouxs0i1K29oxZpMc4dFII+i4RBb/r
	 XHI1YP8esNffUh8q/BTBKM2gTOA8f3EYLKFDLJvw4xwfw+/2eVbeuSDQjv6ACrDGjw9VN03adRhj
	 YSsw1a11IWEf/qY8vg5bHDUGArLciMOG4WmvkLCyaZ2YuARt1E2R0q6fGY1nNvtlaKzmfrC0tNBa
	 T9GJpJ/5gRgpHJIOTDDVz/qjUpAz30h0xDohhqYlo67idKLxayL+obCXLht/6o1poKTCgpvGLgG3
	 Y0qMI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 22:34:02 +0800
Subject: [PATCH v6 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v6-1-dfb63e234775@qq.com>
References: <20260730-master-v6-0-dfb63e234775@qq.com>
In-Reply-To: <20260730-master-v6-0-dfb63e234775@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_073500_009155_A729195B 
X-CRM114-Status: GOOD (  12.25  )
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

RK3588 integrates a Rockchip CAN-FD controller variant that is not
fully compatible with RK3568v2. The RX FIFO count register field is
encoded in bits 7:5 on RK3588, while RK3568v2 uses bits 6:4.

Add a dedicated rockchip,rk3588-canfd compatible to describe this
variant. Do not use rockchip,rk3568v2-canfd as a fallback, because that
would describe a register layout that does not match the hardware.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
v3 -> v4:
- Collect Krzysztof's Acked-by tag.
v2 -> v3:
- Move the Changelog below ---
- Collect Heiko's Reviewed-by tag
v1 -> v2:
- Use enum for the single-compatible entries, as suggested by Krzysztof.
- Reword the commit message to explain the hardware difference instead
  of referring to Linux driver match data.
---
 .../devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
index a077c0330013..81e2b6dfeb02 100644
--- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
@@ -16,7 +16,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: rockchip,rk3568v2-canfd
+      - enum:
+          - rockchip,rk3568v2-canfd
+          - rockchip,rk3588-canfd
       - items:
           - const: rockchip,rk3568v3-canfd
           - const: rockchip,rk3568v2-canfd

-- 
2.34.1


