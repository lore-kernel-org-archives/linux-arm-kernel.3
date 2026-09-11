Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA36C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KIoS8Wk3aO2W56jJdGPN5s/0bYew7FSDY+B2h6y7nI=; b=3iNQxbqAl1XdrL4scHiIikOqsi
	5OkN3Ef78aPZbp1onFHGdW1wjkgxlCEGpGU6Xwh70y9W1vRjhweQEnuz3Gf9RZPZIHjj//6CNydjB
	uDf4/QcNhuSzh1wHz/s9+bTsWljLtpnwHr3bla5a57WrLtQSmYUya3xH6IRjrpH9zY8/IrmHFWEco
	t5GbiWB86QrLhwvsM37B5OqAOZuood02AaYlH/BfP/joA2CO9HsJMMui/0FGrmAEZtSppGN2IIVt0
	1VgXFAdVfCALM5Jhj9qPPpX2HjDtoib3jiqKojatQ0TXF+fAOwSm1P8zk5z18kxtR3QdIN6AHkeYy
	kJUt5oNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4upg-0000000FwT9-2A4f;
	Fri, 11 Sep 2026 06:33:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4upf-0000000FwRV-13Kb;
	Fri, 11 Sep 2026 06:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 363C643E19;
	Fri, 11 Sep 2026 06:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3056C2BCFF;
	Fri, 11 Sep 2026 06:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789108433;
	bh=HmXNcA1YAnZLx3RPO+XZdE0dPg1yJCRKOMe6ArOea/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r/g3ckjnar/MDHt+ZqIrsuDZhWgjyXrV636yYh8ZfnFuQ+xjkGqFAf6U4iTCJKyBp
	 qBqXav3n+bojCQgciefQfjjHABg5iN/4Qpx+IzcXBdXjCO0+eKw2RXijySd+FG0mUm
	 iBp1xc9NmQJkAG4APYT4+YtVXjgMdFRIqjPA04Ruj3w1YvBMVd4n6OU+pOgCrJ30vZ
	 NAaZhBJHfrQxo0/N5fUChSS81LZrKwAVdKgVPU5NYQQ3p724nXvaGftFv4vrVT5m5/
	 gSmGy7QHLVRaoC4C9gtKfUTLWjkU5orkgB4nfdiFsm1euRcZOuU72qu8KNA9z94VpV
	 sXlEr9N2gAlmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BD8C88E50;
	Fri, 11 Sep 2026 06:33:53 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Fri, 11 Sep 2026 09:33:01 +0300
Subject: [PATCH v4 3/3] ARM: dts: mediatek: mt6323: add EFUSE support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-mt6323-nvmem-v4-3-626dd17531dc@protonmail.com>
References: <20260911-mt6323-nvmem-v4-0-626dd17531dc@protonmail.com>
In-Reply-To: <20260911-mt6323-nvmem-v4-0-626dd17531dc@protonmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789108431; l=757;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=8n+fwUrTUb93L9BoRmKvxttEJdPZMxj+kOtwP+JsFd4=;
 b=CTzhpfAQ2JrxbDwtDeNSwlTRehA3OG/8+Wj29z/uu4TxNqsytlxToaaU8G60P12k1QN0PH0nW
 fFhYnVZ8CFACnGdt3jae10uvRf8zfys39SxRrT+lwb1fuar3urSgvns
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 efuse.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index c070f4b0936c..c2d08d29cee7 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -19,6 +19,10 @@ mt6323_adc: adc {
 			#io-channel-cells = <1>;
 		};
 
+		efuse {
+			compatible = "mediatek,mt6323-efuse";
+		};
+
 		mt6323_leds: leds {
 			compatible = "mediatek,mt6323-led";
 			#address-cells = <1>;

-- 
2.55.0



