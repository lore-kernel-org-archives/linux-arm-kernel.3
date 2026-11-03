Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91726082BC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yuyv1K2U;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NSSDyWVQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fOFRdn7z24nh5HHdH+lcQ22pYuvFi8+a4KYRKJ+WMTc=; b=Yuyv1K2Ufuypkq
	V7Y/o2pIWn0HLP52gId6qRexCS/aMMuvCzCVJqVoDO1+TxKlMZ0faB1m7IYGhazyv2Nc1VcOXKlZy
	BkNTm0QFw3JAmoTgdeTd6++yJt8NDhgoMVuAUdT9qWTtSD3n6EIIGqit+3I3WLAO3eskpj2jIOb9T
	ua/P+wjA2mXIGzFKEIL5pZz3hp6BTtwvcoprXP4PNi+D9LHD6WS5ntK8ZtkPuqLQOFyw30XMCgAjU
	bONBvOibGVpVLfK92vrkgqllocO9H7lTaZqTk0fF1fEqXSBBaynnbyqL8AougnRLUonixP7oYdcBB
	WzDR/YgYYTzWEG9eKlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVT-00000001tbc-0GWL;
	Tue, 03 Nov 2026 10:12:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVP-00000001tZ1-2Qnn;
	Tue, 03 Nov 2026 10:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793700757;
	bh=tYsCCetG8oTk0mstJCHvbXche/Jiq/UwGP0ULa31RX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NSSDyWVQ+SboGPOtWWwHr3PRN2S/aTU/eEP+oi/EanOb0Rwe/9xnXYptalEHm06Ky
	 U6l0pEeykQmbsBK6DZv6h7w/c6oCnqMM5OPhvodX6vj6kIPsOkPLZsmZ5EGi4xpDaP
	 MQDesiNPKnUxuK4p5Zph4VwtdDWb9KgI5eevsC+E7X8QwNCy3cL7LeUoH85a2t7pa7
	 HGfogEib23D0P4UVvoyvLQ+6AmwJZxtvrZ8GO1BbKYeN/rSJKkF8LVIqH3FJ0w+kUy
	 HqZ74B0PCP2rRCAMXO6N3inqnPXIQmvH26DICGsgpRZsWVkNOybMVm5qOINp4mvuRs
	 MozeYC363JUKw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AA8417E0C0A;
	Tue, 03 Nov 2026 11:12:36 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 03 Nov 2026 11:12:06 +0100
Subject: [PATCH net-next v4 01/10] dt-bindings: net: mediatek-dwmac: fix
 unit in rx/tx delay property description
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-dwmac-mediatek-mt8189-v4-1-c86c14fc50f4@collabora.com>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793700755; l=1905;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=tYsCCetG8oTk0mstJCHvbXche/Jiq/UwGP0ULa31RX4=;
 b=ePQymgEkZO2DRGZYIf2qdWHWB4kTcaeUKSCw7o8gZIAiRyUoZvlIoTj5ZBYOpvIjwQ6JXLFD8
 4G/DBJCQ7JtAMxLkykdBIedOgP31m2IFdoyamjwgumXL0ugUEMrJzJm
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021239_772762_5B24D186 
X-CRM114-Status: GOOD (  11.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps" descriptions say
their values are in nanoseconds but their names with the "ps" suffix
suggest it is picoseconds.
They are in fact used in both driver and devicetree as picosecond.
So, modify the two properties unit description to fix their unit.

Fixes: 150b6adda6b1 ("net: dt-bindings: dwmac: Convert mediatek-dwmac to DT schema")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 3aab21b8e8de..14f9683f20fe 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -81,7 +81,7 @@ properties:
 
   mediatek,tx-delay-ps:
     description:
-      The internal TX clock delay (provided by this driver) in nanoseconds.
+      The internal TX clock delay (provided by this driver) in picoseconds.
       For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
       or will round down. Range 0~31*170.
       For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
@@ -91,7 +91,7 @@ properties:
 
   mediatek,rx-delay-ps:
     description:
-      The internal RX clock delay (provided by this driver) in nanoseconds.
+      The internal RX clock delay (provided by this driver) in picoseconds.
       For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
       or will round down. Range 0~31*170.
       For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,

-- 
2.56.0


