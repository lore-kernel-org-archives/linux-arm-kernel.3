Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C3C108E1FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKS4bpN/zGnfXpSFFB4RUvieqFi2QAKBmfyhobnZlxo=; b=kEB+7BWSvKlIVw0F45O2NKVzGI
	YWDN3WckazSCdyy8QgMQdUe02x5l93qTw4czFaavFZd7qt+HmWN1O5lk3NhN73T0hu+jn6l7x33AC
	CvWAs9MAkr54y9OvlPoHtKnTQhDpmT8OFQNl/wl30VA5fEXBnIbttOGfC25hzK1cXoE2j/Vj6muUi
	63jWmayZeODt54koxELqNUkPW6XoWR8HHf675Wcaew1CiuSgh2s79+QoM+UpVxolyxcD9inev+TjN
	YdoJM0y9rvogXb0C9WSUrHU+CPnddnwdG9tOLWoqySZ/aq6otA+LaoI5v2IFpEYd2yWIx7iaN94ah
	ODgDfllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CTk-0000000AbUM-1kf2;
	Thu, 19 Mar 2026 12:27:56 +0000
Received: from mail-m1973185.qiye.163.com ([220.197.31.85])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CTg-0000000AbTr-2gni;
	Thu, 19 Mar 2026 12:27:54 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3792bf622;
	Thu, 19 Mar 2026 20:27:37 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 heiko@sntech.de, jonas@kwiboo.se
Subject: Re: [PATCH v2] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
To: MidG971 <midgy971@gmail.com>
References: <7008e941-e4b0-a060-1cd7-55070fd5831f@rock-chips.com>
 <20260319101911.31348-1-midgy971@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <b7060437-a46e-81fa-be2b-506a1b82be12@rock-chips.com>
Date: Thu, 19 Mar 2026 20:27:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20260319101911.31348-1-midgy971@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d0610cdfe09cckunma0125ffa661f67
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxDH1ZNHk9CTUhOShpOS01WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cyzQxvzm4R28cdZsEor86BWIsLK5KuqaVtYyhYPGQOXvke8pFMIlfSVAxaeEuquDRUgEKtGoYXQgBqK/w6V0hbqgxQ7s2/vMtW81y5YFAzctbkrRv+98A819iUKNEu+mckdE2RH70y2hmwhNBXO6QiO6UbKyg3Fkvnx8zMQ5nwo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wKS4bpN/zGnfXpSFFB4RUvieqFi2QAKBmfyhobnZlxo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_052753_218607_E40077DC 
X-CRM114-Status: GOOD (  20.96  )
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

在 2026/03/19 星期四 18:19, MidG971 写道:
> On 2026/03/04, Shawn Lin wrote:
>> IIUC, you are using Claude to help generate this patch, please
>> describe it properly, for example,
>>
>> Co-developed-by: Claude claude-opus-4-20250514 [1]
>> or
>> Assisted-by: Claude:claude-3-opus [2]
>>
>> [1] https://lwn.net/Articles/1031473/
>> [2] https://docs.kernel.org/process/coding-assistants.html
> 
> Thank you for the guidance. I used Claude as a coding assistant and
> will use the proper tag in v3:
> 
>    Assisted-by: Claude:claude-3-opus
>    Signed-off-by: MidG971 <midgy971@gmail.com>
> 
>> There is a missing pipe clock which should be fixed. Please
>> refer to David's patch[3].
>>
>> [3] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee47177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1
> 
> Since our board-level &pcie3x2 override replaces the clocks property
> entirely, v3 adds CLK_PCIE30X2_PIPE_DFT ("pipe") as well, consistent
> with David's base DTS patch.
> 
> I tested v3 on the ROCK 3B (kernel 6.19.0-rc5): pcie3x2 probes
> successfully and the NVMe device is detected at 15.75 Gb/s. The
> pcie30_refclk clock appears in the clock tree at 100MHz with pcie3x2
> as its consumer.
> 
> One note on the pipe clock test: CLK_PCIE30X2_PIPE_DFT is defined in
> rk3568-cru.h but was not yet registered in the CRU driver in the
> tested kernel build, so the pipe clock was excluded from the
> functional test (pcie3x2 probe fails with -ENOENT at clock index 5
> when it is included). The gated-fixed-clock node and ref clock were
> verified working. I expect the pipe clock will work once the CRU
> driver registers it alongside David's DTS patch.

Pipe clock support was applied and appears in linux-next[1], you could
pick it into your tested kernel build if you'd like to have a try.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=41b1a6760959017c4fa1dbc7c3cc318406ab1455

> 
> v3 is sent separately.
> 
> Best regards,
> MidG971
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 

