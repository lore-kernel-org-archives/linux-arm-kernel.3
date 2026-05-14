Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A794CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPD6IywSZnrD27yDLSyDvvak94+4lO6RGWvtYSIoN0c=; b=H5XU6yvWKoObNLZrr3l9naEAm/
	UDg/+cV1VwGdQ6s+YtfEoXNjO133f9/OPIII6Eg1Ikr6upmjyE9BrtVWo4EzCoLYr49kvS72rP9Gp
	mzhXYOhVth3aQFbSI9qADUOZn03LWIxYuV+QymnfFSUDglz0GMb5e6LKEt8XXV27i+UvVRbWEbu0C
	Ef0raokcFM7iGEMblM6khcDzyJbHlXUvGimnQRw0bCgWRN+SULg25GIgPrC5OnRwhky7vqo0EJAjm
	bvwvU08Il2ZtVucjg9fFdtdfFcTlMmtUt2sHKonesCUeevdh3VIrYrPOfEfBcNaq1EaOXwR+vBgB9
	G8JogQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXV0-00000005oHV-3OWP;
	Thu, 14 May 2026 14:57:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXUv-00000005oG4-0cNs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:57:14 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F13D9D7E;
	Thu, 14 May 2026 16:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778770622;
	bh=p5dIUacsdc61vj2qf0gBR53uOK91lDwLXjQqK5PFL8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EDgCc6giUGl9V07YHGKxWVXC0kBPZjbZX6VElrSFLp/PMfT9Xy+4GAQsZakVYf6sN
	 UgaKTNnoZDV7BHe6B4J3rxyXH5xb9yuKJpB1YS6FEJ6zkIgo+sX/HZGpczSVx97A2P
	 IZXWq2vyPY1T3FkqoOHwM+Ayq+474QbCDYno0Jv4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 14 May 2026 20:26:27 +0530
Subject: [PATCH 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2 pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-beagley-cameras-v1-1-5c3500b5a436@ideasonboard.com>
References: <20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com>
In-Reply-To: <20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=p5dIUacsdc61vj2qf0gBR53uOK91lDwLXjQqK5PFL8Q=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBeK4EbMrywm3O05+gaKttVqYSd6KiUsxAGrOS
 CCz4G2U3BWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagXiuAAKCRBD3pH5JJpx
 RSdkD/0d88493PAbF6uA7hyDP0EyY04m1hXO7O1MPdOD6/rVcf82s1+7nnXEOQ1ywTh6ZeywKXl
 OA1jToXhcF4mkCayG1XRI+xzt9at7E4e+NLVPf3iLfZXLsjSb8mhUDuDn12WzbdoXn1AUo/aeXP
 zBQccdOHJtjiqHkfjk32Sl+njSe4SIGprvOqCmcOj1TI6wqKk7mCBZ07plWltTCr1cE+phToirq
 akYgcZNXX4YxfkuJU5JSl7o7VG79BxWD+fgws9Dfqjx6XyHHPtJ/pTpUSAwCuaruApeDDa+KrEW
 QVfb5W4cSnDHyrVbna4oQFdhRLT87sGV01GqHjoBudssv65R4TR98WNQ50akgsOOK9NeRQj+S5Q
 comRMWaBLjYGc33ZOVRufAt0Isi5K1cdK2D4ieG31Ln7arlnWlnQYqjGr8yFIQrMswM/8PwfJlB
 ewUgezNTpw0Kk0uyN+BM31e/Ws4vzgMERV4EjqW8RFFu2PMLOunjQrrPLKbHptpVkoviCxT+c6q
 wuHc1lx1N/FL1hLULHqJn1rp+/DXZ8auSJW5ZmDXESv/YkOxfGv9+tKwvXJYhrt+EcO001JXFDz
 HrjTYjmigbmR3fVHAYIYwLjrhB36lW8gG+LcZuXhrUFBNF1i8tWgU+nq1APEbjpyWEU93/5ZegV
 hZU4OInG3TWi1UA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_075713_329666_A08E4F1B 
X-CRM114-Status: UNSURE (   7.94  )
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

I2C2 is used by camera sensor devices connected on the 22-pin CSI0
connector. Add the pin definition here so I2C2 may be enabled by the
camera sensor overlays.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..06aac02a7668 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
 		bootph-all;
 	};
 
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
+			J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */

-- 
2.54.0


