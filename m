Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56C3D4116C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VITCb4bX5R30M6IQTSFF+7s0mSypA76PtH4Lp3AhVpc=; b=nfsBYPqfRD1+lLA1imGjY+D/dP
	ff4z0NPNlIQzK0omk0sW4uGJRedmUFDdl4fr9ru8nTFQtD3hNj2CaJKs076hCjYfWS1V21v6BUzQf
	daR2t68JkO2C8fBWcVQ/4RKl4x/GsLqVtniQGhAMgC0OeX3t+FCt0L/EF8zuZPFbziOsXERp8JMfe
	3XpkC1uQscmRwn9XlurufLKRTVF2PckuYyQ+Z7Qdo56eQsM9Wl7Z9+r55PMoRNwdRO5lcGLPzvs4p
	qgZETIV+pzk7SDnnom837A8E4uslFfZz/44fVlv+BSYj0PyVu/SeURnqY0au2auKQ81iF/z+G+rO3
	HJmRy78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLBC-0000000CC1A-1vzL;
	Thu, 15 Jan 2026 11:06:18 +0000
Received: from mail-m3293.qiye.163.com ([220.197.32.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLB9-0000000CBym-1QVA;
	Thu, 15 Jan 2026 11:06:17 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30c74f925;
	Thu, 15 Jan 2026 19:06:02 +0800 (GMT+08:00)
Message-ID: <d487d1c4-a21e-4d6f-bc01-5797eb449c57@rock-chips.com>
Date: Thu, 15 Jan 2026 19:05:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: rockchip: Enable HDMI output on
 RK3368-Lion-Haikou
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260114230707.4175162-1-heiko@sntech.de>
 <20260114230707.4175162-4-heiko@sntech.de>
 <8f7880cc-5469-4ac1-9fcc-9bd33327e571@rock-chips.com>
 <10786293.qUNvkh4Gvn@diego>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <10786293.qUNvkh4Gvn@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bc155786603abkunmbbe2c43d3c9934
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxoeHVZJSR1KTx1OHktITh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QMy6QsEf96Dxldir3W7DP9dSiOA0T3gLQiix77OsfmCztiqZc6x2PJiSZu8fQBvp87FDBlWY1SOrAsDlqs230IwcfxWQnXbqAD3TczkuYSEH4rBLdW0ptICsFjBdO5Rx1WdZs+hU9vSjowTEPb+YosktOFR7nAjSEmeYy7UECts=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=VITCb4bX5R30M6IQTSFF+7s0mSypA76PtH4Lp3AhVpc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_030615_926451_982DC930 
X-CRM114-Status: GOOD (  12.78  )
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

On 1/15/2026 5:35 PM, Heiko Stübner wrote:
> Hi,
> 
> Am Donnerstag, 15. Januar 2026, 02:25:34 Mitteleuropäische Normalzeit schrieb Chaoyi Chen:
>> On 1/15/2026 7:07 AM, Heiko Stuebner wrote:
>>> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>>>
>>> Enable the VOP and HDMI controller on the Lion-Haikou board.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
>>> ---
>>>  .../boot/dts/rockchip/rk3368-lion-haikou.dts     | 16 ++++++++++++++++
>>>  arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi    |  5 +++++
>>>  2 files changed, 21 insertions(+)
>>>
>>
>> I guess NPLL is an independent PLL available for VOP, 
>> could you give it a try?
> 
> not really sure what you mean here.
> 
> The VOP-binding specifies the aclk, dclk and hclk clocks.
> 
> The NPLL is a possible source for quite a lot of peripherals on the rk3368
> aclk_cci_pre,  sclk_tcp, vepu/vdpu, hevc, isp, gpu, gmac
> 
> So it's definitly not dedicated to the VOP, and thus should not
> change frequency for the VOP alone, because that could affect
> other blocks.
> 
> 
> Heiko

Oh, you are right. It is a general purpose PLL.

-- 
Best, 
Chaoyi

