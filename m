Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3798FCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 02:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NS+b33zjPCJC+YQ9D+VMMD2zKMV2hZ3cis1B+LtXgQ=; b=R2J7ZXGdNhPHp+ipg4mr77WTDU
	7PoDGwfbh/WwYMlgfTKKO85I63JvFlYDqEL2gfs2PL4O23+HQTPEeI7FnRwnmBQlySd8sYksM8CYD
	S8mOXmefbYxfjKZqKj2vo2CoK4a3c5KQvR0LHIxxj47VWxKZTMCO51gq2jPMVyGbbO4/IkVDILugF
	Ae66zhxV1RbM2VGwVYjsKZMKqFPTxSogxzSyCP21ATWM6MIVE1bpCa2CKiFOBk9uin6dVNQhf2r9u
	xv8fRXNEywMB7YUYV1W7yGeneOy4cMnSZZqjW1u4OHgWr2gtLe3yk2/MlQfbPqE/TKTKwoAz2cs2y
	tZEtBX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0wy-000000082bN-3S4z;
	Wed, 12 Nov 2025 02:51:12 +0000
Received: from mail-m8150.xmail.ntesmail.com ([156.224.81.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0ws-000000082Zs-1XHv;
	Wed, 12 Nov 2025 02:51:10 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2943c7c46;
	Wed, 12 Nov 2025 10:50:59 +0800 (GMT+08:00)
Message-ID: <d4861ef9-a25c-491c-9a00-d65fe75d2677@rock-chips.com>
Date: Wed, 12 Nov 2025 10:50:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/10] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-5-kernel@airkyi.com>
 <868f09fd-8fe8-4c01-952f-6317604c43a3@kernel.org>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <868f09fd-8fe8-4c01-952f-6317604c43a3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a75f93d9b03abkunm3992e66e1852d51
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5NTFZMQkMZSRpJGUJJHkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BfnanaLsNym3HyzqwH3OnGP1xmT0wPf4OoG6mLeXNzKNon4hMOY5ybAPzIG5A2swqv9GW1Dk0xahQPlEdSUzGVGO030Q+pdtfdO7Vn8vOx3D4j7Jqoib9PCmnjI9PllpUI2CFlrsM/l5X+lLXGTAlfSSW9PssoQIt4PnwxpBKbs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=7NS+b33zjPCJC+YQ9D+VMMD2zKMV2hZ3cis1B+LtXgQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_185107_000231_1E808DDA 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
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

On 11/11/2025 7:09 PM, Krzysztof Kozlowski wrote:

> On 11/11/2025 11:50, Chaoyi Chen wrote:
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
> There are never blank lines between tags.
>
Sorry for that. I will pay attention to this in future submissions.

-- 
Best,
Chaoyi


