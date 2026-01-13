Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CFCD29DDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 06:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1mVOjGElKSoKBhNa/BD+yPQrhPOd4P5L0nto4PZ9XU=; b=2dOmTwB+SyPMH2JpP+aWGmQMSv
	D9C3SDiaRlHSoekeeqFP3qI3Q8X23CwmlmNmqaLbGYJ2K6vYivgor0OPvgigWRn8vJlPXtChiIBxl
	wkdhCaw3v3s5U2Sd3XNF5kFX0MSohPg+aGOWIceLurPgIMqqlk5EaTxDXZCfDM6kZgG4R8npR7/ZA
	uEosAakhyrh2ALv9fb8pX4VMgMf+As91WAQ4SYBHMgzkv+o/orJA/dUeEFpr/m9fDow3AflfI1cON
	b3dBW1Oa7MsHjFZ9rJ+yE+6k+sv4N8dQ3Ra9eGgp5kySDGtu31jvoBAHG/C3UNBRPeNRVLwM687ya
	mHfQkgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY6s-00000006bji-20Y0;
	Tue, 13 Jan 2026 06:42:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY6m-00000006bdR-0LKp;
	Tue, 13 Jan 2026 06:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 251B54437C;
	Tue, 13 Jan 2026 06:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D94ADC19425;
	Tue, 13 Jan 2026 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768286545;
	bh=JVfXDE3E2ltmMy4GP25Fi2by9NnQ3UmZ7e8txPADr30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qXlXaHdAa36uNPMLCrQhJ/6CsHPDR2IaT+Muq8evWJlHpus7SfpHIJwM/e+GpH0Jx
	 q9eFz91l8NYONrCbMlpeWeTdk2sF8xfh6PtgHrXKoWBwoMirIJHQY0QzS+2CDNjimB
	 1cl6zqKpPoeucsNX01exINvZxBuXbknjLJHzkEQdDiecI2933GHXkO9buS7Dak7yIt
	 aypgzwXSyAFRTAWBzdNoULlC9APQZIYDX6ItONDnV9jM2CsArtO/OluOf2iTl7+TTg
	 KqpmN1Pshc0VkXF5LKhCmB2Np5Bwh7oL1xgjMOb693Z33Y640xCnkxN9oDEt0ZRWO3
	 jhxSOBkjdwUSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECD7D29DE0;
	Tue, 13 Jan 2026 06:42:25 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 12 Jan 2026 22:42:26 -0800
Subject: [PATCH 3/3] arm64: dts: rockchip: Remove interrupt GPIO for WiFi
 for the Pinephone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-ppp_connectivity-v1-3-284d6e83b212@gmail.com>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
In-Reply-To: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768286545; l=1127;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=V2xGi6mOVeWleP+m2F/1DkoT1Cl2cZl0GZeCm6kqSeY=;
 b=QB+1y+pDSe95xr6xk+qde0I6KgnZrK15MGSnGS0vNzWdXVIPaXxoqEtr5mcbivN2mUb8Nm6L0
 Um61cMTLCyJDlyJ3mmvuBBGruOkvdrJ7XOzBXjx4r9u3vzsLjn6YkCL
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_224228_144340_4952B68B 
X-CRM114-Status: UNSURE (   8.41  )
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ondrej Jirman <megi@xff.cz>

Wifi is currently unusable if interrupts are defined. Let's remove them
so that Wifi networks are actually discoverable.

Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 97d0bf455258..69bb9de4ce55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -834,9 +834,6 @@ &sdio0 {
 	brcmf: wifi@1 {
 		compatible = "brcm,bcm4329-fmac";
 		reg = <1>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <RK_PD0 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "host-wake";
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_host_wake_l>;
 	};

-- 
2.52.0



