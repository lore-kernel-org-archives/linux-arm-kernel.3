Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E5E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V5Cq+Sfz;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=iF77pKNw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cj2YxFAf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0744fbE1Bpjr7J49Vf8JkxMIqKOH5PrOiNWgzUuzsCs=; b=V5Cq+SfzjitBng
	xltSHxRRUzt/P9vf+ddYjBf/pF4hFOwzH4fp5LEq7NF7bKeVKJ3K74Llia4JGWV7/X0IueD4T2SQN
	wEdHqATTslbpylYPF+UrMt+FYhtOEztGgmtzcn42sUWEgbGZfIDVyIDfqieeb36XPbBN3FYZIzswO
	RXAnpHOwEMJucdOXNumKU24j5F8tdWJpT0EAfMEhCQzJQc0lB5JbAfY7NpYWtG2wEFn+vGjDfCDLT
	CZ8U/SRX6UIwKEHuOasYzAOlOKwQEhtSERbR1P2nBIhNY9BlImPt6XYq64NxWYWvkJwM/udyg/9P8
	UJX1wz9nuAl2iOYjdD1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvlz-00000008fsF-1MS5;
	Thu, 05 Nov 2026 11:36:51 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvlr-00000008fjx-2d2D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:36:46 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1A03C7A0133
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 06:36:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 05 Nov 2026 06:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793878601;
	 x=1793965001; bh=0744fbE1Bpjr7J49Vf8JkxMIqKOH5PrOiNWgzUuzsCs=; b=
	iF77pKNweD1dK6m1YwvDTqDDPz8HwVFA04jmXsgA/Yn1KKsfPR6klOkrhaqtBCXV
	R9zOH4nfTCXd6PkTKAzDPzwfyEnmoHaVc2AeXnp93k+a2ntnUiV++lTy4qzCB1Oz
	JzI6mlnorzsIJD8GrSNzzqgyQx1owXkOFCnR0GHZBg8wPop9legez3MrjswL48ns
	9mqCjNWe8foO0g+ZExmvEIoowQG6pOHjsnKD1Af2vhdKXK2KEojGSE+e9dZw+OQS
	qbVZP4UcebhPIJYJs8yZsB4ngdA3QbU7d3AYTxKqa4e9oxDFp8+lqjhK2aGp/oHQ
	uvdJ7CmaMUNBsWG6M8q16g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793878601; x=
	1793965001; bh=0744fbE1Bpjr7J49Vf8JkxMIqKOH5PrOiNWgzUuzsCs=; b=C
	j2YxFAfh/xZ3OCYkktvmPG97PKapZI2M8ceY2OB0vNri9B/jSqZJcuxzPP+ia6oR
	LRS5Xd/+IazTT7PVJsgelAOr70UVTrV23STMDlSXSR00+SRt5oCEM2fnRJjoaWZi
	Dl4x8BWlAS6DJt+yuApiab7UQOKXa0iFEooga81XeHbpfKFJpFK6WD/S9nAOZ35c
	BqKA4rvsXqG59YQqFUdTHowfflVB+6RtE36qDbETYUChwtPMITSSHeVBrK61EaxG
	8O+hgfmQzFzDla33wzjSET8xrwENmS2cKmDnFhNdcGZfOLTT13Y6VgHkAnedEbGg
	Qtg5rtE5PDCaVCI/hHjog==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793878601; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:MrjUNC02MehZB1HxVbQf/M9PkUQZDM45IODSSwHDQfIJ3F7
	wrXdoDgeFqyxOm+avuqS04KlY88r2YKuujIf107a1VL1WCdyV1GfUUOQhFnVes8y
	TfOjRc5U2vvKy2fcc4PBkOiT/42lqmePq7UNmRs8PD69oP8y3QJeeF5vY3gi7FG5
	CpsTIYCZdcOecxoVQec8Vi3XikPhbGbiENZzhdh++WEoS4IBEjbszKbphbsrjdhb
	qjTcjqqOnJuXu8Nwlqq9SHaUdqhGjxNeVuE6tFd/wfKZL3ssIZWlhkjbGN1ni3KY
	ffe60PiVJVc7pZxcExYVzSIlchzfatwT4llISeg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wFZU0B1PvfqDsZBXQbeBFsEUczixwzP5Dp0xKYC6DBc=:hpm8i9GpxRw7kXdH7PimUgLS/n22erqxsBm4zUk+AAI=;
X-ME-Sender: <xms:SGrsai8h0iIPSQaRUCu0hzGUXfQUXhNeGN_I6Nzmga0ED32DGJgi2A>
    <xme:SGrsah-TUhuqorXurBtDInAx5It7q8shvUB00k1i9simfwoijOA5Yhx33b59zzX_f
    dCAClhyMnBAVaWhXz2TbNZLpKX8s0BUoyxEh4ZiySEg_KgOlWEFxwA>
X-ME-Received: <xmr:SGrsaq1ySW9XpuhaldoCoIOs3gWOeAZTvWA9h8dDHQS0X2_trD6hDZcozFzbbYZvdKWEGjez4UlR_d46zZYG-wf88JsAoFeZKgA>
X-ME-Proxy-Cause: dmFkZTFiB+Ef/4hhUELr0xJWI4RLreggeb5lOnSYygbUpmh2w1HzCIgOWn5JqSrKHbnJF6
    Gu1E5HEoFycQcf9fEZZQ93o1mpIX6EUiid5vBGRrjChidySlNGfqHtpNB3U8jUEiqhLfm+
    6xPvXbkcR2ibvNg4OOVM6aiptmnj/TBjEYU3MAKCpGrhxPUrXjXMmo51E4LLG/ceVfW8Tr
    4gql17P4ewfgE57dF++9gDAvlAmy04Q63lix9EUpqSjLhUwBck5DsW/uy2pq/U97T8ijHs
    +ZwSFDLQaHL0/V88gw6RsuWlYcPx9Yr/hGUZyb1Kz3jC9+2TNJOFxe7HAtdL+9BuLuBcqG
    ulwjxzgZuO0Ym0wZltYpD9LL1uUDiSH1pGpwQgLbCjNxiBgUM2MzkVfy7z3XNDEAMqK97d
    tEqCwp3j56ZctZQD2+wwTedCc5Sl0XiD1wvZ5KXUVUKf3FGZZeFHMWqd+Q/Sh525O2w47z
    SoQOmIdDuw9GxwjgouRfqD9RuAuyiqgt2246VqgDUywUmFmHm7nUWJYml79G0O+T1GBe4P
    Bo2QNbcnvjKkdD+fDYDlEyIv+aKGWVLLb9pj8WhTy3dR+wx22RNQb4XnIc93NrZnNVLeNz
    4iAhT8pjgCCaGYvG19iXQc3phmP1+5MzI63qs3GZveXYjFSp2CTzf5c2wEjQ
X-ME-Proxy: <xmx:SGrsah8Zm5m6Qv6HcN8_36QCX2BGhlTBigYD-d-lLwp6v4w3465PPw>
    <xmx:SGrsarfUe_1Q4d6FDmOjq3DTIJwXne9P62dC5G2gkecYfqjdhpgCKQ>
    <xmx:SGrsatFKjdUbG1kuJWqRPW31C0MbT1DK1d2MsWKPv8hHdz2yNpwvIQ>
    <xmx:SGrsagCIIB4Og4_ybYRmzbRU07Y_tyNiqeYDViK-Dk6acBtBdsFA9w>
    <xmx:SWrsaqSDqQlhxqZhH2veNj3DAFSVuaNxzJTIJoDKDcwBk37GVD8QC_Ef>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:36:40 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Thu, 05 Nov 2026 12:36:03 +0100
Subject: [PATCH 6/7] arm64: dts: apple: t603x-j514-j516: Add PCIe device
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-apple-m3-pcie-v1-6-e00a72a604f8@jannau.net>
References: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
In-Reply-To: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
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
 Yureka Lilian <yureka@cyberchaos.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5135; i=j@jannau.net;
 h=from:subject:message-id; bh=i5//AwfzRhKK6qCRpypnc7masCXqqKDqkfxufe4kIYA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqw3WRo7GuS6JrV4T2/luW3lWrrr1z4pHy/PvzzX1+U+7
 u5a6JPeMZGFQYyLwVJMkSVJ+2UHw+oaxZjaB2Ewc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWVKkaGpVMzTdYHHZs6lzktcY1Fk6/8hLwV902j5B9eWS0knmfwjuGf+m9v0/g
 jz4Ui3Evss5etrf+24khEcs2nRp8739ZvNFHnAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_033645_677756_5255284A 
X-CRM114-Status: GOOD (  11.18  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yureka Lilian <yureka@cyberchaos.dev>

Add WiFi, Bluetooth and SD-Card reader device nodes to all M3 Pro and
Max Macbook Pros.
The bootloader will fill MAC addresses for the network devices, add
Wifi and Bluetooth calibration data and set "apple,antenna-sku".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030-j514s.dts      |  8 +++++
 arch/arm64/boot/dts/apple/t6030-j516s.dts      |  8 +++++
 arch/arm64/boot/dts/apple/t6031-j514c.dts      |  8 +++++
 arch/arm64/boot/dts/apple/t6031-j516c.dts      |  8 +++++
 arch/arm64/boot/dts/apple/t6034-j514m.dts      |  8 +++++
 arch/arm64/boot/dts/apple/t6034-j516m.dts      |  8 +++++
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi | 41 ++++++++++++++++++++++++++
 7 files changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6030-j514s.dts b/arch/arm64/boot/dts/apple/t6030-j514s.dts
index 3ba2c9ca4347..f7c1307e76bd 100644
--- a/arch/arm64/boot/dts/apple/t6030-j514s.dts
+++ b/arch/arm64/boot/dts/apple/t6030-j514s.dts
@@ -20,3 +20,11 @@ / {
 &framebuffer0 {
 	power-domains = <&ps_disp_cpu>;
 };
+
+&wifi0 {
+	brcm,board-type = "apple,texa";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,texa";
+};
diff --git a/arch/arm64/boot/dts/apple/t6030-j516s.dts b/arch/arm64/boot/dts/apple/t6030-j516s.dts
index ab07bf7939ab..9f9609575ed0 100644
--- a/arch/arm64/boot/dts/apple/t6030-j516s.dts
+++ b/arch/arm64/boot/dts/apple/t6030-j516s.dts
@@ -20,3 +20,11 @@ / {
 &framebuffer0 {
 	power-domains = <&ps_disp_cpu>;
 };
+
+&wifi0 {
+	brcm,board-type = "apple,jura";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,jura";
+};
diff --git a/arch/arm64/boot/dts/apple/t6031-j514c.dts b/arch/arm64/boot/dts/apple/t6031-j514c.dts
index c1507158325e..8cc2224ee0fd 100644
--- a/arch/arm64/boot/dts/apple/t6031-j514c.dts
+++ b/arch/arm64/boot/dts/apple/t6031-j514c.dts
@@ -16,3 +16,11 @@ / {
 	compatible = "apple,j514c", "apple,t6031", "apple,arm-platform";
 	model = "Apple MacBook Pro (14-inch, M3 Max, 16 CPU cores, Nov 2023)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,texa";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,texa";
+};
diff --git a/arch/arm64/boot/dts/apple/t6031-j516c.dts b/arch/arm64/boot/dts/apple/t6031-j516c.dts
index 841b2bb10b06..5dfe886d47a9 100644
--- a/arch/arm64/boot/dts/apple/t6031-j516c.dts
+++ b/arch/arm64/boot/dts/apple/t6031-j516c.dts
@@ -16,3 +16,11 @@ / {
 	compatible = "apple,j516c", "apple,t6031", "apple,arm-platform";
 	model = "Apple MacBook Pro (16-inch, M3 Max, 16 CPU cores, Nov 2023)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,jura";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,jura";
+};
diff --git a/arch/arm64/boot/dts/apple/t6034-j514m.dts b/arch/arm64/boot/dts/apple/t6034-j514m.dts
index e31bd0bc0592..dfae771ec626 100644
--- a/arch/arm64/boot/dts/apple/t6034-j514m.dts
+++ b/arch/arm64/boot/dts/apple/t6034-j514m.dts
@@ -16,3 +16,11 @@ / {
 	compatible = "apple,j514m", "apple,t6034", "apple,arm-platform";
 	model = "Apple MacBook Pro (14-inch, M3 Max, 14 CPU cores, Nov 2023)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,texa";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,texa";
+};
diff --git a/arch/arm64/boot/dts/apple/t6034-j516m.dts b/arch/arm64/boot/dts/apple/t6034-j516m.dts
index 4d6513558597..dc5c202a787b 100644
--- a/arch/arm64/boot/dts/apple/t6034-j516m.dts
+++ b/arch/arm64/boot/dts/apple/t6034-j516m.dts
@@ -16,3 +16,11 @@ / {
 	compatible = "apple,j516m", "apple,t6034", "apple,arm-platform";
 	model = "Apple MacBook Pro (16-inch, M3 Max, 14 CPU cores, Nov 2023)";
 };
+
+&wifi0 {
+	brcm,board-type = "apple,jura";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,jura";
+};
diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
index bbee373044f9..403a9cb3979c 100644
--- a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
+++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
@@ -21,7 +21,9 @@ / {
 	chassis-type = "laptop";
 
 	aliases {
+		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
+		wifi0 = &wifi0;
 	};
 
 	chosen {
@@ -67,3 +69,42 @@ &serial0 {
 &fpwm0 {
 	status = "okay";
 };
+
+/* PCIe devices */
+
+/*
+ * Force the bus number assignments so that we can declare some of the
+ * on-board devices and properties that are populated by the bootloader
+ * (such as MAC addresses).
+ */
+&port00 {
+	/* WLAN */
+	bus-range = <1 1>;
+
+	wifi0: wifi@0,0 {
+		compatible = "pci14e4,4433";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-mac-address = [00 10 18 00 00 10];
+		apple,antenna-sku = "XX";
+	};
+
+	bluetooth0: bluetooth@0,1 {
+		compatible = "pci14e4,5f71";
+		reg = <0x10100 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-bd-address = [00 00 00 00 00 00];
+	};
+};
+
+&port01 {
+	/* SD card reader */
+	bus-range = <2 2>;
+
+	mmc@0,0 {
+		compatible = "pci17a0,9755";
+		reg = <0x20000 0x0 0x0 0x0 0x0>;
+		cd-inverted;
+		wp-inverted;
+	};
+};

-- 
2.56.0


