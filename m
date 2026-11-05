Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D8606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vp/Tb2KH;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=qj11wS3y;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=g5rvkAj+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zgwlKRgbAyyeVrz9e03wAaukDpxsjlYyoxYyI2Ompng=; b=vp/Tb2KHY2ndhbUCYjylSpi+1j
	iC0euOJEa9joRaaGwJI+U9A4GN63dms3XlI/xqtmNZhtIYN36jF7FcvEjvupzhznyJ6yTB9gB0GdJ
	pTpDko6zsL+umpfg/7R3xNHhh8gM0eu6x6n8M2NWe5mhacs13+btM+JtZGBP/MKq1ZiVuZFJI/sHC
	NdMIIfDCWAwACz/ghKrGgsGm8kOuflxPKNhXmwAQrmmuxmwK+oz0FzSwyRe6PJz4jQESofYe1uAwZ
	OpJA+H2vL84VjgLnqSUylQRjVpinVKFC8eohewGl0o6GCc8nUu9si/swS1FIBIaRzfWsV24d77e9a
	ORAGPq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvlS-00000008fYE-23eK;
	Thu, 05 Nov 2026 11:36:18 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvlP-00000008fXk-4C2v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:36:17 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B30267A0165
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 06:36:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 05 Nov 2026 06:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1793878572; x=1793964972; bh=zg
	wlKRgbAyyeVrz9e03wAaukDpxsjlYyoxYyI2Ompng=; b=qj11wS3yL5DDq5X1Ht
	qOlk3+WuKLwZLtS8XIf7K28AQyD/69sGsYANDa0aBSqzXWfF6fvemgZAgi3PVEtJ
	BOrD+o82UU48P8JuogKSIBoy+/5wuaj2W7Wa/DBckit6i4xxG+5gvm0njWX5FOu2
	mFMJYDxaqpb6q8kVWSpmL819sPZNjEnvSjdDrNhFN+Pye8OJ1zdZz3ReYRZztPHR
	2hP/gddeGKcttvdALY4ZWi2CZqJtCi8+w6SfVCa7A91i2+Vkw4HOiGIKDa1grWLM
	HwDJhLbnAih9oIV4PdTkDawwzS+MplTXOshGg39lVmVwJ2mNG0ue5YYLubffnoa1
	BXbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1793878572; x=1793964972; bh=zgwlKRgbAyyeVrz9e03wAaukDpxs
	jlYyoxYyI2Ompng=; b=g5rvkAj+oNKdnUsXerUwfZUrJtORpRKwAu8BbYXCuje0
	tIOv9qzA0T38dWB93wwkd0yhcK6Xu9zKnURvqo8yxmfmwEISgWfi9StFciH6uAdf
	ip6Or4sGfjpGY2Fl0IRjSAlKrsH3BnEiGvvusSz+QEiw+gRCr5SP9Y6njzfm52aE
	LDY/55GVHSEhPGEqRTfd2OY8KU0AxT5g/ciPZ8KZ1KAC23BDzo6fD8Z7UnTEOxJ0
	0Arkw/W1eahMCBFquhZTiFVICnBrLF46h1VpPIY+hi6sIB91oExxjJeOoA4Bwqn8
	Y6EhO2xte5uwjLp9mxxQ4LN3W/xmvhS6OOpNf085Xg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793878572; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:tBcJeJhCWAt6JSt2yvYgE0mdWKYGUfdELyi9kKzyIqhrtxG
	Gl8EFPRHcGKSL+on7hBqJJC4ebRIMdiNEPQ113zUTm8tKhs4c02lAHVm+teJVYB/
	HkDLY6wnuP08L/huuF5uRx9jEf1lbMYcqKyfoyGkhI8LeyL8SxUuVyxOWaURwUQ/
	jTgbHKfNwyeBnzJurDTV7173h52g7hj9kZD402r9MwzN/vq2i5kLGE4Gka3xGGxQ
	Qd33a1BSeTXyp7UPz9hfLitKNoXJ84wEGyUDF5/Gk79Qkb+8vqSyAM6ZbsicAiGM
	MqmvN4Druir+O1biSdtS3Torzog71cXRW8Tf4mw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:LpZ/5bJM1HLJbcJw2JIC5vEe9vj8O1x7MPP93kEe1yI=:zsPBGklg+XUvs17DCrShWGlc1/+ZwSc51P1G7wIhUZk=;
X-ME-Sender: <xms:K2rsahhFrUfM3Sao498qjOQ-7ZQAG-q-U_bVH4_SFkfzrmF6QSpeMQ>
    <xme:K2rsakblbAbjEg3WKZ04RSsEL7jg8QpFc_dRlTKpTwzG9-0djBT45UWihHCoWL8az
    YMA_ruC2K64ww4PZLQwIIMNVqGnECbWeOnbT7b2fsMEhMKAVySJLPo>
X-ME-Received: <xmr:K2rsatE7Th42Xgq8HaBwHOWQWYRqrU48bQcQGcsxgdDmOcJo_XJ38SZmd8k1dyfSiWUi8xM8tCD8n_2fmROyYAbqRUyIGJAwsiQ>
X-ME-Proxy-Cause: dmFkZTFOa7Ic94cWIacjGhT1BhbECCJf5jZOPDKN/9fhH8jxuN8AGiILDwHUgregI5Fv7x
    KMJdJrUREigLbC5Dc7GCqTqwPtUSs9fuv6Dip20yeAeLHdXaHULuc1cUI8O1bu0MDxlqri
    dZgycBbAWk1wLRdJJcUVEXtcYqA6yQI15kNjdD1S3vxzODPlwowgnkJTs9tpA5W8U/1TW9
    qGnNAN9C7Gg0r5A0BZCghWNep9liU8Pdcn7ErHBZG0fEsU1kNH8DGczEcnWw3Lnl2QdrGq
    R/2qJBd6bVjVn+K6akbdmP4HMw/737P50K0st4ZxdQC8v2TAhIPL/mhvRen2Ptkgh59OER
    BqO+XJnUMAPVioPlxiEvCOcVWr9pc30AfftBFMTA7NJVZ34T0oLKmPr80dbFie4et2B8Fn
    TARleNTK3hgM65vRUZ5yQ94V4jQv2oF2NY5LxZdhJFYdOy/fq8pmzfemSWd8pp2TsJHWDW
    g0H8dDBcu+GdyBfj/+XWjlPWlI0/y0BKDIQtylm+pSkotdTpldZcZOcQNvt7/jEwracAne
    r0s/yABeMO60ZBk0HrN8EnD8K2RGi1dh9a4HOf2wT0UcH/eNlctny7I1InJlXVxNj77xUH
    +K5FQDOIHNu7mfiEcEIkLGAg1Lq7NQZIkjxyCPas5qtlMb0XeoeAKdp1lFcA
X-ME-Proxy: <xmx:K2rsapbUFFSqVfTeKsFL-sZcr8_vMmInLRazGOkMthU7wyIYJC5vgA>
    <xmx:K2rsam1p75ui5emHs8NA8N1fIUYIZuBYjvyGQUMqtGucGDwgbKBW9A>
    <xmx:K2rsapeFMv6fjpIGfBsjwUumvOENjDIKPJ_1Lg2NBeeEXhdS6LPFIQ>
    <xmx:K2rsagCZdjc34x5aYzp67W5tjYeqSWr4g7H-N0NQ5BMhHzs-QvrmNA>
    <xmx:LGrsatQP3prpoytU6xroqbLmj5onamjz2RLdm-vLjpvseLaF855QYDqI>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:36:11 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/7] Apple M3, M3 Pro/Max/Ultra PCIe device trees
Date: Thu, 05 Nov 2026 12:35:57 +0100
Message-Id: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTMJrQSJVyEspvVHxyA0LRgSw
 t2puvwW7+2UEBWJbsVOER9NOk8ZpizIP2V6gPWeTbayjTFVzRLCCH5fOHgFC67WtXXjRAbKTYg
 YdPv9uv7vtLoX/PKd0HGc8cs1w3EAAAA=
X-Change-ID: 20261104-apple-m3-pcie-ae72b846baaf
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>, 
 Yureka Lilian <yureka@cyberchaos.dev>, Alyssa Milburn <amilburn@zall.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3188; i=j@jannau.net;
 h=from:subject:message-id; bh=zsPBGklg+XUvs17DCrShWGlc1/+ZwSc51P1G7wIhUZk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqw3WWpf27qPCC++ZWOZ7fIy4Zac0tfX86dwP1/Sfu2//
 zGV4/fZOiayMIhxMViKKbIkab/sYFhdoxhT+yAMZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKneacrwP/HaiW6+N9NjrHjdk372aff526//5CQhVRItq3K2fM4mLYa/gppv1qt
 ssN7JZWsQzG95IW+RW47kFV7TTv1Qjs0vDf05AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_033616_259356_5E5C5E62 
X-CRM114-Status: GOOD (  12.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hej,

this series contains the device tree changes for PCIe support on all 
M3, M3 Pro, M3 Max and M3 Ultra devices.
The PCIe controller on these SoCs is compatible to the M2 Pro/Max one.
So add the new per SoC compatibles to the dt-bindings and add PCIe
device nodes for all M3, M3 Pro, M3 Max and M3 Ultra devices.
The series contains a fix for the M3 (t8122) power-state devices tree
nodes. A power-state required for the PCIe controller and the NVMe was
not correctly represented. MacOS keeps this power-state always on and so
does the device tree for M2 Pro/Max. Do the same on M3.

Based on apple-soc/dt-7.5 [1] to avoid trivial conflicts with the NVMe
series and to import the M3 DART dt-bindings from [2].

The series passes make dtbs_check and make dt_binding_check and does
not introduce additional dt-style-check --mode strict warnings with
dt-style-check from next-20261103

ciao,

Janne

Link: https://github.com/AsahiLinux/linux/tree/apple-soc/dt-7.5 [1]
Link: https://patch.msgid.link/20260925-apple-mtp-keyboard-final-v4-0-304c267518f4@gmail.com [2]
Signed-off-by: Janne Grunau <j@jannau.net>
---
Alyssa Milburn (1):
      arm64: dts: apple: t8122: Add PCIe device nodes

Janne Grunau (4):
      arm64: dts: apple: t8122: Keep ps_apcie_phy_sw always-on
      dt-bindings: pci: apple,pcie: Add compatibles for M3 SoCs
      arm64: dts: apple: t6030: Add PCIe nodes
      arm64: dts: apple: t6032-j575d: Add PCIe device nodes

Yureka Lilian (2):
      arm64: dts: apple: t6031: Add PCIe nodes
      arm64: dts: apple: t603x-j514-j516: Add PCIe device nodes

 .../devicetree/bindings/pci/apple,pcie.yaml        |   6 +
 arch/arm64/boot/dts/apple/t6030-j514s.dts          |   8 +
 arch/arm64/boot/dts/apple/t6030-j516s.dts          |   8 +
 arch/arm64/boot/dts/apple/t6030.dtsi               | 165 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          | 157 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi     |   9 ++
 arch/arm64/boot/dts/apple/t6031-j514c.dts          |   8 +
 arch/arm64/boot/dts/apple/t6031-j516c.dts          |   8 +
 arch/arm64/boot/dts/apple/t6031.dtsi               |   1 +
 arch/arm64/boot/dts/apple/t6032-j575d.dts          |  72 +++++++++
 arch/arm64/boot/dts/apple/t6034-j514m.dts          |   8 +
 arch/arm64/boot/dts/apple/t6034-j516m.dts          |   8 +
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |  41 +++++
 arch/arm64/boot/dts/apple/t8122-j433.dts           |  28 ++++
 arch/arm64/boot/dts/apple/t8122-j434.dts           |  38 +++++
 arch/arm64/boot/dts/apple/t8122-j504.dts           |  26 +++
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   8 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   8 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |  29 +++-
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          |   2 +-
 arch/arm64/boot/dts/apple/t8122.dtsi               | 175 +++++++++++++++++++++
 21 files changed, 811 insertions(+), 2 deletions(-)
---
base-commit: 6c799b8c0df41869fa0d059f7e54f8f84b3989ee
change-id: 20261104-apple-m3-pcie-ae72b846baaf

Best regards,
--  
Janne Grunau <j@jannau.net>


