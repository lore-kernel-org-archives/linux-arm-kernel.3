Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7209EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8aF1jWcB6IB9KR+4XWsQOiLJ0TW7MXvqDka6LPg71dM=; b=dIM8WRm+fDFB6wVMMicpEVM5mU
	FtDNMW3p+sR4H5lGisGmO2hPD8opoeDSw+fGFN5M/VOYgicmW/ZX7ClxYYxkKp75OWOVkWb5kfEQn
	2Nufj+a777XuwHju2LVydtwW/9jO6G7zq6Jaub/xkNcpgto4wZPDg60ro/2L/p/xiJCrMU3KV3QSl
	EKFZLXYIphNSV4eroXWzAs/p89T4K5/0fDOq1redAdmI6x5MBDdPnPulc5aTIKjkSRjBtPPvPDI86
	FzWoMaj6epMaO3p2d/QcrHTzGFlT/LntsCrpBIbcpJA/yHkmuUpJXn0wQX9xSN+T26Vr41WoUIR+Q
	B/Yv/cOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whijH-00000001E4Q-2Z3o;
	Thu, 09 Jul 2026 06:59:27 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whijE-00000001E2r-3btb;
	Thu, 09 Jul 2026 06:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8aF1jWcB6IB9KR+4XWsQOiLJ0TW7MXvqDka6LPg71dM=; b=EPWmXbpPXQfTrkeIfmqIdPvbxQ
	wOW1LiG49jLz1d8Q5Ne7HjE3dsDF0OUhozjqMdKtMb/PZSfWxpruPh+31py9o0zgBXWiPNKNw53+p
	rHIRqI5JDlWPZx4khUMn6KqjR72+8SdcSb+soUkVAxXKQLW8Rb1VFcmvUnm01O5Tf2u+OYMpWiF6m
	QnXAd31jSLZI7UsDQ4hpUSsfHm+yvUuAlaLBCxcozca16FWoFmS3Qc7JCprmT9NBijoHqRjsIsHjk
	MFS5D7+5rBzGVgJUt5rADZKbF08amGGl7AYPe4T/oSj7dQyb3r4QEDfmnZlRmDeE/kbp5fhpf9MLm
	fz/U84Pg==;
Received: from [81.57.40.39] (port=46604 helo=vscode.iliadbox.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1whiiX-00000009Qd7-3dNf;
	Thu, 09 Jul 2026 08:58:39 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Thu, 09 Jul 2026 08:58:38 +0200
Subject: [PATCH] arm64: dts: rockchip: yy3588: fix HDMI-RX signal detect
 GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-yy3588-hdmirx-d5-fix-v1-1-900a6790386c@superkali.me>
X-B4-Tracking: v=1; b=H4sIAJ1GT2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNL3cpKY1MLC92MlNzMogrdFFPdtMwKXUvDRAszQ3NzYxNTQyWg1oK
 iVKAw2NjoWAi/uDQpKzW5BGSWUm0tAFopeB14AAAA
X-Change-ID: 20260709-yy3588-hdmirx-d5-fix-91a861773451
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783580318; l=1813;
 i=hello@superkali.me; h=from:subject:message-id;
 bh=iFef+RMo4HD2L2iqYTWAnm1yAXxvyc5ptpgmGuUjzjc=;
 b=UCQjMBPadCMciZrzLQcdA3pxynAHmzMfHADkyU2CwwQZycfvm/6rKPhrA3a/znGshyo3923GF
 NMmlUAIPPXDAToHT1ML913ozQHQ9SwxAbKFzqlrIxXyMsnBRZ+esFEJ
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_235925_075140_ADC31AE5 
X-CRM114-Status: GOOD (  10.19  )
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

The YY3588 declares the HDMI-RX signal detect on GPIO1_C6, but the
receiver never sees an attached source there and cannot capture any
input.

That value was copied from the vendor device tree and is wrong. The
core-board schematics are not available and the SoM documentation does
not clearly show where this signal is routed, so the correct pin was
read from the device tree in the board's Android image: GPIO1_D5. With
GPIO1_D5 the receiver detects a connected source and locks, and v4l2
reports the input timing (1920x1080p60).

Fixes: 19847bde695f ("arm64: dts: rockchip: Add Youyeetoo YY3588")
Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts b/arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts
index 658d87504841..e31d04b85edf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts
@@ -341,7 +341,7 @@ &hdmi_receiver_cma {
 };
 
 &hdmi_receiver {
-	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	hpd-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_det>;
 	status = "okay";
@@ -605,7 +605,7 @@ &pcie3x4 {
 &pinctrl {
 	hdmirx {
 		hdmirx_5v_det: hdmirx-5v-det {
-			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

---
base-commit: f5ed1537219ae8bf55446232d331b114653a1475
change-id: 20260709-yy3588-hdmirx-d5-fix-91a861773451

Best regards,
--  
Daniele Briguglio <hello@superkali.me>


