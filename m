Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 23:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DMGDj01h;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IP2i7VFL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=; b=DMGDj01hAjAKn8
	zMNxwIc/Z9RaVh0YdSkhVksS8rFlVOjRhShB5Uvgzz0i2QmdOT0r1HGNgdXDrVKwTxTMghgsItnic
	223NepTQpr5lmDoveCDE9Qj2/w3XH71j53vOirTaYvL14FJ3aDsO47q5iQ7721HUuH1sZF2T/nepF
	YsH/PZ6jacpDMvEtIw30DG/4ikTUUk7CTt7eoCClSdPEf8TfyVQGWA9P9bQHk0/ZheqfyKFaBTkas
	TWvBUh6cc+NoSVY+mM7qIt//v9YzLEMUtcLGUwKMRKITiwPDlsLCSry/gp/7FDTku+zrZNsp9/77r
	d6QzCNizFU/B+W4w2oyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLUDP-00000003SU0-2Q1w;
	Mon, 26 Oct 2026 23:34:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLUDO-00000003STl-1KRh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 23:34:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B6DE40DA6;
	Mon, 26 Oct 2026 23:34:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793057693;
	b=NTDZQwH/P4C6LVlwc9q+Dd6LSvjz4QGy71Djm1/OlbqQQBzRVoswY6gs1s9Zc/w8afIT
	 d0fp1VgWwZMF74xNt5BcFqMROLTJnsrL7Zf6tJaTOxkBFCEl4tYHr91DxqMug83bn/472
	 rIX3ntxRMwwzF/rt44kLBKzkdf5DrXQOHa2z6x8MxVvpr5N5GwSAE5WJzXbcjMEwIredK
	 fjsnUI/33vEJ7uujfkzMU/sLAnWsSx4SCK+Q9Zarl0Wtv0TObE9ctaObZfrmmGrrEBbN7
	 apPIuCntn+h4fbkGe24lmbMFLln2o/lBTDMSua9d0YtRGn6iH6YMDPrD1uytfuRSUrw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793057693;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	b=moBaQ/X1VNqpDp4UC3rj2/BD9QVWy7LDJ2T14H6uQGCZaMlU+SA27pcOiq0AU083rQuN
	 IZGIB3rD3oCbRoCrvDR1DRXP/sOD2IU8pSCDXN2aCosvvo2wMxVMXtF+iTFeJPobkZVS4
	 AGncmpI973mIT5hQCcacaXyFDFozT8WKTRbXPMDRnwbt4FZr75ubeOaazJxu3DzZiA+1w
	 FrVq57/G155+WzczEF6VE9fGqaNTLes6eNadF00fKrNzOrlL6Q68a/E63GBla+5DbYeKS
	 bYafvti2dcVUETLTBnIIUZ+cRL2GwmLzYyd9+6mpJseKDDfmkVvQnE9ncod/DF7njWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 588F71F01828;
	Mon, 26 Oct 2026 23:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057693;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IP2i7VFLrRsu8j7FKFMYfW/oAOcR7n43sjyaXJWJfrVe1YNjhKEUb68HEg8oWg29/
	 QFRVN+WsESZhqr6ekuLC/JVGZC32547mliJHCszpUq/S7kbXpx1tCpaAsdH+Ly1vLT
	 jv7Qjw4vRIqckxW3BiMLOmYJRgDvPXGMkMORviTbA0/Q7Rx2NrdFUp0Et8tQH3hxPz
	 t1PwK/q0ofQuLfSpMhAandIBm6Mi/YG1WaXircQM79cEvSTqR49e6hvcXCCbrRnw9p
	 0fFK7AXC01wNFMH/9ee6/xAbgAyhLkBZQdcBPpkk1pXkXg940yIM3Ia8+8ZCrCQB/5
	 Xg7vy8zRAxoVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4A7944EA9;
	Mon, 26 Oct 2026 23:34:52 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 23:31:00 +0000
Subject: [PATCH v3 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-sunxi-orangepi-3-lts-v3-1-98fef4f75184@gmail.com>
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
In-Reply-To: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793057459; l=1216;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=t1m1y0S3cSpYjFuC+gfshCNEaxwz0B7aj0D0DiamZcc=;
 b=UFkwKF+LrzoyYlPZx7NGE7L9qOh5eMWicHqcBsCJRMBtxjrifjRp/3azHzu7mWQHF+XUvGXuY
 GXaxojGsbatD9mB5zS+yKFeD8XkOpQinDmJXSOOchOVErTzKIa5/SR8
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipescu.cristian@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Orange Pi 3 LTS is similar to the Orange Pi 3, with different
Ethernet and wireless hardware. It includes 2 GiB RAM and 8 GiB eMMC.

Add its board compatible to the Allwinner platform binding.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-2-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..379dc8591 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1008,6 +1008,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi 4A
         items:
           - const: xunlong,orangepi-4a

-- 
2.47.3



