Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B689E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm/a13hl8XEhHij+hYu502IuzmirFb573FKo1bQ4ZPY=; b=sDp7lUGBvmdF9tB91veC8NPgQy
	HFZ4MOb5YdEbwkSe5q47YtVFMRtsDsvKyhFqviY1EJFWh9dCXpFMb1IA0NPHwClEr3yKp0tCPXFxj
	SZHcTAXZImT4k/4RhCw9C0rnpD1fEslc82g5QHo5w7GhSAwP7mtH8SkDeMz61rmX+F9CH7k0aghc9
	oHqH6NVG3OEu53c/hRUCgaMWk5YUc38Tihn6+QNgSXxgSt1H598WzwUHhZb8uMLPn6FU6e5MjjuU1
	/6j3/CVwhDgiPR06tXJpKszvlerKxbeEZZ1I4iZIaae1R3vKNPNpEQ02/YySCmJ8mC3EnzoWdQsIw
	lmZWw1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPY0Q-000000098ac-3JlO;
	Mon, 23 Dec 2024 02:17:14 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXyP-000000098Ec-2LDa;
	Mon, 23 Dec 2024 02:15:14 +0000
X-QQ-mid: bizesmtpip4t1734920023t3m8mb4
X-QQ-Originating-IP: pq+LjWfblgFmA/8l/bIoC+QSLwnpZOeFlxxgYsUWLOY=
Received: from [IPV6:240f:10b:7440:1:5968:fbf4 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Dec 2024 10:13:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14632798559891521952
Message-ID: <88BD6226B9AC9C20+0d5797df-2163-44ca-b6f5-4b33a1ff0517@radxa.com>
Date: Mon, 23 Dec 2024 11:13:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Radxa E52C
To: Conor Dooley <conor@kernel.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, maz@kernel.org, tglx@linutronix.de, jonas@kwiboo.se,
 macromorgan@hotmail.com, andyshrk@163.com, liujianfeng1994@gmail.com,
 dmt.yashin@gmail.com, dsimic@manjaro.org, tim@feathertop.org,
 marcin.juszkiewicz@linaro.org, michael.riesch@wolfvision.net,
 alchark@gmail.com, sebastian.reichel@collabora.com, jbx6244@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20241222030355.2246-1-naoki@radxa.com>
 <20241222030355.2246-3-naoki@radxa.com>
 <20241222-wrench-chill-cbe767f2bd90@spud>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd.
In-Reply-To: <20241222-wrench-chill-cbe767f2bd90@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NoS5wdqc5dY83GUBXTVgrxwseK1cobzIHucP6q22UNxtUm0JypwGKQC7
	R24ZEcd5aIoASKil8u0UAEAveW4vJu5XHKaGhlUIVOqzfbnaJ3uhcLK9i8wxSrMNXaZNdDB
	0eAtF4KZmGrZEEnJRPsfEZYhCMviF3+ntEhbl/SJjuGKynDnQXGkiWe3I6db/WuDq5dT+D2
	IEHr6AI5v3aSXLpXk/vyctUxOuGvgL76A52UzPyQu3Kk79RIX9OziPjZnjkkmIUwlEsdRPx
	m9H3hd+kixEVjFsrtverPM013GLPnGg43R7Oqz0l1KUJAg5XwRaAlWgbgRGrDRwP5dZNQAQ
	31n03dGrEYGl5QYvwZzf/tzqymRjAyB8OrpYPlXMDrOHoqTf6hIIfr8qvH2jxlE0LKidxgq
	yrT5PA63woYO5ykvVY970XoZayJvxSpDyGjX1lNx+5pcDh5bkjmZbakC0Xeu9Fac8P2634K
	V/z5SC7kZwBrGB79JuYcoRtW1F91BPDqqtUvCGJwFeWYV7wDZBzgweyuW2lzCFX6fTeke/o
	REYiaV5f+Mv6UslSNv5Tu8Gfg8vjxW+1UB6fw+VQkwi3s4p6ejHpyAsr7OvppkJVWJ9uFxh
	qWNCxstYZdmUZvBz19L0pEuHTdV0gB8sEbmlK/7Cri/fdscZQjMAEB1Wcyrj9eW6iy0woLc
	gxuFiqdbHmyZdbVQ0eiXDvI6oSkVBimqHyM0Up4efcNW8ERB8D0/SihEV0JKpB3oDorkivc
	h4LR+w10jyskRoVSb31Z4E8zqxo+SpXkNDS7VlOoKsl6dTGNVPJZkEvMw4/wqc3AzVwo56X
	usyfOwn26tRvsvNfU2Vi6E8ggBbUlmg/QS96HuZ3GEeBEJV+yriGQXpsNA/PtGC+vDBCTzr
	4r/Lw9ykn2BTg68ChG4jUsv5C7GNeBz+hSjRA6t0GZMjSYdOdcbqQQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_181510_064720_C8B36A46 
X-CRM114-Status: UNSURE (   7.82  )
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

Hi Conor,

Thank you for your ack.

I fixed the patch so I didn't add your A-b in v2.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 12/22/24 22:11, Conor Dooley wrote:
> On Sun, Dec 22, 2024 at 03:03:54AM +0000, FUKAUMI Naoki wrote:
>> Add devicetree binding for the Radxa E52C.
>>
>> Radxa E52C is a compact network computer based on the Rockchip RK3582
>> SoC.
>>
>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
> 
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>


