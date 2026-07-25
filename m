Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D81C53209
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 07:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vz7yzuowqwsGsfyfQvMihkNn4ZFIprdXXMLcR6PYob8=; b=d2VNVuZzel3YzflIC6MraasN4G
	qemceRqJ0l6+eLNg480JDjD3dfY6aQuAl3SMUb8lVPdtdHaF0n3/hxjPA7viwBCnvHba958HnU7Wo
	TDeMR/+uvPuEXgPsSCxjVUrUiNx0T46SQv0EEQWH0Bt81WzzYXvL86S51xhtrRe/5nbJ6pA+whFf0
	iZ9/maqM0LhwrT42Zc27jvoltSZI1uud8V3p3THhhcj2uRmk9mfsolltWynU3P4vWqg25ZMozhUQG
	Y+5WYvcSGv6P04icM+6CIDuI9YfcGjcogHXmNziWmwxwRfJopZ+4jhz3jy8GqsFzbXhH1xBcfo9qE
	xYRsRFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWTF-0000000089X-2ekG;
	Sat, 25 Jul 2026 07:06:53 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWT2-0000000082s-2cPk;
	Sat, 25 Jul 2026 07:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784963191; bh=Vz7yzuowqwsGsfyfQvMihkNn4ZFIprdXXMLcR6PYob8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nBM5G76EomdYu6Mtfaa1Bg+4j5FbbUhAGzMY2LgEjJMQuyE56jgLq2W0NAzLzwVZg
	 SgDU5Xa4nx/w2SqTVaAtI/COZvcDu6LseDm8FflNXcOSeo11mZIYv26kK3nhyicsNq
	 KacebA7SMSx1ovVYa6l68WPemxyArme74VfRgiZM=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 19989659; Sat, 25 Jul 2026 15:06:25 +0800
X-QQ-mid: xmsmtpt1784963188t0x0rjvih
Message-ID: <tencent_76C8BC251C8C3C068C23BAF859351DD3300A@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Jue+F2vLrGacXGOKYvYWpO/RUL+wYGsTf9uoi7RscE/8TTfquBm2
	 vySwgYzgaR2oSCHZ6b2EkQdw1AsaUJv7hwj/PVw25xNkQ42W/C90hKpHj0eW5QmmO3fFTiWu/Ddz
	 xAJaukWp5J4UtF7go9HnWgi2oFwpOZE0wAihCXYdPc3dHRitJQGIaJ1MRWnKUQpKnZp1+IvFGaZ6
	 VHQpIeaBODL5FO/MDOf7S4A8avPl04TrJXhGgkVKiG5zoOo3wb6oHk9JDSc9/ZFb+RwQqEcVq1n3
	 eQW9iq50zlUUSdqfbf69GOeAeHnV7r7MahllGHb5+tQ58Gasr5Kfz1J1M7JmmwqvZwTxH/ESFHTj
	 /SPF9zm0HHXd+h/hHoWw5oDQ8x9Ha0jVwWMcJCH2QcdcWkZHjmgAqjXTzFzYPRRQKCrGy26MJUj9
	 gfmtmquyIg+P/sRuf1iIDtIGV34fcCvlL7kjxaqkHWq17V3mm3lcE52gh86UzuXvtyrR5tqC0vlb
	 pe52R5KGhgz3IZMoNeICC7zihGldGARJNmUtVCMvfEHwUPAJViGKgebb7y8tCB/tZf4P7tlE4W6o
	 SlO69PBFux5sqCZutf8J5jHgqC9VaovsBJ2q2KoCPs18eAP2NvQuBD/STEhzqL8/ITLJygM/KC9F
	 OtdXhGFU0y6UFH5Vm3dC+TyP5q1E3waIGhlvESHrVPz9Snw8yplCtG7M13XaLv+YGRpSMF5qSXy4
	 MlPYV144tZcQfp92GRhue/dSlLRlTKKXeymBp1Jgb8g5wj/21F8dttx8xLRqHKPmOd8lIfDxVZE+
	 XsDu2DgluVZnfdU1lyWBmDdV5K6zMVk3E9zV0X7qG1XzifWnJhH/TzchcG5iF5T0J+ktVW/J1rzq
	 qiRyBxLYQeejM703DPFtvaGwoSy26DVLFy1toxVr9OvjBA7F2aTJQ6tu+MsrOZzYO2HU6K/H08Fr
	 jM4QrFv+ShjN1d4YRSPAA0B2iepLkYe9l/JRgYKsZLBZJs3TGryqR9UQqeyy4kU5gIRSpwp4BF2D
	 0ZscVtRhj80OXAA4FnFklKXtlzzWNn3EWfvAea+ZmRoAj2MLF2KsvDOH4UFhMqCZhfTeGSrrKTay
	 cgdVFlv9Tetdc5knVzH0wu/1sTibZDpdUSktgvmbAQl4t0c2psis+fXRu5yaa9IBYT28qyR07jAq
	 t25sBvS/8b8bs6fg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Cunhao Lu <1579567540@qq.com>
Date: Sat, 25 Jul 2026 15:03:31 +0800
Subject: [PATCH v5 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260725-master-v5-1-75da459d2b93@qq.com>
References: <20260725-master-v5-0-75da459d2b93@qq.com>
In-Reply-To: <20260725-master-v5-0-75da459d2b93@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Cunhao Lu <1579567540@qq.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_000641_017823_E4DF6999 
X-CRM114-Status: GOOD (  12.11  )
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

Signed-off-by: Cunhao Lu <1579567540@qq.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


