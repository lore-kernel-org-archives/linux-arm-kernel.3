Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82482C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0W32y1X49hPP1q2eHZFiQ6eeTQheSsSajOGIGNQVKe4=; b=qolEc7A+M1QsP9
	DvniNchbC55e9WjgTzOre/KHU8M1cSeaqiOxyuRkNbqoxOQylQVp/NAlDlkNsnt8TeW8Z93bKa5f3
	rc5mgNIO5XST6cgtWeQ2T6IphAO5N/2hDm3z3Gr6P0dMx9ORGKzV65Y4T1pO/jhxOqqnwonWXCqmw
	Z6nw1sFNYxqJzVG/3DOkIucmBeKYH6IFdfCy9wnp3EQTJ778ltC5oYFQiemjsMrEtUGMgYtQcuRNF
	nnZHDMuYZTUaoPxPQmlmbj1nAmbecKUsbcttKzgIbs7ekFIHq22dtWl2dFNbB38LWp/9Krs1GF7MU
	MsMz3yCyZF9UlF/hRS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkUb-00000005IvK-3AMl;
	Mon, 09 Jun 2025 21:57:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkST-00000005IjX-2Qmr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 21:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F212629E3;
	Mon,  9 Jun 2025 21:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A6BC4CEEB;
	Mon,  9 Jun 2025 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749506106;
	bh=tEg6PR5QER8nznaQf7QFJoHg+OzeWOX4wO8uqnYGdc8=;
	h=From:Subject:Date:To:Cc:From;
	b=mctYzr1b6Khssu2nuC9T6oTY4Wv9Ij2j01N71eP93PVIafVh24HP4ThErGwYQgmAU
	 DpCX11HIdFJT/6CNTzyZ3oyE6L0k8vAaIOcXMK4PyPGQv/uODIdrrFEfyazJAZxJEH
	 Wv5F8T2eTRalwVxuTMw74l1DIq5btwGE8PcbOCoV4fYA5BipxJy9wn99+CC/b2E83F
	 PXrVb9FYZs1aYIhGRu5xMPGwx7er6YF+D57kDSUtx1GjSnhYrmeP74cgfAS1P4UrOP
	 bhQc38u9vavH3eAmG6OfKX1wWY/gNYgBzznH2R4AlOhLXVt9sZUY0PeCQnQ++TjdSX
	 Twx/jrXTLWFxw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/2] arm64: dts: lg: DT cleanups
Date: Mon, 09 Jun 2025 16:54:55 -0500
Message-Id: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9YR2gC/x3LQQqAIBBA0avIrBtQQaGuEi0sRxsIC40IxLsnL
 R+fX6FQZiowiQqZHi58pg41CNh2lyIh+27QUhtp5Yj+xiNi4JcKOq+CtaRWIw3048r0hz7MS2s
 f9O1Wml0AAAA=
X-Change-ID: 20250609-dt-lg-fixes-ad1f66e1b505
To: soc@kernel.org, Chanho Min <chanho.min@lge.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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

This short series fixes some arm,pl011 DT schema warnings. I noticed 
that the lg1312 and lg1313 .dtsi files are almost identical, so I've 
refactored them to make the fix once instead of twice.

Arnd, You probably need to take this directly if LG maintainers don't 
respond.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (2):
      arm64: dts: lg: Refactor common LG1312 and LG1313 parts
      arm64: dts: lg: Add missing PL011 "uartclk"

 arch/arm64/boot/dts/lg/lg1312.dtsi                 | 324 +--------------------
 arch/arm64/boot/dts/lg/lg1313.dtsi                 | 324 +--------------------
 .../arm64/boot/dts/lg/{lg1312.dtsi => lg131x.dtsi} |  35 +--
 3 files changed, 11 insertions(+), 672 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-dt-lg-fixes-ad1f66e1b505

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


