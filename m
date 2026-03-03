Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944B4EC048D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N4bOVPl71kwkh1QZtfCm1LvzABryRpdHrJyt7tQcIFk=; b=D/Bm5A8g3q0/GtyH0p8jRkQSW7
	plkcO8GsKm8sNaB0PgJNl5Q/h/yhjTXi3lx8YCnqcWtK2KlQ+uCF9k65+OUIO9Z2QztCKYQABiPe9
	vPinF2r3JrJVT87SiuT/s1pPy34Cy/+2iv5fRETRoDZWTGK7lNosr095jTut2JU2OmF2CbGeGyD4g
	yOP3qnz4VOxyJXfwxetQrtZiXm8t+CwLVQZO1x4OSZrxidfcrNpuaJ/79Gwl+sma/pq5peXi89fMK
	MxtA6wENR8WrfVeehmE6U94ZUGRDCLougGmUQgPpfmL70Mc8jdlHjz00yv5Noykjho6WCklQoxL8b
	fT61FiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMe8-0000000Evoa-3nq5;
	Tue, 03 Mar 2026 10:06:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMe5-0000000EvmZ-1Ljx;
	Tue, 03 Mar 2026 10:06:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA14643688;
	Tue,  3 Mar 2026 10:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C475DC116C6;
	Tue,  3 Mar 2026 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772532388;
	bh=xDY2zUL4lo50XwlAxftH7mcEOPS7xG11OXc5XAcUsug=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kXxVvjLhASHctIxoRdS9tBfadNQBHtdcCXyHpOdeVvjMrL7RtFGkx8fxwCt0P7Pij
	 LEFk4LLja5qorRCzcjQMSDucBnGcpohEEkrnghbxk4xLccE9r141VNJCWuPB6+CCSS
	 LdylA9vOig0Uv3vycPFCxgXJsXPxVyviW6/2dCUqCU/q9f/aMzJgLB+oxsmY0R4KQk
	 twbQw84Yzcah/qAQFs5ixWNSTmoPjZSBIFRyZHt4NRT1rz6pj4daHPg/uw6M+0QhXt
	 FRtxKZn3U/2Nn2bs5fdwo2jKKpTMwCdGL9L7qRYjfLQoQ6bcc5i40+GP9jB6mwkKUr
	 yYvKmhKg3V2wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94F1EC048A;
	Tue,  3 Mar 2026 10:06:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] basic devicetree support for Amlogic A9
Date: Tue, 03 Mar 2026 10:06:24 +0000
Message-Id: <20260303-a9-baisc-dts-v3-0-4bf21001f05c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCypmkC/3XMSw7CIBSF4a00jMXAtQ/qyH0YB0Bv25vYYqAhm
 oa9SztSE4fnJN+/soCeMLBzsTKPkQK5OY/ToWB21POAnLq8GQioBYiK65YbTcHybgncGmMQUMh
 eCZbJw2NPzz13veU9Ulicf+31KLf3TyhKLrgECaas+7bSzUVPdzeQPVo3sS0V4YOD+uGQedmUq
 u0qa6VW3zyl9AZjGApq6QAAAA==
X-Change-ID: 20260205-a9-baisc-dts-cbbbe2e01f80
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772532387; l=1285;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=xDY2zUL4lo50XwlAxftH7mcEOPS7xG11OXc5XAcUsug=;
 b=K7ff/AITnNBzEaAERMwOvCVFbtGofqTk6HA3TRi2H7p6R37aiNO599ue4wYKwUWZgmtq0HIwJ
 wD/cL9vnwNkDHbE8Uf35G+xwW7GDC1fHUUYmnZo29fZQXTMFnirHrNQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_020629_401796_EFA58246 
X-CRM114-Status: UNSURE (   9.50  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the new A9 SoC/board device tree and related bindings.

Since the serial submission has removed this patch as a separate patch.
The dtb check needs to be relied upon for serial submission mereged, or
check failed, when run "make ARCH=arm64 dtbs_check W=1".

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Remove serial bindings from this patches and will send it independently.
- Link to v2: https://lore.kernel.org/r/20260228-a9-baisc-dts-v2-0-47489d5cc1a8@amlogic.com

Changes in v2:
- Move default interrupt-parent into dtsi.
- Link to v1: https://lore.kernel.org/r/20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: arm: amlogic: add A311Y3 support
      arm64: dts: add support for A9 based Amlogic BY401

 Documentation/devicetree/bindings/arm/amlogic.yaml |   6 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/amlogic-a9-a311y3-by401.dts   |  40 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 128 +++++++++++++++++++++
 4 files changed, 175 insertions(+)
---
base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
change-id: 20260205-a9-baisc-dts-cbbbe2e01f80

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



