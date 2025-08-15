Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DFECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=11BWivgxwLW7EbvUh8RHIUTmkxTxQ0cQJ1tPD4CG8Tg=; b=Pd9Pe9hl2U/qemhQKgkV+d2U6T
	DFpJY20whjAV1y3X9EnIuzwX7PRiXlSWntXsHr5/vUoq+6epq0FJJLuch2UBeL1f3LAvE0XX5y7so
	4ImAt3opGBBTgJKjx81HqSrvt0UoD7k8n8zLIx0kUFAD4xYx9K6Ui/LePAfD6bjWpq3ZxeLEA5VPV
	c3407aY7ZtwVDnxOh681ouMtJT2nuulgZBLToQr2eKSaS1b1/LTqP51o1gQ2tdxh7L/ka/Klz6SDE
	VpDzEXY7UfZ4HrzjB+JBcGEaCg40+DRSo3Q5UiuMjI11rXvRUExkmnbWegZpyff4G3U11GqdDhfYa
	XL8WNjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpz8-00000001t4J-0g27;
	Fri, 15 Aug 2025 08:40:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwU-00000001sS8-17Z9;
	Fri, 15 Aug 2025 08:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C967457A3;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3073EC4CEEB;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=L7VZdGs5j0iAIIVV95ydOPA+CQ4L5Vw5Pc4ESRH7W5A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bsNfre0peB10P3Tz9sQE/s7htiknvrsgrvoTh5AdkXi5Ow1IE2Z2+ITr0PbTYp4LD
	 NEL0VHCa5LOZnMOUA5hH/QHOWK8JSAz8D54gKy6GK8eybXTHB7XeQgKSdD2RQmDZ3W
	 iUwHh7h1iiDQasMi7boWq2Kd0QqZUzw6jDNlxujZqEEz0IOizFlW7RB/F1uOveXb8z
	 O0NMpdwWh0EnKKGKYJN89sUKnMoFqj9qAtLT7OVxNgvDSEtZpc1yZHA9EHBmejtPj4
	 WHhgVuUuKJzAspVBgUM5dsikuWFjbSAYfnaG1aWrHNg6oph3HClfZJVsp+7voHY8Ll
	 2t0qfBazxvPGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF5ECA0EE4;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 00/13] soc: amlogic: clk-measure: Add more SoCs to support
 clk-measure
Date: Fri, 15 Aug 2025 16:37:26 +0800
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfxnmgC/x2N0QrCMAwAf2Xk2UDXWUR/RURiGzXolpJsIoz9u
 8XH4+BuBWcTdjh1Kxh/xEWnBv2ug/yk6cEopTHEEFM4DD1SKTiqMbpmx1nRl1rVZszv13Vk8qW
 5W6T9kI6hJCJoqWp8l+9/c75s2w/yQ+LWdgAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247056; l=2630;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=L7VZdGs5j0iAIIVV95ydOPA+CQ4L5Vw5Pc4ESRH7W5A=;
 b=HrV4mTTd9v5hmPvd3ShYi4GdXeIZDlANBSxOzuM4gM9XilonMTDwDrW+DuLRkddH2wFDdyUbj
 9cbdHjUfK2FAS1fSwzBLSODvtHVd+QKD31ItH7oLe9+kRlH/BVEwSch
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013742_350879_B21CEE0F 
X-CRM114-Status: UNSURE (   6.93  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

As support for clk-measure expands across more SoCs, the current
approach of defining all SoC-specific clk-measure table data in the
driver .c file results in progressively larger compiled images,
resulting in memory wastage.

Move SoC-specific clk-measure tables to DTS definitions and extend
support for additional SoCs (A4, A5, S7, S7D and S6).

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (13):
      dt-bindings: soc: amlogic: Add clk-measure related properties
      soc: amlogic: clk-measure: Remove the msr_data from clk-measure
      ARM: dts: amlogic: add clk-measure IDs and names for meson SoC family
      arm64: dts: amlogic: add clk-measure IDs and names for Amlogic SoCs
      dt-bindings: soc: amlogic: Unify the compatible property for clk-measure
      soc: amlogic: clk-measure: Unify the compatible property
      ARM: dts: amlogic: Unify the compatible property for clk-measure
      arm64: dts: amlogic: Unify the compatible property for clk-measure
      arm64: dts: amlogic: A4: Add clk-measure controller node
      arm64: dts: amlogic: A5: Add clk-measure controller node
      arm64: dts: amlogic: S7: Add clk-measure controller node
      arm64: dts: amlogic: S7D: Add clk-measure controller node
      arm64: dts: amlogic: S6: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  66 +-
 arch/arm/boot/dts/amlogic/meson8.dtsi              |  94 ++-
 arch/arm/boot/dts/amlogic/meson8b.dtsi             |  94 ++-
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 212 +++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 202 +++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 275 +++++-
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 312 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 253 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 243 ++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 144 +++-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        | 229 +++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          | 136 ++-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 301 ++++++-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         | 255 +++++-
 drivers/soc/amlogic/meson-clk-measure.c            | 930 ++-------------------
 16 files changed, 2877 insertions(+), 871 deletions(-)
---
base-commit: e5624eb63c452efa753759e74eb27fe132eb577c
change-id: 20250731-add-more-socs-to-support-clk_measure-b2a43590d5aa

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



