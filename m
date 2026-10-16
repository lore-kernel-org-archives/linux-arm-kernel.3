Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E161BCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 05:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R1zgOK4X1gDQAdk1P35fq0mJ8lNv8pOHVhiAkDyN8Uk=; b=B360T3caSFWOoQHoGmTBA14yvu
	pq4ntCS5xASIaUKQAeIVNAlv8wIkECzswpNnQhPDEBpNS13BEgE+tXE7BV28iOF1sAsfneBNC7LZK
	mGPu0eGhGp8lB2EmBo50D/wfOXkbi5Ha/fjKL6XoEjvfOT6QLTN1fGEMRzVYq2O9XcRWbslFv4uDS
	rSy/dqw5wW+HcAXqc9npExxB7Hm/Zv5mFUzVsHQWz+gg5yy6SVzJwyWNYn1HOkZ2Xi6noWvCg5WCQ
	IaKn4BdpgEr0LPVSOghnHENKyMWsumwiP/ZG7p3RkwHb6uJoq7WNpETiLsajFJA59WVqP8/7F84EN
	bq1Fgp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaaV-000000022AX-0WuR;
	Fri, 16 Oct 2026 05:34:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaaT-000000022AB-3qdx;
	Fri, 16 Oct 2026 05:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0521341231;
	Fri, 16 Oct 2026 05:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFB17C2BCF4;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792128876;
	bh=H0zSGhB8hGAGhGm1ZMMp2gTyzpy32OW6Q5DZrz3Rqmk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VjY6YBIqPZ1wha4WNmuCZH/+oZpQHO8keUQsZE9kvCeUhwQm9UBMOf6sZOCLdeH3U
	 kesttPOn+hQ8R29+p191iCIvq+QQswCp7ZZnY/Pv8BhrqqzRgioh7IXSbqfFK7dwur
	 3yG0ZVfJ+0sbVCNnB5nthdISGJ5orocrqQS5TXHKJ2qDsyPCczKRkzdqq6Zddtk3EF
	 7kc37oaVKr+Pio+ZYTxsMOcPjmyUz6qKGCDgCAz3kLPwB50im74VtLsqyrinlBZ6T1
	 kotvtd259U2CJkE+RwPELVkvgnzYV2vF2hqj0UEVU0HBzPXzubiEQcPQlYyJGStKwE
	 aO/3tVBAEh1NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC840CCA462;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH 0/2] arm64: dts: rockchip: Describe more of the power tree
 on Kobol Helios64
Date: Fri, 16 Oct 2026 08:34:32 +0300
Message-Id: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGi30WoC/x3MQQqEMAxG4atI1gZs0SheRVxI5x8NiJVUVBDvP
 mWW3+K9hxJMkagvHjKcmjRuGa4sKCzTNoP1k02+8uIqJ7xg1Zik5j1eMD4M4Kb1ndQhQBqhXO6
 Gr97/6zC+7w9qd1zyZQAAAA==
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=H0zSGhB8hGAGhGm1ZMMp2gTyzpy32OW6Q5DZrz3Rqmk=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkXt2fpHD19VvaiXNvJwOvzopMM3lUdafB5HmCY97ykv
 2nGV75HHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiNqsZGdbULbULLJ/cfvP+
 C+8DynopafyH9xgu3CHWlFfEnbvbw5/hD5/V7MQ7i5c1qVzavtP2+8ydm2LXRd/4vfdfb9KOlWV
 OegwA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Helios64 device tree leaves out some regulators that the board has.
Patch 1 adds the ones in use. Patch 2 adds the RK808 outputs that the
schematic marks as unused, so that the kernel switches them off.

Schematic:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Tested on Helios64 with a 7.3-rc7 kernel: the new regulators come up at
the voltages from the schematic, the regulator core switches off the five
unused outputs, and the disks and Ethernet work.

---
Igor Velkov (2):
      arm64: dts: rockchip: Describe more of the power tree on Kobol Helios64
      arm64: dts: rockchip: Describe the unused RK808 outputs on Kobol Helios64

 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261016-helios64-power-tree-572864cce656

Best regards,
-- 
Igor Velkov <iav@iav.lv>



