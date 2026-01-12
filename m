Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18ED2502E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 01:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/coguvbuQJ6Lc8S2lu4ggKAcKXnFx/f9Jnk8AsJys3k=; b=1xjzllw0kySR9OePuOV1DqucWE
	diCpzd+opbiuyWK3bHGbz8sE2Whz7fE9MzRa1+P2tXhvy9zd353HhCLhK5jty75vdKFP1fB1J9Sfx
	SrnGPkBUxy8Q/bVZ59coEw0RnN6hBUtP1EqJvw4BEEaHZn1CCocfc1SvJlrtjlJMza9k3DM9w2g7N
	vE57YCUKH9/HEP+Yyu1F6y5aQYYIlpWT1w8qkth3ToG1uQ11EBvyXEtb2eVHtpJdI3gKzuYyxfUG/
	l7PEeRXEPJTTvYxgHfQMMZoRZJvHtUIloO7/zOhcBcwRs01U7/9X+Eg+zgkC1Rh3cPT4jf9o1YV0s
	gxp73NhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf6nm-00000004dJz-0UJp;
	Mon, 12 Jan 2026 01:33:02 +0000
Received: from mail-m49237.qiye.163.com ([45.254.49.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf6ng-00000004dJ6-3pzv;
	Mon, 12 Jan 2026 01:33:00 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 303f0cc91;
	Mon, 12 Jan 2026 09:32:50 +0800 (GMT+08:00)
Message-ID: <67ccb8f6-f9bd-4266-b79a-b688bd6d030b@rock-chips.com>
Date: Mon, 12 Jan 2026 09:32:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-rockchip@lists.infradead.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de, ulf.hansson@linaro.org
Subject: Re: [PATCH v1 0/3] mmc: dw_mmc-rockchip: Add stability quirk for
 NanoPi R76S
To: Marco Schirrmeister <mschirrmeister@gmail.com>
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260110010715.1610159-1-mschirrmeister@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bafd59c4509cckunm6b904c3425d9cd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0tKT1ZCGRgYH0hLHk0aT0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PUZD15TFeHoo8gN2FFcDZ0avYlYQF5N7lfZAwZgerD57WM3N5NA8XTpdqiJRjcb7D8eXVbJPTrA+FaewvgoG9ZQn0n2ULA0ibPRhxksTlN7ilOpGtu4kLuykrxjWWvQPZNVq5SBZ0bWdp0ftlx2a+0N++WEODvAFbfRU+wKrCQ0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/coguvbuQJ6Lc8S2lu4ggKAcKXnFx/f9Jnk8AsJys3k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_173259_077571_FC8E678E 
X-CRM114-Status: GOOD (  16.47  )
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

在 2026/01/10 星期六 9:07, Marco Schirrmeister 写道:
> This series addresses a microSD stability issue on the FriendlyElec
> NanoPi R76S (RK3576). The board currently suffers from a 400kHz
> retuning loop when the controller attempts to enter runtime-suspend
> during idle periods.
> 
> Evidence of the failure in dmesg:
> [Fri Jan  2 01:28:02 2026] mmc_host mmc1: Bus speed (slot 0) = 400000Hz
> [Fri Jan  2 01:28:03 2026] mmc_host mmc1: Bus speed (slot 0) = 198000000Hz
> [Fri Jan  2 01:28:03 2026] dwmmc_rockchip 2a310000.mmc: Successfully tuned phase to 233
> [Fri Jan  2 01:28:04 2026] mmc_host mmc1: Bus speed (slot 0) = 400000Hz
> 

Does this problem happen with all microSDs or just *a* microSD per
your description?
Have you ever tried to disable SDR104 support?

> Testing confirmed that the issue can be manually addressed by
> disabling runtime PM via sysfs:
> echo on > /sys/devices/platform/soc/2a310000.mmc/power/control
> 
> I experimented with various changes in the Device Tree, including
> lowering the bus frequency and attempting to keep the power domains
> active, but nothing stopped the retuning loop.
> The issue only went away when I forced the controller to stay active
> by disabling the runtime power management.
> 
> This quirk is the only way I have found to keep the SDR104 link from
> crashing on the NanoPi R76S, I am open to suggestions if there is
> a better way to handle this in the driver or the DTS.
> 
> Marco Schirrmeister (3):
>    dt-bindings: mmc: rockchip-dw-mshc: add rockchip,disable-runtime-pm
>    mmc: host: dw_mmc-rockchip: add rockchip,disable-runtime-pm quirk
>    arm64: dts: rockchip: add stability quirk to NanoPi R76S
> 
>   .../bindings/mmc/rockchip-dw-mshc.yaml        |  8 ++++++
>   .../boot/dts/rockchip/rk3576-nanopi-r76s.dts  |  1 +
>   drivers/mmc/host/dw_mmc-rockchip.c            | 25 ++++++++++++++++---
>   3 files changed, 31 insertions(+), 3 deletions(-)
> 


