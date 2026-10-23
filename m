Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21910606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 03:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KazVh8MP;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Xme2Hqt+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wl1N2fN1N3OOtuQaycXv9jDontNpFyjkTgCOUkz6GuI=; b=KazVh8MPYnvISY
	yr9C8Qn9GCcJMO76m5UGuff7OM7hJ9CeFjfE9YfpX3CWH134UxqC1d9MqYjIGlSEHHVvBPQA2++Gl
	0KyBCpPJmLToKS2Wkdwuqc7cIa1NnGUu6wSyxVXKa7BBWbQXVMJzQbWTIhWgnHrq36t2eUhn4U++w
	tJScOPYE4p/1N3FZGgQT7tpm3wg/hpF0PcfOJ6KMsFLZAnSrX2Af3erJNw8vp+19jIzRRwTSXWUZC
	JZBfMlsnMKj66r7DMBLR1rm38z0NgsbIRJnurI+QouDYnjXDLJvLOkirxBR+Jotnu74YWrONVvyvc
	zV0rSmh1ASnNgQKyTb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6OF-0000000FSyM-1CKg;
	Fri, 23 Oct 2026 03:56:23 +0000
Received: from mail-m10250.netease.com ([154.81.10.250])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6OB-0000000FSxT-1WvB;
	Fri, 23 Oct 2026 03:56:22 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52153242b;
	Fri, 23 Oct 2026 11:56:10 +0800 (GMT+08:00)
Message-ID: <5892f99c-68cd-4ff9-91f1-af5ee024e025@rock-chips.com>
Date: Fri, 23 Oct 2026 11:56:10 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: phy: Add rockchip,rk3568-edp-phy
To: Rob Herring <robh@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dave Jones <s.dave.jones@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
 <20261020030916.3223833-3-damon.ding@rock-chips.com>
 <20261021133418.GA3889663-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20261021133418.GA3889663-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa166e6e69b03a8kunmccf974a417d0dd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxhPVkNCTx0eQhlKT00YQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5KVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Xme2Hqt+FhhVlD1vZmU4mevIcFRkIWQMSFZ7Nm5XlFzIku226zn+7vTxfGDosuZ9ynLpSkWwnLZuWuLTyteI4WBLKb04mGHOcaz6aNvEYwEdL+nqOyWi5+/0qC/zwvBo8K+R0JkuIHfnbEvJk+6jbKm2O5x+GSul8g5Kgk/zbeQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wl1N2fN1N3OOtuQaycXv9jDontNpFyjkTgCOUkz6GuI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_205619_949918_5FDD84AD 
X-CRM114-Status: GOOD (  14.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rob,

On 10/21/2026 9:34 PM, Rob Herring wrote:
> On Tue, Oct 20, 2026 at 11:09:12AM +0800, Damon Ding wrote:
>> Document the eDP transmitter PHY with NaNeng IP block found on the
>> RK3568 SoC.  The PHY is controlled through the eDP PHY GRF registers,
>> so its node is modeled as a child of the eDP PHY GRF syscon.  Also
>> add the "rockchip,rk3568-edp-phy-grf" compatible and the "edp-phy"
>> child node reference to the Rockchip GRF schema.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 59 +++++++++++++++++++
>>   .../devicetree/bindings/soc/rockchip/grf.yaml | 15 +++++
>>   2 files changed, 74 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>> new file mode 100644
>> index 000000000000..afe7bc3d839e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip eDP Transmitter PHY with NaNeng IP block
>> +
>> +maintainers:
>> +  - Damon Ding <damon.ding@rock-chips.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +description:
>> +  On the RK3568 SoC the eDP PHY is controlled through the eDP PHY GRF
>> +  registers, therefore the PHY node is expected to be a child of the
>> +  eDP PHY GRF syscon node.
> 
>  From the driver, looks like there is a specific register range for the
> phy regs in the GRF, so please add a 'reg' entry (and 'ranges' in the
> parent).
> 

I see. For v4, I will add the reg entry for the PHY node and ranges in 
the parent syscon node, as done in rk3399-emmc-phy.

The proposed eDP PHY DT layout looks like:

edp_phy_grf: syscon@fdcb0000 {
   compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
   reg = <0x0 0xfdcb0000 0x0 0x100>;
   clocks = <&cru PCLK_EDPPHY_GRF>;
   #address-cells = <1>;
   #size-cells = <1>;
   ranges;

   edp_phy: phy@0 {
	compatible = "rockchip,rk3568-edp-phy";
	reg = <0x0 0x100>;
	clocks = <&pmucru XIN_OSC0_EDPPHY_G>;
	clock-names = "refclk";
	#phy-cells = <0>;
   };
};

The driver will be updated accordingly to map its own registers
via devm_platform_ioremap_resource() + devm_regmap_init_mmio() instead 
of accessing them through the parent syscon regmap.

Best regards,
Damon


