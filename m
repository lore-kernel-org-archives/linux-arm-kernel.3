Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AD4C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 18:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg1k+N1CjHljh4O4O+1NZ5dq3O9FqJdzDpBsXrHQCJU=; b=ijxa6kS1PDo1gKNZj4RCeuKfkz
	uKFNdRuCVL9jK791KnNzsv0tj+z0pPZFILdUCQrdQL1fBnQueTEnhffa5JtXL11LQgyaW9yhQIz+f
	te69FBIv40C7sYVQqjZzVXFpK2wAy4nDyRt8WyCfhrkPXzPCeL1bqbDfxskjtddVvTIDW8hSkQ10q
	TVpXBJj1m4dpOISfQeKZ5r5T+TwZCspPonzxmiLBqmS4qxA8biepIvgFHR1qiBS/NgTdz3bUVB0ca
	PBMtG5CE59KPmcmj1zjmKybflFe88Y32h0VqiD8z1pVoBkFo/WsXiwcsHePufbOmlvQXucuYyzyTp
	IwNLeI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCf9-00000006BzT-1kmV;
	Tue, 08 Jul 2025 18:03:27 +0000
Received: from [37.205.8.231] (helo=mx.olsak.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC5o-00000006785-2qft
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:26:58 +0000
DKIM-Signature: a=rsa-sha256; bh=vg1k+N1CjHljh4O4O+1NZ5dq3O9FqJdzDpBsXrHQCJU=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1751994605; v=1; x=1752426605;
 b=Mz/4tHpMmeaAh8Ocf9jwkYrQgSGVnfZNVUPblzd0Uvp7YdVUJeZH8SzH02irPNBgon78FknZ
 Ng1qpX2LUoP9tsNrFki9jwUfEQP/msKAUaVtBoTU3dAB8mycye1/A4lfs6FrRL9wGY8JYvbJMcl
 g5m1wS5MCKtRH34QgtFdOk839IvHoYI59C+D/7nZPTfoXq8HPiru2Otvt1x0kM9FwAAxmHToVoP
 T0DiKhPSObrcbGRGRv6cZ1AmS/w/aLgYaND2L6ImMADo4lfTDKyf5592lHyx/PXtVLn7oSqR9Ui
 ULy6tFACEHwuaRAEEzQ8NjRh0M7gIXDQDCZzVmLV0sLfw==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id b4c8048d; Tue, 08 Jul 2025 19:10:05 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Tue, 08 Jul 2025 19:09:50 +0200
Subject: [PATCH v16 5/5] MAINTAINERS: add myself as Marvell PXA1908
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250708-pxa1908-lkml-v16-5-b4392c484180@dujemihanovic.xyz>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
In-Reply-To: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 soc@lists.linux.dev, linux-mmc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=967; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=woWeKJnpRztvRK6bKdssmWxs/ctbwt85zMIAynkGfrM=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBm5AY9DePkKj5dxOBRnhx5PqY4P2DmHSauyhym35aCdP
 veZlk0dpSwMYlwMsmKKLLn/Ha/xfhbZuj17mQHMHFYmkCEMXJwCMJGZ9owM8xedZlJ89Xiy3KNk
 wYkSHmH7+b12uL5eGtNiK9emd/rHJUaGRQu+sCTMmLGrw9nGL1n04wPr5wcOPjE/UZDtJHOye+s
 6XgA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_102656_864145_7E8168F7 
X-CRM114-Status: UNSURE (   8.94  )
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

Add myself as the maintainer for Marvell PXA1908 SoC support.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v16:
- Update email
- Fix device tree path
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fad6cb025a1918beec113b576cf28b76151745ef..a886d791e753588f55807737ce02355400133188 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2787,6 +2787,14 @@ F:	drivers/irqchip/irq-mvebu-*
 F:	drivers/pinctrl/mvebu/
 F:	drivers/rtc/rtc-armada38x.c
 
+ARM/Marvell PXA1908 SOC support
+M:	Duje Mihanović <duje@dujemihanovic.xyz>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	arch/arm64/boot/dts/marvell/mmp/
+F:	drivers/clk/mmp/clk-pxa1908*.c
+F:	include/dt-bindings/clock/marvell,pxa1908.h
+
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.50.0


