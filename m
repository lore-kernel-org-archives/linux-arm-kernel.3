Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C3AC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZxB1RQlMaS2z+NjDdEvkDtfnoLQIQaaxdHcSv04bepo=; b=XEe5xc5IeVXjNMij7qL9TQD9ie
	I1qygEFRAyJlHkoa94XBoGlHkq6xzuz9hNgh9Daqjikac1lVrq6ulZtTSlMCbvNB9sNzjYCI/0Du0
	kL4VJqukWwBq0hiXSe7tDXgqSfqH2ySx7Of/p++rKrMNV6F1qqXgSWQyb/jxSH3S1meR3QDxJD7AH
	H+krD4FhuClEjedIOI/bbX6l/q8d4QLybBavdJpdOQUjeRQdfNI5zvY3P1zVnv7maV5ZwifHZJ9si
	iQE0280DYT5HEYqVF1AfCvFKFRZbBK2RfO9ox2+V5V2fhfxtWqC9t858AbRfD9WW0T8GB4ErgzBbb
	qL1nmfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRxj-0000000B9bF-1OqM;
	Wed, 11 Jun 2025 20:22:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPJY-0000000Aj37-2H4n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 17:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3BD2A5194E;
	Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43AFEC4CEE3;
	Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749663159;
	bh=I4HXo0ATSJ/hdYPbDOMk7Ra3is0bb13Y9rAP/aptRgY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ej0rUAsrLsWzPXsxSZgc1vDb6FaLk6B1bklbgjWvOEMJIfNDsxyvimoMhGeQoVpB+
	 e5n62n1TDNhDFDZn4f/zQSb+LPpuppwkGS7EknY23V7B12+Cfad2ef0UQ1do6pjpbn
	 i2F/8Cyay3NRekosMEILXiBftUx4aPwzLRscN+vXFxbhz/RuzvQOKCL8OcYrOiv2S5
	 RvY/l9fyIEL0DCtHkQaOpSMMZ+bfNKmSYicmFZ9sQaKISEKdE6m1PVX07mU4Kv8zse
	 XhXUH1IEI6WyH7CW/HDZBSjgwWUE1cW5MEWH3eLvGErvBRWbyKEwOMenNtR95Fic5R
	 1fBdPFfkgyEag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31558C71141;
	Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/2] Bindings and DTS for Apple SoC GPUs
Date: Wed, 11 Jun 2025 19:32:15 +0200
Message-Id: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+9SWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU2ND3eL0Ct2UEl2TRMMkIDJOMjJIUwIqLihKTcusABsUHVtbCwAIRPi
 FWAAAAA==
X-Change-ID: 20250531-sgx-dt-4a1ba1b3b20f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749663157; l=1440;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=I4HXo0ATSJ/hdYPbDOMk7Ra3is0bb13Y9rAP/aptRgY=;
 b=a/YPKcThE02rkRwTyp+2PWA/Znv8r+ZwFTmoNq9NkcjUgxXGHJoltLqMOGX5qRLEf4jZ6KO9L
 a7wGQotkZnHAE5MWdWThd6RMmfvdh3TUiWPOhTM2vktnPdo+qNV5750
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103240_728089_DFF12184 
X-CRM114-Status: UNSURE (   7.50  )
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

Hi.

This patch series adds the DT bindings and tree entries for the GPU
present in Apple M-series SoCs. The driver itself is in Rust and
upstream is currently missing several prerequisite bindings, so will
be sent later.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Sasha Finkelstein (2):
      dt-bindings: Add Apple SoC GPU
      arm64: dts: Add Apple SoC GPU

 Documentation/devicetree/bindings/gpu/apple,agx.yaml | 95 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                          |  1 +
 arch/arm64/boot/dts/apple/t6000.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6001.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6002.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi          | 34 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi            | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 294 insertions(+)
---
base-commit: aef17cb3d3c43854002956f24c24ec8e1a0e3546
change-id: 20250531-sgx-dt-4a1ba1b3b20f

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>



