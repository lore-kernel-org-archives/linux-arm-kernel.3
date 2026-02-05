Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3703BE91264
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 06:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNLQVJwS333GTu/8/PQDY7fNDpYW0Nbc1IadqvSGm60=; b=oJr1I0o9MgzD5dvUTzulB3CPCj
	uly/Uub27UO1rUSdpsWNdrvaGBembn8lzaYoWBcvkueGbY/J6EdefK/yQclRbyomudNjb21o2++Lp
	AKVTXjEbCAfZAl8faGRrkdwsbYSTbOYzuN7+jyUooO+dMI8OMYNOgWfS5qxkXRqZuWYzW3DTQLrHg
	s5ftwxrigW5rzRSpHyfjKe5KnXGyrPT8cWvGDRIHIDaJkYMs/TH+aNOUaNfrw+p0P8K7Et0uxlxUq
	Pa8Chd64Yvu+06CgzgY1+BbP2zXKKWrABusyw6i7Rbel43KG1CGhaFleMJj1+3T4W75mo5aPMwKn8
	x9RGYrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsTM-00000009Tbd-1hy9;
	Thu, 05 Feb 2026 06:04:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsTH-00000009TYt-3Tek;
	Thu, 05 Feb 2026 06:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A888444D9;
	Thu,  5 Feb 2026 06:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0B7CC2BC9E;
	Thu,  5 Feb 2026 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770271446;
	bh=K9kgNOGc4L3iPmFJyzHMCUZIC9BQcUrCSOJH5wVch+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QyjsQCpWlpum+Oa2bQf19iN0bkI44uSRs6c7zUyTJ2QMOix8mUqlOQDqXxYoFMkuf
	 xdcrvWvPfnzO2mlsXz6zy5URhqFZ+UHogaaoTrssaRPzj+I+/41oP/YnC6eNMtjyou
	 i+QcUGbymb2xLgRqn/5Lg/Q5ljDWDJdUK36MG4L7JURcP2cqdcmV+aHzbqXvnvwD21
	 Aekd2ZTkIoSSB5NpCTw1u1XPvgdOYS5/8Jicb1eqVo07qL2Mi+E7Wep9Nn1Y6n7vUT
	 ykTspfRYsj3rT+QzlTk3odOpe4J9iVBF88laBdmDIhWj/lhUiGdM/p6cR74wzw3DzK
	 ov00sdo8cL6uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E477CE91264;
	Thu,  5 Feb 2026 06:04:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 05 Feb 2026 06:04:03 +0000
Subject: [PATCH 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com>
In-Reply-To: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770271444; l=924;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=RCJyzHs+o1Q4QHsgBLu74Jcqi27JmqRWixOLb0GImw0=;
 b=9Zs6E0IX/6RF0qH91Qy+YIFi1spTvkqTuhVlDJ6LTfSpAEC1qth+w636k9+VtPxzWdKVcSr15
 K78SBjYk7PbDQqVGXMBv16mWgjA3aQ0VplMhzboOOKH6TQ0qU35naHc
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_220407_918079_929F1444 
X-CRM114-Status: UNSURE (   8.44  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic A9 SoCs uses the same UART controller as S4 SoCs.
There is no need for an extra compatible line in the driver,
but add A9 compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index d8ad1bb6172d..a2702319685d 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -56,6 +56,7 @@ properties:
         items:
           - enum:
               - amlogic,a4-uart
+              - amlogic,a9-uart
               - amlogic,s6-uart
               - amlogic,s7-uart
               - amlogic,s7d-uart

-- 
2.52.0



