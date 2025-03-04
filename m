Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC5C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AytBdYdwRQGITXUMu+CAMOtvxXFQ6MY6aN4AJEGNjDA=; b=ptpc2Um907fFQ2qaOX+vNmp7C6
	OnCRhkdTPE/yE7RGZ3BfAEXXZ1cxZXhdae1nZSHHpRS+9ZrMB6FJQxhg8MDC2Qb3J7DwfYaq7EavZ
	FTPMzJxID8SLXULYsQCP4FGMeYnkCjPOq6Xzs0KGAAuYTLtVyqJpy39FZroN15mdqrdtid8AR8hbz
	+tZAiWzovi8VDQYgMKRLHxSV5vK2pe0XSiKY68RMPyZ1j4VyYlucdg7UB0tcMV1p+KB0iLUH+Ue/5
	IhTAoA3h7i7xG2lg3IJDg7vPM8cCNN/on2kllMeZM/vcqMLGAquxWcGrXpQKd9fLXc0IWSbnLJ3T+
	if8RK4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa55-00000006KP0-4Ads;
	Tue, 04 Mar 2025 21:45:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa3S-00000006K7W-15VG;
	Tue, 04 Mar 2025 21:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741124636;
	bh=uJqRyRDrhR+bFdnuWX2kCJ50vTE2fJm3kzGtsIJnJxA=;
	h=From:Date:Subject:To:Cc:From;
	b=LbGXHHBl6KhPy/rpTrUoczuClXv2maOy4LlaICgDAB0XkxKniLAlukTFjfjubpynP
	 /YHL9hz9jarB6GSaY96TCvaTf1wUfIfEV0HZwyYnD8X5t0nAarZfqh5ztcJ2/bbBi3
	 tBc6LXK4gsnMjbFgHBXXgdJYtkp9T0ozQ0r/kQAsJI7329SbgnUwbV5jlWNLpx04YI
	 wyOo2oAUEcHs+8UTT87+rvVbNAAxKG3NweMNkLqIDcgcVMXLh8MZugLJ1nqwSa2hpC
	 lDW1+UdyN9D9l+l2pKTYJpbibsbARcOeLL9yLXcnhJPP8X9uKgoScCdS0m7Sh8ecj5
	 6IbI5zRDLFtQg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D20C17E087E;
	Tue,  4 Mar 2025 22:43:53 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 18:43:49 -0300
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Add jack
 detection with accdet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
X-B4-Tracking: v=1; b=H4sIABR0x2cC/x3MQQqAIBBA0avErBuYzBK6SrQQHWs2GhoRSHdPW
 r7F/xUKZ+ECS1ch8y1FUmwY+g7cYePOKL4ZFKmJRtK4c5RkiNA65/lCfxXUVpvZBA7KeGjlmTn
 I81/X7X0/CZbG82UAAAA=
X-Change-ID: 20250304-genio700-accdet-dts-4a4767fef27d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_134358_452835_AF6C0EEF 
X-CRM114-Status: UNSURE (   9.99  )
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

Enable audio jack detection for the Genio 700 and 510 EVK boards. This
is handled by the MT6359 ACCDET block, which on these boards has the
HP_EINT pin pulled high and connected to a normally open 3.5mm jack.

Add a phandle to the accdet in the sound card node so the machine sound
driver can initialize the accdet.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
This patch depends on both "Allow retrieving accessory detection
reference on MT8188" [1] and "Get mt6359-accdet ready for usage in
Devicetree" [2].

[1] https://lore.kernel.org/all/20250304-mt8188-accdet-v2-0-27f496c4aede@collabora.com
[2] https://lore.kernel.org/all/20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 992bf60c097ae3b1fd6d4e62ef1a327b146496ef..e53c6b0b5a53a616a1684e6efc3758f449294bb9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1189,6 +1189,7 @@ &sound {
 		"AP DMIC", "AUDGLB",
 		"AP DMIC", "MIC_BIAS_0",
 		"AP DMIC", "MIC_BIAS_2";
+	mediatek,accdet = <&accdet>;
 	mediatek,adsp = <&adsp>;
 	status = "okay";
 

---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250304-genio700-accdet-dts-4a4767fef27d

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


