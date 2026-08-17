Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB25EC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nx/2JiOqz/x+w6M8U7ObPZ69yW2KHjw5AdqyjeYqdZU=; b=XPFh5XlxIOtOHnOP85Uv3Wmwu2
	R61PZv3TncPB0dO17c3oPb4vCY0fH6txoaNtuRyMIdrXMSDGUoCVDkJI6VUFYNL7S+ec7zu+qUA9O
	s1ZlQAuaC/DXBb4yaj+xtijMgosVKdZe3zDpg4WSq1Z7LBRaI1+Ikvk652a8aQvwu1UXDnHL0g0VK
	5Tjn1hv3QbTbQqFGOKOJPuYnbu5lHB3lk5KJ0K77C25sanHhRD1IuVKHmuGeoToED8UqixLG6Exvl
	bsCUgA+w5IWy1mjxDkeKpN2M5XNzDEXCyKOoO6eVAjLTdRQCMFEphvYmGLafCCmI1z53QbUFgvw9Z
	xN6sh9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxIO-00000006Cu8-0IyO;
	Mon, 17 Aug 2026 13:22:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxIM-00000006Cti-2At6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:22:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A01F601DE;
	Mon, 17 Aug 2026 13:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1256F1F00A3E;
	Mon, 17 Aug 2026 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786972949;
	bh=Nx/2JiOqz/x+w6M8U7ObPZ69yW2KHjw5AdqyjeYqdZU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=e1HidAbukOVKdxgQJFMcqBVJrXipGGKVLpHJrISDDBU9xvC0qdt/SpaT+DKw8rBYq
	 DjSO/IBbOl2mgVZTD9bzPJ32Vg5UnQ+snCrok4tte3Q+McAoF2ZFeUjQhg8s+wWqD9
	 4e2tIpnWwGQdbVjxmzS/mmHSGWX9Ovj3FzUGJc0YyEYBhQTDUiC9LbYOmyMT79IgEa
	 ywVmga32zT7qWPzOiFhsVvDDNRiY51q7dM1lfim8vXQSjSKpP3drLGpY0VHRIqPTPb
	 N0WGzz2RxbjcLxLc7JXM9QuxDBqb8GjIfBf43/l2aXZM4JRC82bAngbrQbpPFsq6Bn
	 YYTz78Fl4b3mw==
Date: Mon, 17 Aug 2026 08:22:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: daniel.baluta@gmail.com, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, goledhruva@gmail.com, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 simona.toaca@nxp.com, devicetree@vger.kernel.org, m-chawdhry@ti.com
To: Bhargav Joshi <j.bhargav.u@gmail.com>
In-Reply-To: <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
Message-Id: <178697294672.115607.1502530861180483583.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert
 to DT schema
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


On Sun, 16 Aug 2026 00:23:00 +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Note: Running dt_binding_check on patch will yield a warning for
> 'ti,keystone-reset' in the example block. The YAML conversion patch for
> that child node is already in progress here:
> https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-1-189389503324@gmail.com/
> ---
>  .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
>  .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
>  2 files changed, 84 insertions(+), 19 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.example.dtb: /example-0/device-state-control@2620000/reset-controller@328: failed to match any schema with compatible: ['ti,keystone-reset']
Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.example.dtb: reset-controller@328 (ti,keystone-reset): ti,syscon-pll: b'\xff\xff\xff\xff\x00\x00\x00\xe4' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml
Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.example.dtb: reset-controller@328 (ti,keystone-reset): ti,wdt-list: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


