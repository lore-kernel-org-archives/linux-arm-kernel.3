Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4182CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NLh1E95H4l7QuioBMWDkuw4dCG1aGZnHBLEVB+RvnU=; b=U1sGvpgOuTiiWykZWnNX/xWlJN
	yqslmFkEgWoMwBWFYTpGFWiJnL9Y6w0S1i+evPzboV/0TTmpt1OlA6OpdlpwizBGC4WROAu1iAZYd
	Im35p+upNm/3UygRCmkfY9X53UgfRDoXBTiPCEfITK7lsO0ei7BHmErfy9QR9ICWk2phRp/Al9xOy
	uu5Tfsmz9UIVB+0VmU2uIywOr8V+gmCBh+vu1r7ipG66qerAH0pjrB5OGAtgvHqPxFYNBhxbEHUio
	yVmLVcokR8ECa9VWUZtNbgmdLldDY/P7KiMPXfF+x8Gli9SXu1HeEC41yGH+arR58lkmTpk/n+v+M
	4ixaD14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrDT-0000000HaSi-2TNc;
	Tue, 12 May 2026 17:48:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrDR-0000000HaRo-2Wnm;
	Tue, 12 May 2026 17:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12E1260129;
	Tue, 12 May 2026 17:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9E5DC2BCF6;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778608100;
	bh=yzhiuLK/wwcykh5U1JFLwd/q+FY8atYPjgq9u4+qZks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h2p3tdPPiBxd4jfwp5pf4CGb4gm4BX3HMBXI8IgvRMjKnd5n3CWSKkfgYerEHo+AR
	 1zu/4AX2GawWwKLB2frIT8Bjh/WITgHmJPZrlBKMOO+3/lsiWDXtxty0kv5f3CRs5U
	 ooEt0/Chv1XCg0GEPkCKqT1WR1No4h4riMKppKQ0WM/OarMyjTU0dOE4hR9ddN3Nov
	 X8Bmt0xLp0ZCauGOvyVWr3rVrK6XSq4V5yAf/6yfnd9DvFGEhWI6NgnRw+QeglxB2Q
	 MUW/qjvFlQqeFy7DRk+w9zefKoJXU4HUbStxH4gKuAYJnkdmItxTwJOLqxvL7YVahl
	 f8z3V2WpBUrMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A905FCD4F25;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 12 May 2026 19:47:28 +0200
Subject: [PATCH 1/2] arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
In-Reply-To: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Vceb+Rx57Kg52Yl+xM01/jcuRqzhC1zMhtRZU3GpSrg=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZz+oM9/rIHYgxu7G+yVuoqFlDmfPno/EeN/ov7/ot59
 X/6zzS1o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiI+GlGhqkicoyPj61ZFWio
 +TQ+5qTCFd8COxf/nVLZbzKumZ1kmM7I8O9/UkNpaTBvvkTtJdavt1YmiUhsdvzZWKyxViLuqoU
 GJwA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The pwm_ao_c pin node was incomplete: it was missing the group name
suffix, conflating two distinct pin groups (pwm_ao_c_d and pwm_ao_c_e)
into a single, ambiguous entry.

Split the node into two separate pinmux entries:
  - pwm_ao_c_d_pins: uses group "pwm_ao_c_d"
  - pwm_ao_c_e_pins: uses group "pwm_ao_c_e"

Both alternate pins are not yet referenced by any peripheral node,
so this has no functional impact on existing boards. No backport needed.

Fixes: ee6e05a49b93 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..62f6b9baad28b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -400,9 +400,17 @@ mux {
 					};
 				};
 
-				pwm_ao_c_pins: pwm-ao-c {
+				pwm_ao_c_d_pins: pwm-ao-c-d {
 					mux {
-						groups = "pwm_ao_c";
+						groups = "pwm_ao_c_d";
+						function = "pwm_ao_c";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_c_e_pins: pwm-ao-c-e {
+					mux {
+						groups = "pwm_ao_c_e";
 						function = "pwm_ao_c";
 						bias-disable;
 					};

-- 
2.49.0



