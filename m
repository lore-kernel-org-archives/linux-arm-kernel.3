Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE0C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFbUhcP1yG+C6Sjb9tSAjq+P1Y64NNZvAIAF95OJ7Qg=; b=oFXbY8XQhfzoST+gV8DaM/Ifxl
	AAZPeOPqpH880pKbVII2oZFHteUFYGDIcS4mwtQKcxCQPXbAq+8UhlDCEVjvXNvFseWXKg3/5tiUc
	GfJzMSnN/c+3rbVw3q3d3Wui2hNqkUToZLFuy/30b5qJzs0wnsh2jR5RtFxdMbfObDedqZQuWIwkA
	o10Gfde3yWTbXXIcps2hn3u1ODJy82f7EZt/8h487RJd2gFiXcY2ajM4zfqgpCgtbcMhDbTzDiQDV
	NGZf5r49EoFHGDQjPHwOaTG9I0zEN653ShLh+KrexxlF4wNjkJOg3ZIZMqVJO2pa3mmpeqwXsyR/v
	SVXyWArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3E1O-0000000Dq92-0T0b;
	Fri, 11 Apr 2025 13:02:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dih-0000000DmYK-3uzH;
	Fri, 11 Apr 2025 12:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1493F68464;
	Fri, 11 Apr 2025 12:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7E3AC4CEEF;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375374;
	bh=DZyRArmWU8s8cpsbvvv3MxtnXSt/PgZtZ7PMgCXwnnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DF+E9mfN64zBObj5MIL8G8llGD6eCZiuGsakKeXWPoX5ZCsGUI8I4sIpMmrTqba5V
	 +T7kxvC9Owf0SI5Tyx71gN5koDlwfSHhNl1tYcTm46KV5a5oEdEa3Q5k60yVJaKXoJ
	 7HohLLroq5UgS96/xDvIr/iwQ6b8tR8GuTP46AQeA8RCX2wPv7NnjmydtcJvPFV04n
	 jmnGkHb6iZynzHy9Nwn12HBfgACWyrkzNd2cvy9DHUrJUdT+wZiGjfETic66f1Dw5h
	 4nj3ySWd66BiMBHNt+tcIF0xmNI8yzNIQhdPtapKmVudSma4afSkE55TyRTAKRnd0W
	 HlzvC1jmcm4Bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B4BC36010;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:45 +0800
Subject: [PATCH 3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-clk-measure-v1-3-cb46a78d019a@amlogic.com>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
In-Reply-To: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=821;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=vEn+4e30XPbCJq1TpYY2Gt5BR+VfUFjl4ByVSq+jgb8=;
 b=Oi6fBD/SLZ5wm+N47Lj9tWHoLvpG6hcGTSC+/O/DS5EAZFV/VDgiG8QXP93r0VNg8mw5C1E/8
 6PHFe3CaZS2D77cIlDjyYEjhplrY/n/WGrrxx3xq2e2X4jOFI7znOsD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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



