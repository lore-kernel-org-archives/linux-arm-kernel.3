Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5125C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtYJUtNRd4WFJaaNj+Ejw+W4TxnhoeuI+HQtIhDZ/UI=; b=WsPcyfn9g4o1H4N0M8xLD1/tpH
	UH8b9DHr5ms0Gmj7Wp1GFc7ISN/JWeomvMu7W+e2tS5JaY6xwA7g0y6JNoCE+WmogD4v5jqS0EISm
	pYw9vGKMd86RUG/3E+zwKumijl8I1CQnybyVc3smahA36yBnfOja8yzk+mbCr3YrepmG8v2rsZfUW
	B+XMvdI3Iz5XNiOCIvNwz1DV0t3xH0e35rN4aIiZF9jJa4GhRcgkussbd5rMAZzcW6nkKZqmUR5ZJ
	Y83QWL2kDB249F6JmkAsUHvtE+R8i6geusKQ0y+ssv6/r5YXuzHM4slQrcZfOLESGpQFlIUOamhEX
	w3jbU+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpniC-00000007zfv-1Op1;
	Wed, 05 Mar 2025 12:18:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn26-00000007sWW-1qjZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 045995C6758;
	Wed,  5 Mar 2025 11:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD229C4CEE2;
	Wed,  5 Mar 2025 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741174525;
	bh=5wKZo1W3/KKJwo73d2ABuM4lG0wjBbXCHJqMn98euFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HNzwL2Apz+ImWcI9E449fJ1uUCaPdrWT870QqZwQokeyeALzznCrATR+82SLgP5iR
	 PNTj+ohzDf0Us/J46qONWbe9bakWDrN1d/DSgee/1e3NhX4sFWZ/vAVhJk9wwHzW21
	 TmWMPE3apeOd993whfLADD6duv2C2uwBlf5MRjOuDIXMxf8tiWyj+Ft37yVK9ZrVPA
	 lUTpnlqwIbVv8M020yEbOpnF74F99Tu4zzBx1DFMpW0MzXg27I0BZ6MQoRE6sX6bkt
	 Vy48TaeHTxQI3sStfR6kbPjOeajO9cjOxotx/vyq8T5/lW+XWPmD2pOC8l5XjOZ/kQ
	 4bjv6EnaztQsQ==
Message-ID: <c7129d8e-87de-444c-be52-b2eedf03585f@kernel.org>
Date: Wed, 5 Mar 2025 12:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: soc: imx93-media-blk-ctrl: Add LDB
 subnode into schema and example
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
 <20250304154929.1785200-3-alexander.stein@ew.tq-group.com>
 <20250305-dandelion-axolotl-of-excitement-05fa70@krzk-bin>
 <4414669.ejJDZkT8p0@steina-w>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <4414669.ejJDZkT8p0@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_033526_610284_23DDFACB 
X-CRM114-Status: GOOD (  28.93  )
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

On 05/03/2025 10:02, Alexander Stein wrote:
> Hi,
> 
> Am Mittwoch, 5. März 2025, 08:13:04 CET schrieb Krzysztof Kozlowski:
>> On Tue, Mar 04, 2025 at 04:49:21PM +0100, Alexander Stein wrote:
>>> Document the LDB bridge subnode and add the subnode into the example.
>>> For the subnode to work, the block control must scan its subnodes and
>>
>> Don't describe drivers, but describe the hardware.
> 
> Thanks, I'll rephrase to describe the hardware better regarding LVDS.
> 
>>
>>> bind drivers to them, do not misuse either simple-bus or simple-mfd
>>> here.
>>
>> I don't understand that simple-bus or simple-mfd statement. There are no
>> such compatibles here.
> 
> Same as above, the wording stems from 1cb0c87d27dcc ("dt-bindings: soc:
> imx8mp-media-blk-ctrl: Add LDB subnode into schema and example").
> I'll drop it to avoid confusion.
> 
>>
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 51 +++++++++++++++++++
>>>  1 file changed, 51 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> index b3554e7f9e76d..cd785111928bf 100644
>>> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> @@ -24,6 +24,14 @@ properties:
>>>    reg:
>>>      maxItems: 1
>>>  
>>> +  ranges: true
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 1
>>> +
>>>    '#power-domain-cells':
>>>      const: 1
>>>  
>>> @@ -46,9 +54,20 @@ properties:
>>>        - const: csi
>>>        - const: dsi
>>>  
>>> +  bridge@20:
>>
>> @20 looks wrong. Use 'ranges;' and try again your DTS...
>>
>> Binding is supposed to be complete. We have several examples when people
>> added children one-by-one, everytime with different reasoning about
>> child addressing.
>>
>> So please confirm: this is complete and no other children will ever be
>> added here... or you are 100% sure that all future children will be
>> unit-addressable (will have unit address and appropriate properties).
> 
> This block control is a collection of registers for different purposes:
> * MIPI-DSI
> * MIPI-CSI
> * Parallel camera
> * LVDS
> * CAMERA_MUX
> 
> At lease for parallel camera, another subnode is expected ([1]).


That one at least have MMIO as well. No I wonder whether the others will
come without MMIO one day.

Why this cannot be sent all at once? Entire device binding?

> 
> [1] https://lore.kernel.org/all/20240819024001.850065-1-victor.liu@nxp.com/
> 
>> BTW, I don't quite get why this is both syscon and has translation for
>> child addresses. Does it mean your child does not use the same MMIO as
>> parent, thus leading to unsynchronized reg access?
> 
> I'm not sure what the best practices are. This LDB has two registers
> inside this block. So it seems reasonable to me to indicate this using

reg is fine, but you added ranges which means there is translation
between child addressing and parent MMIO. Usually, although not always,
when child is expected to use parent's syscon, you do not have ranges,
because the syscon deals with that translation.

What's more, your @20 means you depend on one specific value of ranges.

I would just skip the ranges and claim there is no direct mapping of
addresses. Reg defines offsets within this device addressing and this
device will handle it.

> a reg property. On the other hand, access is solely done by accessing
> via syscon, so unsynchronized reg access is not an issue.
> 
> What I am getting from your comments this node should not have 'reg'
> property, as it uses syscon anyway.


> 
>>> +    type: object
>>> +    additionalProperties: true
>>> +    properties:
>>> +      compatible:
>>> +        contains:
>>> +          const: fsl,imx93-ldb
>>> +
>>>  required:
>>>    - compatible
>>>    - reg
>>> +  - ranges
>>> +  - '#address-cells'
>>> +  - '#size-cells'
>>>    - power-domains
>>>    - clocks
>>>    - clock-names
>>> @@ -77,4 +96,36 @@ examples:
>>>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>>>                               "pxp", "lcdif", "isi", "csi", "dsi";
>>>        #power-domain-cells = <1>;
>>> +      #address-cells = <1>;
>>> +      #size-cells = <1>;
>>> +      ranges = <0x0 0x4ac10000 0x10000>;
>>> +
>>> +      bridge@20 {
>>> +          compatible = "fsl,imx93-ldb";
>>> +          reg = <0x20 0x4>, <0x24 0x4>;
>>> +          reg-names = "ldb", "lvds";
>>> +          clocks = <&clk IMX93_CLK_LVDS_GATE>;
>>> +          clock-names = "ldb";
>>> +
>>> +          ports {
>>> +              #address-cells = <1>;
>>> +              #size-cells = <0>;
>>> +
>>> +              port@0 {
>>> +                  reg = <0>;
>>> +
>>> +                  ldb_from_lcdif2: endpoint {
>>> +                      remote-endpoint = <&lcdif2_to_ldb>;
>>> +                  };
>>> +              };
>>> +
>>> +              port@1 {
>>> +                  reg = <1>;
>>> +
>>> +                  ldb_lvds: endpoint {
>>> +                      remote-endpoint = <&ldb_to_panel>;
>>> +                  };
>>> +              };
>>> +          };
>>
>> Messed indentation.
> 
> This is already from the original binding. I'll fix in a separate commit.

How? I did not see any '-', only adding here.


Best regards,
Krzysztof

