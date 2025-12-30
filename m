Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF333EE01FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxKIdIuImYJyruxAJajYUHr/pCHXGqxg7yZ2rj75Zl8=; b=nNnP9ctxZebyDPOFD6Xbi3vbmp
	1WSwdCKs8M6IYgLQuWE/7JHKY+VFc0zgNSUMlqKWjumXKq9OXNvwzMH9oGhe6hJJG8HwhyjVjV4XO
	vAvPRUAyMT6U65ou57UzU5yiOR0Pg7Dxy3ctGjiuY3AEE1ddv+Sa+lj4tMo0+szrqmXWihAdLrWad
	UAqoMUGd6kdN8A6fSkPnE0YYqxg2Erp3e8pRSYxNCuaBeF7hX8lJrNiRrMABNcIcx/QHgYjHxhY82
	maCGdd5Y/L90moCPrDrxmaltew8t92lSMIS4ZpLyyHQun1sqbl1WGPuG2Ps+/WgSlSKZDBa0bInMc
	RV+DpYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaXs-00000004vSU-1OfI;
	Tue, 30 Dec 2025 14:17:56 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaXq-00000004vRh-2YBS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:17:55 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dgZtM6lvVz9t18;
	Tue, 30 Dec 2025 15:17:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767104268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxKIdIuImYJyruxAJajYUHr/pCHXGqxg7yZ2rj75Zl8=;
	b=RK1sHCtXeTJMg0Fc6+vn5MLRV/qqkMW2e3gKfcYYqgZTEy9X+YQIpCozTyMHokhUeGNfxl
	Vft2jvyU8jVcxqtPUxffHupgGFpMLlJTOGGEK4GDzuHVp+ELs9eRQ7dUfmZa26pM+P2jCm
	qoDLzFZ/JIk3p8DD+XcLZIzwHfZph+wOo6taTUWfys6ckQTlcmBrMUGe0+hu50/fsd6ZkB
	+q2bXt5NmnAg65MEy7X3nGZrbd3DeBIBGMrBkVoRxsjnGRnnLiwEuKPs9CXyjcUCjeRjTQ
	FdV2JkuEI3xXULwkX8OuLR/h+IWnzyUZF6/54HWvkY0EDoA2cz3937MP7LBN6Q==
Message-ID: <6055d6f3-2b31-4225-a42e-0f5ad79f7256@mailbox.org>
Date: Tue, 30 Dec 2025 15:17:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
References: <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
 <aTKVMAMQ6v_BwD6R@oss.nxp.com>
 <9b593731-898f-46a7-8ee5-68f8c170351c@mailbox.org>
 <aTYxm_dfMwF4H0_b@oss.nxp.com>
 <53ea529f-3538-4ab5-aa99-0caa6729b4cd@mailbox.org>
 <aVM-mSkSubMPd7Du@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVM-mSkSubMPd7Du@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4mz587hke6yw9u8coj5yj7tpaucfotsn
X-MBO-RS-ID: 813c5cfb66f07759a26
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_061754_824102_AEBB03C5 
X-CRM114-Status: GOOD (  19.97  )
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

On 12/30/25 3:53 AM, Rain Yang wrote:
> On Tue, Dec 30, 2025 at 02:53:38AM +0100, Marek Vasut wrote:
>> On 12/8/25 3:02 AM, Rain Yang wrote:
>>
>>>>> Okay, I’ll submit a patch later.
>>>>> The commit message should reflect that only CLK_GPU_CGC is enabled.
>>>>
>>>> The commit message , and this change , is unrelated to GPUAPB clock.
>>> The commit message is ambiguous. Could you clarify which parent clock
>>> you are referring to, and whether it can be enabled by CLK_GPU_CGC?
>>> If it was CLK_GPU, CLK_GPU_CGC can't be able to control it.
>>
>> The commit message clearly states "These new GPU_CGC clock
>> gate the existing GPU clock." and "GPU_CGC as well as its parent GPU clock."
>> , I don't perceive any ambiguity, sorry.
>>
>> Frankly, the whole GPUAPB discussion is entirely unrelated and it only stalls
>> application of this bugfix and keeps upstream broken. This is not helping.
>>
>> So unless there is anything in particular that is on-topic and prevents this
>> patch from being applied, it would be good to apply it, otherwise the GPU on
>> MX95 in mainline Linux is not working.
> Hi Marek,
> 
> I’m not opposed to this patch being merged into mainline, but the commit
> message needs to be accurate. the parent CLK_GPU cannot be enabled or
> disabled externally. The last sentence should clearly state:

Look here, this is what you can do with the MX95 SM:

"
 >$ clock.r
...
083: gpuapb               =  on,  133333333Hz
084: gpu                  =  on,  800000000Hz
...
174: gpu_cgc              =  on,  800000000Hz

 >$ clock.w gpu_cgc off
 >$ clock.w gpu off
 >$ clock.w gpuapb off

 >$ clock.r
...
083: gpuapb               = off,  133333333Hz
084: gpu                  = off,  800000000Hz
...
174: gpu_cgc              = off,  800000000Hz
"

Notice how all clock are disabled, including GPU clock.

That does not agree with your statement.

> When the panthor driver enables the GPU core clock, it enables the GPU_CGC.

It also enables all disabled parent clock in the process, which includes 
the GPU clock.

> This ensures the description reflects the actual hardware behavior and
> avoids confusion for future maintainers.
> Thanks for addressing this issue — once the commit message is corrected,
> I’m fine with this going in.

See above.

