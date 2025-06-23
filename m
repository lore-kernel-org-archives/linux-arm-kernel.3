Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A938C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEB9Uu/BrBrdgfsB6ag5zH9CJIrem98ugMHj5C+RaBk=; b=DnFByBrTVOO1PN5/dFxV4pZpRL
	mlJJk8n7UWUEx/PqiJZ7K2IT4tVIGFwiZkKTw6JMDQuUA0fvxqEEox/vi/u3XwH2NuE9hl7zwF0rH
	VFqAC74dojuIOqOJh+58NbgjHCHcxwicAeLNQ+ElWCLghZbFw+3FK7I9eeDzYcA0KWbykgjkVxXYw
	r8B3knbYCYkj1Rho/mw1peFdyHwNoiFqQ42/4c2ZDKTjWkqcvKC1IIgVQJNO7cJTb1U82U5EMME2+
	X2Sc4oEQuCwzjTFxuDv2G9qaRIVcIqhdsLFyLIbcBQfTRPTGiiA5OSSk58xEMh0uQGR8nAk2XIO89
	xhnquYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrb8-00000004Ha7-13AB;
	Tue, 24 Jun 2025 00:33:14 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToOg-00000003ypM-1335
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 21:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: References: Cc:
 To: From: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1750712889;
 bh=gEB9Uu/BrBrdgfsB6ag5zH9CJIrem98ugMHj5C+RaBk=;
 b=EUh8stVcTijao1rWnyQM8Tqwijtby71BhH8HEIMMPm6tJaoqTznw4HTMIlPElYwlUTlL9b8il
 kG8BLOaYG+zk6J+cTZc7qqqcG1hGNsV1Py2GgVZDxHRoJsF7n36BNDw7zr8uuiMpW2lfx0Y+Vvi
 Uakmf+U5LCRpgubFABcvLsgG5F+gKqAj3z82lSIV0yVUImlLF8Q3Vux7kSN0w4xEDXuM5b+mFSZ
 OerY3GXDfWv2TxgXIBSKl68QuSb3p9Kz0ftTzWIZ5h8LE8cyZPAZyJBT3/19y5QXI3EWxmloqWX
 zL1+OcgNfZwAF85I3Pd8w9IFiavEqjh5Sf8x0l+UH9eQ==
X-Forward-Email-ID: 6859c22e294ea86d0db707c3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <90b7a1b6-bc49-414d-9cde-e6fad46d2650@kwiboo.se>
Date: Mon, 23 Jun 2025 23:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Jonas Karlman <jonas@kwiboo.se>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil>
 <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil>
 <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
 <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
 <36711B65-DD45-4539-BD9C-0382936FD0A3@gmail.com>
 <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
Content-Language: en-US
In-Reply-To: <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_140810_626307_DB947994 
X-CRM114-Status: GOOD (  13.73  )
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

On 2025-06-23 19:40, Jonas Karlman wrote:
> On 2025-06-23 17:02, Piotr Oniszczuk wrote:
>>
>>
>>> Wiadomość napisana przez Alexey Charkov <alchark@gmail.com> w dniu 23 cze 2025, o godz. 15:58:
>>>
>>> On Mon, Jun 23, 2025 at 1:19 PM Alexey Charkov <alchark@gmail.com> wrote:
>>>>
>>>>
>>>
>>> Okay, I've bisected this.
>>>
>>> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
>>> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
>>> v1.08 and earlier work fine.
> 
> v1.09 added support for 1 GHz hrtimer in addition to the normal 24 MHz
> rate. Mainline U-Boot may only support use of 24 MHz hrtimer, unsure
> what impact the hrtimer rate has. Mixing blobs with/without 1 GHz
> support is known to cause issues. At one point the latest rkbin tree may
> have contained incompatible rk3576 blobs (mixed 1 ghz vs 24 mhz rate).

Clarification:
Following boot1 parameter activates use of 1 GHz hrtimer, see [3].

This parameter was added to rkbin repo before all blobs was updated to
fully support use of the 1 ghz mode, and is the source for incompatible
blobs I referenced above.

  [BOOT1_PARAM]
  WORD_2=0x100

[3] https://github.com/rockchip-linux/rkbin/commit/cbbc6868221fb416d4f0d86a10e493dbbbc1f117

Regards,
Jonas

> 
> Did you try with newer blobs, i.e. ddr init v1.09, bl31 v1.19 blobs [1]
> and mainline U-Boot [2] ?
> 
> [1] https://github.com/radxa/rkbin/commits/develop-v2025.04/
> [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3576
> 
> Regards,
> Jonas
> 
>>
>>
>> just fyi: 
>> to confirm: replacing only bl31 to 1.08 makes all good
>> with perf gov. clocks staying on 2200/2300
>> clock estimations are predictable, constant and estimating constantly 2400
>> ux is „like” on 3588
>>
>> Alexey: many thx for finding root cause component!
>>   
>>    
> 


