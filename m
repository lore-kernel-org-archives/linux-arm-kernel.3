Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43790D20694
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8CGdx4QbymWZMNrQfPhb0eO4ThzNB+W0rAATdSxR+I=; b=d5nt6ZJFfKkiYIHAE4WImC/APZ
	MYUfUzUy9qJjHqZv7MelshifoBfUmxUAjwgeJG5g4j/WlTEWg4rRr0TcsgzLCGuLGA1bb+8nPrm5j
	k2Y8v3bTwl6kxwEvvK1ibiVcSknkHmtSjPGf+fhULqeAX7LluCN6B16AavYMNTuNJnZjZNhcSPGad
	N5tfKDLBoXnLfA/IBspZw5oMYT7Xsn6icSqOX9tTwbBfayMa76DjtvAUAbHkBmXQaFKJbf6Pih1Kk
	0tV9vLFzWihRZeQktImsObkdWoR+EeLiPJE+xqMJRb0Z6z4X30takfzIGx072ZtrHzgYHYalgZy/X
	cFc5Avlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9bY-000000084XR-0ibu;
	Thu, 04 Dec 2025 13:42:44 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9bR-000000084Sw-1e0x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:42:43 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 74F281FBDB;
	Thu,  4 Dec 2025 14:42:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1764855751;
	bh=r8CGdx4QbymWZMNrQfPhb0eO4ThzNB+W0rAATdSxR+I=; h=From:To:Subject;
	b=UpPDhNBCQhtg2bs2kuMwpYRREVEFcKayep4BNdBo/7byUB4EGoKCVmEMXPgmDWXha
	 us5Fb/RGBTIdzGF73wAW0R5aWFufhb+uQ+4VNth/WSBAXJgbwPSPUumESuafSHw90+
	 qOvRD3ji3x+r7lizZKvm8El/8y1qSyuHGFJKO2WwMAp4OQXr/MMfppRbxyuoiIeMV3
	 8jlIdl7OypT2iPpzdr2lMaJoQhT725kBLGd6DAiGpe6UXJbsaoXHI1p69zP6Kx16mY
	 km8GeiBkZDBDRowbt9MJDheHcHfTDh9odRgPcBtcrCriebw4CsarWAjjnOK3+pZF1b
	 Z7Y+E0JzGszaw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am69-aquila-clover: Fix USB-C Sink PDO
Date: Thu,  4 Dec 2025 14:42:19 +0100
Message-ID: <20251204134220.129304-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204134220.129304-1-francesco@dolcini.it>
References: <20251204134220.129304-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_054238_026435_185FF171 
X-CRM114-Status: UNSURE (   9.72  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Change USB-C Sink PDO and the amount of power that the device can sink
to zero to maximize compatibility with other USB peers (the Aquila
Clover Board is not sinking any current, it is self powered).

Fixes: 9f748a6177e1 ("arm64: dts: ti: am69-aquila: Add Clover")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index 55fd214a82e4..c816ba3bfbdf 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -280,8 +280,8 @@ connector {
 			try-power-role = "sink";
 			self-powered;
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <1000000>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.47.3


