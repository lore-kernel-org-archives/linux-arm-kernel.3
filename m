Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902D5CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/A+ksG9EMYP+aQ5G//wzuZokqsDVh9YvLyCK1HKays=; b=ZQpsZP0QCNyKWgGBJbrLobI8d/
	fB8iW8P63Lzg/nnF1J7i/EdxMfvoBJKJbmY2HC6jqxkDkOWj+ST6gqLwEuzTEeVqeFFKVqZulWVjt
	9GKPG4D+l94Z/FOSdnIg9ivY2xBwsrFV5x67UOZ9jgwam2/i3lzuMFu+cwZ6TYXPohVVowowWTkov
	GnBFJdfDoLzOZF0XnyjPnh1qzX9YUOYp726nNsdlJHdWkzNrYZhj05kKDNMwgf2p/n8Q+fLAsFE3S
	B7G74hAfvH8JPjt4WQtxZoZJAJyRlg+/fmEp7fgRwb5V1XWQwrai4rJOQW9GaTdvAUBkDVqglQbeb
	rqd1lFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyn-0000000DyfO-2ULS;
	Mon, 04 May 2026 18:25:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyZ-0000000DyH1-0SwY;
	Mon, 04 May 2026 18:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75427445AD;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3241EC2BCFA;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919099;
	bh=0fwwYNeYc3kr+antF5NrKzPSvQ6OoHbAnhgXEJEye30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QkRYfLSpf98W7hQ4ObbEW1P7mNvxg0uTiNgwI3is1u4TqGRHjMiiCysDYbGlpvVH4
	 sE3NHndNy09z1N+ONPBEnxhlSFDQHCx2hVCFgyGf018Rv3mV8H6QAoqRQIsEr+Ta1b
	 AiiSRl/+pU5ZcNP+mKWCz/TvUA85+fPnxqtnJ92I1xXYIpA/3laMq9HZ/FmtcoCsIv
	 8mo3+fmi2Naih0QAYTtXf4jCm1UbLooH6ylk3Dr35BH3Ro648LhDMyinsW5/4kfVyw
	 GXckxmtOTkT+vdctqOR2lgqI7EMUB9zDpFB+vFEWuJDZN18q0LQ8UQHRzRuiakku5g
	 a2V3dsFurWRsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286F0CD3436;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 04 May 2026 21:25:02 +0300
Subject: [PATCH 10/13] ARM: dts: mediatek: mt6323: add support for AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-mt6323-v1-10-799b58b355ff@protonmail.com>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
In-Reply-To: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=814;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=La2MB3KRVqMYMwKFh7B+QquLap8lejJsUVONHZ0oCfM=;
 b=If4UY3kmkGiEJJtVFcFrKYvQsaQvfITJvuCaHU1csy8WFVf6gx+wsgv7vYyM5HTJ73TbQgOTx
 WkNqaEcst4fCb1ix8Y3iJ4sOMMXOH9KGgZQl8YBm0mb/AlQVmgIlyRm
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112503_277936_B0FA4556 
X-CRM114-Status: UNSURE (   9.30  )
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 AUXADC.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index c230c865116d..c070f4b0936c 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -14,6 +14,11 @@ pmic: mt6323 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		mt6323_adc: adc {
+			compatible = "mediatek,mt6323-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6323_leds: leds {
 			compatible = "mediatek,mt6323-led";
 			#address-cells = <1>;

-- 
2.53.0



