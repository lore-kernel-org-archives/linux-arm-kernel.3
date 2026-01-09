Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1F5D1681A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXDzcquGOdehleXxFnIEl392gprPh8tMG4fxjnQCrwU=; b=gjXjziZ8Kza+X/mgCjz4o/4ARs
	lrD/NLxuCRgRFPnda60yQc3h0XfZpBIUe0xjyak9IMy23wzMwxyG1ftmx81BzFifzmP06MTS6yKMo
	aXKPX6MCkripz4ts66s9cM/OUvJx1MCviDCXYAcqDxgS+oMS6iK1Idv1EEOk8qLm51PBv0+rv+HF1
	3eJuqGwS3Qgq0v8+t0DzAA5bLl6XvL3C0nTOjoJtXQv3JdCHPUMXa1TKG1nvwmv8D7SlLqL7xlsUj
	Yd7Bn/Dm0IDoP4nvG0s7S92JcAqZpV3BFShRwyXllvE6pAsOGcNuLPuqYaFLhqWyhxjEF3pR6aBdu
	rzbbnlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyi-00000002FPC-04hB;
	Fri, 09 Jan 2026 11:48:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyL-00000002EwI-1MDN;
	Fri, 09 Jan 2026 11:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959282;
	bh=fanj89SC0YIefDFZeAVi0tb2ZW4a6HRUlCfP7iaiAFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EGej+a+00OpeWM2oHpmrVF0onf3PwfoA+aNzCJrrzid5khJoIMxqYW1uK9iVmLxDD
	 slF3L2ODXWi2m88XrfHWnvBLP9vPC2V6dI1oo0oYXNImPUOkLzmrG/VSzq6GKSJIT3
	 lJQpZIEMIbYCKlAAGdlf9ik17qZgvtkhQf+doQsQ5r+ANm7KB5SPlCVh4YQu+E9Gfh
	 85WRnJv4Pl6+2lkcM3pLnNIVvixBeD5P+vIOfy+0nLI8l/bcphXMg85q5d+tio1vpa
	 AlnTw4u9Ara+7d9aKmMpd2NU4atmrIitgC6xUBtVynb/JleYEZbIMTsQcxrAUm+Q/i
	 W1Ragtwg4fmew==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1259F17E0FF0;
	Fri,  9 Jan 2026 12:48:02 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 10/11] arm64: dts: mediatek: mt8192-asurada: Remove unused clock-stretch-ns
Date: Fri,  9 Jan 2026 12:47:46 +0100
Message-ID: <20260109114747.37189-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034805_633746_5537B94B 
X-CRM114-Status: UNSURE (   8.61  )
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

Remove the clock-stretch-ns property from i2c2, as it has always
been (and still is) unused.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 0b4664f044a1..eadf1b2d156f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -344,7 +344,6 @@ &i2c2 {
 	status = "okay";
 
 	clock-frequency = <400000>;
-	clock-stretch-ns = <12600>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
 
-- 
2.52.0


