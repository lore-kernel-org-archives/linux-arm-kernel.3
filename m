Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66894ED7B9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n4IMnZq2+EdLwlhf7az1AcIEM+UsEFK9lEeE6eUfQ0=; b=sg9xDGLGTE0JJo6buKbobO/YnB
	YK71G7mexCTOt5iCKf0+b6nizTT1WO1nfveN+e/Y5Mpd7DeOvvl6EADA+iUsZDRstpSQ+trtKVIBw
	k4nyFh5jA8lzX1uN21uPBSnSp9Ic8SZCNUCMk9Z42OzSOczrRPKBmoFJ3/P/Zy1zYClxUWlk8k5GB
	v9MKK7wCQSQuI8G0RH8EfBnPCXnevYB+y4kzJdFJ0E8l0+BtxngPZ7d95HzBnZoZIYz2aTbLMoUM6
	bS4xPG4hLN/MQrbFstcVrlpieOka5U5jha5M01TlA98MDIwo4vs4W50STVsV5HOIYrEgpuFq4XA34
	lfveYvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5g-0000000H9Zs-1tEU;
	Tue, 14 Apr 2026 10:33:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5b-0000000H9Tw-2aWc;
	Tue, 14 Apr 2026 10:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776162828;
	bh=UQc4ou+UQDzZxINqGXpBn97ET/EsjCNUWs9PO5MU9T4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NrjZ/SKdNrPnCpprsS45aCtMUiUZYV4cjYW8SHy7ICBnSMTkjK4MHKVf46I9oUHkR
	 9a6vCggXXoMOcKYs7MVRkR/MZIgevGsi5HCdtQp2iqfMAqSMfv1SecWPn3LmdQHlnT
	 fj7gsOQCJ09WSu6Qa64t3BRapjHWD40uQpd77xmnSyrQLv9XwGYZN7fqw7Llqa89WO
	 HG7NfrXozwk7g8INTYY6KCSGdW0zMuGjNOvHZZrMADjNWENyi9+lisHxFsdQd+6N5b
	 x6xqz29oO56Z50+3Pd2KGvNKbk8dkiJ3E6Q9iLj66H6dEO02eazcyNnbEFTdt8OEhA
	 Il7L7iXi4vDVA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA32517E1380;
	Tue, 14 Apr 2026 12:33:47 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 12:33:33 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8390-genio-700-evk: add
 specific CPU power supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g510-700-cpu-supplies-v1-3-3b8313e5ca8d@collabora.com>
References: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
In-Reply-To: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776162824; l=896;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=UQc4ou+UQDzZxINqGXpBn97ET/EsjCNUWs9PO5MU9T4=;
 b=XZTakqBs+bu5IEN53sjLNd6l+Agru9M7boQC5q8Cr0xUfHypxBfQTKTISwtJqOisY7q3Q6+rz
 jjPZzyECpClBAp9Cl/ahryTLGmuU4wlk5dmeAOWOJdsu40ictxM/BD3
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033351_818779_F44C1820 
X-CRM114-Status: UNSURE (   8.26  )
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

Add power supply definitions for the additional little CPU core nodes,
that cannot be factorized in the board common dtsi due to little core
number difference between MT8390 SoC (used by this board) and MT8370
SoC (used by Genio 510-EVK).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 612336713a64..0d5a75efb2ee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -21,3 +21,10 @@ memory@40000000 {
 	};
 };
 
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};

-- 
2.53.0


