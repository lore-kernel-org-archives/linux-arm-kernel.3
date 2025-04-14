Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E574C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4C9gyr7siZ0xEY4Hy2QnkKs2CQg9nQZqfR0oirdMTNQ=; b=geUsU13fppt7WxmLJNe4uG1u1h
	p+NA71Pt0/e/Fd7pDi2LFla1aiQfFe7xZL/LtvAKGPoPo+2zkH529jGeiJflK7rddoD6vrU2X5yJI
	jEhf5YCYmGwtivZ4OgNteK0GZ7p63PgryATocuWwdlpa0HzqSagYfXZjuzYyD36KL7NnorT4lmlxu
	7yR5ICpUJxwchPCaIMDGNlVmwpmC5VYJO9DA4apyvfQ58XHZDpOQO7Fh2jkVdqudvtvHUcJ8WbJ7z
	OBl3fGHCdUV9YvCEXzpsU2pXJlQdEy6COWOfIa8F5+cYTc8qkTt6iwOXMQY1C7B+Ir7VbWTimEml6
	YMoTYN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gxn-00000001V7E-2DTy;
	Mon, 14 Apr 2025 10:22:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GoC-00000001Rkv-2kCt;
	Mon, 14 Apr 2025 10:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B1B94A571;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6F8CC4CEEE;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625575;
	bh=75keAXRMnoUm3nWjp9JCjWhNFcUePI50VoUETtE1kCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h79SvUhpxexqgyIMLxxDjXR9Ue7ikBs5MMi+HAT/F61BOT2gAed5XLssj8vTtZZ8x
	 2e+1T1AZm+ItaLqu4KwDif44gX+C/I4HvW7RVQAYqmQCnHrNMT7Fmgpj5S+5ZKrL5W
	 NbQvIKyOTgsPCwi/f3jM5Lucz4eAEDA9wOGBjJLKP3K62RcOkZFmxnnl0V0oEd38VE
	 bwnWREA81nNJpXpDDGQ3wjxu/fyjTncU6m3XHpg6DTvXnMkCx3a7gxncjktOK9O8Eq
	 6j6I3Px7OaDG9lWw0g5PlLytM44pERdlf58xxlR2ceIK5RT9IDhrrp4xZwjp7abGku
	 25Rb/JhC/2vXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F18C369B5;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 18:12:30 +0800
Subject: [PATCH v2 3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-clk-measure-v2-3-65077690053a@amlogic.com>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
In-Reply-To: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=868;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Bv5Y4DpbmiEYh7fjv0Fc7kk2ovIc05XnT6FwbcehZ6c=;
 b=5MN7KmLfAj+nB4Y5624uTR7Cw0B5gifagMJGUugs2I5NWLbXhV5LZLPFeNIFM+GRwSb+IW0tQ
 ZkBf0C+mdWnDahWec+EGuf7p6pPd9W9TGu8CWl4atQ27TvqRVgjxCns
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_031256_718973_12F6EA1C 
X-CRM114-Status: UNSURE (   7.04  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

S4 adds support for clk-measure.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 275afe7fe374..39d4637c2d08 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -23,6 +23,7 @@ properties:
       - amlogic,meson-g12a-clk-measure
       - amlogic,meson-sm1-clk-measure
       - amlogic,c3-clk-measure
+      - amlogic,s4-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0



