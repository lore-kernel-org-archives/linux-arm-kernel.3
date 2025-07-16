Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BACCC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 01:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jn0hRWbIM6rr6NocmrIeQ0wNYnfckKljpY3FeBK/+iY=; b=sr4o9L8nZT/MPjbKKbfkJiUdXt
	YXWHuVphrCGHahZ1LXOjyTZ7LtWVZJYdWUgT43Pefh4Y/JVeSvFWblG8PqLuP4xqcmyqV65MiaiWv
	HyvR7cl/qB8l93Pg7IOia6YuhCfAGRMpwZ13chtSN/cc94JV6jpA8+imMrv2MIeiot3EPa6XdRm3E
	Y7gNBuw/qiyKScl+pEibysEFk0Lme746BqBM/V0XmKRhSnJJhrJlIdmc6aA7p8z9fNPt8JXNU90+S
	/3y7juXEIfwSg8+QgR0RPRp3iwAB8emZp1cvHW3f8irM6AgUyOXllssIZiqjn2z1+LFQlSrLm3FHM
	ShR67AuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubrQQ-00000006ZkI-1L1a;
	Wed, 16 Jul 2025 01:59:14 +0000
Received: from mail-m15599.qiye.163.com ([101.71.155.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubrNy-00000006ZVy-2gOj;
	Wed, 16 Jul 2025 01:56:44 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c22589b7;
	Wed, 16 Jul 2025 09:56:28 +0800 (GMT+08:00)
Message-ID: <c84cb838-e6e7-4ed0-8d12-67b82f85ff28@rock-chips.com>
Date: Wed, 16 Jul 2025 09:56:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add support for
 Type-C TCPM
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-4-kernel@airkyi.com>
 <eqb5m22om6bx2ypjtnlwdjmgfyycpmgrlvro34xwlwjj4j2jeq@mrarg36wetp6>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <eqb5m22om6bx2ypjtnlwdjmgfyycpmgrlvro34xwlwjj4j2jeq@mrarg36wetp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkgYH1ZMGk9MGh0fHhlJH0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
	NVSktLVUpCWQY+
X-HM-Tid: 0a9810f28ea703abkunm90ac2de114329c6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pkk6PAw6TzE0CQkqHyMaKTwO
	FCMwFBxVSlVKTE5JTUhLQkJDTExNVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUNNTDcG
DKIM-Signature: a=rsa-sha256;
	b=W0jW9R03pDXvYvm3Rcj4D/OVXpsMGGUD4uR1EzjGrfUvJ1jREzszZ3UvHu9fA4hJSWutBZqokl4p7J5EL4BskBgoitkLIFthMM+EJ1eWoL5y4pjR+pSdm4P3can6FI5v2Cx7gxWVhXUR4sdLwXNQPCr29lZXHdhlnt5R7jcGTaA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=jn0hRWbIM6rr6NocmrIeQ0wNYnfckKljpY3FeBK/+iY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_185643_171675_83FAA5D5 
X-CRM114-Status: GOOD (  11.67  )
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

On 2025/7/15 20:05, Dmitry Baryshkov wrote:
> On Tue, Jul 15, 2025 at 07:24:54PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This patch add support for Type-C Port Controller Manager.
>> The extcon device should still be supported.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   drivers/phy/rockchip/phy-rockchip-typec.c | 335 ++++++++++++++++++++--
>>   1 file changed, 319 insertions(+), 16 deletions(-)
> Please keep TCPM implementation under drivers/usb/typec/tcpm/ . Create
> an aux device and write an aux driver for the TCPM part.

Sorry, the commit messages may not be described accurately enough.


This patch adds mux/switch operations to the PHY driver to improve 
communication with the TCPM framework. Since this PHY is a combo USB/DP 
PHY, it requires configuration changes to the PHY lanes based on the 
USB-C  plug orientation (CC logic), similar to the existing extcon 
mechanism implementation. Of course, the original extcon functionality 
will remain fully compatible.



