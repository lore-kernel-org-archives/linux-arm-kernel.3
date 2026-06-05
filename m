Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5C4CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=; b=Ek77EgH5qHp/67a5im9pOTzt+f
	lIwEMcsmd5PN29BiuS0cCiXXbn5hY2P89khOBwBOodOEuR88utJ1oV7dxecoEnB2qqK8mfy8wqBmP
	LY9z1skWCxHzX4vlAzpsLswGcE/V5iw+yXos7xIpBJ1YnzVOD/gHCh/K6gHZkXMcMou6qbrSXTWVE
	xPUzDbDxMKkhFH9gGoiS5uhBfKFJxcxwVqeRwk5Yv53GpqEKH/Lq7MAo9WtbW1YsqUykiYUkaobgx
	kNGCUTHRgrlgDFR8SlEEDsXXjrxQgzeO2uOAS/kVlbSCLQYlEUTGFeYuejBqYT8liQ6ppK4WdTiW9
	R0nydRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX6-00000000baE-2e4U;
	Fri, 05 Jun 2026 12:20:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX1-00000000bWD-26yZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so1300986f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662010; x=1781266810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=TtU5vgnVKVFHexBjxAJrMe2KmwHUf+/2zNy87sfYaCUMGxoZ2qLcCr2B9yhwv4DJFl
         VhvtZ8ik0Lpe4cVWfWqoP6Cg2V6jaZttIBgnN7qD1ktJU3yoVUsq31SfWF8F1bO9eG7A
         T4jSidQJBBk4xHUPTWCEbkWzPFzs8+2bPBO4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662010; x=1781266810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=XQ29DQEz+wMJU12Ea0q/Oa3eA72QC9Zf/X9mg0ps8HqSWH+BXRQ6Lcft96dzaKAQO4
         bpxAzFdQ0XFgqQIGR6yPM6/JNtnFDAsl1qYmcS/RgEW4gCZANLnHHncfIpygTRQwBUv1
         JVsCnM4e6dOqTQgMobkOTiTJiyGh5FLh5lnTNt7Q+brWhXxP+kCuRpbnCUT2ztEZYUoR
         c/1v82J/joFzueZVcB6Og2h8SUYL1FXoqKRCFL+fEY/T5P0vAHPbEKVDlbP+n2CwwULS
         P4DMCDNMWjADuKiP4W68YyHHgIDHwV/+H1GC34VZpw0TaoMNyFsgInw3vsm5qm6LgTeF
         PVUg==
X-Forwarded-Encrypted: i=1; AFNElJ/L2BZSyrh6lNuSMza+VMi1hfKeMWWC/3rSVj8crVYsUsqc8/pSRmA1SwPmrZs3nN+5o0IcrtJVjIG2nN2THySi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv92/ozCxbKLZdzk6BPNzWx0mwypN+P4tHtCDREBv02RN3IVY7
	2b5Kysb1f0/4QDQLFw+zauLAlHy2WWGs16TnPcRG0RGeuJi0Bs0tp55r0ZYXG0Rsrm8=
X-Gm-Gg: Acq92OGdC1qgDiAMS0l0AFN+K3t2qLqTsldyUTndAnNDxz6QzLY6+LV7rV4MMKs7xX5
	iOoLAHX7EHq4n1GfZAY2HBRdiR3PbN9QW0VfS4wRuvWkeyjR5CUA28XdV/SbAasb2I5533gfh5k
	a8JGobGrHO5RMKSLPRA8hxH7b/6TZZRCr+oHnQ8YUaQPPLkVmn7lhltxGnUCjMx93OJFOzq867G
	dhzvIJMJGY0/Nx25LM/Rdc4lWT53wtVO9oR6r9fOioSvIIfOARibCZNq8isTg4QV9f6S2P0/3wB
	/Af2kWEoqnFEIzhItijEa3QL/FtY1g1G/9jmvO1eRwYAaqW791MaW6ZTVbykXH1YiNhPsSZ7pGQ
	mRUMmU1EB5+6/O1J0ClukwFjfY1CV+ZgGQmOszmorDkxGfNzv+0VR9DvWkFl332SsvcEF078dRE
	khiMfcmQ2tPTEGggUqZYgKP0BVTJ6k/MIi9hGAMD8N11R/I4iqxdfFoKkWmhmr2c2GKYJhsxzzt
	6YODaRegVAYH3bZLnzOamhIPqh17ebokIHdyAcRNvof8PMudIE/SMmLAkcEZBYFWQa6cziXPKPK
	VzhuddALo3fWxquh1XD/7S9hY3W/DqfxeVo=
X-Received: by 2002:adf:e00b:0:20b0:45e:ec27:b4b0 with SMTP id ffacd0b85a97d-460306435femr4423966f8f.18.1780662009486;
        Fri, 05 Jun 2026 05:20:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 03/14] arm64: dts: st: add CAN1 support on stm32mp25
Date: Fri,  5 Jun 2026 14:18:14 +0200
Message-ID: <20260605121957.78409-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052011_568500_9873DACF 
X-CRM114-Status: UNSURE (   9.90  )
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

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0


