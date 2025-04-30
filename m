Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0671C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRTdfeEkhk9GKJcFVAyeZt9lecxsoqPn9xU90KsNqhU=; b=DsI4kpLVzpbETW0pERF995oHup
	1zxwU0GCUDEVctWUy2g7BoTJcV/sfEn7G61snR6XgrCb0OYpcQzdYJYjEWQhAmujSynO27YxysbVD
	wQpcCwf+40YPVYqSyxICzpHZlWbPCAnMgKs60iIKnb1H/sCYjkhLtFOC5nwzDSRV5bBKaaJOwKQJN
	QsVUygV4tQsexbMde+Dat0/tDFpffzDzMCIUsjcouLCeiflRtW0qrWIVeZZpmNvi8ORdu093GXYvm
	iUA42gJ0aiX6zKty7VutqhrodktRVOTl98C+yVdw2yv8gxQNwKl+omVrZxadsFodtz08OCaGT4+wd
	Ymxe69+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA034-0000000BlHN-2wLV;
	Wed, 30 Apr 2025 05:31:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zqS-0000000Bjb4-33np
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 05:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KRTdfeEkhk9GKJcFVAyeZt9lecxsoqPn9xU90KsNqhU=; b=DFrmkNmrmWbdRqTutRRiQwRf4z
	LCD2fGOEC23n3bWo7uLvGv/JW1ITxYLv26pgyqQaHwm6Mg1RA9kSbLVmw9cZn25SKdRV6QlmGEedM
	CCwLBcD8CZtL5r9mv61mHxcyMyELqMTGwX5r/8+baJtYqQPunsxtyYUvLvX5W3WuyAhEcnJpt7345
	jKdxRAoEAFkeN+dPsuvXuc8rYvNDKIyXf0jjTmfguL4/+OrmJ7/JAwWck9f3/6M379LJgqAFzVgLr
	L3DAqt/Win3oe3ZGA/k3i2LipTnhco6xyYc+LhyV0fFtlDsKvRrh5E/M2MqftYV9r3p0jwFV3MRLw
	lrfwzX3g==;
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9zqC-0000000Dh0t-092r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:18:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EF1E10269586;
	Wed, 30 Apr 2025 07:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1745990308; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KRTdfeEkhk9GKJcFVAyeZt9lecxsoqPn9xU90KsNqhU=;
	b=hPW331TwwNGEtmFb1EVAXT3I1ENK/bqWU4dNn6kz6uIStMQ7KUIcre/Pa0FiDVB5pY/Hm0
	TnhQBSdHHFXAe5XHjAxRZ1nRaThMAeBT/sp+G99DhkoEJOu+iJJxmkxVnmweoqz+FoE6Kd
	xVNQ8MfhNlnVX7nzVl3Z9u+njKXtdn6arl0asw0d6o5MbQHUtyHzcS8hzlZbf8qDcaaRPO
	Nzc88IFPlXWHAksiSYKiTdMl2mCAbVZ4JIOwA2dNxZECq5OvMZEod31e6Bk3MInB1cB4oq
	kiZiyVumm07/JvqNHHmaOQgB71ilhEaHhlXq9xaOKyMhSsFaJfUWPC3he/HztQ==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [net-next v9 2/7] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2 switch description
Date: Wed, 30 Apr 2025 07:17:51 +0200
Message-Id: <20250430051756.574067-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430051756.574067-1-lukma@denx.de>
References: <20250430051756.574067-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_061840_508372_CA68FB6E 
X-CRM114-Status: GOOD (  10.63  )
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

The current range of 'reg' property is too small to allow full control
of the L2 switch on imx287.

As this IP block also uses ENET-MAC blocks for its operation, the address
range for it must be included as well.

Moreover, some SoC common properties (like compatible, clocks, interrupts
numbers) have been moved to this node.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

---
Changes for v2:
- adding extra properties (like compatible, clocks, interupts)

Changes for v3:
- None

Changes for v4:
- Rename imx287 with imx28 (as the former is not used in kernel anymore)

Changes for v5:
- None

Changes for v6:
- Add interrupt-names property

Changes for v7:
- Change switch interrupt name from 'mtipl2sw' to 'enet_switch'

Changes for v8:
- None

Changes for v9:
- None
---
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..8aff2e87980e 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -1321,8 +1321,13 @@ mac1: ethernet@800f4000 {
 			status = "disabled";
 		};
 
-		eth_switch: switch@800f8000 {
-			reg = <0x800f8000 0x8000>;
+		eth_switch: switch@800f0000 {
+			compatible = "nxp,imx28-mtip-switch";
+			reg = <0x800f0000 0x20000>;
+			interrupts = <100>, <101>, <102>;
+			interrupt-names = "enet_switch", "enet0", "enet1";
+			clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
+			clock-names = "ipg", "ahb", "enet_out", "ptp";
 			status = "disabled";
 		};
 	};
-- 
2.39.5


