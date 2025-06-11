Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C591C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Svtp/gqx+lO0g8v6x3s/QjhEmHg1WTdpg1DxAvIf74M=; b=jXHxhvW5X6ZvpP/GwoxToKYJqo
	OegLk3EW4z8ipNLKuct7MWfGHq59geGHhrpF+lf/4LOZRIS4PfsnpdKbOvda0pBWbuBhK3eulXU2E
	FkmORPz2LpkxnbrSohdglElFdcD3ilq0Lny9sW2EbWp8tRelk+uvWYBEhhxtoEqz0MAMDJ55Kmm71
	Teq8WUHAksnqtJKA1b7ps8UYOaQrzlWRwSAebKJcP/XqnCBsBFwvnoys3SzE8f22E5C2zi98JODlm
	2f4lWbe64FunXkJXjOF3uE1lY+97E8n61LRUHzT5dxLM4GCqMPGBGJ7M92qQB4gse5hkeqqjlrvxQ
	UgYrt4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTqp-0000000BStx-0YrM;
	Wed, 11 Jun 2025 22:23:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPS5m-0000000BAWV-1XAJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 446EA5C554D;
	Wed, 11 Jun 2025 20:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BF47C4CEF1;
	Wed, 11 Jun 2025 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749673835;
	bh=T6MQUq+5csmPuEPWpE+uUchnp4jTFEZuMy7pJ1JdciM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=S5GCgIDdqwW5uQvwOOOGjyKNhlM4xrU3CjO6NpVsLLJEFaUU/LVQwWmgXGpQ4NCPb
	 eQzXs45T4jXhXz/6TRTtnK61ELFNCMd5lLNkhwBlKpzXYeWmEflM1paUlzXujeqzFx
	 BhrhzyQiOuQdAxwFmJHrI9FUXRk3HPSitfphnUoQexG83Js3tXMWYU+z8pFxDyHmt+
	 Ev9cc1NSwlLRl+Hj6k6LClzwF9uhkVd7LbIpEO46Yvm9kweX9kXYk3q20IssQ0Y5FL
	 46TzQJya+ay0U9NTUe5yuTrOwz6D0xOHbolrhtIR6DOmbJ9gsdEJNNooq+v/3SLrX4
	 CQd0AUnzcu2iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECEEC7113E;
	Wed, 11 Jun 2025 20:30:35 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 11 Jun 2025 22:30:31 +0200
Subject: [PATCH] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
X-B4-Tracking: v=1; b=H4sIAGbnSWgC/x3MTQqAIBBA4avErBMaM4OuEiGSUw30IxoVhHdPW
 n6L916IFJgidMULgS6OfOwZWBYwLnafSbDLBlnJptKIwoZNK+POaKz3K5mbJxZOYSNRtbImDTn
 1gSZ+/m0/pPQBKqY7WGYAAAA=
X-Change-ID: 20250611-arm64_dts_apple_wifi-d415214723e6
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=wHLTjbA+ZQtpL0eNy1zcPArF/Oix96dlxYfH46ebBpY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgzP51kRH8Mu3v4jEB23riR0deCkgE6+c2cMvr65PcVSe
 0ccb9X0jlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABMJ2MzIcLts4jqju75O01+L
 W7AzLZr3XaNW7reybOvtzn/v4/9UeDP8D1O7tNy9eNnCJpMtf/9daq65scqR77nMzOoP0rJxOVf
 4GQE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_133038_500367_ED696844 
X-CRM114-Status: GOOD (  10.11  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

Fix the following `make dtbs_check` warnings for all t8103 based devices:

arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: $nodename:0: 'network@0,0' does not match '^wifi(@.*)?$'
        from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
        from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

Fixes: bf2c05b619ff ("arm64: dts: apple: t8103: Expose PCI node for the WiFi MAC address")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 8e82231acab59ca0bffdcecfb6681f59661fcd96..0c8206156bfefda8a32c869787b2e0c8e67a9d17 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -71,7 +71,7 @@ hpm1: usb-pd@3f {
  */
 &port00 {
 	bus-range = <1 1>;
-	wifi0: network@0,0 {
+	wifi0: wifi@0,0 {
 		compatible = "pci14e4,4425";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-arm64_dts_apple_wifi-d415214723e6

Best regards,
-- 
Janne Grunau <j@jannau.net>



