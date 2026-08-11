Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6276EC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJqFjeEz2lMqJWlseT7sxSs4A4TdKCnjQFI/u/6gb6g=; b=CjMi6Es9mzjMmXmvrfJTD4zPSY
	RYC9mbhbe2BQPjMsZIMxvvCkZnk/SqM7hTjKyqLUhFnfrxMEUkKFPMlYRc3u4TrcEDLmFVb4u7/0T
	zUYCCr8u5x7GovqNz8n2aqQAgN2cu1R6N79FUCYE/267JOZwTOrU6Ua/xVeUtuDEtlBkyKp/FYVXD
	oOf4fdLDLz6ru4Ch8BpGAranbpA9Vc5LuY7eMyj9SHzU5URslQbEOvNe4GWQ3AcxpSgBlPeEjdCuN
	41yDyungKHDs+6FUvfwkRjCKGCL+npjiAWsYh1R3CCTRLwDFWURZzBH0YohAS92EiPjYHS7hcG+0O
	7uA+98RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn9r-0000000EBLd-20qJ;
	Tue, 11 Aug 2026 14:08:47 +0000
Received: from smtp-8fab.mail.infomaniak.ch ([2001:1600:19:b8b8::8fab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn9o-0000000EBJa-2QHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:08:46 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hKD4S0W0Gz9nx;
	Tue, 11 Aug 2026 16:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1786457319;
	bh=zJqFjeEz2lMqJWlseT7sxSs4A4TdKCnjQFI/u/6gb6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h8fHbtN2KNtc608cCWn8Dpg6pFi9xpS2VWBxGIdM7tmP+SCXFq6FC4b8c/9xky0lA
	 WrZ5viGyIcRjire6WsmBB5HUmX4BKb7Di+4qHqnhAChtDS9ti0WJPLvU7za2Ve2FDt
	 bnK45lzwLJ2jIYqW21BAqveBaFD9xFp9n+1zEaYvzegmkei71it/XEnzz/UIH3/ByY
	 2S8JHTcZfrtDi3sLqY6tfNbNiVoOrA70h1BDG0bI1loSrJQ5IHjpHxYZWq0W0vYtAQ
	 8usfjTrJR3ZF+nKSSb/Uiug0ZeKBkzoPfZmoNQNZhifl7sYoWHDfNeIvMtq84nyM6R
	 Aut63fRYyWQag==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hKD4R0y21z68w;
	Tue, 11 Aug 2026 16:08:39 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 11 Aug 2026 16:08:26 +0200
Subject: [PATCH v2 1/2] arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-jaguar-can-v2-1-7e78415b5a08@cherry.de>
References: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
In-Reply-To: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_070844_857912_B87F1F95 
X-CRM114-Status: UNSURE (   8.01  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

RK3588 Jaguar exposes the CAN0 interface on the P5 connector on the SBC.

Enable it.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 41758fe7d3689..ed6c1162bd821 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -195,6 +195,12 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 	};
 };
 
+&can0 {
+	assigned-clocks = <&cru CLK_CAN0>;
+	assigned-clock-rates = <300000000>;
+	status = "okay";
+};
+
 &combphy1_ps {
 	status = "okay";
 };

-- 
2.55.0


