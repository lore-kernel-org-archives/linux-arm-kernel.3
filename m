Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71053C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD63xWUiken4bOc7UVHKp4kXOXY2WeTmkakYs1rcMNg=; b=OnHY8CKLDFroFXjjgezu/vI6r2
	Alj3SxNUUMVMR6oPOR3pNwTa8jgi4GA4vvNW1TOOcA1GFdu7ZQDwGqHC1/cxnhzpLYA+4TTXGNYot
	eW9tGeDOJSiWrD26jzoXUTenoXDlplOwzTdbRdwGK4o2A9Rrahf3mb2g2SNxFkkB5Mut/Q+GRbH+J
	/BheVZR5/hdI/KtTfnafCvP45SB7bpqLyykjbAZFI87gn2c6345abpmrlV5kwpoyiNWUkKQae/TR2
	IiTypbENv3YZdGWpUJo3rYLRfSeOMrFHDb4YH467CMRuKKxrU2Jq03MBSUIvhUFDIy/xt4JOlaWDu
	9J2fM78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4H3T-00000001XFQ-10UT;
	Mon, 14 Apr 2025 10:28:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GoC-00000001Rku-3N6m;
	Mon, 14 Apr 2025 10:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDFBE4A410;
	Mon, 14 Apr 2025 10:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBF1FC4CEEC;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625575;
	bh=uMxf6PyjUiBPhkaKa+YXG1JpcOgoPD6r+dpLZyFYDyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pIUXq+DKYJunOHquufjQRstJNO2wNOohjDbCQwqFCZHKenOydN4YW9e0pXWmcf1v6
	 wi7oWJZpWFB2AFeJIF+TFz6u0jA3LxFDU9nWiI3StzLbgZDXxPU4HHAg4HrFGPlUap
	 IekDNWLCNvdX93A78whKUEWkABaO8dI7BKrF60p7g+iaPqy1G3W2t/BupWI5yg1b1f
	 jVWQIozTMszyzY43QD0mmaCHCUl03mFwYWNcnpoS1SLFQ/yINwyvRrYy5tctISvb83
	 w8RfskLfumOJ6HvQLvMLnwYVoMAgDs9XOKpfnNmlvRpLG9cfnP99RQ1xy5v/0/7MTL
	 TevW5XZMyCJ/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEC9C369B8;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 18:12:29 +0800
Subject: [PATCH v2 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-clk-measure-v2-2-65077690053a@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=875;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=P5KRner9ELHl3o409yiGCGnkva5HFExJ3rMn3+oG1ko=;
 b=OBeqwNSfKlp1ikH78aflX1hMLwcMKPmgvjsG+/sH9hULhjziPbD6BrLZo0QJOtrtPHjP37N20
 1aTJ/JXfGobCpPe30pfYUiyMIXlkVgDOZFfw9ZKJEiaGMjYHVHX5Qd2
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_031256_883457_AB4D5B84 
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

C3 adds support for clk-measure.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 77c281153010..275afe7fe374 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -22,6 +22,7 @@ properties:
       - amlogic,meson-axg-clk-measure
       - amlogic,meson-g12a-clk-measure
       - amlogic,meson-sm1-clk-measure
+      - amlogic,c3-clk-measure
 
   reg:
     maxItems: 1

-- 
2.42.0



