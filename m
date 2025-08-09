Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F8C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r1dhH9w4gRDVGnBhu+EFnBWO89/jZ+zu2NTBfQLcUk=; b=mCBiaUx80QJnvCNcpv3Fu/o1P4
	z9gqRY1nQw/tp2PUpsuBJxktYDyb9YnBifAIvHT+Upmch+aKzEwFZuqL8T4oLFglbXXBtqM4dAM3j
	/5T8r9G8V9/hSkKKpD+cFAY4o5dXW9zpOvq+8Qbuu2QhvX9jk4oZCyoRfSFiJhIRFWFb2jHWPhuex
	yh+krh1zNv5I6YGdqTGvly70fJF3Er6aIw1tG12q1TBupADGNESU8KxyRgwTohjKifJjD3zvWxWS0
	yA4lYEeZp1j19+Tl92ZZoJzDe/f4nPHKesEi/u65fENWsosWSbCXJ3zJ7uIw9rH5CrwFS14nfRaVE
	1F0vW0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukmOa-00000004gYj-1Pu5;
	Sat, 09 Aug 2025 16:26:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukmH4-00000004fxz-3Q3M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 16:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00C0F5C541C;
	Sat,  9 Aug 2025 16:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C9EBC4CEF6;
	Sat,  9 Aug 2025 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754756304;
	bh=MVrwPnbpDeCNYRZTsZwypV+xQ9Qr414IVgjU0A/5p68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tuImT21QtoybNQiEOZUO+R7ydTm/KKDDd0XaxuZUzj3mUQasEj/YsFd3/bQn6qVCx
	 vcj4wRgedxTDmTtYqD5cFFzh6IBVH1m0uMqJK5+wsZ4SuDE51fMtziBQ59GXSve4bA
	 cKCP71g45Liixqz0HkGjqUZoNjgLUyWgI6P5Nz+Ng36fh3No/yW/0dK/bwRTENTkRm
	 J90CbyPKibziccV/3sO3hfF987sSl92bJ+ELSfkbIS+CFh66HDdYXhGxsk6Pwk9NBH
	 wXv/bNhDVS+YrtB9SwJGFanvLskAIeHNMZi6pvOW35mMY/OV6W0rpMdabsA/uK4zG+
	 t9sk7n5ttQJAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8C0C87FCB;
	Sat,  9 Aug 2025 16:18:24 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 09 Aug 2025 18:18:06 +0200
Subject: [PATCH v2 1/3] ARM: dts: allwinner: orangepi-zero: Add default
 audio routing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250809-opz-audio-v2-1-f4fd15552a82@posteo.net>
References: <20250809-opz-audio-v2-0-f4fd15552a82@posteo.net>
In-Reply-To: <20250809-opz-audio-v2-0-f4fd15552a82@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754756302; l=1309;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=/SmFcb4P8aLhRsUonrHuHU1uklC2E8xTPCWEXu/PUmE=;
 b=LI2h1mfVWU6kU0l7YHBPmkV41bCngpuBodn49BoN4gCg8R+zxYvaI4/Nk5ZoLTZ69o4JIpEmE
 2/oizJo7lvmB/nXbzNyJCIEUTRP39WBJ3XKgGLOpZXmp4eDUgfSCuk6
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_091826_892401_2DE258FD 
X-CRM114-Status: UNSURE (   9.32  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Line out playback and microphone capture work, after enabling the
corresponding ALSA controls. Tested with the Orange Pi Zero interface
board.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

v2:
- Add an explanatory comment
---
 .../arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
index 1b001f2ad0efd2e77218742efe6d8edfdd18a816..b23cec5b89ebf61701e1d917929589eb6e884afd 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
@@ -112,6 +112,20 @@ wifi_pwrseq: pwrseq {
 	};
 };
 
+/*
+ * Audio input/output is exposed on the 13-pin header and can't be used for
+ * anything else. However, adapter boards may use different audio routing.
+ * - https://linux-sunxi.org/Xunlong_Orange_Pi_Zero#Expansion_Port
+ * - Allwinner H3 Datasheet, section 3.1. Pin Characteristics
+ */
+&codec {
+	allwinner,audio-routing =
+		"Line Out", "LINEOUT",
+		"MIC1", "Mic",
+		"Mic",  "MBIAS";
+	status = "disabled";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpux>;
 };

-- 
2.48.0.rc1.219.gb6b6757d772



