Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D256CD3E773
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JDqSCtTVCq4Qczhx09B9nJjBnN/eooqA5p++DfQuKoA=; b=RGuP8lgNHrnlPc
	ZhcJYGXRSCBIAhcLx8ftKqsLEsQLXIrWyz1bPDsdRiEiGYFWb0IV8Ckagq+puOgK6gjeEO77Vfnbe
	NGxIrHbKs2P7MPB7wGPG7TWyBzPA9VbeF0SsHHca5sD08uaA6vlgC+LFAql8YKAjrrhsk8yQrBSBO
	SZCMQmgzG1qul8ulDiSoqg2XwRapEdwf10XdIU0sCEuIqCTKwoxtdlXflczY9+6j74crbt01tMl6X
	KBn4pYgVgcKw2PNyUeXJOjjhBa13Vz1h7xBU/WBDywJ3aof1kEcwr9N0/M/JmwUySovSSWesMmKsi
	zSEwtD86UjFDwjF457eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Qyc-00000000qUf-42IB;
	Tue, 05 Nov 2024 21:20:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Qws-00000000q97-3b4C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 21:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76E48A439F9;
	Tue,  5 Nov 2024 21:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08673C4CECF;
	Tue,  5 Nov 2024 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730841529;
	bh=ITqqGq6mWtWfAtqIp8o0iLGvCeORRBMChO8HBBT5CJQ=;
	h=From:Subject:Date:To:Cc:From;
	b=Ny9sCyO6mFQ3XL9ao31MrZF9ooikmFG6s6XV/aBBCvYDQrH1D1qzfCsKcSn/xTEJ7
	 QwxvKM07WDP0NvT3wVLx/5m4JQzB4V+0UoijRdoI4+6rBeR5v3Gj6gqlVxLU73r9hu
	 S2FHh3GZ62ZoeNFbl5OoJBWTEZniFu50rGrFpnt4wx2Y6SFml9ReW5N6BfwajOsLAT
	 pAy7sKp9am8qMsDijiHE+Sre7aj92gnIm2M9SyLKkUCzQD/RzGhunIois98/bWr42b
	 Md09g0x8T1UIm09ya3ZGPSNxxVx6XtpyxlUb1DkfMUeXJwtKgBKfaXlx/2pC3KSE5n
	 AgRtFFbv2v6JA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH RESEND v2 0/2] arm64: dts: PL022 clock fixes
Date: Tue, 05 Nov 2024 15:18:38 -0600
Message-Id: <20241105-dts-spi-fixes-v2-0-623501e5d1ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6LKmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDQwNT3ZSSYt3igkzdtMyK1GJdy2Qjk1RzczPjNOMkJaCegqJUsARQS7R
 SkGuwq5+LUmxtLQDbJBfPZwAAAA==
To: soc@kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>, 
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanho Min <chanho.min@lge.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_131851_016888_F5E5C4D2 
X-CRM114-Status: UNSURE (   8.24  )
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

Arnd, this series[1] from 2.5 years ago was never applied. There was 
some discussion on the lpc32xx patch, but nothing on the first 2 
patches. So I'm resending the first 2. Please apply directly.

Rob

[1] https://lore.kernel.org/all/20220311093800.18778-1-singh.kuldeep87k@gmail.com/

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Kuldeep Singh (2):
      arm64: dts: seattle: Update spi clock properties
      arm64: dts: lg131x: Update spi clock properties

 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 8 ++++----
 arch/arm64/boot/dts/lg/lg1312.dtsi           | 8 ++++----
 arch/arm64/boot/dts/lg/lg1313.dtsi           | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)
---
base-commit: 6f2ca0f00f319c694ad5bb494b64745a43b40756
change-id: 20241105-dts-spi-fixes-9c24e7763f3b

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


