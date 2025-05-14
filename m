Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F1EC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3itLzVr3wcAGurgHi5vW7zv37HilRwYyZn5aQsLd+k=; b=QTi/gOVRKGXs366/BCwn60f4nJ
	jjQhiJymKTCw4G0Q0AOHHNWwcWn7iQxyUGLrjucjbuDW0ebY6jUVNXJ2TjEJHzmUB66ouTaG48hRt
	xb3nl/P9i0f1h+To1T3j0oztH98eJ+kI0NfZNylNcJjnfWnr8wFfobL6lqY77ASqXO3Ibw21Z+dHA
	Ex+dhvB7Xx9+tyvM6wcg86yEUlr+DK4/oGSxUlsLuge8eIZXZPAGeUvo8xvpUWSSI/vXdhpAQtAEl
	zMDG5ZGOdyzob9e1tiwH2XUtBBpxpJSmBfkxTdP2rI0vtd8qsCYRKvB0sVKZmb6e/TfJi50MqV9Kl
	M5n8Jjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7xJ-0000000Eaqc-1hbd;
	Wed, 14 May 2025 08:59:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7LX-0000000ETjB-3yjG;
	Wed, 14 May 2025 08:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747210810;
	bh=Zu2ghSu2kt9/8uiiXqMjSaX/ZzpuEjE3fucBPzK/Mh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FbIksy41gayjGfbnDbwUgJ+VWVum8h3wOBQf5wn6CT0+RkA6RtNGoEIoyARNVoT9f
	 aY2uJHsQpxCoXJ2cl2Gz9BB7zh/VYW6LaF+ISC36AtiB3isxMeYFew++lgGjf/wYyF
	 Ea5XT71ZmbC9dMIQFN9X2W5DbOYbfWvb44TXZkmKsKzifZ3O17pAlnNTOfIH9OqDRu
	 zKa47yzPfoO/8vHu+FDKulWmJKI0ZiLFP65rEMjr1v6RfX6fYy1PEHRDEvrStTpQh7
	 eDBdWVnEb9VuBr57i6QwzsX9Cl8J98BJUeaqlT0QUSRReiZ0dmQ2WrmFtcmSh+aRUk
	 /6xZMFokYMTeQ==
Received: from apertis-1.home (2a01cb0892F2D600c8F85Cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B75117E361D;
	Wed, 14 May 2025 10:20:09 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 14 May 2025 10:19:58 +0200
Subject: [PATCH v2 3/3] arm64: dts: mt6359: Rename RTC node to match
 binding expectations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-mt8395-dtb-errors-v2-3-d67b9077c59a@collabora.com>
References: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
In-Reply-To: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
To: kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012012_152015_5FA8128B 
X-CRM114-Status: GOOD (  11.41  )
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

Rename the node 'mt6359rtc' to 'rtc', as required by the binding.

Fix the following dtb-check error:

mediatek/mt8395-radxa-nio-12l.dtb: pmic: 'mt6359rtc' do not match
any of the regexes: 'pinctrl-[0-9]+'

Fixes: 3b7d143be4b7 ("arm64: dts: mt6359: add PMIC MT6359 related nodes")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 0c479404b3fe3adc9789386e34bda4dc580b5abd..467d8a4c2aa7f16ade92a287ecdeed5089302045 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -300,7 +300,7 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
 			};
 		};
 
-		mt6359rtc: mt6359rtc {
+		mt6359rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
 	};

-- 
2.49.0


