Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630D5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOwRZpFoseOz9hM473nLmBBHXI/FXd6Ps4xPKvt35/k=; b=qrCKi3ZMl+bv03JvgPVsfCDOpk
	LlBBN1VTy+IEdb0sNHhuoI8QKwffQe9dyr2oZryJ/eWWIJaHc2j3tmsujioPbYTraU75liGcs0x9C
	GaW+3GDK4VNkLNfpJ6BI04Glwc326uDgWsj351Teh0N64DnDTuSqtXlDQD9Al4X121OyCEHx0g0mZ
	KJXuanmQj7ntxP0jB84JJfIKh5k3TKmq3CvHvpJdzKUIF8rdPd+b1z5CbJGl2Jvg0hSPJwhQbHrQI
	hSyzqUFV0KMiVHBGExyMl906BGKqGSdF5OEieujJTOifST7fikabD3UJaVINaQL4wbqu1cthnxlhn
	jR22bTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeyj-0000000A68e-2Oda;
	Wed, 08 Jan 2025 22:56:45 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVev9-0000000A55a-43Sl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 22:53:05 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508MqDVP081037;
	Wed, 8 Jan 2025 16:52:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736376733;
	bh=vOwRZpFoseOz9hM473nLmBBHXI/FXd6Ps4xPKvt35/k=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=elHDE0mpR9ctwrwK0FLxmCQgllmkqw0LpgU/mDuNJ+6DcorV5YT2qcgcYnRjAZO11
	 NrfVKP7r1D5/CVuk2c/OLOEElKZExeoPD4wKCvUHlSPwrJEgC3z0vyPiI7yWDRrUd6
	 liA/ZnZ+9TlbnYN8I8cEKXYznHfJqtVxHKA6EGvk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508MqDYL080912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 16:52:13 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 16:52:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 16:52:12 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508MqCMU038352;
	Wed, 8 Jan 2025 16:52:12 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Wed, 8 Jan 2025 16:51:55 -0600
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-am62lx-v2-3-581285a37d8f@ti.com>
References: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
In-Reply-To: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783; i=bb@ti.com;
 h=from:subject:message-id; bh=aXWJV3lurQbpO8RjUHTuNWtjBXtYaKNXg8VgRBPGmWE=;
 b=owNCWmg5MUFZJlNZce+8qwAAaP////95Tv+lebvj70y6FvTv/Ox3855Kfnf/fP9u7XPO/u+wA
 RrIIepoADTQMgNBpoABoaaAaZDQaADRppo00AAAGhoMRoZGgeU09RptRpkM1PRtUQAaNAyDQaZD
 EBo0aDCMjINDIAADZTEBpoYCGnqAD1AxDJ6mmJiBk0GgYZACZGgHqNNNDQNANBgjEBpoBiAGTEZ
 AyAZDCMI0BiZGQ0DTIABpk0BAjPHWh4VKJ0YGGLk0wMgDO7hUpt0I3+tTIOzPyJGWA/GOt0gYw0
 NkaH3dFccVOuUZdkMEM4Oni7BG1BrCdwDK76ByoZA2zhEYuwqFToUCVgY7UiwYOWPby7gocV9KJ
 iT+SARfGllzBcj7AY54N3/OzD/hsaa1/yR0QHnS5yKKYN1DDsl1+seC1yJUJe+wsGZiVbcWEUK+
 THa1P0EQ3kB8T0u9os0EDdE+9EMYxhhjiQTNTDjNSFEUNzXgtoRZrwE4NiWyCCy1L0vfxHdSYMQ
 Pv9fIpeqNJfhBB0V23KvChLkTA/hedtIgmspTGOjpjfJgw545DmzS8yp9nY5NLf20Qm3HCvG+WI
 Vk2bwM2EqNtKukHZbv4zBQImkqeAF4/pU+J91rpWaGpx07x9HS5ZohiQsdgG0wpclQgxz/Q12lp
 xiD/F3JFOFCQce+8qw=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_145304_138186_43CD637C 
X-CRM114-Status: GOOD (  13.51  )
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

From: Vignesh Raghavendra <vigneshr@ti.com>

Add the initial board file for the AM62L3's Evaluation Module.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v1:
 - switched to non-direct links so TRM updates are automatic
 - removed current-speed property from main_uart0
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected main_uart0 pinmux
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 43 ++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
new file mode 100644
index 0000000000000..ed0148ce1bea6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L3 Evaluation Module
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
+ */
+
+/dts-v1/;
+
+#include "k3-am62l3.dtsi"
+
+/ {
+	compatible = "ti,am62l3-evm", "ti,am62l3";
+	model = "Texas Instruments AM62L3 Evaluation Module";
+
+	chosen {
+		stdout-path = &main_uart0;
+	};
+
+	memory@80000000 {
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+};
+
+&pmx0 {
+	main_uart0_pins_default: main_uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01b4, PIN_INPUT, 0)	/* (D13) UART0_RXD */
+			AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 0)	/* (C13) UART0_TXD */
+		>;
+		bootph-all;
+	};
+};
+
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	status = "okay";
+	bootph-all;
+};

-- 
2.47.1


