Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C89CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 01:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLei+uFr5YZHJ93sMcV3QqaOLicJRVy9CC898it139A=; b=JXmBMrt26jswWcGJuJbYyyx/IJ
	Dw5lNeONRkjrawagRSS5VlWhxW2WKVPo2kVolSWBV2+5vXxiLjMSSLnoGH7J7BA+K6rI+fvKPEgbN
	L4OEDvzVMsr3+rXSwhRKTiHjuyavP9Iewe3yrW3Ao3lheGtcR4anFq4c1YbJM+tPu1n9e975SzFVV
	cOdzREoHa/ZLQDdvrv18rNVTWkXjffHpY95JcjdXNE2x8Nb1/7YVMeceDa6zxDZHp8V0pS+p3wKcU
	GVtEjyWmO+464ZJKZ2bR+Rp9Ssmcy1rKC27KbWn6XfeY40r2mOI24uI7JdJrFHAv2z9BKH9vlGveX
	ClZdX8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sDW-0000000C450-1mSe;
	Tue, 23 Sep 2025 01:53:18 +0000
Received: from mail-m3268.qiye.163.com ([220.197.32.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sDS-0000000C447-2QvS;
	Tue, 23 Sep 2025 01:53:15 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23b4ad8a0;
	Tue, 23 Sep 2025 09:53:08 +0800 (GMT+08:00)
Message-ID: <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
Date: Tue, 23 Sep 2025 09:53:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
 <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9974464da503abkunm22f00280b9170
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkJCS1ZMS0JNSEhIGktMGUtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FVAuvIC6WtCOkl7iGSCNBPn3NST+u7LAfgkkz8bBSPG57/anneDVRUxQD3phPFobGTw+H2FPJ/3RW8oPuZRKAoRqzyfzCBiMzGiX/zF3oVAyQoce5gghiL9LICOcDeJyrqy+JhX3wovoruTkQeXgpo19obUlwY5peVyclSu6Dic=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=XLei+uFr5YZHJ93sMcV3QqaOLicJRVy9CC898it139A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_185314_784578_A2005BAD 
X-CRM114-Status: GOOD (  17.09  )
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

Hi Dmitry,

On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The RK3399 SoC integrates two USB/DP combo PHYs, each of which
>> supports software-configurable pin mapping and DisplayPort lane
>> assignment. These capabilities enable the PHY itself to handle both
>> mode switching and orientation switching, based on the Type-C plug
>> orientation and USB PD negotiation results.
>>
>> While an external Type-C controller is still required to detect cable
>> attachment and report USB PD events, the actual mode and orientation
>> switching is performed internally by the PHY through software
>> configuration. This allows the PHY to act as a Type-C multiplexer for
>> both data role and DP altmode configuration.
>>
>> To reflect this hardware design, this patch introduces a new
>> "mode-switch" property for the dp-port node in the device tree bindings.
>> This property indicates that the connected PHY is capable of handling
>> Type-C mode switching itself.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> Changes in v4:
>> - Remove "|" in description.
>>
>> Changes in v3:
>> - Add more descriptions to clarify the role of the PHY in switching.
>>
>> Changes in v2:
>> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
>>
>>   .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>> index 91c011f68cd0..83ebcde096ea 100644
>> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>> @@ -51,6 +51,12 @@ properties:
>>         '#phy-cells':
>>           const: 0
>>   
>> +      mode-switch:
> Having the mode-switch here is a bit strange. I think the whole PHY
> device should be an orientation-switch and mode-switch. Otherwise it
> feels weird to me.

I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)



>
>> +        description:
>> +          Indicates the PHY can handle altmode switching. In this case,
>> +          requires an external USB Type-C controller to report USB PD message.
>> +        type: boolean
>> +
>>         port:
>>           $ref: /schemas/graph.yaml#/properties/port
>>           description: Connection to USB Type-C connector
>> -- 
>> 2.49.0
>>
-- 
Best,
Chaoyi


