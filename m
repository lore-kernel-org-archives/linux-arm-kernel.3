Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17729C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 01:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xepetMOANOmDjgKxqlDl2/kYrljTtdNa/MYCm6NNH4g=; b=aXqklT9XwtgjagYvukiD8tNcDo
	s/75HsqyApHlDjcuJFlyvaWh8gu4h+OybqdQEUnb14YJRukUns49HPcXv4JXfzgwMBRfFtAQyiIZ5
	7tv3PN84tAaUJByCJMA7XSKIgKKvl3ShQI27ZnhRUPJKR5l+dQZ3zZ1WXhDNAAYp8Tk6UNftbqswF
	hHpdKo2e3yKHCg+qY2uDSOkA9zbzbvniZ669rpbNe4lMuj0vuytM8HsS7+BoqUgQwAE5zyzGadO47
	IeofAAunGI1QLXgcHUGD/Xu7QIb98KGqQrTC1trFN3FuOJ2DzfnYKSlNzSszkIUWWnVJcxgnnkHXn
	Sx2RNCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijk9-00000006HYH-3ubz;
	Thu, 22 Jan 2026 01:44:17 +0000
Received: from mail-m49215.qiye.163.com ([45.254.49.215])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijk7-00000006HXb-1csn;
	Thu, 22 Jan 2026 01:44:16 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 318437bb3;
	Thu, 22 Jan 2026 09:44:11 +0800 (GMT+08:00)
Message-ID: <e01451e1-78c8-4cd1-90a4-0f9ea38b1ab2@rock-chips.com>
Date: Thu, 22 Jan 2026 09:44:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Change gmac phy-mode to
 rgmii-id for rk3576 board
To: Andrew Lunn <andrew@lunn.ch>, Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexey Charkov <alchark@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Stephen Chen <stephen@radxa.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260121031548.402-1-kernel@airkyi.com>
 <b25d6eb2-e105-4060-86fa-c1a06396ca92@lunn.ch>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <b25d6eb2-e105-4060-86fa-c1a06396ca92@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9be35f986103abkunm2cc02e0dab60f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk8fSVZCSx5CSU0ZTktMSEhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=e/1/N/h6wrnqA7VHwQI73Bv34Hxa4/97ZmtUIfQ98i+pN998XA6ELUU5l3UrHj0OtN2BVxucSQZnHneR/br2JWwSE3OPwK/ati9o9WrghKL5I6wF94M0lxfFLcSQGYTLNIWk/7d2Rk3YzVRq4Md5rNnxD8qN8B2H+YLJjd2afoM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=xepetMOANOmDjgKxqlDl2/kYrljTtdNa/MYCm6NNH4g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_174415_625169_3806D2E8 
X-CRM114-Status: GOOD (  10.30  )
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

Hi Andrew,

On 1/21/2026 8:57 PM, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 11:15:45AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> According to the description in the net documentation, PHY modes
>> "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock signal
>> to be delayed on the PCB.
>>
>> The Rockchip platform has long used the above mentioned PHY modes and
>> private delay prop to describe the internal IO delay settings of the
>> chip, which is inconsistent with what is described in the documentation.
>>
>> Some background, for RK3576, you can assume that:
>>
>>         tx_delay_time(ns) = 0.0579 * delay_line_count + 0.105
> 
> Where did this formula come from? Is it in the datasheet.
> 

These are measured values obtained from hardware signal testing.
They are not documented in the TRM.

-- 
Best, 
Chaoyi

