Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91896CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/9yrQNlZX/aPm42B7Q/aMWdWKGIBZ/4yvQO3L7Tasbs=; b=saBAq1KqJHdQeG
	f1XHlQXQ1riDkTKuCUQ7O6P6/5IHN0iB+1upzPEQi3WfMKKd9nO2EJQIHwZijrk1C8q+0vtf1PGeN
	S5sfkdQq7Ufyy8PfQuVG9SOAEL4ICsXsB3YYeZPx/opRn7I3HmqXqbSWGx01Etz01EkQvAtjiOzwU
	nZmAZsC4h592FCViv2Z7cFIoQzWjOtYmh3XkRwgYagLe9Rp3ZHV31Jq63S/bMtc9KPoAtJMM5NDwe
	j6AICGh6E3Pc8HYJTegnY5w+jagCg4ddK1V45axHfI9vRn/uQzftoBcaGy04Nt+NRetZkNiCLsiNg
	4JCEmjjreDt5CeJYvG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOk0-0000000D28S-05ko;
	Tue, 02 Jun 2026 13:01:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOjx-0000000D26u-0K6H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:01:06 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CBBF103F;
	Tue,  2 Jun 2026 15:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780405236;
	bh=vHZE41Hi0DXKwAAFsQPc+iizs789zAoAVPwori0iZoI=;
	h=From:Subject:Date:To:Cc:From;
	b=MmZK3eNC8qnA+O3b2hMxbcNSXmEp17G15SQT8k8cD43zVmBx8w9sRTkxvxU7xuoTb
	 fK4+dDBvn3mn3dGKyhHa2lfS+OiDxQwDaxGWVc/THzbNakEAnHG7Mlhe39vKLHkBAR
	 c8c6/WV1E8nsjoeJAVNBfdGnsk6xSs5tu0WT6Fqs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/4] arm64: dts: ti: BeagleY-AI camera overlays
Date: Tue, 02 Jun 2026 18:29:26 +0530
Message-Id: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ7CIBCF4as0sxYDtKC48h7GxUCnLYkWA4bYN
 L27tCsTdfm/ZL6ZIVH0lOBUzRAp++TDWKLeVeAGHHtivi0NkkvNlWiYJexvNDGHd4qYmBSONJo
 jHjoB5eoRqfOvTbxcSw8+PUOctgdZrOt/KwvGmXK14twqbGp99i1hCqMNGNu9C3dYySw/GfXNy
 MJ0Gp3V2hlj1A9mWZY3ZhvG0vwAAAA=
X-Change-ID: 20260514-beagley-cameras-21ce6a98a7f1
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=vHZE41Hi0DXKwAAFsQPc+iizs789zAoAVPwori0iZoI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqHtQB7zMV75HjI1Bis3vQuVe/k9EFMiZgBMS8B
 +2MHrglKI+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCah7UAQAKCRBD3pH5JJpx
 RaXwEACjwBzsxAK5oRlp6x6OK8HCcduSchHYZ5CYb01CbX7yHGWRk0OvqUZ508QselV8Qukq12g
 P2k8VczKSy6qXAocK4xcSXwGKWF3MBD2hj9aTpZglg3JT9yilM15luKMX53dVK1pD8EUp4Arqx3
 dEucsNhIedC44iNWeUUS+o3KLxMX+pAA4d8jdjuii20pDvkHd22i0KQKdD7qor2am6DDFZdqMUI
 nvNM+ln5IinNmVQKB32XzRlAKaJwoTBU17Urj32iWduvqkrosqNMnk/d5lX42stAwp5N8D2vXof
 UADNO4888nFGR0opYN7SZ1JixHKGj4xX01kcoL+/TIApHTEfKhOueYKXKGp+BzAH0scrnOkTvCO
 Z9zBRPM6Lr9Ngyu3ETUR7exPfVoDs8jaVVrWTC44gj2Ejamy7tP8F2rTlkfwbct8HViHwi5Kd8Y
 jJJbR8Xqz5UdVJxD81d+BQiyRn2SQ11SQi7JntNPcdqRR5LsCGXTnDjLnn4KJ0+dEaYI445aQyz
 VmRH9qSXm+r4uyj0YR637OhwJ1w5Ea7WRiyL34tpw/QV8cBWFD79NNNQbmJ1ejRyhCcLsKxX0cf
 /ccCK0Ein1BhWTtrQnclhRnIcdkWN4pnb31kpSrXG+TF2U25vHI60wq38dEvQsShflC6T6hYglR
 Zhr+gfVGGfiWClw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_060105_275016_B2A94341 
X-CRM114-Status: UNSURE (   8.77  )
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

This series adds support for using RPi V2 camera module through the
22-pin CSI connectors present on BeagleY-AI.

The first two patches add support for I2C-2 (used by CSI0) and setup the
DSI0/CSI1 mux (used by CSI1) in the board devicetree.

Next two patches add two DT overlays, for CSI0 and CSI1 respectively.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Add disabled nodes for I2C0 and I2C2 along with the pinctrl for I2C2
- Add Rishikesh's R-by along with a link to the board schematics
- Add Links to RPi v2 camera module schematics and BeagleY connector
  schematics
- Link to v2: https://lore.kernel.org/r/20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com

Changes in v2:
- Use PIN_OUTPUT for the camera reset GPIO pins (I forgot to change the
  sysconfig generated line).
- Link to v1: https://lore.kernel.org/r/20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com

---
Jai Luthra (4):
      arm64: dts: ti: k3-am67a-beagley-ai: Setup I2C for CSI/DSI connectors
      arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1

 arch/arm64/boot/dts/ti/Makefile                    |   8 ++
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 118 +++++++++++++++++++++
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 118 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |  45 ++++++++
 4 files changed, 289 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260514-beagley-cameras-21ce6a98a7f1

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


