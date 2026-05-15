Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F097FCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aDuylUwBvTWIWpNHqrWWz6jS9i+377i0dWDApU2/2Ak=; b=Bu6kdKD8dwcNh0
	DHv9RWRjTqPm3xp9tNY3uI2SQ0yojfNJ7DhsGtpdH2rORQon5WVyCwdv+IwBA/4ONWACzaIdBjm6y
	q6ZfXtnLegLhnhns+MXlBurXobmRkHAL/vi82THUYdxSNSoL389X3jR/6VhR5oXwcCVeCkFw4BLBH
	gzDFJrx1TWgqIgVUfqgrPzHN675fYsJJsmBMxzI6+mH6GekskPAsayVmFTUm0fTDwvg/vbuqOMsC3
	ukOg0CbcWtgBdDT68h85zgatnFpMoZp+pw5q6l6oQQDe0DbQuVsldZrOgReujsHQlqrGgsYwVr+li
	Zb+aCB0Bei6WWz1Q6wxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBB-00000006zNR-1jKU;
	Fri, 15 May 2026 01:17:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhB8-00000006zMn-0U3X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 01:17:27 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B7B763C;
	Fri, 15 May 2026 03:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778807833;
	bh=SBhtUk5LxStn9uFGuOs1Bm4gzHoDQePMv+PnFCWJ4RY=;
	h=From:Subject:Date:To:Cc:From;
	b=VhKyTsrfHKzmNBpoTCdjkj3IibBSzGlxDe1e0xi4dkzIvXupaijM7Gwi6jAakP939
	 uW4QXzdZRVTYM7Y0zoDByDH+sCEVx3iqAqu5l6W8F6SQtFyCCdZ5n3gzAFQnnGBZZI
	 sfyMWu4jKp0Qb+3WonLWazOqNITHUAtJdAMDTgmg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/4] arm64: dts: ti: BeagleY-AI camera overlays
Date: Fri, 15 May 2026 06:46:35 +0530
Message-Id: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6DIBBFf8XMujSAQh+r/kfjYoRRJ6lioCE1x
 n8vdd/lOck9d4NEkSnBvdogUubEYS6gTxW4EeeBBPvCoKW20qhGdITDi1bhcKKISWjlyOLtipd
 eQVktkXr+HMVnW3jk9A5xPQ6y+tn/rayEFMbVRsrOYFPbB3vCFOYuYPRnFyZo933/AhO0Sti1A
 AAA
X-Change-ID: 20260514-beagley-cameras-21ce6a98a7f1
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=SBhtUk5LxStn9uFGuOs1Bm4gzHoDQePMv+PnFCWJ4RY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBnQCZXKMi58q2DFuN5EE8FDoGtu4TVgM2YT1G
 0KYMxGFKxmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagZ0AgAKCRBD3pH5JJpx
 RewbD/9wSG+iuYpObc8Nycwy0qPw3c7N8yQimTzRFb50QUXJl/eS+JKg2hgpfNU87w9gxiG4pDP
 dPGKCdvF3FGXAozPpzhdofC1kPg4wQgd71yeA1gnrP4n99wKv05PgS7lHjBQJBGx9addBzQVVvO
 /bNkxgXUEZ0x4lYAq+CBXi4WLXzsbsQJsT1DGIZBJST2qXF4+u4v/dB0PV1E0YZQR1ki9MFPLlt
 dqhi5L3hmp67m56EcMqHkoxwVODj54DktoNQ/qj4QiTO2BYS+aqFHmFnG9Pa7/9TRV4cHn+CrCy
 3JLpUE+BJkgXMWxtsqc6aU35AHSDuCqE7St/DoQFDlkFeISSNA9thrUxRhvQJsxPswXjX+/96dZ
 1GPbaUV//LHXnjx4VVqps8QFGx4lsXW40HswW79LBQIiunIgwvYY3wgHqHwPxQ2M8opKtcjUUvb
 G/hmYBGHJdXxZbFdu+fdf2Uh09eCmN9LCjG+kVvxCo9qfKAGQTp8IN/SbqEPxHUjH3L41g4ClAd
 xraFseC8/NO2MHnng2ff/SzJkVHv6nOThVLLEwShVrQtfk8e0kyEQxGoike/TKxdNZ0OdS9EUUp
 8PQmlqqBFsKKeRFOEZ7+pdK9k5V900y06/acMZ+PTLrmeHagt61StmsfLEL39cKkqWazA1SuU3s
 j6J60IOrEohur3w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_181726_303954_9E52BF86 
X-CRM114-Status: UNSURE (   7.76  )
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
Changes in v2:
- Use PIN_OUTPUT for the camera reset GPIO pins (I forgot to change the
  sysconfig generated line).
- Link to v1: https://lore.kernel.org/r/20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com

---
Jai Luthra (4):
      arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2 pinctrl
      arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1

 arch/arm64/boot/dts/ti/Makefile                    |   8 ++
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++++++++++
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |  27 +++++
 4 files changed, 277 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260514-beagley-cameras-21ce6a98a7f1

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


