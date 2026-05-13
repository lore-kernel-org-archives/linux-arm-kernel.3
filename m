Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754F2CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IRY/Y0RfmmU16CYpDfV7ZN3tXZtE9FwMN1uSgVTwp8I=; b=lROwoFnKj8mCUM
	VlWokYtIAuDjckn7s+9ao82OhVBvgUm+XVwbcGlSBRBu2tiyVvqWLzlG4lzTzoVEMzQaqrA08YJyA
	44VkZ50EDiFENCd+i3RNvEduj85qEaE5gttT4hZnopM1MAiaQLZ4sZVGaCR1UJb5v9ug4ySpxtCjv
	I1A6YWffJanQ7BAfar/6YpGLoWqonNyLnsaqitZrLGt2/Z/GZTl0ytN6w77jU2NG2TDmpIK1uEQaB
	4DpTgusYD7ADf9VPg0l+ZBUBtlWl6bSNF+rkBGLJjpreLZ+JIPFKtS7w3GK1bhoYAOa2dkjDnYcEU
	Hsa+SZdczOv7AZnu0bzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF9c-00000003Z7V-2b7f;
	Wed, 13 May 2026 19:22:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF9Z-00000003Z6k-3MoL;
	Wed, 13 May 2026 19:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05E7341914;
	Wed, 13 May 2026 19:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66682C19425;
	Wed, 13 May 2026 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778700116;
	bh=dsUv5jcnn03CHn9iwYpTRt6zRlnYVPtybAagqBvQ0Ys=;
	h=From:Subject:Date:To:Cc:From;
	b=ufwjBWDHUqIb0PMGbCUI+wjrX7xkaspwscotkC8pxFwUejRCfj53/adt88kl3U0CF
	 5LNl9Qk5uFDTa6xGi12JpZBZJqKHGVNn/PCQjv6UcbcGrO7+pBaoqbHgv3xLwq+6Qs
	 N39szS+ydDPswexX3PmdHPeslM8qycEtp4NfcTAM2A6EyaOetOa5ycXr8JIF11Hqut
	 Xm3wSdioT3YcrHMiqMIZNw5/CYus+fqQF2dc/cVh9R8rEkwK+dineZSZIn/bxx1wDM
	 sB4aslbx0hdOinkWyomyBS8Vj06f6fH6878flYruXmMXSi3zHOsNuUcaUdYbTuI3XI
	 Uonj7rHyH5XjA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 0/2] Introduce Airoha AN7583 SoC and AN7583 Evaluation
 Board
Date: Wed, 13 May 2026 21:21:35 +0200
Message-Id: <20260513-airoha-7583-v2-0-ee0d82b37ce7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQrCMBCF4auUWRuZxEyNrryHdBHt2A5KIxMpS
 sndjV27/B+8b4HMKpzh2CygPEuWNNVwmwauY5wGNtLXBoeuRcKDiaJpjGZPYWesJ+dbDB5tC/X
 xVL7Je9XOXe1R8ivpZ8Vn+1v/O7M1aJhij4EujgKf7qwTP7ZJB+hKKV/b0+xJpwAAAA==
X-Change-ID: 20260509-airoha-7583-145246084016
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_122157_872093_0BD48F9E 
X-CRM114-Status: UNSURE (   8.00  )
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

Introduce the Airoha AN7583 SoC's dtsi and the Airoha AN7583 Evaluation
Board's dts file.

---
Changes in v2:
- Fix RAM size for AN7583 evb
- Remove unused properties in an7583.dtsi
- Use ns16550a as compatible string for an7583 uart
- Add airoha,an7583-wdt compatible string for an7583 watchdog
- Link to v1: https://lore.kernel.org/r/20260509-airoha-7583-v1-0-e5ad085b258e@kernel.org

---
Lorenzo Bianconi (2):
      dt-bindings: arm64: dts: airoha: Add an7583 entry
      arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board

 Documentation/devicetree/bindings/arm/airoha.yaml |   4 +
 arch/arm64/boot/dts/airoha/Makefile               |   2 +-
 arch/arm64/boot/dts/airoha/an7583-evb.dts         |  23 ++++
 arch/arm64/boot/dts/airoha/an7583.dtsi            | 133 ++++++++++++++++++++++
 4 files changed, 161 insertions(+), 1 deletion(-)
---
base-commit: e6490a169f6d5f5bdea7a2e8a673890d43afadc0
change-id: 20260509-airoha-7583-145246084016

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


