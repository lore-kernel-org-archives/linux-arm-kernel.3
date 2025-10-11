Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B4FCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 03:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JciJ+fW3A6ZS6ImbDuDBfmOW2HRfOeNCg82yAvl2wII=; b=N4XIXc9KEJNgXDNg5irL+BrxKd
	wIqPg3AyZNtlJOICGsfQieJ6EpeTAFSdyt5BTaM6iLJ6YGXuOcK5+36f5ZAlS6QCf4pAg/82x7BD+
	GQUgOWteI1pAhsll39rldWs5+Si/yLftzDbK9vU5ql8Ew0QzAQ7E1rm+aFwYGub2J2y9LjrlyHKLe
	1i3/0r2/Vfo2XWe5dPtbXtIalKJz7UhY0KuwAq6zitxkzcX9NWzOpT0oD93Up+4fdKMP8SkmpsPpY
	HcfQAEXO82c1ppW7BlKr0hYNNTkibPzVvxIOEUFTtV/gayQ965YjCIbUfkj0VdbPhr3nRrJ4U5p56
	B8CWnTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Pv7-00000009ikC-2vq9;
	Sat, 11 Oct 2025 03:05:21 +0000
Received: from mail-m32105.qiye.163.com ([220.197.32.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Pv4-00000009ijk-148R;
	Sat, 11 Oct 2025 03:05:20 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258448df5;
	Sat, 11 Oct 2025 11:05:09 +0800 (GMT+08:00)
Message-ID: <7a0e519b-40ac-4b43-8b9d-f553f12149ab@rock-chips.com>
Date: Sat, 11 Oct 2025 11:05:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: add RK3588 DP carrier from
 Theobroma Systems
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250723190904.37792-1-heiko@sntech.de>
 <20250723190904.37792-3-heiko@sntech.de>
 <0582b7bc-e5b2-4b5e-821e-8d2c4301579f@cherry.de>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <0582b7bc-e5b2-4b5e-821e-8d2c4301579f@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99d13ab5e803a3kunmd5ed0f611cf2f8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRgdTVZDGR9ISxgdS05MTRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BcG4JDpHNH8v0B4VgRuWcBKp5Y0HoHiVdkW0aQ0sem1Laa/IbTNu7NbRpVErCbTBGKlINOF02NVd6bq8nOwYlmjqwfWzrHCawRddnNsSe71Ib8WxSaWhAw33Q+c7CHL3++68jO1O071FK4IIyiTo1yYhitwDBGsB9j0f6LtEpso=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=JciJ+fW3A6ZS6ImbDuDBfmOW2HRfOeNCg82yAvl2wII=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_200518_828276_ED941B37 
X-CRM114-Status: GOOD (  21.68  )
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

Hi Quentin,

On 7/25/2025 8:29 PM, Quentin Schulz wrote:
> Hi Heiko,
> 
> On 7/23/25 9:09 PM, Heiko Stuebner wrote:
>> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>>
>> The DisplayPort carrier is a very simple baseboard only providing serial,
>> ethernet and a displayport output.
>>
>> But its main functionality is that it routes the Analogix eDP controller
>> to this DisplayPort output, which allows to test that controller simply
>> by hooking it up to a suitable monitor.
>>
>> The Analogix-DP controller supports eDP 1.3 and DP 1.2, so can drive
>> both eDP displays as well as full DP monitors. It does not support DP+
>> so passive DP-to-HDMI adapters won't work.
>>
> 
> I tested this on master (2942242dde896) + v2 of the eDP driver as listed 
> in the cover letter, or with v3 of the eDP driver + 
> 48f05c3b4b701ae7687fd44d462c88b7ac67e952 and in both cases I have weird 
> behaviors.
> 
> First, `reboot` is stuck for a very long time before actually rebooting. 
> I think you have a stacktrace when you tried yourself, I don't so cannot 
> send one.
> 
> Also, I tested on two different DP displays, one has a green tint, the 
> other one purple. When trying out other resolutions with modetest, the 
> kernel would often crash (no trace, just nothing on console, SSH dead). 
> Note that the same HW setup with downstream kernel from https:// 
> git.theobroma-systems.com/tiger-linux.git/log/?h=linux-6.1-stan-rkr3.2- 
> tiger works just fine. I would assume this has nothing to do with this 
> Device Tree patch here but rather the eDP patches missing some bits maybe?
> 
> @Damon do you have some idea?
> 

Apologies for the delayed reply. :-)

Since the patch series has been updated to v6, could you please rebase 
these patches? I will then conduct further investigation into this issue.

> The display with green tint is a Iiyama ProLite XU2294HSU and the one 
> with the purple tint is a Dell P2319H if that helps.
> 
> modetest output: https://paste.debian.net/1387797/.
> modetest output with downstream kernel: https://paste.debian.net/1387798/
> 
> The Device Tree looks good to me otherwise.
> 

Best regards,
Damon


