Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB79CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yU6S/B5YSuFjUzOAk3D3lqxy8VkNJeKY4jp+sDjgGZI=; b=Wq7dcPdmalqxDz
	vsu/kASaRz9tE6K77ByZA1pNPjEtkYVNxMsJ9xGSX47MAn9gkNnzx/Wb4hlc/MEgbn5i9EeP42WO7
	EFTPaROHDDNqQSbfCZIKbax12AwtArcZV2qzPWJA3tOWK1KS+gguMwm2m4ByD+hpDW6QdYuRE4/Gj
	FyjcGp7rGW8h08t0qK2vvQCmQAmYqF/n6Td7uEK5bvvJ07fJW5kpdDwHFe2HKmzk3vIxqnQH6emGk
	cyCXDTXmu8wlPP5FxWVvE4KLAD2EquDVI3ql98rdGiHQm8xz2KEaEmf1s2UC4EsF2ZT+7srrjb33n
	BtKqdrCInjynFUSFt2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLldw-00000009MIi-47MD;
	Sat, 09 May 2026 17:39:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLldu-00000009MHs-2Zrg;
	Sat, 09 May 2026 17:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C6084170E;
	Sat,  9 May 2026 17:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA5CC2BCB2;
	Sat,  9 May 2026 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778348349;
	bh=k1wubvKawOKjkBHiGqFKqZ+JeyvmKczkhcAkSXnDDhE=;
	h=From:Subject:Date:To:Cc:From;
	b=gZetomavLvXNTNp2DSmcZ/mgvzjIdYJJx86n9OjYI6MicgIms7krOg9e2AsLNYEyI
	 ZSDsqpj63zbrDjrSfx5SZU+ttuLMsa7GSpg/Y6vWQ/iKS0mu64FrLmwUKFceIqIU66
	 fT7oxpE5e3n6935egAVv13gpWoQwp0jZuvxt0I1eYkxTxNXvTIIyBvelGh17kv/vmZ
	 lzwBJEmuPBgsD0K7/VexIDvODN/PfMO66e/zQhc34gxfebJsI/Qq1qOGtQDtuEh0yI
	 JtsvL18Imn6+Mm0khbCMYwR3G3WvNF3ipdw8JMBc56Uqaz/l72jvFaAzJby1LuB09e
	 ti+HyRnnZpdnw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] Introduce Airoha AN7583 SoC and AN7583 Evaluation
 Board
Date: Sat, 09 May 2026 19:38:45 +0200
Message-Id: <20260509-airoha-7583-v1-0-e5ad085b258e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNL3cTMovyMRF1zUwtjXUMTUyMTMwMLEwNDMyWgjoKi1LTMCrBp0bG
 1tQD7NBcuXQAAAA==
X-Change-ID: 20260509-airoha-7583-145246084016
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_103910_679088_CB6CC72F 
X-CRM114-Status: UNSURE (   7.12  )
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
Lorenzo Bianconi (2):
      dt-bindings: arm64: dts: airoha: Add an7583 entry
      arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board

 Documentation/devicetree/bindings/arm/airoha.yaml |   4 +
 arch/arm64/boot/dts/airoha/Makefile               |   2 +-
 arch/arm64/boot/dts/airoha/an7583-evb.dts         |  23 ++++
 arch/arm64/boot/dts/airoha/an7583.dtsi            | 137 ++++++++++++++++++++++
 4 files changed, 165 insertions(+), 1 deletion(-)
---
base-commit: e6490a169f6d5f5bdea7a2e8a673890d43afadc0
change-id: 20260509-airoha-7583-145246084016

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


