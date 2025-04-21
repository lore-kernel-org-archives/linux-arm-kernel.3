Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807A6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOiuKc5gnmroBb3AHjA0TxTPn9oGQPZONtVkG09mV6g=; b=SJkKNwRrl5EiY0/yqTtQ3DvqLa
	8fv0dw8c3wk6LaIi2Hj5zlXHcvD99BZS4kc6OiG4bROmPH5LIbcUEMERO4MHQmD4z3ei2f5uVzAyl
	GLxZmKbp0dftShblKeOsdve+mCS+burpXYVnw9Onk4keaHHhRHbPofIU7sms89fU+iADsPYjxjUWY
	hqUUhgWDFJn9KcXJz6yawsY1OAxd+r2cNvQXzY2J/fZtvCRJz7w2AHb9b+4qHGtZkkWEpTiYTlSj6
	eYtEQ9G7lcdfNxQbGhCTcgaxWW8OZeCNfiyOjPTVvvT+buMq2ZXHtgLdI7lvp+9XDX1SNkZdhRDDN
	sqNgH/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yGA-00000005922-3Av2;
	Mon, 21 Apr 2025 21:00:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6y5H-000000057g1-47py;
	Mon, 21 Apr 2025 20:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268582;
	bh=ZXE55CQ6tKXOBWcsEApxFOCcB9MJRav1Ft8naFxiU5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fjcvlpaSsWhC9Q9A1lQLzwCPUsP0oOrjVUMOS50F+K6HAD46EqWL6yxYA+CDZazyK
	 hp1vUGfyFgmAFKtfoF3zgcXHfREJ+fP5T//ZXfq1T9NJsyGrDheGWw4ylyFcPIfNuj
	 SBsuYkfbo3kewPFzn6Pj51YL78LcfAJH8MxEy7YBEpAg3S3C+9hNDSLRQw0mUSSSnt
	 N6yCieGcmYXkdXDrP0pWWLXKQVjVO7LnNIdxMCO0R+swW/ITf80jjzkSokq/lpB2ew
	 wq6V5xtygHkcxhdXXCqyDSfnJWcGVpIXY9vEUAUxu7WuNXgIDx3N+/DWb1X1ru2rCY
	 X+z895908TfOA==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4ABC717E078A;
	Mon, 21 Apr 2025 22:49:40 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 21 Apr 2025 16:49:08 -0400
Subject: [PATCH v2 5/5] arm64: dts: mediatek: mt8390-genio-common: Add
 firmware-name for scp0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-scp-dual-core-mt8390-v2-5-c84117a959a9@collabora.com>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_134944_161195_DA795CF1 
X-CRM114-Status: UNSURE (   8.21  )
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

Add the firmware-name property for SCP core0 so the firmware can be
loaded from its canonical location in the linux-firmware repository.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 805a4bccff33e3ac1a16c5fb2cf13914c8e97746..698054ed5d6d4f7b947db6ab5335d3b202bb84d9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1060,6 +1060,7 @@ &scp_cluster {
 };
 
 &scp_c0 {
+	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem>;
 	status = "okay";
 };

-- 
2.49.0


