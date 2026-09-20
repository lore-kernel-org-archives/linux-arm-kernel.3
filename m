Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31271C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8kIfjDOH+vb1HRu61bKehD9zkSsQQ3ILjlVHNmQwl0=; b=YMURT2FzHOA32KNDHs8eqWvoqC
	FtgiR+qpfqgRlif49Ak6DFnZXzNpVI4Ee0XtgwFz4TQGfDyboLjsvHCuCxbvGdtkAcJwVMwXkEMt2
	PDi0t4zJOpMgnDtZQA8zlBUxcPjAI9uPQzY+97aMZzgvveNBvGD7kCMlBLpsmSQYjP2l1FwfLovHC
	FRauHTuB9u9R+E473x3U342Z7T5qvrswJ4cQAn+8sH76lNCV4HoO2HzBzWfGs2qQhpJIX+3VJT4os
	VZKyhTquT5Ixv/+lB+t/ZsZceXKqxiBfQfJLBcvrd4EQQzzCAHzNG4KfM2GnbnExWtlEjx3LNQMRc
	qy0mqt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Eje-0000000HFcm-0BvO;
	Sun, 20 Sep 2026 10:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjM-0000000HFPC-0pEv;
	Sun, 20 Sep 2026 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94CE8447BD;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7643BC2BCFA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=mLj7YUC9Fm6rKKu4LSYfjTh/ywFy6caKOyKBr+t9m/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F4SRpdN7Zvpi0iY1lQDmu2AEV2ShUTMe1K9hnRqunOE6CZq/fA4tl0qzFrGAZxvga
	 9//zhbf4wuT38pDm7s871lci603W3v0S6ENWmKsg0mXvyH8ZGcerS3Xlv6TTceivEE
	 VaizsvWJuj7y/DWyoa7lLKAlYW2oEJX616Y4jJWsr4PbyXn7egymeBwA2uoeQ4KowZ
	 g3GAY4GrbaG0agKwAFU5icNiTW0TIi3bhOOcQDBSCQL5/bE5pUF0WrtPIu72phuREm
	 oFQFjNC+IY3TC4v7Y8TzIRlXm9rgcBVJV9saC1duRfubplkSano3/A9Icvd1MPESkI
	 5Ex42z+otLGww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64086C982DA;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:10 +0800
Subject: [PATCH v2 08/12] arm64: dts: amlogic: a4: Add clk-measure
 controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-8-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=797;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=wRifO0cIF3hQCIdhhi4prrj9RKNwhA6uX1mJAaHO3Ik=;
 b=34vRqi/pd6UVz90Vtvp45zfx1ThvzN4OBgfrH5k//2lnQcFQqK4v7JpBTKDLtlCsxAJdtSs9T
 0lMipt4YCPJBntVi34HwlATmjeYXIi2ykCkQLS3eBOicDn/+ZG/4e98
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

Add the clk-measure controller node for A4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index fce45933fa28..762754b33f23 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -207,6 +207,11 @@ gpio_intc: interrupt-controller@4080 {
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
 
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,a4-clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+	};
+
 	ao_pinctrl: pinctrl@8e700 {
 		compatible = "amlogic,pinctrl-a4";
 		#address-cells = <2>;

-- 
2.42.0



