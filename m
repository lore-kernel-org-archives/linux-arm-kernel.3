Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D692C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPitpmiwr5l9IF2gxpMYMAPvfvwPiTMXrxeVUdV6d3o=; b=cVqPmXUk0KVJDe4sWAynZ2Egyj
	dmllk4DUFhtLhYIOT+3l7UhN5ok19f3jd31gS/AegSVX+pGvTfk3ctrLbmIC75nTohpnIOPPLFy9x
	LQRgjh52OGilqDK1HXi6O3uAb7g5OkPZ6irqMU74+rASCXFjZzZNYI2N9A2HSfZRhn1exHXAXmFqX
	4id5fAkptUb2G0D/iOpsBVM0oa4gdCWdez/+560OvJrtg3D1PnRTsIUwzJdTG2ZFoMxTe0tgYJbd+
	Tr5Pemz4IWFFli7Xs97nyFcs6MJAWHHvMueoAe0A00MgU7MldWg9KbG7BnN6azNEaaSVh4SFqknuq
	4HgOHVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLvj-0000000Cyri-3dE0;
	Fri, 21 Aug 2026 09:52:55 +0000
Received: from [38.71.22.102] (helo=spam.axera-tech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLvg-0000000CyrF-3l3O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:52:54 +0000
Received: from spam.axera-tech.com (localhost [127.0.0.2] (may be forged))
	by spam.axera-tech.com with ESMTP id 67L9VqaV009888
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 17:31:53 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67L9USlE009398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Aug 2026 17:30:33 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 21 Aug
 2026 17:30:30 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Fri, 21 Aug 2026 17:30:04 +0800
Subject: [PATCH 4/6] arm64: defconfig: enable ARCH_AXERA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ax650-v1-v1-4-e1b013938e6b@axera-tech.com>
References: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
In-Reply-To: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787304625; l=635;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=QS02tvkVmFzXqI3twhl3BKem23lCVglLSY1o44tazxE=;
 b=SexAhsJl62b/yFLRpa16G1JgEyohIPxpiuiVcCMEKBEZo9cSrj68FTWJWqvbFlj9BxqHthhpW
 3INefI055lgCR0NnNLvDmEaV6vZ0eJH302iK9zR1ht9GQojFrwO/9lr
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-Originating-IP: [10.126.103.103]
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-MAIL: spam.axera-tech.com 67L9VqaV009888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_025253_241219_7DF4BCAA 
X-CRM114-Status: GOOD (  10.15  )
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

Enable ARCH_AXERA in the arm64 defconfig.

Reviewed-by: Shi Zhicheng <shizhicheng@axera-tech.com>
Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..a2c2b41f0146 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -40,6 +40,7 @@ CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
 CONFIG_ARCH_ARTPEC=y
 CONFIG_ARCH_ASPEED=y
+CONFIG_ARCH_AXERA=y
 CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y

-- 
2.34.1


