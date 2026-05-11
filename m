Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBDDCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QkyufA/Hgj2GyxmUk6urE/8+rHteYNCx2KKX5Ay7wdw=; b=unIE3S3t4zy/77KL3UXacZNjQm
	QxU0V19nVkeeqz5B1cx9ezkEu3ISpgYnytrtAldYaFOuc/W38SFQlM6K6tHH5Pf3aFBI0uquBcyzt
	duBotYbV1MyD9MINPGVxZ1tvPG8Muo6Xlfla6MNDAfSgVJS5Eip8axFuaTVuU8oeO7+NvwbszjVjZ
	f4d7lVqdem3KBn5NxnQm5YTXhE+/pEqEKdOpLi2tKwL+A675tyzk3Z/yT1H4DLFJbyFBLXkJHyg0h
	JA34MoNIT1DZHojrsa7fPzp7A2SNvLtLr8E217YBIDIeZ8HltTZ6DL22f8KS6ttMxjJdjVgut436G
	M9gC9E6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNFF-0000000Czv4-1INC;
	Mon, 11 May 2026 09:48:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNFD-0000000Czte-0zVF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=QkyufA/Hgj2GyxmUk6urE/8+rHteYNCx2KKX5Ay7wdw=; b=RJe1Y7ZeiZREPh/GWfP7ZbadjG
	7P0bVdtVZNan8rOc2mF9wVP4iM24jH4lZM6kEbGVHTlNRGwtVPWpJB3VTi0A8F+jd05pTiCsDfXEj
	eHl1ZkQXOxI0+Qk/S2NTq2pQcXJUzFNe8ChXEvCRle3mqsJQzwRiv/so+kOYqXmrehcuUnUFMTtMY
	VB9TLb1Y0bGhTkp+O32+hoCc0W63n7WctViQa2YJ0/JGersuKjfyz4HDpLueT9L7DuhBr/tVuAFPF
	geFtqcsLGaJQwiD9WnJjz+1vqqL+6s7pmb2IHr9oGObUB6HeLx9JLpnNqKXpMgxV8lsf8Neh7ENSj
	6YFcIiIg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNF6-0000000BF2q-2Eo9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AB34407AA;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70B1AC2BCFA;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778492880;
	bh=D4cEEwP+Pw2JC+uqCH7D0mOoSaD3yW1LgWxT8p0r9d4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LoldjdEomdcXhZsTCmbS+yxoyWhyPMpSy4xF0MTG/tlAsQfy1nRzFTP8rSvUFLwuU
	 OvMPu54qeLCV/1j1y//ApfxX2OCwmjBNNPnVjTdSNDF6rsg1lJtyVSSGer3/FxXPhn
	 CzQCBLuNTD2oGyON4oY25lXUxRkxkx7acyzbHKAKR4uAFm9zavvE1yBSlxtTlnZi/p
	 URsAs0TXuU0hn1//BfvC6QhkKlZsWZLfV9KHOb0Cuc3DYxLNB+SGOU3A4V8SkwFLH5
	 GOfsoTDjcKp3e6uCdwRQHLiD2zSG0pCxYewiox1/z5c6HDNxclWFY3dpa6yjQlAWpI
	 D9X0Z8V7b7jCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F08CCD3427;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Mon, 11 May 2026 17:47:56 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: add JTAG CPLD TRST pin to SGPIO
 map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-jtag-trst-pin-v1-1-b0be2f7b2da5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMulAWoC/x3MTQqAIBBA4avIrBtQsR+6SrQwnWpamKhEEN09a
 fkt3nsgU2LKMIoHEl2c+QwVqhHgdhs2QvbVoKXuZKsUWu/xKHbDknLByAFbI5feD8aSdlC7mGj
 l+39O8/t+z6YwNmMAAAA=
X-Change-ID: 20260511-add-jtag-trst-pin-540b7d84ae2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778492878; l=1269;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=bBz3YS2LvMQAba2/yKKCExHR35pJbolOWMc0cULsHQc=;
 b=7eqrmaxmn6l4gBcvbL2EZFv54EpM2ExzQR73yUeUFlCbjQgpzwSnkXTmVVMzLP6g6IACqMNDx
 USyAryJvHoVAj1X87q8+El6BZfM90iU21bwytKBspw7Ok3OtcRg0YIX
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_104805_910468_DA412622 
X-CRM114-Status: UNSURE (   9.69  )
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Colin Huang <u8813345@gmail.com>

Add JTAG_CPLD_TRST_R_N to the sgpiom0 pin name table on
Facebook Anacapa BMC.

This exposes the CPLD JTAG TRST signal through SGPIO,
allowing proper JTAG reset control during debug.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Add JTAG_CPLD_TRST_R_N to the SGPIO M0 pin name table on
Facebook Anacapa BMC.

This exposes the CPLD JTAG TRST signal through SGPIO,
allowing proper JTAG reset control during debug.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..9a43e0c87257 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -882,7 +882,7 @@ &sgpiom0 {
 	/* C0-C7 line 32-47 */
 	"RSVD_RMC_GPIO3", "", "", "",
 	"", "", "", "",
-	"LEAK_DETECT_RMC_N", "", "", "",
+	"LEAK_DETECT_RMC_N", "JTAG_CPLD_TRST_R_N", "", "",
 	"", "", "", "",
 
 	/* D0-D7 line 48-63 */

---
base-commit: b333a0f1c857411d83a02aa6f1d9ecc7666d6179
change-id: 20260511-add-jtag-trst-pin-540b7d84ae2c

Best regards,
-- 
Colin Huang <u8813345@gmail.com>



