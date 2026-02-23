Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC5BEC1113
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZUdZl5z6qHV0IIb0h7NNTv33WoB9V7pmBSMHp4+dS4=; b=nnQt3ELAoOQHFX9BE0CO48kamc
	S0uxTs51llsK2dJto9DYkF2l2jULg2xHyMPmyGKrE4QlwVLAfV6X6B9e1B8kH5HGhk55ny6Dh9Byb
	BtCYR5UdGbd7oO7JMcw53Qrxgew54qHcq3Fod4sY8nTVQrnKnAdFEY182gn/hihe7wifWm9yBHbql
	ivoPjtQGoUxXEi5N/rmiUXrwrMOv1Jua2XnNvFv+x78CMM1eeJ0rrlDFwUptzRqEnhwltPccJpTOH
	aa1tmCM2JHOnjNMlgXtac/4bEw4IpyP74RX0vF0DZNDoV6qW/HlJvBxGRnIiapUEVLDcf4e5TnFj0
	ZbHidmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZPU-00000000j4E-0FdS;
	Mon, 23 Feb 2026 17:07:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZPR-00000000j3i-1GSZ;
	Mon, 23 Feb 2026 17:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771866464;
	bh=A6xnEFdr8reueLge6TPzjj/7mjnCn9LUEyXj3tdfcH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NkX5yRnHWIe56qhSahvA9hfs/eeL3XAMkDAfj4yH5+V7lbpmnmRT9NZ37rmY82jbT
	 ED2gAQarwg+/A2mUr8/r5O/To64gctxlKFh+mNju9sDpTEyJb8EJTV78djOydRtR+y
	 52Uww8ZVbsfh3oy3qhU3Fgmk2cM4Qnrhnh8InPaAKVzCoC7+tDcydj9a4SeN16mwSu
	 snLRBYrBWBkY9L5c2wVmbFcscpNkjvcx/LPbx3JP5ibB2UHTwkV+vAtih3NVpfanrz
	 8B6FKcVrlCXaXDpHuQi5aAmspjX/bq7NuczZeMsaVdifaUfwUewyPGS1jsJ35O0Gxd
	 hAn7rgm5USCWQ==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9D6017E06CA;
	Mon, 23 Feb 2026 18:07:43 +0100 (CET)
Message-ID: <b4eb3031-69e8-4a73-b4f1-91dd4192bb21@collabora.com>
Date: Mon, 23 Feb 2026 19:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
To: Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
 <aZxkDGzEQCCLKR-M@venus> <DGMF3IX3J3BP.1XT41P0G8P5OD@cknow-tech.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DGMF3IX3J3BP.1XT41P0G8P5OD@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_090749_527297_26746FA1 
X-CRM114-Status: GOOD (  13.02  )
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

On 2/23/26 4:39 PM, Diederik de Haas wrote:
> On Mon Feb 23, 2026 at 3:31 PM CET, Sebastian Reichel wrote:
>> On Mon, Feb 23, 2026 at 02:25:05PM +0200, Cristian Ciocaltea wrote:
>>> When building device trees for the RK3576 based boards, DTC shows the
>>> following complaint:
>>>
>>>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>>>
>>> Provide the register blocks in the expected address-based order.
>>>
>>> Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576")
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>
>> This fixes this warning, but instead creates a new one, because the
>> reg-names order is fixed in the DT binding:
>>
>>    reg:
>>      minItems: 1
>>      items:
>>        - description: The function configuration registers base
>>        - description: The link table configuration registers base
>>        - description: The cache configuration registers base
>>   
>>    reg-names:
>>      items:
>>        - const: function
>>        - const: link
>>        - const: cache

Oh, right, missed to check the binding.. :-(

> 
> See also the prior discussion wrt this:
> https://lore.kernel.org/linux-rockchip/edabca63-594e-44ae-8a3d-0f60987a8664@collabora.com/

That's interesting, I'm also not able to trigger the warning on RK3588.

Regardless, the binding can be easily adjusted with the patch below.  Hence I'm
going to handle this in v2, unless there's a reason against moving further.

Thanks,
Cristian


--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -34,10 +34,12 @@ properties:
       - description: The cache configuration registers base

   reg-names:
-    items:
+    oneOf:
       - const: function
-      - const: link
-      - const: cache
+      - items:
+          - const: link
+          - const: function
+          - const: cache

   interrupts:
     maxItems: 1


