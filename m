Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFDBC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 20:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4F73MhPknyh6RrkOFfdpIYVBvQdv2srA1Aiavw/rPjY=; b=mc0XbN5LwX6Ra9SqyYeq7makpW
	Tv6VO1omED0faYSf0yGa/EmQucYq3tTksw8G9fbP0OCPUohKhk9xeznpPldpiu6b7wD6QSpSl9tqY
	Nr6TxF9FH39qP3iNQZVQfufYltP9l9ePtiF44jqxy3HeiQNqh5+HI+SrRW3QjRF75SjMNkNecwEce
	YXiJKso8F1GAX0LRkj5w9qqEkd/zLq5hmQpZKqSxp1lzOHYDcIDrPYkQbCvCXVf8PwVXRJ1x6WS1I
	i7GNgE8kAH5tiPQMC9uZFYwMv1Od6wePIPLW9EcwxO5zcHPmXnzRWpNDR6Nd4UDOwxhFkNHgLvtrW
	aiyXTjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6y8n-000000058B0-0t0B;
	Mon, 21 Apr 2025 20:53:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6y56-000000057cv-041P;
	Mon, 21 Apr 2025 20:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268570;
	bh=XxnyUlhOLmgJSyUzXhTEsswDEQueWFydV1G3E4gpjvk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RK4LqL/NA3r/DD3HMf9ARqzI2tJN36zWf5IKjYlWz7ZG5pB/H/smnyLrV1N+PduEg
	 BfxWgb+mxsAwgEFL2RWjurcpHjuFREOjOqYqAquOWPNSmueSiCXwRJhxziDwbYaOzF
	 dAJO+BNzU3w2CBX5XgJoRfmuEuJrKYJO/7sHMn5qwaUVznxdoBiJKyDC3QIZjFx5EP
	 MWo9K0ZlOG2NPmWUWSmQDrrboJFT5xzjHrsB5EsAGEg9vjv/If6D1m084ms/X+kgiW
	 0/EmPOvp4t6n9hBcwOGLgYFVQxUB7qC66EaX0juajfOmpvQjDxqhjRacAZQOv31GBM
	 y6V1Pqfv9I49g==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96AF217E078A;
	Mon, 21 Apr 2025 22:49:27 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 21 Apr 2025 16:49:04 -0400
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
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
X-CRM114-CacheID: sfid-20250421_134932_225284_5DAE2075 
X-CRM114-Status: UNSURE (   8.77  )
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

Both MT8192 and MT8195 have an L1TCM memory, so it should be described
in reg, and therefore reg's minItems should be 3, as is already implicit
by reg-names being three entries long. However minItems is currently
unset for mt8192/mt8195, resulting in it being equal to 2, from the base
schema. Fix reg minItems for MT8192 and MT8195 by setting it to 3.

Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -185,6 +185,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 3
           maxItems: 3
         reg-names:
           items:

-- 
2.49.0


