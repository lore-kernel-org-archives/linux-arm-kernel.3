Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1518BF41992
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1ch1blOm1o6DPJRORFJSiJyfZyDi4TTUxZitPREm3M=; b=WtSdoj+XcqTsKVcnnw6XkzfaLS
	VO6wWa3FZnaXrQAecud6CxZ1yMoQxpR9NhlBmoxOJagVmuwdaPaBt4aMr58FZb/E8GasD09SQjxQk
	ebiedaUv4cgvhHeks83Vw/61U3qInz6R0pBJ80sOf4HyhLZ5flFc+FGKX98v3iePxF3jE4/v/aZcv
	wIuEq/uSPgCGY48yN4W4G740UKIeksJ7VHFIAztiuEkZyzeqe0gZFYBqoQ9JfSfxvE64cl11vBHkW
	GvvsyHJ1M9ItnWAEVJZTcpnyzXOl/20uSVQcG/A48h0ZuKnAoDoETGdJzywCjdSuL4aCu+cxMIkTR
	yK2ayY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyF5-000000011tU-3O2q;
	Wed, 15 Apr 2026 11:17:11 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyF2-000000011rs-0WEX;
	Wed, 15 Apr 2026 11:17:09 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776251823;
	bh=qMIfF/SxnQytgGkQqO94DbvHup+0cklo98SudTS8yPw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DZGOUubqY48BE5DE4NSGXuy0KjCm12IVJiUHeE23SfHRt5I5SASEERaeKpexL/2F5
	 lFtx4Zg7hS0fr5QxrkzJeSNHed/gkkqdO0frkjFFFuyV5vUkz2ygSkYwV0dKeBtMFw
	 aXyLp4MDKSPqh+f5kavEZu1AjFGAxSayI3wRPOlc=
Date: Wed, 15 Apr 2026 13:16:13 +0200
Subject: [PATCH 1/3] arm64: dts: amlogic: t7: Add uart_c pinctrl pins group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-add-bluetooth-t7-vim4-v1-1-0ba0746cc1d6@aliel.fr>
References: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
In-Reply-To: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776251821; l=985;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=qMIfF/SxnQytgGkQqO94DbvHup+0cklo98SudTS8yPw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI9QChe9IBXcowqK82XGlhXqzELbPJqkbqYXP7mDt/LRbX+IQpkuZnKzzwOoIlVr9ZKHql+yzze
 FHe8ph4iHcQM=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_041708_598793_18A6C94F 
X-CRM114-Status: UNSURE (   7.10  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
in the T7 SoC pinctrl node, required to route the UART C signals
through the correct pads before enabling the controller.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..531931cc1437c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -553,6 +553,18 @@ mux {
 						bias-pull-up;
 					};
 				};
+
+				uart_c_pins: uart_c {
+					mux {
+						groups = "uart_c_tx",
+							 "uart_c_rx",
+							 "uart_c_cts",
+							 "uart_c_rts";
+						bias-pull-up;
+						output-high;
+						function = "uart_c";
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {

-- 
2.49.0


