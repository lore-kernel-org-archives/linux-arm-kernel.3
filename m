Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE13C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 20:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31SrRjWAj2BDddLiiFHD9HK8pr4j9zpCW7h/BQy8z5I=; b=StoWdqy/TZm40NgHQDc9DtYqyn
	BBHVsEnkpob9vaBcPnHW8QAwWnl0oR9nifRafdjokpqR++xEx8eLILzTxzqaYungqkN82a5DW6dBW
	tdDCXcio+loD3WbB7g/We5IeU7m5d+egHY2ROjWeasoRwMeH2P9AsRw4nIHgYS+GFo1bwyh4bVxI9
	if0iZrWnOMT5XIxqxCaMxZvcVKoENbpawUIbuUftvtKU0LZvtCU3iSJmnDD6hEadcjiy7y8XNXQww
	iIeXm4BfvrkL2llNCPz2Ke6RDBRskFyReNuf5WwC9K3G+kOnIazcj31RwZxkcli6P6sT3cW+yDrdm
	8i9eJTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yCT-000000058Uq-23Li;
	Mon, 21 Apr 2025 20:57:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6y5C-000000057e4-1ieE;
	Mon, 21 Apr 2025 20:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268577;
	bh=tApRshAmb0IYmM2jaD30rYtdVz+5r1FcnHKRAmrj+d8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZNVnHPNYmte6L9Udo7AsosNFHhX+JQKq5HCOfOgEsiIOTovxNRQ+ALMssLwxEisN
	 zRN40sVQQ75iZ5oF2jo+6WU3TcaO2XsYquca7goIXauDU7HiEat+Gd0tZ1MVzXXyHU
	 xQ8QvZSrb5MXTXGRzs1Jlt/6KeAV0wXSYfiZPBm4zWODqDlei78d5rBPrCqHv+gU0Z
	 i/u7zm1lrWogaf6036ZTuEyUIsRNP+IKQO9mCgSxqKWH2MC83mGpAaTeU4YzqH8GAy
	 naF7vBNuDnqIQ1hm4ZdmlHly9QgwQbGgyuq9qyuiKqspk4ZIgJSan0G1Y4KgjhskLL
	 FNeg4ZFMinH2g==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 379B117E0F93;
	Mon, 21 Apr 2025 22:49:34 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 21 Apr 2025 16:49:06 -0400
Subject: [PATCH v2 3/5] dt-bindings: remoteproc: mediatek: Drop redundant
 maxItems for mt8192/95
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-scp-dual-core-mt8390-v2-3-c84117a959a9@collabora.com>
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
X-CRM114-CacheID: sfid-20250421_134938_588461_E9F20C86 
X-CRM114-Status: UNSURE (   8.11  )
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

reg's maxItems is already defined as 3 in the base schema. Remove the
redundant assignment in the if branch for mt8192/mt8195.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 04348cfcb0424dc78ff1ddd77665285a052925e9..82c7edd5a2fbb8610315881a4033a3a43198162e 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -187,7 +187,6 @@ allOf:
       properties:
         reg:
           minItems: 3
-          maxItems: 3
         reg-names:
           items:
             - const: sram

-- 
2.49.0


