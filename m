Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC7DE776F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyywd9I0kEffR/daSYsAoEeToLYK1gQi6U+zGnM/qhI=; b=xKLIpUmBWrnC633+wF0y/QvGL0
	gs6wabuBtnaPQ0FhjO9AanKO+vUAdMcWHwpZaKEZuaEE+rcLiV27uIFKQwnFs/vbJJlWayFe6HxXH
	sQANjhQLDVrD13Go5bPDCd3TXk+m+fcSnGOc4Tki05rpZWOzMlxN6zX6p8SHEAxJVfjd4cb801uuj
	ymNUG+458TtGzT+p6YjMuqbb0fR1Uk2bGam0qjUnCMKRb69fJzt4F69oPhAVvM/CeaHYOsAb5qHVX
	7PxZKSIpzDowbmxFNnAKsR5jpd47aor2jqKtyRHaJnJ5FmcTluyyFovoGAoALsI7ZLsvHr3OyfrHF
	5cR35ZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCT-0000000HG3I-2GS2;
	Wed, 24 Dec 2025 16:59:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCM-0000000HG1I-3XO9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 24 Dec 2025 16:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Yyywd9I0kEffR/daSYsAoEeToLYK1gQi6U+zGnM/qhI=; b=IXOGk/TyJRsabp5RdcJ7Sw/zdF
	Y7WeyF5m+eitUh1dWrmQWTfsclk0a+iW9bgr9H20SzCWVtz7mNthC09bLX3GvIiY6mdzAvhaCUjim
	w7mkmeWSZSi7S0JYXEGYvxxdnCFpU8S5ppULnQkiIe1j/JDnCkCw1b37SmReU4Xc3vON0hzXQq/jS
	WL1h7lp6uNSuGK4UTapNZN9G1A2JqoEectRER1f1Mg58D0SvEivoDmpVQ5zzMFkURnWAkToreMADG
	6onggRJ82woxEMQw6rlezEJez8XhYduTd6RJlPlSkhuErv/ljj6s4xinDidtSRLKmJtBVrqhXw8jN
	uN6loB9A==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCI-000000003HB-1Ro9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 16:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766595528; bh=wEFs4mTiDo0ClYnjqZcnDlX0QwitP+M2KZrX9mPhHrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dbtUgE2CO+zOXXPZCEKY286KCynRymPPNdq7tf8Oa+rdf+isGSczP0xZjndEdA26R
	 Tp0lGhtCQDzGeM14M7kATFMV6ZEQfheVxIJB4Tv07kTSRoPMvkdIMquzEbARY6532O
	 cNwySBBQLiZtZuSvov0XLJWmQlnplamMPrb9PBsysJMAIJlzxFqtQHKgClkV5xHu0k
	 JIPyVdSykPW/elnmV4lOpyjx14wdSQZjFELZha5OsCvHPSFDkaXbUktAPF+ts90cCG
	 NrfzG4MdrjVl1HRMyJfrZd+wFkuyfiR6UUjn1TqZy3asa7w1LgxjB9GwAFeQ/CNTKA
	 eCeUqqvXnfGsw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 665C33E837D;
	Wed, 24 Dec 2025 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766595528; bh=wEFs4mTiDo0ClYnjqZcnDlX0QwitP+M2KZrX9mPhHrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dbtUgE2CO+zOXXPZCEKY286KCynRymPPNdq7tf8Oa+rdf+isGSczP0xZjndEdA26R
	 Tp0lGhtCQDzGeM14M7kATFMV6ZEQfheVxIJB4Tv07kTSRoPMvkdIMquzEbARY6532O
	 cNwySBBQLiZtZuSvov0XLJWmQlnplamMPrb9PBsysJMAIJlzxFqtQHKgClkV5xHu0k
	 JIPyVdSykPW/elnmV4lOpyjx14wdSQZjFELZha5OsCvHPSFDkaXbUktAPF+ts90cCG
	 NrfzG4MdrjVl1HRMyJfrZd+wFkuyfiR6UUjn1TqZy3asa7w1LgxjB9GwAFeQ/CNTKA
	 eCeUqqvXnfGsw==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id DF0623E8AFF;
	Wed, 24 Dec 2025 16:58:47 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: dts: lpc32xx: change NAND controllers node names
Date: Wed, 24 Dec 2025 18:58:44 +0200
Message-ID: <20251224165845.1261926-2-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224165845.1261926-1-vz@mleia.com>
References: <20251224165845.1261926-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251224_165848_436591_5C3F0C63 
X-CRM114-Status: GOOD (  11.47  )
/bin/ln: failed to access 'reaver_cache/texts/20251224_165848_436591_5C3F0C63': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_165848_436591_5C3F0C63 
X-CRM114-Status: GOOD (  12.27  )
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

The device tree node name of NAND controllers shall be 'nand-controller',
while 'flash' name is the name of NAND chip device tree nodes.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 206c66bdfe41..3d5a59b2886c 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -62,14 +62,14 @@ iram: sram@8000000 {
 		/*
 		 * Enable either SLC or MLC
 		 */
-		slc: flash@20020000 {
+		slc: nand-controller@20020000 {
 			compatible = "nxp,lpc3220-slc";
 			reg = <0x20020000 0x1000>;
 			clocks = <&clk LPC32XX_CLK_SLC>;
 			status = "disabled";
 		};
 
-		mlc: flash@200a8000 {
+		mlc: nand-controller@200a8000 {
 			compatible = "nxp,lpc3220-mlc";
 			reg = <0x200a8000 0x11000>;
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


