Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E74606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vgF2etZ9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvD/ucDp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dOrw03ZY4M0Y/JC7nnm0OdrkCVNUcDRGbuVdDy6WXrg=; b=vgF2etZ9y9Y9kmKqmvEKQ8xQD9
	D1i+MyvjRqprNe5+dyoG1LPV24y6CZobn2NGOBb4ePIpNgNCev6XzsCGoXViUirfUnGlveQn74pzC
	OY9bScaLufnPEqkFX1YGYEqsWYdUECkDcXpsV49DP7+XYxsP5XVzJz0Z6Cj76szR8lSv+Ezgqzku9
	/xo3/Vpmf1NGJZTUD6gaIylQuMQoZPTdoQXQn5KPE8sPk8p7EMCrBlpt3Uv929s1BEfFGx6EJI2m2
	tDMT+q1gVkk1RgnxNW/Ohw6rbRlctg+Hq/MeXJsmiYYxr7rma10CJ+pHybPId/pRdHarLiiO0fUPs
	ZqL7gI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNprL-0000000GFa9-3AJ1;
	Mon, 02 Nov 2026 11:05:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNprJ-0000000GFZ4-3fZ6;
	Mon, 02 Nov 2026 11:05:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 046CF60F40;
	Mon,  2 Nov 2026 11:05:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793617548;
	b=fcb1kxNs4faN8sZ5H0sWR4Fdt02WnNP7/mCQ3WcieawhkwjjdaIfO81BYGRi0gtYTfV7
	 0fMRXfBfQHPDzAaJx6ObX2hNFGwSvM7U3SFzB4XXL7MSb427sEW55XZCByK7gienZoR0v
	 /ThYlFU3hi4j5K3iPKMDwWNTTl1d+rw1cqo+o25yscB7EvURuOUTzoQuBhAl143wKOySy
	 MkJTl+wZpxTCVfotJfZqEMCSkuXZfJA/SAZshIq2oQ4iSisrMzzSEZuAzUhXzBtQufDk0
	 Nm5TDYMmbysbeMRaWHnBn/pp85OqoBURjD4u3TmnppR6cueLCvW5emcZQVYF4t6GE4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793617548;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=dOrw03ZY4M0Y/JC7nnm0OdrkCVNUcDRGbuVdDy6WXrg=;
	b=q74A1BZx5Qa9QKkDkOx25W6/EE1wj6YnIWRsnAOmihtTT5zNQ5qww82kYA7Vjc907+AO
	 g5voEb0RhPrKCXLElQ9mMHvSLDQf7XueBzU3yWeF8w0fH8EOKitbD4LRL6a2k9EyUx+NQ
	 3ZEtTD+3GFZ6SX8F8YcyRPrUe7JDmhOFv7MApHuKfbTo3FG8DtC3X2OAy9aIFBANCQOT2
	 FY/ciGsCBDFpT7gFzlP6xrkv1wCGeNluaINSpihB/NQtDSlm0yu+KAsxrNC2FwCXaG+zu
	 8boPw3Y8NSM9hEgjn3IWb+fub29cOOrQ8IhwQuRyBswNaINQEigwY82i5wF2ZSc2/Cg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF3CE1F00A16;
	Mon,  2 Nov 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617548;
	bh=dOrw03ZY4M0Y/JC7nnm0OdrkCVNUcDRGbuVdDy6WXrg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=YvD/ucDpSBv3rK8itVesUFA6gAWbCc0AUT6TbbSKgOZhUB5ZBSi9Q6fU5nwmP0ahI
	 k3WbDqtZsx+Ihag3GvALimV+jtWw9tzCwnKDjQdnkG2YUPbO0g0r+bhAs5qEWZqrI5
	 wfIi9clTPXNc7mU9/d6kkE82SUStr42Ynx/nTeNYRF1YUIvGq8s8XuKZasgzB4ESit
	 VbbGjhqZEaYUDsRc6Zkq7D4PYRj8CDywmmZ92JHHDHf2+/H+htGykar5UqSuQpMqx3
	 VLwpEGi0C5xMr+BTlrpZ4lxcfMPG8Cd0x5raI3xYLGRV7MY6jDD60rW4qsTzYVv/xh
	 NW31Z4IRVT5CQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D3E3464AD;
	Mon,  2 Nov 2026 11:05:47 +0000 (UTC)
From: Junyi Zhao via B4 Relay <devnull+junyi.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] Add Amlogic A9 I3C support
Date: Mon, 02 Nov 2026 19:05:38 +0800
Message-Id: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJu6GoC/zWNyw6DIBQFf8XcdWkAH5Gu/I/GNBRQb1OlAUvaG
 P69YONykjlzNvDGofFwKTZwJqBHuyTgpwLUJJfRENSJgVPeMMookeKGpSJC17yqNRWVaiHJL2c
 G/Oyha/9n/74/jFrzOhsT+tW67/4UWPaOqDiigRFKSi50y4RuOBs6OT/tiOqs7Ax9jPEHtvKD/
 rAAAAA=
X-Change-ID: 20261010-a9_i3c-9d5245d094c8
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com, 
 Kelvin.Zhang@amlogic.com, Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793617545; l=1695;
 i=junyi.zhao@amlogic.com; s=20260924; h=from:subject:message-id;
 bh=UJx6v15t+vGPfwRUpHt2I4ZrP80lRsdJGExEg/joTkI=;
 b=18IKIcD3tbqV1AO5x5M/aDMWsCEGnolOANX6OlHDU5VZtiKG9Yc8hSPlxSfaAGD1RSWjtCX/g
 RqH0pwQyVEiC/nAKTPWnya0TuURq6v+ASS1FxJPezuDRnUqKoehW52b
X-Developer-Key: i=junyi.zhao@amlogic.com; a=ed25519;
 pk=hiL5PjGIksGFiWvEx9J3MhQqU/ro6vNbj72NIw4bbvA=
X-Endpoint-Received: by B4 Relay for junyi.zhao@amlogic.com/20260924 with
 auth_id=1054
X-Original-From: Junyi Zhao <junyi.zhao@amlogic.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: junyi.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Amlogic A9 SoCs integrate the Silvaco I3C IP, but their peripheral
clock setup differs from the original implementation: the EE-domain
controller (amlogic,a9-i3c) takes two clocks, "pclk" and "fast_clk",
while the AO-domain controller (amlogic,a9-ao-i3c) exposes only
"pclk" and derives its bus clock from an internal divider inside the
controller's own register region.

This series consists of:

  - Add a vendor_init callback for the clock setup and a
    vendor_quirks field for AO-specific behaviour to the Silvaco I3C
    master driver, and enable the existing Silvaco workaround quirks
    for both Amlogic variants.
  - Add the Amlogic compatibles and per-variant clock
    constraints to the silvaco,i3c-master binding schema.

Verified on Amlogic A9 (BY401) with both EE and AO controller
instances.  dt_binding_check and dtbs_check pass with this series.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
---
Changes in v2:

  - No need rework the Silvaco I3C driver. 
  - Based on vanilla driver, adapt A9 SoCS through callback 
    and quirks to handle the variant.

- Link to v1: https://patch.msgid.link/20261019-a9_i3c-v1-0-329d819d621f@amlogic.com

---
Junyi Zhao (2):
      i3c: master: svc: Add amlogic a9 support
      dt-bindings: i3c: silvaco,i3c-master: Add Amlogic A9 support

 .../bindings/i3c/silvaco,i3c-master.yaml           |  24 ++-
 drivers/i3c/master/svc-i3c-master.c                | 214 ++++++++++++++++++++-
 2 files changed, 231 insertions(+), 7 deletions(-)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261010-a9_i3c-9d5245d094c8

Best regards,
--  
Junyi Zhao <junyi.zhao@amlogic.com>



