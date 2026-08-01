Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80A1C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 00:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOpdjYiy1dw/PF2Kni1dZZvOd/ToLUIPJyYJmCb7uaA=; b=b99B1bVqwxe82+Mv5EHIlj55lR
	rFenYPXcE0scVIoK13pZbonlcSGX0vIz73YMUtFXld7Y1Ze1KBI7s38B3q2/QQ2fqSEPspTMmEKte
	qSt4YXTUcJdNes527aAyYtWzLDin8Ls79i0ek4aox2Ca+isyexor8Syxq3iMNTHqirt5Zb1cN7Jst
	E9nh3E4HxdnZGPvgcNaInmR4yas4ZY0T4xOMJtS940qhf8Lkt0u499o/NnlMd6V8darACYauVYy0r
	qGe08fR3pjO3RDcI8Ltx9XsIuf5Ko4VtiqlZVQ9Pybee8mBQ5GkFOkiYdy17n7ktPpOksptOgZkOJ
	pW4m/40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxhO-0000000Dlfm-1UiL;
	Sat, 01 Aug 2026 00:35:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxhM-0000000Dleb-3RUO;
	Sat, 01 Aug 2026 00:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2BEB4506E;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7802C2BCF5;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785544531;
	bh=IBXJdMv3y2Oce7CYXF7RsNTqmP5WmVy5av905jYjMZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FFAfclm8PbPA775JMD6KDx74zWBh6xZjdGHnYXEhZvLvV0AwazooMtoVAQiVPGvPB
	 C75ypEdM1jlpgPzbR8VJGnKuvY6JvE6YlYRQAdj6Db0jbU8Q9qU2eZImRZAE7pFjgM
	 yrox42bmfIbD3rXo4bQw1GwMb3FbeH8fel5hCJXhWTUU/cI35kGORazhUA9LE/uVjV
	 UeXQhyE/8JG00USL4Zn2RybRHZdDr1voYSOD09HsgznH1w6RGgDjsc4L80r0hf+6w8
	 nnmw1+L4sxm8p8XBaeKsOYcQZ9aR45oqxjtZZlJ6WN11EbVEJA3OXBsTxYDHCrCjIB
	 pUKo3oklb8ktA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9F6C5516F;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 01 Aug 2026 02:35:22 +0200
Subject: [PATCH 3/4] arm64: dts: rockchip: rk3566-pinetab2: DW9714 coil
 requires higher voltage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-pp-pro-camera-v1-3-7b4d90788f9f@ixit.cz>
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
In-Reply-To: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ondrej Jirman <megi@xff.cz>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 Manuel Traut <manut@mecka.net>, 
 Alexander Warnecke <awarnecke002@hotmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 phone-devel@vger.kernel.org, imx@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ZHRJuCpp9diTbSoK/fprSuePRcEV0i0y0Y263b51eL0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqbT9RrWeOzQofKRUF0yXALcXjL6uK++hWoGvII
 zYHZFYlEOSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCam0/UQAKCRBgAj/E00kg
 cidMD/4olIUWt4Eo80Icz+MSRhbI2hBudu+Q6K2z5p1g4t02GHyJffBgWUluc3uMD3vkezQH/pj
 64jT96zE0/Rfo0Hju0ey0K1tl2qEHw2+JbmJwWhZUu4XLrAdVUG1TjwY4SvxS/05GHdfEkHzzqX
 vg/fjM328bqC51TAB8PxoTB1VjFd/VzVfSI8KYKmZCAY6KNhtb2VlB3DfmdmEoNjI2qJlqVQ94+
 sEkbty+eERY4OW207ZjWDhmiOp9aZycdZyGJaByTjd6JwRx0Focb6b6txJ6NhE1HUplkyVoRb7a
 j8pvTpfBuKEp/dXYnsNKW/KYz+QqOF8OlxB5vylpcmAfHjpCJT4CFNqrdkXBnAnAwJCJezsRGYL
 2VAZyFxn6AzoDc8h4ow4MgrkxXxjPOKs7it6rth0wdDiREcTWfQQAPsRhI0hTkw2q36Xytxsk7r
 C1xI61i3r/VsYwdn6cr1TfEm6kbJlg+nAgJk/GNXT3MhpyE7dwsnPJkeWVt+eSUlxqZ4CiHouSC
 j7T7ahrM/65s2MFuEp0HJBFishxK8gurEpEajNSVcv02+Sxho+qdtzzDmjT1lgPw7d/Z3HMYNN4
 yil+aJf3vLU8Z3OllCwX7JwALEDajOvEtZGxYhu5I3JolK6uhRKF6urLZHaSX6wKOGbPq+O7+ow
 9sT3/on8FxojQaA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

By datasheet the VDD (in-kernel named vcc) range is between 2.3 to 4.3 V.
Usually it's around 2.8 V. Here it matches the vcc2v8_dvp.

1.8 V here is likely used for i2c level shifter.

Fixes: 1b7e19448f8f ("arm64: dts: rockchip: Add devicetree for Pine64 PineTab2")
Cc: stable@vger.kernel.org
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
index 08bf40de17ead..96511f1bb51d6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
@@ -581,17 +581,17 @@ touchscreen@5d {
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c2m1_xfer>;
 	status = "okay";
 
 	vcm@c {
 		compatible = "dongwoon,dw9714";
 		reg = <0x0c>;
-		vcc-supply = <&vcc1v8_dvp>;
+		vcc-supply = <&vcc2v8_dvp>;
 	};
 
 	camera@36 {
 		compatible = "ovti,ov5648";
 		reg = <0x36>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&camerab_pdn_l &camerab_rst_l>;
 

-- 
2.53.0



