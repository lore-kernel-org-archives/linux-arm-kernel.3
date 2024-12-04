Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E56E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyk00jx2rD13abnBIF0gny6mCB3L0WTy7Wj+eriGTe4=; b=ShOzJ9kBzAtfx2
	bT+VqeDa26qScyKimmeoNhS+P44QHrB9PscA1/uy9IbRWReOKT4vaNGysGzjNsvtCd60pYtcEu+LV
	p1FZzQCE87ITy8nlAiNRGoNHmauxUgJj7ZLIBPxUr8C7CuVISmpRbsNrbFrSGkqxaAPfhGNTgxjIe
	t2WZHVjJNsFv+2poJ1hEBrwrMSxeZ4ypeykueBHHBkIg0dFcxBrOD/Ryeq47dFfTyeSIPphxkK0z+
	yvWHp7rRmNibIaQJet8WJLWV7HWrTsfmTAvm/IGdxMiE65uDuQ8yTVJS9JBlWbH45DxoXqWWilKly
	Fc+nScz3CT3ndiAFdF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImuA-0000000CGId-0xO1;
	Wed, 04 Dec 2024 10:46:50 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImhI-0000000CDTP-2FGq;
	Wed, 04 Dec 2024 10:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1733308401; x=1733913201; i=frank-w@public-files.de;
	bh=dyk00jx2rD13abnBIF0gny6mCB3L0WTy7Wj+eriGTe4=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=p1NsGWXOBMpk9Xrxst9wZ0QHjMpwO7wZJ8PDKhJSd5bz+aLjtIPUof5t5z92JKzh
	 WT02h1/9Ek2xR76AismXJy1hwo56p+h5riKtLoF+z+6W0IDaGJzvNBC1p0XHudAL3
	 jtOOec7pDImiWz7HbelNd3t1Wpmj9F65TG7D/yPkSLXvy/a3dlWQ9MygbJHBa++zz
	 mXLkVzs0UUVuBkS8la5c1KcoKak8F/2CyDCW9yVL+hQelEYyzrEldwIvbUOE6JEp6
	 TnRY2WuT6d2WACzdxo5G5WAjudf2k/UcG120YBStBRKx6TEuzHzh046azmBcb2MMU
	 zD7LgwK4EffKaV9O+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([194.15.87.121]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zBR-1tfnDG2q0p-00rC64; Wed, 04
 Dec 2024 11:33:21 +0100
Date: Wed, 04 Dec 2024 11:33:19 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Chen-Yu Tsai <wenst@chromium.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>
CC: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_dt-bindings=3A_mmc=3A_mtk-sd=3A_Docu?=
 =?US-ASCII?Q?ment_compatibles_that_need_two_register_ranges?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20241204092855.1365638-2-wenst@chromium.org>
References: <20241204092855.1365638-1-wenst@chromium.org> <20241204092855.1365638-2-wenst@chromium.org>
Message-ID: <4762E5F1-59F2-40D1-9D22-724107623AAB@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:db3sHldF0T6VuQva7YZ8BJkBo83cuzvjx9Z9UO2GrwoDa+O4ixH
 63rmTFteH+CanEW1qjyJ069egAPYXQngNUs46t0yjSkh3WMF/xZrQP6vY9qrGuV5e7KbCfF
 g6HTJA6sh62ZCv5Ae+BJ8V7TBxzSZUshJcf9QvB0tKaivwWdNdU+QxtIxPo6scMnpvq6CFR
 HVb0vJa7N7Bvc35qVqjnA==
UI-OutboundReport: notjunk:1;M01:P0:cyQuMalTPvY=;G6cIYpP8l4HrqzVPFLzj+VTuA7s
 6uJk7KoSZC1ZovJPT25TGM8GJhSI8xoE6q/HVcQqBdR69izgSmBk0HHjKrQFCMhBlGOb/YaE1
 zFN4MB2ZIc6cuu4mTxyNsNIPoUrAv53QGq/Cxm6L8eJIqc31ePlcmdDlmYdk3wCBa/bADdyjx
 mCfBONVrdbTanzp6gGEd/sQrLnQJoiw1bf7/dVY3tiTp1f5Kl+pI9Q89yktvTjb8NgoZhitro
 6UYJ8EU5i5S0NQPv7nd2p7N2dpscbpotcfPfUFzW1teVXMYS5TfSKS/jLpxWt2HVjsuSJ7DOp
 VPKbfuj30K1EbEFpDYPqjxTzdwBJEZw85eAqAu+DukkBex6lHtnQb7UZVJ4XDeZvfMXyXtOKB
 66ZW1RLWCHvlAA1cBw3uIFJw4Gf65wmMO2UqTc+F4s9bJ5+TyUEkwGdY8oCr9ZBIvO2Bz8tzz
 GFWCjJ2X9GpvCXVRsHOjuAtzQY+zDeamSdAaSmxCx+SM05MFMUt53JTmBecp8xBA6w/mryszI
 PU9ndFD1J3U3Pl9sh+3RNNgBwRB9HZF9rWs5Bkbz94U8pIRKCxav7ojdmSx6d6SGOhBmbhOl5
 p/tPEYB0PXqLCglsVzE+650DxSgPifuJmr+9592Vh6OjY384voQrQFvSe65q+dzoSmoYMYzB4
 sE8VJwUSkTk1161t1+9qzBU+gVrrGHd/PfJtzGs7Rm0Ou5kYUR4CnjtefZIuJKxlxbbU29WWJ
 kGiK9aICfxDhWANsyKZ9QwlaWxZ7e+bG+MqcmE/I3DxIs4F3D53d8Vm/1gn7zgrmL1KiyuSZ2
 3SacLt7TdVo4kM3MLSt5CdP+AxNBAXcwTE8Cy4mHVoDNOHgztGLGzKVB4UdO29dGXGLmDUHHk
 Z4wSQbE66gN7+4pDbDUc5U03YTZ3jsvphxj8U6LOv0+dX3NgWE7hkmbxAA6m4lGVbJ4QWFDW8
 fuA+JppOaV3Fm2tuCQ5lzQTLY6lgpQT96ME/EUYMtYWT+AzHPjIwZoPCwnTt7eRp4F04AXgIF
 WzqtPeQ0ZQ/r9Pfk27OTM7w1CCceSbdZLtCA06MSWkN89GmH8b/ZDCZqFhlb4yfzNtaNVCg8+
 yZaXe4JsM0f1iCA05qDKUovnAigL3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023332_857478_83A5C9DD 
X-CRM114-Status: UNSURE (   9.42  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 4=2E Dezember 2024 10:28:52 MEZ schrieb Chen-Yu Tsai <wenst@chromium=2Eo=
rg>:
>Besides the MT8183's MMC controller and all its compatible derivatives,
>the recently added MT7986 and MT8196 also require two register ranges=2E
>This is based on the actual device trees=2E

Hi

Mt7988 is similar to mt7986 (only using different clock settings) and usin=
g 2 reg too=2E

Currently there is no mmc node in mt7988 dts (i currently upstreaming it) =
so i guess this is why you have not yet noticed it=2E

See this for more:

https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/patch/202412021226=
02=2E30734-3-linux@fw-web=2Ede/

Maybe you can add mt7988 compatible here too in v2=2E

Regards Frank

>Properly enforce this in the binding=2E
>
>Fixes: 4a8bd2b07d88 ("dt-bindings: mmc: mtk-sd: Add mt7988 SoC")
>Fixes: 58927c9dc4ab ("dt-bindings: mmc: mtk-sd: Add support for MT8196")
>Cc: Frank Wunderlich <frank-w@public-files=2Ede>
>Cc: Andy-ld Lu <andy-ld=2Elu@mediatek=2Ecom>
>Signed-off-by: Chen-Yu Tsai <wenst@chromium=2Eorg>
>---
> Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml b/Docume=
ntation/devicetree/bindings/mmc/mtk-sd=2Eyaml
>index f86ebd81f5a5=2E=2E9ea035928563 100644
>--- a/Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml
>+++ b/Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml
>@@ -235,11 +235,18 @@ allOf:
>       properties:
>         compatible:
>           contains:
>-            const: mediatek,mt8183-mmc
>+            enum:
>+              - mediatek,mt7986-mmc
>+              - mediatek,mt8183-mmc
>+              - mediatek,mt8196-mmc
>     then:
>       properties:
>         reg:
>           minItems: 2
>+    else:
>+      properties:
>+        reg:
>+          maxItems: 1
>=20
>   - if:
>       properties:


regards Frank

