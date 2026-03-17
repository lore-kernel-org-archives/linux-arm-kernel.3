Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434DAFD874A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRAWdjCwxCbz+YpNUmuGWkb9Vz8VLQ2U7nUml1WoZqU=; b=EupB3cZIjJjanbH/Evu30R9pwd
	0q95e/NCJYKN471l0iNFZ/KhnqWwUknc9/ieVw+8EE7OM+llR0m5cDS7TRCh1p2o+aKDUlV/cde+y
	HJC0kVLSNneiFaI5xH9poWr2PphUunMBJDYPc/yQlYj18MJ453tMJ5YPVYczyIPgu/HuaUcEdLfSK
	TNdHgOdkcTtYezUab7YZS38xd3KxuBx2Z0/5F4HibtdDjN9fv0dLgxwvTNffpv6Zug88iiuZLixyL
	gcBYl4LkdVjVRrwSRpISXugBowmPDUBpW/lbLSal4G2hlOUa5a9sV8acsQP5YKfczxp1bhzWfbrqX
	+u1eBBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2l-00000006FDX-0Uxs;
	Tue, 17 Mar 2026 11:57:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2Z-00000006F7O-2GsL;
	Tue, 17 Mar 2026 11:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vRAWdjCwxCbz+YpNUmuGWkb9Vz8VLQ2U7nUml1WoZqU=; b=k8fV9PXhDb+2KIJYKi6eue8GMv
	OZ0mng4ZsWX2azKIDK3rVC3vU8V9vOQibDbMSaS8+pb4F8piDcaHKW4OoESHCiTlzGXjEKKHwkDU1
	BiwHmJ94yK2ldZfVII1f398w5J2trIBcBpdy6i6Rj5bwUN2zxVfzl/war392fbR0UM0aCtSoo8tbR
	2LASKwoOu+Qupnesp0nh5c6+lMCs6BKhNa7E6HyN7eiM4aFF+QpKSg0XZMQIAXMIQyyjdq1fav89u
	Ez1q8UoWtf0YgQvIaSQmzaONZZ3Z0foYiynPWSylLxZ49/o7V0uiCxbeKSoiHfYVqXhMapLBpiYb+
	DSD4ChIw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2V-00000008taO-2r42;
	Tue, 17 Mar 2026 11:56:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsBmQ53851628, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748451; bh=vRAWdjCwxCbz+YpNUmuGWkb9Vz8VLQ2U7nUml1WoZqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=hpSVY/R3/71HeOWYGgwnuUOli9Cwh25gI7Vd4vCU/y1ccrHU8e9bDn20luUrSkBQO
	 8AB1CGhcH234cbPZR9GSX5JeFw+rEHsUH6BTyEhpykT6ZpL67o2PLdZQ4ph89SKHdi
	 RIHPiP78NcqXQoH1r5aNFoFSoqgTWg6ZzsetXzHgEzsLkonxLHInEf//VfltBdYDii
	 DrGlwT9skO9W6rLAfpuBHLdjLBd3OiaPy6KfMSH7hEUV+gYwMgr3Wtu2rFuwwuXXQN
	 zFzQ9JK8mSsPFJeT57SW/rsCUy3ux7rPAsV/jH7rY30bUws/9vj5N7SdfPZ9yBnsMu
	 zjZZSH69e2v0A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsBmQ53851628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:12 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:12 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 4/8] dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle' description
Date: Tue, 17 Mar 2026 19:54:06 +0800
Message-ID: <20260317115411.2154365-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_115648_255275_A7C1C092 
X-CRM114-Status: UNSURE (   9.76  )
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

The previous description was misleading because this hardware block is not
a PWM generator. It does not generate a signal with a specific frequency
and duty ratio.

Instead, it provides a fixed nanosecond-level adjustment to the rising/
falling edges of an existing signal.

The property name is kept as 'realtek,duty-cycle' rather than being
renamed to strictly preserve Device Tree ABI backward compatibility.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Add Reviewed-by from Linus and Acked-by tag from Conor.

 .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml         | 7 +++++--
 .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml         | 7 +++++--
 .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml         | 7 +++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
index 90bd49d87d2e..2a640e495cc7 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
@@ -135,8 +135,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
index b6211c8544ca..2136546adec8 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
@@ -134,8 +134,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
index e88bc649cc73..e8ea1362b16d 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
@@ -133,8 +133,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
-- 
2.34.1


