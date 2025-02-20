Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B03DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 21:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFsJ5VEXtJo0NHRksdyRS0SzAHI2Wi77udIk+h0C8P4=; b=LjcFjbLG5hWOz+x1nadR9J3vuH
	Gi4Q0Z3bSXr9dvij+sIGFej1/Azzg8zeuAKYMuvYLySEvUOHh9ACixTJE1mXapQRlnLB4yqzdGR3+
	TKaZxcpnQVVOBrPkQp5SFLYmdPwJT/8D7cslsulvvxHFW17vOyDL/u1ekniiEEEJKptl5oDhbznGs
	3bgc3tuzEoF7yfl8c5LcJ19LQezXUWw7Va5B1HpBImsQ1KUKqbFFHSfyVPDOWx6dOLnC0h9dWdk/K
	WKPWNAnoI/M6mxB/ol3UBHzVbGOWGsTVkGakQnqVBfmcVFimLSjQe16Ux0fbz7WqMR+7Ncboyom/f
	ggiPdD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlECY-00000002yir-2RxQ;
	Thu, 20 Feb 2025 21:35:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE6i-00000002xBg-1XbO;
	Thu, 20 Feb 2025 21:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 995C85C5C06;
	Thu, 20 Feb 2025 21:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138D3C4CED1;
	Thu, 20 Feb 2025 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740086959;
	bh=A3IOtWBEjqYwd1Ik7NqJ+fHSDWC0dHLIvijucwx1oG4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OAdeGOVRdx64WfB9k0yHqlocXOVN6rl8Couf0rvfJWUkSFENgG/epeD4VMtf8Y/TN
	 S54pP7Rqw8RXnJpTQtUKBywhk28n1frg2sCAJChNSP2t+bZkeSdNG5KumADWfxdgpO
	 96AneZ4SZs9CmxFBxTv9kDfJ2UmO6eoGTpbNNCfDiky8aTgvcxsrYoSYKNFW1+0Erg
	 hUB9zjSfAX40mUz0cXjxBXtgjg63NJuFRUepMpIqdCQK1X2+wptS94V2ctXVlgcb9N
	 JMmrHvOhTAcFehJCuyEhBBRRtmNbkhUMuTDiTkjt+ZooDE96zY2oIFWmgkXsCEALF6
	 CEIokj5qEjZag==
Date: Thu, 20 Feb 2025 15:29:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Yow-Shin Liou <yow-shin.liou@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Simon Sun <simon.sun@yunjingtech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, linux-usb@vger.kernel.org, 
 Fabien Parent <fparent@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bear Wang <bear.wang@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20250220143354.2532448-1-macpaul.lin@mediatek.com>
References: <20250220143354.2532448-1-macpaul.lin@mediatek.com>
Message-Id: <174008661763.4046766.2334410087090847223.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] arm64: dts: mediatek: mt8395-genio-1200-evk:
 add support for TCPC port
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_132920_492331_D0B18C22 
X-CRM114-Status: GOOD (  16.52  )
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


On Thu, 20 Feb 2025 22:33:53 +0800, Macpaul Lin wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, and related settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SS (SuperSpeed) and HS (HighSpeed) USB.
> 
> Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
> to "otg" for OTG (On-The-Go) mode operation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Yow-Shin Liou <yow-shin.liou@mediatek.com>
> Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../dts/mediatek/mt8395-genio-1200-evk.dts    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250220143354.2532448-1-macpaul.lin@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: usb@11201000: 'ports' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml#






