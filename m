Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1D8C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0BM50TZK/HIu82bsqWrUkagwGNI0D2aUJbSTJdHkTw=; b=K4iCavNM/hprbtHmCXwyInzINw
	rf3woOLCg8ecpQ+w4G8td+g60lPh0ZJ10YQfkC/SibhBtv2vfc28AOudAF9PWIsqxKYHn6hrkTvwR
	onh7wyMPQ3l5FgNw6QEHGmWMHPuM1r8RRY+UYK2vxgjCnphnfOwaC2/pCcvX8trXXjeLNQSHSXO8b
	2iLnPNa8IonUs/qy5bAUanB2fVw2hSa6z1vNhoUJd8rJamQs2ngMemnTs2ARlevVtEtQ5+bKEfIBx
	sJy/kEj+h+g47IhSPF5bZ8zERCNXyyYZ4vqe5XeQ5IuOjGUdRrAyYHkxGekwtv9eHR2LCj9pj+tMa
	Rz29R/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGp1-0000000ERzb-2nxt;
	Fri, 24 Jan 2025 10:21:55 +0000
Received: from mail-m1973180.qiye.163.com ([220.197.31.80])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGng-0000000ERqB-2jUt;
	Fri, 24 Jan 2025 10:20:34 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 999d7bbb;
	Fri, 24 Jan 2025 18:20:21 +0800 (GMT+08:00)
Message-ID: <9199671c-f647-4c39-8618-f2d7fa28f081@rock-chips.com>
Date: Fri, 24 Jan 2025 18:20:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/14] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, kever.yang@rock-chips.com,
 l.stach@pengutronix.de, linux-phy@lists.infradead.org, vkoul@kernel.org,
 linux-kernel@vger.kernel.org, cristian.ciocaltea@collabora.com,
 hjc@rock-chips.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@linaro.org, rfoss@kernel.org, krzk+dt@kernel.org,
 heiko@sntech.de, andy.yan@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 algea.cao@rock-chips.com, linux-rockchip@lists.infradead.org,
 conor+dt@kernel.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-10-damon.ding@rock-chips.com>
 <173763136187.3345079.11905359473404124812.robh@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <173763136187.3345079.11905359473404124812.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk8dTFZLShpKTRgdGkhMTExWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a9497d3b59d03a3kunm999d7bbb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBg6Lyo5AzIKCho4Az0aKBw4
	MC8KCh1VSlVKTEhMTEpPS0lIT01DVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIS0lCNwY+
DKIM-Signature: a=rsa-sha256;
	b=R9P1b2tY3AWKf5ZQ/2+nyS6ZvqpAcjzV+V0ScfM8eTSa/i9Jm7OY1vqqONpq6+DgOfkt6gctdO2lSxQme3D9eMmucV/8kGVoor85I9KlWdAqTsNwPPTY2EezB9MMB0cHYdCBnaRleqMhTFQriClr29J69Y0S/jfwE5Fq1TFS1S0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=u0BM50TZK/HIu82bsqWrUkagwGNI0D2aUJbSTJdHkTw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_022032_846093_4D82DAF9 
X-CRM114-Status: GOOD (  20.28  )
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

Hi Rob,

On 2025/1/23 19:22, Rob Herring (Arm) wrote:
> 
> On Thu, 23 Jan 2025 18:07:42 +0800, Damon Ding wrote:
>> Compared with RK3288/RK3399, the HBR2 link rate support is the main
>> improvement of RK3588 eDP TX controller, and there are also two
>> independent eDP display interfaces on RK3588 Soc.
>>
>> The newly added 'apb' reset is to ensure the APB bus of eDP controller
>> works well on the RK3588 SoC.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the main defferences of the RK3588 eDP and the previous versions
>>    in commit message
>>
>> Changes in v3:
>> - Expand the property clock-names, resets and reset-names
>>
>> Changes in v4:
>> - Remove 'spdif' clock which added in v3
>> - Add the comment of newly added 'apb' reset in commit message
>>
>> Changes in v5:
>> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
>>
>> Changes in v6:
>> - Keep the widest constraints and add only RK3588 related constraints
>>    into 'allOf'
>> ---
>>   .../rockchip/rockchip,analogix-dp.yaml        | 22 ++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: properties:reset-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
> 	hint: Scalar and array keywords cannot be mixed
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: properties:reset-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
> 	hint: Scalar and array keywords cannot be mixed
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250123100747.1841357-10-damon.ding@rock-chips.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
> 
> 

I have found these errors using dt_binding_check and will fix them in 
the next version.

Best regards
Damon

