Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D501F54ADB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSFIM3X/MACRi2/Obg/UD/c/LDuTJ0areH5qdPkLKcE=; b=Hrf8TTymlcot2kLdBYWeMPtPZ4
	9SG11dXOqK9E2Q6YvpAu5g3sOThgB/nRM5qsOe89ic6AvTr+PB5SATUeuVGrrGPi2onyIHDupGHOv
	5ICviEuyFn0U3kRSMnSwLJadZoMGTT2uOfmbJZtHK2i4q7pGAOAVVbRYoOWNnMWnyRTl7D+Qm0ZoF
	sARqzkRMrlOgxJhD4Y5WW0wqjI3clV3q3jlcE/khv5yU61m5kOE+0gM1kC4pKcrwVyzcvndg4t/Gp
	VZdzifj8fDlcjd6TYzMu2jyrvd4zmWYVmb/DKjVu7gnU3FV7Z3XDcSOzwYl5Sk4sSuA5AKzGDMGsg
	w/4zN7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rN-00000001uNo-13yO;
	Tue, 24 Mar 2026 16:44:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rL-00000001uMk-2mw3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2080D600AC;
	Tue, 24 Mar 2026 16:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC74CC19424;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370642;
	bh=uALeBIQ9srGWNXN1FhxlvCEa7dBhMf1seaxU46RBbec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKd/bY+q7kW3h9G/0vdZWfPBXTRclabRpkl9UVKyk92HESgdxGDki/8TyS9AVIXCJ
	 lSAFfNUIYo0nb1xUWkEWeENwSkw+vi/RLWbD1x5nEN0XP8Wvem5ocAf6wnmBcH2IjT
	 ReiStKF/+/+YJoVFQ6eeDppiUnevBTLsre8qoW/au0niqzuAeOhvMcwwZWNm/OC1Jq
	 7KzdXf8Z6w27klffegiC+p5puoU4UuV2snqYUZoKaNPVPYDhh28rnBQDhr3wIp/5fU
	 MgkB8faRY+bseQU9CEOhRdGtC9GGqYITU5lRIDJf++OcKayqnrqicPm0S0oZi4ZY6a
	 XTxMlq7NVXEcA==
Received: by wens.tw (Postfix, from userid 1000)
	id 9FD5E5F9F8; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: sram: Document Allwinner H616 VE SRAM
Date: Wed, 25 Mar 2026 00:43:49 +0800
Message-ID: <20260324164357.1607247-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Allwinner H616 has two switchable peripheral SRAM regions:

- The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
  to this region is enabled by default. CPU access can be disabled,
  after which reads will show the same stale value for all addresses,
  while writes are ignored.

  The mux value for this region is different from previous generations,
  and thus needs a completely new compatible.

- The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
  KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
  CPU access is disabled, the whole region reads as zero, while writes
  are ignored.

  The mux value for this region is the same as on the A64 and H6. The
  existing compatible for the A64 already covers this.

Add the compatible for the VE SRAM to the list of covered compatibles in
the generic SRAM region binding.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..ddaab84f7ba0 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -81,6 +81,7 @@ patternProperties:
             - allwinner,sun4i-a10-sram-d
             - allwinner,sun9i-a80-smp-sram
             - allwinner,sun50i-a64-sram-c
+            - allwinner,sun50i-h616-ve-sram
             - amlogic,meson8-ao-arc-sram
             - amlogic,meson8b-ao-arc-sram
             - amlogic,meson8-smp-sram
-- 
2.47.3


