Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86975C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 01:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tvZ89+8JoZnHFukEKSRMTvjOkm6vgN7ue8AXAXJ2pE=; b=EoftgKYDSe2J41VjOdbgRUHLiJ
	bCGC2QL6Sf08gbM60tfVEi6rdFk7HTpATQ+SJJYelaaCe5kwEj6r3KcIjG+RJ5OZ3hgjbMqxRYw0t
	AWzDyIkNbpbbL5Y/UruXVqfy3uzi9Wtqm1pC1l5yhofEOOFRujmfukxoq+xEpEDajcgPH76LSAuGy
	MVWSOpjuQ1WJemAR83VS9Jvz4noh9QCwzhTCDlfsiXsWR6Dbhbms3/ntaK5Wx1Wh9ICAt/rzONRiU
	02FzmS0gsShmmS0sVBxoC7wx52ViZ0j/k1XylaSNF93G8x91DXVcU/iW5N0Sm2CdDAJ1NsEYYB43m
	M7BUBcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubqnY-00000006X5y-26H0;
	Wed, 16 Jul 2025 01:19:04 +0000
Received: from mail-m15580.qiye.163.com ([101.71.155.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubqkh-00000006WtL-47JV;
	Wed, 16 Jul 2025 01:16:12 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c20d7125;
	Wed, 16 Jul 2025 09:15:47 +0800 (GMT+08:00)
Message-ID: <3a27b7f6-a614-49b4-85dd-5ecba1fbbf70@rock-chips.com>
Date: Wed, 16 Jul 2025 09:13:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: connector: Add displayport connector for
 hotplug notify
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
 <20250715112456.101-2-kernel@airkyi.com>
 <r7b4y74lr5qwejkejquosaar75mthjvjfy4pp6bbl4pgte6cq4@n3gwjolsaw2j>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <r7b4y74lr5qwejkejquosaar75mthjvjfy4pp6bbl4pgte6cq4@n3gwjolsaw2j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxOSVZISklNSh0dHkIYGk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	9VSktLVUpCS0tZBg++
X-HM-Tid: 0a9810cd504203abkunm840d694a1422a31
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6KCo4ITE1QgkzSBFDOBBD
	KD4wCg1VSlVKTE5JTUlDTk5MT0tLVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSU5ITTcG
DKIM-Signature: a=rsa-sha256;
	b=QErOC5UoqyDYWY6i+q1Kg2Q45UWi3O2IVyJcMA1U/7LcGrlGgWVB09uVvIPfrOYKEcsJjjpCUbjXms9J4bcz4KxHOo2ErvusAHAuHfIyYmuk3PwbGw6m0m6hCQLlKA6SYkIKMj/7nPuL8sgKuV/dILnY4vDV16XIqVGUvBs+5u4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=8tvZ89+8JoZnHFukEKSRMTvjOkm6vgN7ue8AXAXJ2pE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_181608_526221_BE30D924 
X-CRM114-Status: UNSURE (   9.97  )
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

On 2025/7/15 20:04, Dmitry Baryshkov wrote:

> On Tue, Jul 15, 2025 at 07:24:52PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The USB Type-C DisplayPort alternate mode driver will find
>> "displayport" property for DRM hotplug event notify[0].
>>
>> [0]: https://lore.kernel.org/all/20210817215201.795062-9-hdegoede@redhat.com/
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   .../devicetree/bindings/connector/usb-connector.yaml          | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
> Please see how it was done on other platforms. For example, qualcomm
> (both tcpm and pmic-glink) use port / endpoint to link to the DP PHY /
> DP controller.
Thank you! I'll check these out.


