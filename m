Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABBAE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eE8E+grBmi8D3c9kMH3BrseGSOYzb2/Hbi9Rf2w2QQ4=; b=bbji3xctV0WGhwv9eVMRWWDEmI
	nzgdXDBTc2mvciCQGcrdpWFFjON+G9lcDgUxnsz0WC9mi872RbL5mO6uao//orc7n1Z5GGRspxq7E
	6GHoKXK+Jn3aoR5g5bb4c9CA0s4+vzevzJZfOc4CNntlTwxGNiboKyJQWYsL9vITuVKl7J8ESQzr+
	/i93d4PUeld70fKOvgdqVZXWo2OspaRBUatmYIhUa9dh7WDbsIXlTSSjktjnMRqSuxv8BvOXH4M7d
	Nl8QnYHmki5dNjUcYgxoZQniIJFPF9K5iiB4cuw0e3y3ls7O2JCZrmjV1sJ7U+24nprQ8XZ0KvrqE
	B6ges90g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt6DC-0000000BZrC-0kDu;
	Thu, 19 Feb 2026 15:45:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt6DB-0000000BZr6-1xLZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D3A760054;
	Thu, 19 Feb 2026 15:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF78CC4CEF7;
	Thu, 19 Feb 2026 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771515903;
	bh=MEZIWk5e9iRnjMniEvcze5MIU7mUhoymJgLFKvBIwxQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cXebsbrTQgF5mniykYiyeGQVEbO8JzzkkCbu1/vbhC8UUO29DXHEehHJiNU/ZbJbn
	 s84RQKoi34A/mhaxJADHAKA3tX3mZEOQxg27ZLkhazft25zKZyGWTPBPZ+18+4bQFr
	 nLDnA4BS79JeAc3s2ziLgUZ6KXZoqdYWhk/nsL4LiVyyCzXq7/Fv6P6w0j20po/S9A
	 A1+9yNB9zn0DxysDgEZFfSioJ11IQ4Vh7uLgRSLleilxlqFs0xA7HmIUePzDkjdaeH
	 0RNxZyNnCuKNDHWw9rmxlpNj658vpdlqfNvgIbR6OOnmzzbxU/SRGQ35pqDWcoKF4y
	 tSKnk2BjIeO1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBFBE9A03B;
	Thu, 19 Feb 2026 15:45:03 +0000 (UTC)
From: Dirk Chen via B4 Relay <devnull+dirkchen.amd.com@kernel.org>
Date: Thu, 19 Feb 2026 23:44:47 +0800
Subject: [PATCH v3] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-b4-anacapa-dts-fix-v3-1-4f70fd2d1070@amd.com>
X-B4-Tracking: v=1; b=H4sIAO4vl2kC/33NOQ7CMBAF0KtEU2NkOyZbxT0QxXgjLrLIjixQl
 LszSQMFohnpf+m/WSG5GFyCrlghuhxSmEYK5akA0+P4cCxYyiC5rDgdphXDEQ3OyOySmA9PJnn
 tvWux1NwADefoqD7Q251yH9IyxdfxI4u9/ctlwQSZVmkuhGou6oqDPZtpgB3L8htofwKSAO+Uq
 rDmZaP9B9i27Q2awI6R8wAAAA==
X-Change-ID: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Dirk Chen <dirkchen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771515902; l=1779;
 i=dirkchen@amd.com; s=20260202; h=from:subject:message-id;
 bh=e6uon8fDwRBTubN8ywUAkYjtYXx6mIWRj19Qi3Y6T6g=;
 b=yPhRCyA6wRLeJlcr0K5q0+OqpgObOJe/AzDQSJiYDKvOW5cRhT9MUc8VQfNRlWLPZMUt0q/EO
 hdK+ttB1juxBEjXrPe59DC/BQLuAYSuWc+elt78/2d3j+BRmO5H9K/+
X-Developer-Key: i=dirkchen@amd.com; a=ed25519;
 pk=NBIyLsVg/YYtGLruq9XLdLWx2PP/1MH4jDDQ1V+7wes=
X-Endpoint-Received: by B4 Relay for dirkchen@amd.com/20260202 with
 auth_id=622
X-Original-From: Dirk Chen <dirkchen@amd.com>
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
Reply-To: dirkchen@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dirk Chen <dirkchen@amd.com>

The Anacapa board features Atmel 24C2048 EEPROMs on i2c0 and i2c1, which
are used to store retimer configurations. Add the corresponding device
tree nodes to support these components.

Signed-off-by: Dirk Chen <dirkchen@amd.com>
---
Changes in v3:
- Reorder I2C device nodes by ascending address (place eeprom@50
  before i2c-mux@70)
- Link to v2: https://lore.kernel.org/r/20260209-b4-anacapa-dts-fix-v2-1-fe446a7038bf@amd.com

Changes in v2:
- Improved commit description to clarify that the change reflects
  actual hardware as requested by the reviewer.
- Removed mentions of other platforms to avoid confusion.
- Link to v1: https://lore.kernel.org/r/20260202-b4-anacapa-dts-fix-v1-1-20d4b0114854@amd.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 221af858cb6b..1502773d9c30 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -300,6 +300,12 @@ &gpio1 {
 &i2c0 {
 	status = "okay";
 
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
+
 	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;
@@ -334,6 +340,12 @@ i2c0mux0ch3: i2c@3 {
 &i2c1 {
 	status = "okay";
 
+	eeprom@50 {
+		compatible = "atmel,24c2048";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
+
 	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		reg = <0x70>;

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c

Best regards,
-- 
Dirk Chen <dirkchen@amd.com>



