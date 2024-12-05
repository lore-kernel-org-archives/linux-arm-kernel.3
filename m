Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B4CE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 00:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WNNOpnUyLFiCbOGUxMtfO2sYZhHb/B54RASf1pjeX4E=; b=QUpRodJdaHDtwqJrPW/oWI3RUo
	9fMgzl/5NnssD+xrJkRsGgxjYPhIWEwF2Tl1iKLCMaq5Z+f5HTpRfnqT/kBDCvXXyDxTo9eRGMK4S
	dSgBzcEzA64DIOzmnn9szBxDl6MepDZR76gI1zFx2mXg10Yya5BxhM3AQlrtbZIWBlg1N4itF+wnD
	aOMqFT8OQOpgd2bwQOWG8+YoZ454+isc45Vy0Ye7egxBl5hWQPizxDtnY7Vgc8PORFVxwHAcOK688
	wNTGbpEevg4LY+LJbkT+DJBLGmh2oxBe0Hj4LA37H+oI6yN+2LH8PYm4MMHF71ic0zMCYXgWGEpXA
	gVgh/OtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzN1-0000000EHMn-1Lo0;
	Thu, 05 Dec 2024 00:05:27 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzL1-0000000EGzE-0EdG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 00:03:24 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 81637A0E14;
	Thu,  5 Dec 2024 01:03:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=WNNOpnUyLFiCbOGUxMtfO2sYZhHb/B54RASf1pjeX4E=; b=
	AZqwORTcqlhQcOdQ3nidlRkFbnL4iC2qfhQOVaeigT244W6otYsdMtFlk4Ps9LKK
	2uki2KeiKNF4qz1N7L5HZRO78D65w14VItktL9s4JBmns4U4UkI97AsHCmfBue49
	vl+81d002TZoujaOFfAPcc4spliyakL07ya1s9oTH3w/u86mUw/h0bdbGRXWmuBc
	ccDWOuBwUAQ6MfsCjZJCd+nLcIuAGXJmHVK3jVeZLyFeMTNQkbTRmrLWmJcW9561
	SIoPgkAB33AAIm9070j6kEWpRI/JA8MSOHL0FjCGVll7yfaEGsYFkqeXUCQoaoHb
	796yoRwYFvDpdoGYDRWcYFEWB9+tQsF7HcpK9Msbv4Xm/LGLbQmpPca3o9g0yce5
	LUP3YWnvhOkm66Tyeyyl7xK9dXKODDdz3OQBFmiO3ISCBRkBGJdlzEmATtxp5grr
	HT0nWnJhO/ehBYq2yzyhMZevaedFCXR/7d1jpFQeW8xoC6S9F2a9sAEAbYL8Rdy/
	H2ul2BthXSOeDYOor5bJ/Tsboacjzsn76tUBYCTtigf3xAdjHyJ4vkJmr3cX6NH7
	xH4c5JcaRs+BnKMDL2x/LIXRo1oSlUs6iTCpWG/3DjLIA0DP8IUBSCUw4V45Qmrw
	50l6cz2GSZeCIkK3AuarRAwHN5l9jCerQn4ZfR4XQQ0=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Mesih
 Kilinc" <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Chen-Yu
 Tsai" <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>
Subject: [PATCH 0/3] Add F1C100s audio support
Date: Thu, 5 Dec 2024 01:01:35 +0100
Message-ID: <20241205000137.187450-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1733357000;VERSION=7982;MC=821435405;ID=169666;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855627561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_160323_425920_5DB2840F 
X-CRM114-Status: UNSURE (   7.63  )
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

Support for Allwinner F1C100s/200s series audio was
merged in the for-next branches of the DMA and ALSA
trees, the last step is to add the codec to DT.
This series was forward-ported/rebased to the best of
my abilities, on top of Linus' tree as of now:
commit feffde684ac2 ("Merge tag 'for-6.13-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux")

Mesih Kilinc (3):
  ARM: dts: suniv: f1c100s: Add support for DMA
  ARM: dts: suniv: f1c100s: Add support for Audio Codec
  ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano

 .../allwinner/suniv-f1c100s-licheepi-nano.dts |  8 +++++++
 .../arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 24 +++++++++++++++++++
 2 files changed, 32 insertions(+)

-- 
2.34.1



