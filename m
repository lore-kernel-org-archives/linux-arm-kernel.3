Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41353C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvzgOVO6jhm4u4fWUb2VkpKCzhTp79gobTgqrCwBTWQ=; b=fo0FQMtu42cnhKxggD+SpSSNc/
	3LYAushDwABu5Gd71J5h8xRfkr8Nq9yW/ARGSIjtl5AdCmtrgjNe8nUWs3f0btgbtVZcNia9V23cy
	0+qzrSnfuECOmtDVxc31tmtyP7sCosQBavc6ymwyC/bsFNoJQXgiOcAPIZvmSTi6FHD+rPSEk7Vjk
	dBOf8pG6dM4wpMShJ758U7MnRkUZ6vFqaU0EsvyAP9/h2DJZ8VPxgBt9f+7uis21mFc87+B+OVYqC
	WsdbzHxz+n30WZy6SmnmLqs/Mqi+3zhmcdWEwFCuAIfbOtJb+c9WGprXdCLlzMXtrTcILBWylMOOZ
	Md/gPRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqkF-00000007JoP-3sCT;
	Sun, 12 Jul 2026 09:45:07 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqkB-00000007Jje-3zBd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:45:05 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2096243a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849503; x=1784454303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvzgOVO6jhm4u4fWUb2VkpKCzhTp79gobTgqrCwBTWQ=;
        b=R7VsrHb55D8A1VXIzJ+Hmv4tWdcv8GRtsxRaivpGSnO/3RnWQjkb+VYbJ87udO24Zo
         AlWScOgugrK+8GKouNEt6Gh3tFi6OahxbsScFB1o3qyB4q1zYk9Ql0wedtk4Qf+Tg2t6
         8zK+tMG0DrC+itSAb3awS5wK2X8u5QK0FhFh1vGgekEX/f1B+tiuHF4f1cXF80FS5CSp
         4nkas+ovSg3J/hYyE0FpBFE2ZgyD42B3kO56eYjOsxn+/Qmtk5T7wOuZLDLexhlnTO3k
         ZZcyRi6F6W6Q12grVKFlqztKGcyJ9NFS0G1C1DrlClt5k8VOTyErMbQ2ChwjdpzvQPLz
         ho+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849503; x=1784454303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvzgOVO6jhm4u4fWUb2VkpKCzhTp79gobTgqrCwBTWQ=;
        b=H3kASBB/7jPX6GjCk2B5EyTmVEvpHOWZvk50JE8+BbHALDW87zs5HWeLLcJMD4x1en
         X2xVd3DmAg0uclctH5/hdA7Px1lxk9ZvPTdWGiZJEtfth6V+p2zEDrJ+MxwOSeygCd0I
         wCpllAXpKS18Bl2edCywrErM457KnXNZRyPnLhM9g92R7fILM74fbnAHVHV2Z8sWa1/+
         e0LXDaWVr4hTBTai8DlHe89rJCJfvDWb7oeSJUfBbFYLQ9mSD448DlyDEmM2Hd6gTQrR
         f9D2A3DRJNFrl8Io9Ve7IpMDmPOjxKpXnAGUses2ei/Xm/9YElyLlLHA5UkC9unmK7Sg
         a5wA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7hmtXpds4XOsG2nX9zHQjMpK2uh1teIOpQdlwZ5d+qpkqpEh4XZoTEXIWbOnbkcpAcVfR9mgrYIzJV5kZ8JCW@lists.infradead.org
X-Gm-Message-State: AOJu0YxelU6LxXYNaskekTYWq2LoDvK13qvHiNpYdnw2C7qa7EMjb95+
	mQAou/iHQyQllio62Trb7k6rOCtplTEfJLjCSrRQmmJhBXGGEl1T+nYv7MaZEQ==
X-Gm-Gg: AfdE7ckWAONbfIVqAUCX2xov0oJdNWCeASusKs/hw5EXPFrOcExxwfuzRulsX11zpPn
	R+UiPZUuKC7jxchrXSLSc/o0F3nS7E4Iu2P72Ze6IxFTWQYeO2r9eJP+SxhlXOFWHNs4Dq0Rvjb
	iDGuynLwnN5GpYjj/GMJwdeH8qmccofx7rCMTzwZBu7OpxFkextJXmlTODsbpVqXDTDHtv5bDpT
	qmG6d4BM14JsV0cKtVJcUyY7PDHNXP8HFVttpL2RDBAiwR84hvRC4UgBXyPhvJDjVhPfIAY8M2v
	ddnrVzSVMnZ56UTlsNE/KmZ46wIv6EJSfju8+agdbE06B/1gg21Mktv5WnRuGmQhnEqWiKHAHFF
	XKXVaoUPdgbowEYr86iaZ5T/vhmUp4R5MAxBxdm2k+dxMlBGdfCnEmtmjtbyTmo++Hcc3e/xWyT
	J3FRe/+tUqw6Rores2MfZ3gVpm/LqIG62UmMUoOtC/jEL3dThz4YECPx9n9GOIaQeU9xPzmpV5L
	qXu3efdZE8Z1+e0Pe27z2Y2Ey1WYh2ccEw9n/Q4yCy837KHChwzSFLnwPzsgRs7
X-Received: by 2002:a17:90b:514e:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38dc77cf117mr4925674a91.40.1783849503296;
        Sun, 12 Jul 2026 02:45:03 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:45:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:31 +1000
Subject: [PATCH 12/12] arm64: dts: apple: t60xx: jxxx: Add device-specific
 SMC hwmon sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-12-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2858;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=x8Grz8Kqtnr/cWgyc/taQbax1eaDHX8U8ipxLd2qWVQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/3dR4qK5p210l/pqS3Vv7mW7v7f6a3pPXXqx/VN
 NhzM2Bmx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqPH2H4p/mTUfXNvp1bmnnO8ZfNF2XfMTfIIE8nf0KO8IfHMRJzGxgZOuR3r5H
 uuX197szpeboFmqt5+zey2S1qsSyYfvZDi9V6LgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024504_007360_5BAAA1DA 
X-CRM114-Status: UNSURE (   9.70  )
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

Add the device-specific hwmon sensors for select T60xx-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 2 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index a2a24d028cbb..e6eb6b6c386d 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,8 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 
 /delete-node/ &dwc3_2_dart_0_die1;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index fee84f809a9c..caded1636f3d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -367,3 +367,5 @@ &atcphy3 {
 };
 
 #include "spi1-nvram.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index 7c7ad5b8ad18..e3c2635d84fa 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -45,3 +45,5 @@ &pcie0 {
 			<0x200 &pcie0_dart_2 1 1>,
 			<0x300 &pcie0_dart_3 1 1>;
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 533e35774874..82689c380cdf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -35,3 +35,5 @@ &port01 {
 &pcie0_dart_1 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 31f24bbda968..f50a6d56f3d8 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -44,6 +44,8 @@ &typec5 {
 	label = "USB-C Front Left";
 };
 
+#include "hwmon-fan.dtsi"
+
 /* delete unused USB nodes on die 1 */
 /delete-node/ &dwc3_2_dart_0_die1;
 /delete-node/ &dwc3_2_dart_1_die1;

-- 
2.55.0


