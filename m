Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EB4E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRKahnavURx49oYiJWyGuG0d0hEUCAYpEdAy2jRiCuA=; b=4w8K3PlnEuudaiZWhZGRcO6b1b
	ymq0O1lAMgK5WjsZJ0ikHDcTqYBsem3YL9I+v4Yy+/Hi7iCnK3bKjkcuc6c592HJMtaS0m9LFaZRW
	26rxXFaKiNITQSeLMZ4zHRa8ozMDNBExXscI3WSkJ3cqVJb5lRb63I3jhDKnjbgA9EN4HAwIYMTQp
	mID9KPfIbpTeUs4TIw4Q1AadmhIrZSQ9EQHMkZKoBtEa5tv21my2eW9Ukpz2g6wOWeJ7HgvZgGYo/
	Rx8ANcPYq4RVkTb2KQlqHo0eXAN9lAnYH1VCNcCB83zULybzgFAfX31ya6al+w4rGppDmBiU90oAD
	5FxfmRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPKpS-00000008Fb3-1LBT;
	Sun, 22 Dec 2024 12:13:02 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPKoF-00000008FTh-3yys;
	Sun, 22 Dec 2024 12:11:50 +0000
X-QQ-mid: bizesmtpip4t1734869452tbc1hoc
X-QQ-Originating-IP: 5ofUMD6iHBFQLIXjS8jarTqL4A2U9EvqjnyCSUP2VcE=
Received: from [IPV6:240f:10b:7440:1:75fe:f8f3 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 22 Dec 2024 20:10:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2159805039635468433
Message-ID: <88F271690E44F371+28d3216e-0517-4ff7-94bb-f36bbc980b29@radxa.com>
Date: Sun, 22 Dec 2024 21:10:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] irqchip/gic-v3: Enable Rockchip 3588001 erratum
 workaround for RK3582
To: Marc Zyngier <maz@kernel.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tglx@linutronix.de, jonas@kwiboo.se,
 macromorgan@hotmail.com, andyshrk@163.com, liujianfeng1994@gmail.com,
 dmt.yashin@gmail.com, dsimic@manjaro.org, tim@feathertop.org,
 marcin.juszkiewicz@linaro.org, michael.riesch@wolfvision.net,
 alchark@gmail.com, sebastian.reichel@collabora.com, jbx6244@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20241222030355.2246-1-naoki@radxa.com>
 <20241222030355.2246-2-naoki@radxa.com> <86msgoozqa.wl-maz@kernel.org>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd.
In-Reply-To: <86msgoozqa.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Njf/zTiR//7AZMBhuovLnyxjVxn03BE6Mpua4cuBp7GI8jnWvQl0cRn/
	+eewA3bJn7W7hWfYggtjgSwhN/6HsGW4v5fL9ibi7MG+tXCsZ1HE0g1l5/KpU3e3TqQNs+N
	cjDTRu1mtxPvTBMalWm6vfwk0bEEBFLVKXnDdlyxh3MUkCwSW5I/YFt2f3cWl/P97+00P1f
	hdOB8ZVxabtzyo/DTkCKzLnQYxax0TpgjlnVFPLaV5UKtKZde6y3URfPE4IzF91fiWa7K4J
	JxbkMNduRqeK+IHEZt5rrRUmntU9JUvKA15INK6/3Pxzz8IsuDLI0BDgzzS8u4aR5XvvA8S
	zdctzfiSHylTMSaxDsg3zSqZF4ozr4wfpbecBIa2It20UIfvmmuD7ASLqJpl3hPe+no0lAX
	rUulrXLIvLEH9Vx2ZnEN6WdzRFp77wE0BGeFBYTyUuvO/lBF6fkmDM/g04FOmeeJqhZ6l2a
	pSa7tMvpC9xk/3RPUugMzSgiryamLctxNi63ZO3XkOS8NmM3j6WNpuQQd/ELHhaNED7eG79
	sfAO1GA/A9NJN/WxIj5ZxljYQITE7PopZ+GYnjANSV4hP/oXoh/2riD5fMcU24XEZs4NogO
	yDAznrRzmhkGymkNDMpPhWf1wIH5LPUoucZNlJzM/o5N8++ePbja04bO0knTRo5zgDlyI++
	dpIY3dHhqN0y/8p7OLXxINkDg9N3EowYfiCfODuHO3N/n8MJYOExaH5HWkA05K/lMLLnQWC
	+EveU83X5hU899ijMah8iIXgrklm56T8/znMBEko71NnDcQ8MklohevVlSGaiL36qUbEnXE
	/DB2m48i1QPjfPWa0662CsioikHM+aWdq8WoII+mQdqUOpinpJoyRKXVmi6ocZBXOQO6DKO
	aWZ48nHbPGi99iJEhdfOoeHtoz29KeGkTlyGQvrk16i8KTKTNPGSSEXF+5Jc6b7Bw7XVZBg
	d3SQ=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_041148_533330_2F55E2D9 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Marc,

On 12/22/24 18:04, Marc Zyngier wrote:
> On Sun, 22 Dec 2024 03:03:53 +0000,
> FUKAUMI Naoki <naoki@radxa.com> wrote:
>>
>> Rockchip RK3582 is a scaled down version of Rockchip RK3588(S). Apply
>> Rockchip 3588001 erratum workaround to RK3582.
>>
>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>> ---
>>   drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 92244cfa0464..c59ce9332dc0 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4861,7 +4861,8 @@ static bool __maybe_unused its_enable_rk3588001(void *data)
>>   {
>>   	struct its_node *its = data;
>>   
>> -	if (!of_machine_is_compatible("rockchip,rk3588") &&
>> +	if (!of_machine_is_compatible("rockchip,rk3582") &&
>> +	    !of_machine_is_compatible("rockchip,rk3588") &&
>>   	    !of_machine_is_compatible("rockchip,rk3588s"))
>>   		return false;
>>   
> 
> Please use the relevant property for that purpose ("dma-noncoherent")
> at the distributor and ITS levels. We're not adding extra compatibles
> for this anymore, and you might as well fix the core dtsi to expose
> such property.

I see. I'll drop this patch in v2.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Thanks,
> 
> 	M.
> 



