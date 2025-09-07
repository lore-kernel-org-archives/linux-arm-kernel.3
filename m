Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3C3CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UUfEoumCbzIEx8AGvj96Z7JPRJbPQvAkGwx1CilBgwE=; b=U2TyE1eHF/dhms
	Cwd550SDZ+tWbHaJtf4kr8gv2G++ZEsCtKPo6BEbD7GuBqx2Nt2EMCqOQYazhF0kSaTtQ2lXKqkEB
	0F8QNRk27emrhzl8Z0y6swxUu2ejoVZTq19uO8iwCUkOOfBF96J6Gz32jJa7HJi9azVdawqP1VsFR
	lRMqHB0IB0UoezUsRHB06Vn7f8kwhfU6Q3bOwH/g2OzyKEIlwsx8hiCOHnOltBbcZte0uBCJNsNk1
	eCDyaAs3ctQZEt34pKLlnBSwUQ3nkdCoonJMeiVF7caF0EmSLSmKYETMiS4inScVKrn+Pz/sI5X2x
	Mg521H1URzONYFKcBitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFzU-0000000BOlQ-3eNk;
	Sun, 07 Sep 2025 14:03:36 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFtq-0000000BN6r-25DG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:57:48 +0000
DKIM-Signature: a=rsa-sha256; bh=UUfEoumCbzIEx8AGvj96Z7JPRJbPQvAkGwx1CilBgwE=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1757253359; v=1; x=1757685359;
 b=dCN1TqkR8jWZhyQqaVOJAVVuCxA1lXyAZxR7vG3jqxxFgDLEtahbtdU7MVlRXt5ZQhHuJrxB
 II4UhBVNPZbXIZb29uBjNS2BgKqdVvKPd7f0eRtutvActjbl7ILVrxabhEGc426x2w7WrG08iNh
 5E9uAGuBVhV71fkhYFemHWgV9P4tMDZZSYLnn1DtA1xN6y7u50s2lH3YnEBSgnuv0Md6pbvt/Lw
 FAnNmoIamCxHzbljW5s3inUozXbH2aoznbgxDjnx1KtIyMopJyfg2WpBnVjo1vWDWU0FTCWJYJv
 gVb8oOVbMRxgDHMcgsihuw614rQ6uS7562eyfMJ3ivYoA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id b57b65df; Sun, 07 Sep 2025 15:55:59 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: [PATCH 0/9] samsung,coreprimevelte DTS additions
Date: Sun, 07 Sep 2025 15:55:13 +0200
Message-Id: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMGOvWgC/x3MQQqAIBBA0avIrBNUULSrRAtpppqNiUYI0t2Tl
 m/xf4dKhanCLDoUerjylQb0JGA7YzpIMg6DUcaqoIzMLeqgvMS7SmfRu2jRoLcwilxo5/bflvV
 9P+KHPJddAAAA
X-Change-ID: 20250902-pxa1908-dts-65d86a5d2d85
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=TYNRK4+bphtWM7te51Y2NO2PW29CFLfANZF+pOwh/qQ=;
 b=kA0DAAoWrTGTUkWPrQMByyZiAGi9ju2iqQQ5hd4oP1/zhH6hkf+gf1PCCdXHrNhozAammwcUk
 4h1BAAWCgAdFiEEbf9B1g3zFLW3a6YwrTGTUkWPrQMFAmi9ju0ACgkQrTGTUkWPrQNCWgD/bW/J
 2b0a34KRd4pKwG0R9y5OS+d+wmbIQlO2ik1AtYIBAJRqdJazJ9EFW8AuqO/nxJxImL1E96apsLT
 t+cy2ViQG
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_065747_366592_F6670B71 
X-CRM114-Status: UNSURE (   5.87  )
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

This series adds some hardware support for the PXA1908 SoC and
samsung,coreprimevelte board which has accumulated before the initial
support series was merged.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (9):
      arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      arm64: dts: marvell: pxa1908: Add PWMs
      arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      arm64: dts: marvell: samsung,coreprimevelte: Add USB connector

 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 157 ++++++++++++++++-----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  46 ++++++
 2 files changed, 169 insertions(+), 34 deletions(-)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250902-pxa1908-dts-65d86a5d2d85

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


