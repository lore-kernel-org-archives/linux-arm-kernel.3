Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80162C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7E0dv8dad8ykAZHYhwM6AXzi3dNkuvSDcWdTKiL1UY=; b=SUpLFDP3CbaLfI7PzPxtbesbyh
	xwuXcLxhaU91LwMOdzzlickFjb9sNM7HkDNoT4Dn7S37l8PHMZtn2U02BOmrL4WA9lWgsZ0v/1vhI
	XxzVsFNbbTzfrUvyWtnkhJKSxDZjDLnXxnzvxe5B0deyd0nZQx8g4y26pVzwMOujGMB48VNJPrYke
	nNp+LTbKyzbIkfRnUpdQdZWvuhBf7h/PgS810JAsz6RAYuRcyQPZYC3msPF/5APBChHL0X6nl6H0k
	81vPg0QKIgsQ2EVacY71XnGt5BCkEpuczYlDx/SxwYM14Yei7j1IajdQbJ5G6OaWNsKyzYHOmkb/n
	R9zV9c4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXjW-00000006WhY-1hCM;
	Fri, 21 Feb 2025 18:26:42 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXUR-00000006Tn0-0uir;
	Fri, 21 Feb 2025 18:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22321615D4;
	Fri, 21 Feb 2025 18:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217A1C4CED6;
	Fri, 21 Feb 2025 18:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740161466;
	bh=mb3+FQLiAdF0GxPdTxxNZ1nsfmB1mwgJcruotyetN9Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CUO5XUpE5/sksVVDBuF3JnxmN+bHo+c1O9ILuMJqjeQdO+1d4uH9jXDth3xbNBetl
	 b9lCeEagUllp9vXDf12sYZJscUOgiOjcu57Es5G3iiVC8zOpU7vLE/MyHdotn1oJEA
	 VPiOP12WJaT2QMAXEL/G9HIN+dllsF+42fpaZZTSuTdqBkXE/i8l7lFuLgpCXjTPYA
	 u2/TtfZuka8QjTNTQqME60gh7MZErwn2Gbis8sy2tusEo2rDNqEMHSrlYZycoxpgLM
	 qBjp06wjA6Jk/WF5wqsV/5fntE6+n/eM/SsyiFpdu13hL8xYkpSueAGhdYn3Kt5w0W
	 pwOjHKW9HN2XQ==
Date: Fri, 21 Feb 2025 12:11:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simon Sun <simon.sun@yunjingtech.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, Macpaul Lin <macpaul@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bear Wang <bear.wang@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Yow-Shin Liou <yow-shin.liou@mediatek.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20250221144941.2844333-1-macpaul.lin@mediatek.com>
References: <20250221144941.2844333-1-macpaul.lin@mediatek.com>
Message-Id: <174015998416.3469778.7696460950092748736.robh@kernel.org>
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
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


On Fri, 21 Feb 2025 22:49:41 +0800, Macpaul Lin wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, MUX IT5205 and related
> settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SS (SuperSpeed) and HS (HighSpeed) USB.
> 
> Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
> to "otg" for OTG (On-The-Go) mode operation.
> 
> Add ITE IT5205 (TYPEC MUX) under I2C2 bus and configure its properties;
> also add references and configurations to 'typec-mux' node.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Yow-Shin Liou <yow-shin.liou@mediatek.com>
> Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../dts/mediatek/mt8395-genio-1200-evk.dts    | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> Changes for v2:
>  - Drop the no need '1/2' DT Schema update patch in the 1st version.
>  - Fix indent for 'ports' node, it should under the 'connector' node.
>  - Correct the index for 'port@0' and 'port@1' node.
> 
> Changes for v3:
>  - Correct the order between new added nodes.
> 
> Changes for v4:
>  - Reorder for property 'op-sink-microwatt'.
>  - Fix indentation for 'source-pdos' and 'sink-pdos' nodes.
>  - Correct node 'pin-cmd-dat' with 'pins-vbus'.
>  - Add both Highspeed and Superspeed ports to ssusb0 port.
>  - Set 'role-switch-default-mode' = "peripheral" for ssusb0 port.
>  - Rename endpoint of USB data port to 'mtu3_hs0_role_sw' and
>    'mtu3_ss0_role_sw'.
>  - Drop it5205fn phandle for node typec-mux@48.
>  - Reorder properties of typec-mux@48
>  - Add "Reviewed-by:" tag. Thanks!
> 
> Changes for v5:
>  - Squash two patches into one patch and refine commit messages:
>    suggested by reviewer.
>  - Drop 'role-switch-default-mode'
>  - Add altmodes settings
>  - Drop 'Reviewed-by:' tag since the two sub patches has been combined
>    into a new patch.
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250221144941.2844333-1-macpaul.lin@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: usb@11201000: 'ports' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml#






