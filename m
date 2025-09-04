Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FFBCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFzgHNkBceQtG43hARNZ5KsLfBA2WJdlKaRU15qH5Do=; b=vYwKtucFdQEkeje9VTgz/j/MPr
	MGCfEcCwLdiAhRhXhZ320cR47dPDG+99m1xkBKB5jbyv7ez0aCaH6jHi3HKndFbe01zJcuGT7368A
	YrxuVaUYhGNhjZ7PqzWvI5QmJHAcG+sC2VnYLtbFG6TmqManvrepAnxazIY+hcKwyQtgQzDVdrBSk
	XvDTF27Wj4NY5dAXf0xIHPvO/rM6d4OzEx2IzSFXF+rmV1PiA/YFzttUby42q1wsnckCSjQVgyfl+
	cn80omWWPaW9SJQbaUqMd9knii7PUS7Kw0XSdLApyzddvj1EmxbNLK/dIbgFVNVmBa+HNVbS0GrvX
	ayLd1P2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM15-0000000FyOd-1dnE;
	Fri, 05 Sep 2025 02:17:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF0E-0000000Dj4B-09cE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Sep 2025 18:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FFzgHNkBceQtG43hARNZ5KsLfBA2WJdlKaRU15qH5Do=; b=AY7/vSDpsHI44Gyk2gMA2kzEG1
	L+4S8pYg7Hz+w6DHPg9QeCkHvlVzbGJ4p802lSJgDqHT1Bc5D2oPRNevDptASfbuIPB2e8oBG/5WB
	e7EVtk/E6uDkd3+BjijII/u+PhwC310etdftJTZYj33roQFUUfkydx3IbU1Xez5+79dXWbFN7H1f1
	qPIpPmcG0h/Ljl746Kurj3reOmPpfUGrok+DzU0v7sfle1pmJVREI8cKYTaqzUj4MM/jCw9yVJiJ7
	eQ3dL6Dpf/P+cNf0u1e7HbMwysfAWokcL4vfybfYeq8vX86spXb3IDlF6PAGAtNxsHOXPbQJpvXHz
	Q25k2pkg==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF0B-00000004PA3-008z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011625; bh=7mCH8/8S4sBInifv/+Psyx02yABDs8NiX2T6iejMDXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BsAn4G2D/0/rOaUi/EWOikiyyE6MWgc1vbA4ftu06X/igJKHy0ydDP2g1ycHajr9k
	 MezaTRmE3PbQkR6xlJLi39PwBx86ZLwaBUrObBoQkszj4doxcFUJt3wT/2PMdZ4PUg
	 ya1eulKb88xd4t/dayuMQd7ZmD2WMfx92guambUu2T1blQbh7Z8svJBiQ2j49S61M7
	 aL9GheOJxAF/bzPh4rnxtp119r1fJ5rJkh5NbaMLNuLbBa/EFj4GcNFPfisliPXIN+
	 7b5tjr4Qu4Os2T2dEUxXUbANV0MsIaypQPnOgn6zJ2WMAOytwDsBTuntobeeX5Jqem
	 HcHtJueOuAwJQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id EDF203D218C;
	Thu,  4 Sep 2025 18:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011624; bh=7mCH8/8S4sBInifv/+Psyx02yABDs8NiX2T6iejMDXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a2ZIN1LYQt5Bho/wWQyZdVbIq030FL6fVbNk1NW9ez0/b7L2LWLUe/vPUtQ/RmoMe
	 KFnfUhq2PjevqUOAV5x8rpucHkSWptS9VUcDRa5xfAp08yRbCozX2kSUMLwVTg+mTC
	 ro4wsaL3JK8N4U2Ur1c3gqJs/DL+wMwADzXBZxOnnnbBfBjTyI8EjJb8lU/jrSzjPS
	 9I55RwrEAIQWGZkSb39DV9LRO+PUybAlxDUnQO/n20NhXhzCRR/mo0qFVV6tYk5nbf
	 +r/BpPWZZNwPdSbNv4R3tPO+2UmTuuz69CCsY5rkNsHifbDvqYMSnkSAdoOI+Rb9+4
	 rNMlhNQ/57k3A==
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] ARM: dts: lpc32xx: Correct PL080 DMA controller device node name
Date: Thu,  4 Sep 2025 21:46:47 +0300
Message-ID: <20250904184647.397104-8-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904184647.397104-1-vz@mleia.com>
References: <20250904184647.397104-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_184704_997260_47ED5C42 
X-CRM114-Status: GOOD (  10.81  )
/bin/ln: failed to access 'reaver_cache/texts/20250904_184704_997260_47ED5C42': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184704_997260_47ED5C42 
X-CRM114-Status: GOOD (  10.91  )
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

Rename PL080 DMA controller device node name to the expected one.

The issue was reported by a dt binding checker:

    dma@31000000: $nodename:0: 'dma@31000000' does not match '^dma-controller(@.*)?$'

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index a38f3c6dbe47..2236901a0031 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -77,7 +77,7 @@ mlc: flash@200a8000 {
 			status = "disabled";
 		};
 
-		dma: dma@31000000 {
+		dma: dma-controller@31000000 {
 			compatible = "arm,pl080", "arm,primecell";
 			reg = <0x31000000 0x1000>;
 			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.49.0


