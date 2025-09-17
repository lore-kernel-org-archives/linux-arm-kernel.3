Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE79CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 01:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=bqmenlmc8L86CbEW9VoE5rdRn0
	gP0L/UPahPahay5D2hzvSCFw0ezlve2J1j6Fh+yxCKMHwrjo3yClvRP8/t1fUpNBVsGVOUkntu/2A
	eymSxPY35nz0OqJS7kNunfaachVPybz1a70/myPqo0BxoY4HOg7ScvvNeA5cko/xBObJq4y0r/W+N
	uHjS0SON1kCm8g2ZMs9231gkzm3sMMZBnK5mvaBPCMFucB7NwrLku9/vLHtThnrpL1lmVOkkb0Q6L
	/93jTgp3sm3r8xXnzqrKrHc3/FDno/jjJABavt2bGlq9a+tOpeUDDTPy0HUtTWb95M+n9YT5j2UUN
	NTAHZj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygq5-00000009pJ1-1Giq;
	Wed, 17 Sep 2025 01:20:05 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygpy-00000009pFN-0Mj4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 01:19:59 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BDD5414001C6;
	Tue, 16 Sep 2025 21:19:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 16 Sep 2025 21:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1758071996; x=
	1758158396; bh=GAZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=G
	Z7o7oBrPxp1aTccnBvCB30h/cLSe642B4TGFfIGld0pC8JOnqhbgkS6Gd59TAfgl
	2l5Efeo3D7mb813VoxCA6y7Ott+RPWT+7Zdmy673k7/pC88LMmN9VTB0j9Pr+rRi
	tImHSiVHgGAwWQ5su3vQrXxBMW3sAzWpiTddlsFohaIuNF5Faore1zVs+BIktd6E
	RdaOEK8SDaCxpfA22RpQ7n12N+Tn2PT/4/TRZOuEmjr4murWucKei4z1OHhWWylI
	x25Fozlsa6h5kJqfxz1vKFpXxuCngy9lGFHrITxRdY7Gk9BMNCerJO3m9+BcEo8l
	PHHaodYyC1M6sPvanUNww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1758071996; x=1758158396; bh=G
	AZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=OiE5pUJBEVctG4j7p
	yJch+eh6egGNWtyoOvmBPbpqBfyVnKLPLCFlEWiJ5PzUn5AZw5Um7oUNs2wGpr8j
	a+sQOxkfA9ZwKikaFcFfouhzB/IxA23IXqz1Wacs2kMkhxy7e4OlhWrccL/YMSU7
	49nBWk6PuOG7+tlizHso/7zkIPwD/ENuvmHnTsZl92lx+AI+lQjz1WRdLvljDz2i
	n6vfiCEJbp/j5aYHLqBnoqd4Tf9T5wpqM8UPbKMlzbwSEgzaB5dfbmXAWBz3A3ZK
	VYt66m631C5y9TSCLgAmFgwxDzUZHoDMGlietDYN+mSTUoNkCB08LM04JrJFMGPI
	rxf6w==
X-ME-Sender: <xms:vAzKaBkijQJGGIFjz1EF6YrMhK3T9os-qsg21GDRibmr3g81SW3Ekw>
    <xme:vAzKaDlLiYJ_DliXWM5wnaKqL5J9ip7xlLHDwCOE3jT8pW8tTx9hUPw_HW72getlR
    -A6Xlvlh6xeAGKALpo>
X-ME-Received: <xmr:vAzKaJYdSufajFYwd9Kh21J-MOPER4UFlXB2YL92SHfP7PcF3oTnOKNqd0QmQVcp8hW1s645UgVmamkwyixRMnIPctIZVvEFmohhBNeOmuVb0BiGql3uSaoCLAB_5Kwstql-wIBTq316mfNuCJUTo6DOGzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegvdduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforghthhgvficu
    ofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecuggftrf
    grthhtvghrnhephfffueehtedukeevjedvieevffehjeeiteehhfefkeehgeffleefleej
    udekgfevnecuffhomhgrihhnpehtrhgrvhgvrhhsvgdrtghomhdrrghunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrthhtsehtrhgrvhgv
    rhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghu
X-ME-Proxy: <xmx:vAzKaNQxifJ1xF7Qosw2lcFC5OCckOV4z94ramicOiEwLpaVhcjFlw>
    <xmx:vAzKaLtkK1woThXD6pCA2oXkEkHVB7ISoCb4fdXvfg9R7wKjBe_UbA>
    <xmx:vAzKaHEV3sJSqifKpSImPBtO3ATn5DxVmUZ6nbYKVu4-aDPvdz0wLA>
    <xmx:vAzKaExdoFPtpejWyF7tU1piQKk76uz-TQ_zKpac1q_cu_r-_J_O6Q>
    <xmx:vAzKaEfd6rPptWDN3TuJwSO4cTg16pOPxnX1NwufnzuxYDZs0m_Gr9hG>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 21:19:53 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v4 2/2] arm64: dts: ten64: add board controller binding
Date: Wed, 17 Sep 2025 11:19:40 +1000
Message-ID: <20250917011940.9880-3-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250917011940.9880-1-matt@traverse.com.au>
References: <20250917011940.9880-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_181958_196627_AA8CF003 
X-CRM114-Status: UNSURE (   8.71  )
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

The board (micro)controller[1] is responsible for functions such as
power supply sequencing, SoC reset as well as serial/MAC address storage,
bootcount and scratch registers.

There is currently no Linux kernel driver for this controller, however,
there is a driver in U-Boot which utilises this binding.

[1] https://ten64doc.traverse.com.au/hardware/microcontroller/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 3a11068f2212f..71765ec91745e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -253,6 +253,10 @@ usbhub: usb-hub@2d {
 		reg = <0x2d>;
 	};
 
+	uc: board-controller@7e {
+		compatible = "traverse,ten64-controller";
+		reg = <0x7e>;
+	};
 };
 
 &i2c2 {
-- 
2.45.1


