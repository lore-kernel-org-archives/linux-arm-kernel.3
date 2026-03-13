Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C415B105F78C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vZM40g0Jp74NcgvASKD63LKTuF0A3t/lE1gLDVkFhw=; b=nksDObD9FKtV7LDX+fVwvfnrnO
	ScGWAmdn3iovPj3sRmjXkwjy3sO0db6ULCubO2pQCnCd9Vo/8Nz19He5nc2fgv2cvfwQEdY1X7QHe
	BKG8sHYTLiTRigslbJ53cwuMSWYaTQH5eufDqs6/qxaQOwr8gCtZg2Da+sxazWLwpR55dxH5a6NUO
	vt646HJbTLMma+oj+KQz9aclbWAM+froz0TG1oDYus4SrgZ7q4KqyXvvMcZm25nxhypGgiKelATjk
	KIol9UvEHWY0qtir0VtezsGAFv5jDbZgJM+Q2NzO+eNdaURcBbbuzwvM2WNus4LHk5m4fTuNl5yPi
	OLpuOT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10SD-0000000HapR-1txF;
	Fri, 13 Mar 2026 11:13:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10S6-0000000Hali-0Ynd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68D6743F0B;
	Fri, 13 Mar 2026 11:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F524C4AF0D;
	Fri, 13 Mar 2026 11:13:07 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v7.1
Date: Fri, 13 Mar 2026 12:12:59 +0100
Message-ID: <cover.1773399673.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
References: <cover.1773399669.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_041310_190958_22917F51 
X-CRM114-Status: UNSURE (   6.28  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v7.1-tag1

for you to fetch changes up to 3ac4e6b92fc200e047d13aae06224b2a72539b9e:

  dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC (2026-03-06 13:38:54 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v7.1

  - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
    SMARC SoM and Carrier-II EVK boards.

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
      dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC

 .../devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml |  1 +
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml  | 13 +++++++++++++
 2 files changed, 14 insertions(+)

