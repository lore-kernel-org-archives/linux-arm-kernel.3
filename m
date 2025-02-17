Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74D8C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5hN8hYu73nLFQUg88JO2+5N1euFquYDYCWfMTQ+JOs=; b=afERmu2/PfTikk+pFV2K4JzXsm
	7Ojpe3rs5zodg5ic21InNXuzx4sf9qPrmf0RL/IIgpcSNIUsukOJ7OvHrYYvnB+ygVCpqe20uGDI+
	uSEJbllTWTBSxxcu5WU7cVZzDpIbTYU02QoRv3CB9iHmMKh9YabXCkScwplw63wCoGDB3y1qfqnuf
	SeMmlX/CitDGCPJ9SDtWS64YKI4Mbo5Nt54P5xQgXz8qc+wGrK2jipjupeGdUPbMsiyEyzClME6Xo
	EL9i7m2gzVO8byb7nNBIpdxyM/XUeDTS6E6LkNWyTw8H/3XdAfYwDbb0iJ4QMleIUm+tV+5DPS3hE
	gDCWA3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzZC-00000004MHm-1VwE;
	Mon, 17 Feb 2025 11:45:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzSC-00000004Kmc-0aGR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 11:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=l5hN8hYu73nLFQUg88JO2+5N1euFquYDYCWfMTQ+JOs=; b=FXJsfQ0QUxuC8f35tKzBTukL3B
	m1CbquF+GzEIziPWQs1EhGpejYgELvffLC2S/i48MegNtpjSomfLoiWSTEqSZNPzUtsUeh4x4kg6Q
	hyAL/dYGdrzT5t5H7cmy0JhH44c/N2HghEgxXn5GKQ45SweElw4dJcJ9ecPRVunATxQYCyBUTA3z8
	UMq8LfmTGsco4EyjdvaE7+MKGtyMhGEecIT2zXBrfMlSU30eSf/dJHG2Fxvp9bBss5r7hj9sFHCXF
	SA/s6u424oa/M1HmCQ2e3ZMKIS2pX0qCcAaUll2XpFa/HkJOViFYokomuVkEyiACM1O9Sgju6JzW7
	OCaFtVdw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzS7-00000001nmd-3zds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F94A5C548A;
	Mon, 17 Feb 2025 11:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EC47C4CEEB;
	Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739792296;
	bh=vJ4rRARvHvI+TqMh5YEfuph2abkuxCb70so77AF6Lp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aLgkTqAjZvP6rN/OTvl7AfhLcg/jEkj9q1r29l6LwmspKJtdguR1u1WeqG+IyJcgs
	 IQD3Lh8xaGWNdvD4uHWKsRHL3oEKpkhnr1xzRvf/QPe0q9JbdoLX4wlG+6a7wUZtih
	 TDk1GsVEru93sIyGt8zDZbJiwbBLWe+ZiZnNMiDx59huz5KWVPpFyMxOSz3athl4XQ
	 bjnRWu0wsuifYo/CPrFntpcpv3Nc5J8MyHqMtf9CztyNnvdNNrVOOYwikBNZCaZ0lS
	 10O+Pv5MjwSWUGFCHVEODRHdA92Y/SFjc8bVz9mDSE4tg7fxA+ZXG06bQnUe71oqdE
	 owT3QCsheT8JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10369C021AC;
	Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 17 Feb 2025 12:38:04 +0100
Subject: [PATCH RESEND v6 4/4] MAINTAINERS: Add entries for Apple Z2
 touchscreen driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-z2-v6-4-c2115d6e5a8f@gmail.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
In-Reply-To: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739792294; l=1303;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=InMRbHicu7oJRHDFwDtDafdNISTi0qP6MkyrWoUFJQU=;
 b=q/IU4spImyU4lkrTPb1Sg0FrX7UxOiEvj7DS7BBtsryr0q42cLnwkhNA5/D9LZTElpkvjdxf7
 Sf/fJJw00D5DXJdrOZdae6HPsK1n21+QpsFYjh7tgj2I4MP95rCxFKl
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_113820_227506_94BB0FE6 
X-CRM114-Status: UNSURE (   8.97  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..8b3776eb748e128f87c44886b117e0652447fb37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2191,6 +2191,7 @@ F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -2211,6 +2212,7 @@ F:	drivers/dma/apple-admac.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c

-- 
2.48.1



