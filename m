Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00DAC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 06:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrrqReRVP8vJeyg5PfphNvWCkrOXLcDZ4zm3kNo2Lt8=; b=G0ybxietswcywfxzYG69zZ6Gmb
	mVc0jZ4i7UrDV9eJCv/4pPt7Byd4SuWI0Ofnj7EAvACEywlgS+ZKguSEyIPntlZBGUgUQ+YQ5AA2y
	oTX6uHQ84JQ7JKsxn3gk0PtT+zjcfoxYihmFU/zhQsK3oxsoAxMOF4/hYyJQADzyrqgJpOSPUrMAJ
	CxDY5fIgu14GNw94EVGVKKZLZtZzL61Oa1b/bI6e2caYi051QYfxn//ks9z+1KKKjOp5h1SmP/e9f
	/N2knW7WkBT+5y2EBVfw58fliRkJoHJH7aWWwanInduF0zAJ9j9FJT09rs7o+LvR3SIB8PEa+JfHW
	6Yi+JDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRU5-0000000DLxo-33kg;
	Fri, 07 Mar 2025 06:47:01 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRST-0000000DLo8-1xol
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 06:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741329920;
 bh=xrrqReRVP8vJeyg5PfphNvWCkrOXLcDZ4zm3kNo2Lt8=;
 b=G38UIhR59FX19r+G0LhMaOv08GIMzn4hd/RCb1XqfBdvYyrMqNisMv3jcYZD7iA1E/HZD/hTC
 DswtpJ3mtjvkzIBzB7NshAF7jvE61uLL/WrMMftFRl/OdmVPsCRHdLz6WgCd5ssT80B2I6hTZYB
 JmpeK1ErWCON40FrfGu0MdS2mBFmg1QvlF+lOQacraTRaG5uB9sSw8xWFH3A1KKQcxtVwY+DhQh
 Hw+MkJsC1FWvZI5isWmENTNEVecqnp6aSon82lucYo+pfDif7GRMVGwzEQGCOS8pM+ym7mRslz4
 0bbpd7fOlprBiH/qBSyqyIVcdtGHmoSL3vVk8zE2Z6dA==
X-Forward-Email-ID: 67ca95f1d992817a57e34193
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5a0a7ce1-1dfb-4d19-8a1e-0d89d177f5b8@kwiboo.se>
Date: Fri, 7 Mar 2025 07:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
To: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
 detlev.casanova@collabora.com, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250305194638.47187-1-ziyao@disroot.org>
 <20250307033508.656479-1-amadeus@jmu.edu.cn> <Z8qJqpUwi7VV8tJk@pie>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z8qJqpUwi7VV8tJk@pie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_224521_860970_426789A8 
X-CRM114-Status: GOOD (  14.39  )
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

Hi Chukun,

On 2025-03-07 06:52, Yao Zi wrote:
> On Fri, Mar 07, 2025 at 11:35:08AM +0800, Chukun Pan wrote:
>> Hi,
>>
>>> +&sdmmc {
>>> +	bus-width = <4>;
>>> +	cap-mmc-highspeed;
>>> +	cap-sd-highspeed;
>>> +	disable-wp;
>>> +	no-sdio;
>>
>> With 'no-sdio' property:
>> [  129.608986] mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
>> [  130.711168] mmc1: Card stuck being busy! __mmc_poll_for_busy
>> [  130.725536] mmc_host mmc1: Bus speed (slot 0) = 300000Hz (slot req 300000Hz, actual 300000HZ div = 0)
>> [  131.751240] mmc1: Card stuck being busy! __mmc_poll_for_busy
>> [  131.765608] mmc_host mmc1: Bus speed (slot 0) = 200000Hz (slot req 200000Hz, actual 200000HZ div = 0)
>> [  132.825083] mmc1: Card stuck being busy! __mmc_poll_for_busy
>> [  132.839413] mmc_host mmc1: Bus speed (slot 0) = 187500Hz (slot req 187500Hz, actual 187500HZ div = 0)
>> [  133.960141] mmc1: Card stuck being busy! __mmc_poll_for_busy
>>
>> Without 'no-sdio' property:
>> [  105.224019] mmc1: error -22 whilst initialising SDIO card
>> [  106.290838] mmc1: Card stuck being busy! __mmc_poll_for_busy
>> [  106.801931] dwmmc_rockchip ffc30000.mmc: Busy; trying anyway
>> [  107.385835] mmc_host mmc1: Timeou sending command (cmd 0x202000 arg 0x0 status 0x80202000)
>> [  107.400425] mmc_host mmc1: Bus speed (slot 0) = 300000Hz (slot req 300000Hz, actual 300000HZ div = 0)
>> [  107.431561] mmc_host mmc1: Bus speed (slot 0) = 49800000Hz (slot req 50000000Hz, actual 49800000HZ div = 0)
>> [  107.433107] mmc1: new high speed SDIO card at address 0001
> 
> So it seems the sdmmc controller actually works with SDIO commands as
> well? I don't expect that since the datasheet says RK3528 has only two
> SDIO 3.0 controllers.
> 
> We could remove the "no-sdio" property if SDIO actually works. Will
> apply it in the next version if there's no objection against this.

On the E20C the sdmmc controller is routed to a microSD card slot mainly
intended for use with microSD-cards and should normally not need SDIO.

What card/adapter do you have inserted in the microSD card slot that
requires use of SDIO instead of just SD or MMC? What is the use case you
have that requires removal of no-sdio on E20C?

Regards,
Jonas

> 
> Further tests about the capabilities of the controller are welcome.
> 
>> # cat /sys/kernel/debug/mmc1/ios
>> clock:          50000000 Hz
>> vdd:            21 (3.3 ~ 3.4 V)
>> bus mode:       2 (push-pull)
>> chip select:    0 (don't care)
>> power mode:     2 (on)
>> bus width:      2 (4 bits)
>> timing spec:    2 (sd high-speed)
>> signal voltage: 0 (3.30 V)
>> driver type:    0 (driver type B)
>>
>> Thanks,
>> Chukun
>>
>> -- 
>> 2.25.1
>>
> 
> Best regards,
> Yao Zi


