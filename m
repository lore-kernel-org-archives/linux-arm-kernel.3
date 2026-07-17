Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BEBC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euhR+NFnLdb+bsfUoV9W/QJPUb0t9RuSsI5XmiS1jBs=; b=1uUIqYjaqYYSS/4dc34t+hYc3w
	Lnv5qmsgqZb4k/le9rGiF7CvDiZfPMB1jxSU/+0W5Nosf8kOK1/oKO+jODK+jYrn22WBFExAKi19j
	TgeK39MKD0ABwGW0vHN9jlShzD7NA5Rzh65w+Ni0eEK3c6yz6Z40+cstAK5bAYimf1Zyt+2RTINW8
	dCUr27YXqbuwSr8icpKU5UXXBWw5DQtR8RTcTCR2cKtccq/X9OswUPruIvj6+THIcbxh6tEMUNEVW
	Ge8JjXdT0vhsOBbaWSwjneKg8TjE5iBz+4/jqNnkBui2J9nL6opFdU6iYK419lx6CMYYTt1xneJBR
	sZ+m9EDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfOm-00000001uJC-458C;
	Fri, 17 Jul 2026 10:02:28 +0000
Received: from mail-m1060.netease.com ([154.81.10.60])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfOj-00000001uHE-0tLX;
	Fri, 17 Jul 2026 10:02:27 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4695fcceb;
	Fri, 17 Jul 2026 18:02:11 +0800 (GMT+08:00)
Message-ID: <5c0c8de1-a340-43f9-8906-3fad22135001@rock-chips.com>
Date: Fri, 17 Jul 2026 18:02:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/9] dt-bindings: npu: rockchip: add
 rockchip,rk3576-rknn-core
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
 p.zabel@pengutronix.de, ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260717085220.3212274-1-gahing@gahingwoo.com>
 <20260717085220.3212274-2-gahing@gahingwoo.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260717085220.3212274-2-gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f6f86c73309dakunmb26c5b98998f5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0oaVktLS0JCQhhNHhodT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CanspQY3O3PM+ZI89p8f7mNRUoyig/xUchaPTtE8hUciWBgQ795Gqv0fE7uU1lrYOBOT5Hi+p3aVpBM/mNlv+pZ6ZKfUJMVJuJ4jzXfPrqerjWVgdAxj2wJlEqBSFQYMYYGPB360EhFYww06xbQgdvGhTmWMJYb1qBET3Y+Omek=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=euhR+NFnLdb+bsfUoV9W/QJPUb0t9RuSsI5XmiS1jBs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_030225_779169_F6B72972 
X-CRM114-Status: GOOD (  10.92  )
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

Hello Jiaxing,

On 7/17/2026 4:50 PM, Jiaxing Hu wrote:
> Document the RK3576 NPU core: add rockchip,rk3576-rknn-core to the
> compatible enum and drop sram-supply from required (RK3576 has no NPU
> SRAM supply).
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  .../devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> index caca2a490..d904db3bf 100644
> --- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> @@ -21,6 +21,7 @@ properties:
>  
>    compatible:
>      enum:
> +      - rockchip,rk3576-rknn-core
>        - rockchip,rk3588-rknn-core
>  
>    reg:
> @@ -75,7 +76,6 @@ required:
>    - resets
>    - reset-names
>    - npu-supply
> -  - sram-supply
>

You should not delete this item directly. Instead, use the compatible 
to distinguish whether it is required.

>  additionalProperties: false
>  

-- 
Best, 
Chaoyi

