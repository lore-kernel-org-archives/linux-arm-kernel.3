Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34605CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2Y8TroP6Edi9Nm16BPK2d+Ft18DrYZbOnLN7bgJn9A=; b=qsoOQwdFzf3kQEaClfs7XXpwE8
	nIehx+5uJa3jyH9N8BYByBKq+LrFxyGQs+SMzBCHt7Ndi6XwlSQq+idIr41+Gu9IxSI8DkQC15rbo
	CfTDLGrv6uxtWPEtgwzU+w7KSVX/aCPdQKC2NkrPkmlFRI3auxWJUcylKt7WCLFKusg9YXb8fzF9b
	YqgDl40d6FB0Z9d83MkTLwn2NVark66TdUJlMIjtW5G55R0vvC3m4cf8XEzhRkQvj3Z3WHZgOKAGT
	Ff8OqpvFfh4YAOUk4jZrPqSuaJ9NyX04c11YtWMy+3/Tmw4oTO7YZg2sWbUk1P93Yhda5rNv13Ube
	s5WEaMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIvd-00000005XSt-3JBs;
	Sun, 18 Oct 2026 04:55:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIvY-00000005XQ7-1AaQ;
	Sun, 18 Oct 2026 04:55:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 184C9447E9;
	Sun, 18 Oct 2026 04:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0388EC4AF1B;
	Sun, 18 Oct 2026 04:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792299315;
	bh=St4QUOnykiewwv5EWmKAgq6LofwIxgwobf+CO8xJ7Cw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EVaZFPguy1CSmuXJVzvtLdcgiUiMUvwA44isfx1jNqnAYgXj9HrYugfgFgakMMEF4
	 kIttJkrC938RlLw6aCQBZknlKI+DJHtiQqmzW2btxAs3ycdOeJ1/HrOsx8H5Kkr6L3
	 TtyEviRoBDj/33EoQF1rUi+6veTRgB48bOMA71K/HnB6gLIEVmCM8oav39xNo7Ldpx
	 57WCSYCFW4E2hNszLy37UBsxdgkyaxX9vle1f3SAABzuIRhQz+Vcb5E0hJIqzD0bNl
	 yp4DWc2IGN6RxKVoGscw5cNFQgUBCe4gn2OJoI3GyhIEVQXxc8h+WREdRtPvCpwTb9
	 +t7o8ANDQjw4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD40ECCF2CF;
	Sun, 18 Oct 2026 04:55:12 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 18 Oct 2026 07:55:00 +0300
Subject: [PATCH 2/2] arm64: dts: rockchip: Label the fans on Kobol Helios64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-helios64-fan-label-v1-2-69a3f96d4efa@iav.lv>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
In-Reply-To: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=8aw4Q5PUDH6ZuJvAmunt0x+2TojvBEPQhOMZdMQFsu4=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlXAnWNvvozNJcwG/2IF53P377q+jN24+aDyi9OWF76Y
 VjwYd2DjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjARpxUM/9Q0si8d+u9uvkTq
 fGi3Y591yt/ohHMNGo0+tbafjjhqcDMybBVtdBKLYUk2kte+/jTVbEHY7alm522eTNvJp8i+KnE
 iMwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

Name each fan after the header it plugs into, so that userspace can
tell the two apart through the hwmon label attribute.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..a206827903e9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -70,8 +70,8 @@ clkin_gmac: external-gmac-clock {
 	};
 
 	fan1 {
-		/* fan connected to P7 */
 		compatible = "pwm-fan";
+		label = "P7";
 		pwms = <&pwm0 0 40000 0>;
 		cooling-levels = <0 80 170 255>;
 		interrupt-parent = <&gpio4>;
@@ -81,8 +81,8 @@ fan1 {
 	};
 
 	fan2 {
-		/* fan connected to P6 */
 		compatible = "pwm-fan";
+		label = "P6";
 		pwms = <&pwm1 0 40000 0>;
 		cooling-levels = <0 80 170 255>;
 		interrupt-parent = <&gpio4>;

-- 
2.43.0



