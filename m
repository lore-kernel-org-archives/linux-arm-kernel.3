Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173D3C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 20:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7lA3sg9Ze5Hg1p9KNTE2Wkxzq7TpBw3xISkEF/MJsew=; b=GFfJOcO8cF1enwgPIaNOap7G1M
	CkxFDnXQkO7d5eCuQ6CXIk2ddZR39oLX6S8urn3glAETvn100V7/m7KVW9kq183NoO252anGHDflS
	gpB21ce9yebg/oS0laFexz1glk1AOuPFbwznF/3fzPNRXDagMrG7kODvB/WM/DeB3kZ97caxmIr7l
	lj3KBoaYu2i1Rhw5zlGfi6hAY8x6CEeEVEoYUiBNbqUJmKr70RIQUwxL+FHGwxpXqHgEH2IfTwl3I
	3EWmS8gAhLpnGK0pfCGTNGF4tw1mzzbdvQ7FdMbiEqw7Cd/qYootJ6nr+3qnL/yCOw9eL4InUAN+Y
	EZN8aXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww42X-00000006mu7-1cIX;
	Mon, 17 Aug 2026 20:34:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww42V-00000006mu1-1qw4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 20:34:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF810404A6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 20:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF8A1F000E9;
	Mon, 17 Aug 2026 20:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786998874;
	bh=7lA3sg9Ze5Hg1p9KNTE2Wkxzq7TpBw3xISkEF/MJsew=;
	h=From:Date:Subject:To:Cc;
	b=UMw59CKpg6oLomoZj9QSbzg3q4Z+FROT8CjN0hS773aDFHCKG/936vJLX1t2zWcQB
	 ZqdvBK3Z5lOM9uKdTYZl3AwuK1gelGw5Ml7TfoCwpfzxz6JcARzz2Xd7QaSDaOqFYs
	 9ZKYD+VPKbcRpC6bUs7cHvgdRwUCLrr37rvE5YdjaTzTf3B7uLal+3JPjz+le8Pkhq
	 qPmDnqMbsQ2XHVH9/lLEfpstoZXrfz7GLOMXF0+Db9r673GwgJiIdIuORy1mO0ZEAN
	 qbviu0rEE5koDYP9aTWkl9kPZ9RPDQDQISNI8wCsQEN7+I22QNRVrUuDM4FubXelnd
	 NEeXMqwhgYHnw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 22:34:31 +0200
Subject: [PATCH] ARM: dts: ux500: Make panel regulators have unique names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-ux500-dts-fixes-v1-1-24379c6c2495@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avErBsww6iuEi1Mx5pNhVMhSHdPW
 j4+P4NQZBIYqwyRHhY+9oKmrsBtdl8J2ReDVrpTfdPhnYxS6C/BwIkEnR/aYPXih95Auc5Ifyj
 TNL/vB9r52O1hAAAA
X-Change-ID: 20260816-ux500-dts-fixes-cd93fa2bd985
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

U-Boot is not happy about regulators with the same name though
Linux can deal with it. Make the names unique, it's more elegant.

Link: https://lore.kernel.org/u-boot/20260817-ux500-external-sdcard-v2-8-ca9a110bd9c6@kernel.org/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index f736888474e7..d4f364ec8685 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -510,7 +510,7 @@ wl_reg_on: regulator-wl-reg-on {
 	panel_reg_1v8: regulator-panel-1v8 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "panel-fixed-supply";
+		regulator-name = "panel-fixed-supply-1v8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO219 */
@@ -527,7 +527,7 @@ panel_reg_1v8: regulator-panel-1v8 {
 	panel_reg_3v0: regulator-panel-3v0 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "panel-fixed-supply";
+		regulator-name = "panel-fixed-supply-3v0";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		/* GPIO219 */

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260816-ux500-dts-fixes-cd93fa2bd985

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


