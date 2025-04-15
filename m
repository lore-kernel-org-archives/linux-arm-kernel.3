Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF338C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 03:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4C9gyr7siZ0xEY4Hy2QnkKs2CQg9nQZqfR0oirdMTNQ=; b=syvRylnEk6L2OUN+qg4NkaRFyN
	pF/nLMqi7S+t2iTnzaCg7Knp5gxjLxHh9HgIYL+6gJUSQcFcJm8qhRAjcvcmP6IpcuSgUQeEw/VQU
	2BQOgpWVk17GPu0T/8pj9GcvpjwK964lisd48W8Ho48jzsS+fkZMzQYW43Ec0wlxm+EjQK3FAH3kO
	ku8uWewrOfhCxXmfIrEmq9dbjXOwJ2lTjaijxuvAAQku4r4Yn/tA3krZlqHdxLGVnoZhnGwhS57Su
	HSn5KLpwVWBB+wTn2ek07/b/ekVjk0J5aYxQ/hIKP+m1+O+NcjUl4etnz7+LF9NQJQAAsoRVT+GkB
	xm7Txobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WXa-00000004GV5-0D4m;
	Tue, 15 Apr 2025 03:00:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WJD-00000004DRR-1gDA;
	Tue, 15 Apr 2025 02:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22F2AA41451;
	Tue, 15 Apr 2025 02:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E64ABC4CEF1;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685158;
	bh=75keAXRMnoUm3nWjp9JCjWhNFcUePI50VoUETtE1kCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SR00pwcp9LgUcNzvz+70649JT5PGeuPxs6DQLzpijiL4Lg8/zQIia3Pie1JAlyXiw
	 s59u5r43Lmn7xqhd45woDdbz2wC+A7nmprW3hhpeOWZzwCcyJ6gKCFpQ/9FzSvFQnr
	 sLAK+EzqiPoLywnO1EYAlfhN+IaUlAYp/J8mHsaLQIbZa3hxmITW8WXJT5DPMCzwbj
	 gQaQuRTAaeBo6DMGMr6bZZWt4t6c43MD4lR3eJnnU0eqrqNKbYRIVycEpr9BmDJGY/
	 ZvZs6a0G4xL8sP3g1rBxO4swriaLPTG5kktXZe5SpFea+vzBUYkctXeiwY1WtnzVJv
	 Ds5zomc1aP0pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79A9C369B4;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Apr 2025 10:45:26 +0800
Subject: [PATCH v3 3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-clk-measure-v3-3-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=868;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Bv5Y4DpbmiEYh7fjv0Fc7kk2ovIc05XnT6FwbcehZ6c=;
 b=w88IzP6gAbA3az1au7kmY/Stty3NwkvdEmCsgj+oCuRXQV+ilieQMwlv4fHg53IaJrtql/vwN
 uxHZQHA18F9Bf5GYJ98y7H7f6sRAwslBL3LgZFkKiG9INGoVDtaDc2I
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_194559_495313_8B8AE637 
X-CRM114-Status: UNSURE (   7.36  )
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



