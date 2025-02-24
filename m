Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEDAC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzMVVDfo0NJa6RT9RxzfioG6fkbL5ySEPZp4hBtpxe0=; b=2TQCqSVSfcX+TC0q+BykbSzTQI
	4TBJQP72yVZm4bMlEg954ewrp4GBvJn8zqDVtF1U5dIrCgO/JQG4qUZrURX6van4qwOUS9p3fQR/N
	vsKVKASn5Hc9aT9d7InyMJu9w8gR4oPnEIO3+N4BUdRFNstivwxjebMFUdBGr/QkoPf0vIJFbe4jK
	Y9i/wGhM1O3pS1hmSWZRSo9PT8FnpArlJstnfL8YqF8uX8BlfybKxLcjrTpZpuww5FBaOe5Ut6VSr
	3Pik4Hobd/QytCo9REcQKjoSOjdX7aFzv/xNWbIcl/v82us9Ghth0SagtGpw96qzVmEsz9kylua7a
	q01XhlTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZPw-0000000E5h7-2Ext;
	Mon, 24 Feb 2025 14:26:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYxE-0000000DzTQ-30QK;
	Mon, 24 Feb 2025 13:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE5235C57F8;
	Mon, 24 Feb 2025 13:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C8DC4CEE6;
	Mon, 24 Feb 2025 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405423;
	bh=OQ7YbuLAqtoQmHB21uw+7T4OIQyqMIGl/9dHS8SMf3I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IBekRFC0f6gWwCSFDsRNzMkpGSB2uuxZWf8eLw1JIuQCbgnybT8Nr9dWdAq6C7sis
	 +UhxPIog8lJhYq50ZvxT4ZQ8NTT1ltpdZcoKdSf1iVYg7itMrVXxF4evLvHMo0f8F4
	 20aj9DfOAFix0I2zhLERV2oEPOyuYXlhPMgr92riUWrfPD54dcZZEYTlGHtao8N75W
	 6T/XtUBmY64ed3q7yWX6vVFP4g7XwXNBRrVgAuHcNk42BwG91wLRJc+KqvDgknPm/a
	 /8BBroJCopj4QsMIfGtEgKfLq+RmA+Q3EugyZ4Mv4AaSY03IBqYxn/pwkIYSBvjJ0O
	 V+SGYdotM9nvQ==
Date: Mon, 24 Feb 2025 07:57:01 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
 Yow-Shin Liou <yow-shin.liou@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Simon Sun <simon.sun@yunjingtech.com>, linux-usb@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Macpaul Lin <macpaul@gmail.com>, 
 Fabien Parent <fparent@baylibre.com>, ChiYuan Huang <cy_huang@richtek.com>, 
 Bear Wang <bear.wang@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pablo Sun <pablo.sun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
References: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Message-Id: <174040535775.2710776.691558658609135796.robh@kernel.org>
Subject: Re: [PATCH v6] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055704_875500_F47DBA38 
X-CRM114-Status: GOOD (  18.62  )
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


On Mon, 24 Feb 2025 19:49:34 +0800, Macpaul Lin wrote:
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
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../dts/mediatek/mt8395-genio-1200-evk.dts    | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
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
> Changes for v6:
>  - Add 'pd-revision' property to 'connector', thanks ChiYuan Huang's help!.
>  - Add 'Reviewed-by' tag. Thanks!
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250224114934.3583191-1-macpaul.lin@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: usb@11201000: 'ports' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml#






