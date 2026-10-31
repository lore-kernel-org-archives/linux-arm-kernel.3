Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25901606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 06:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FsJ2bdqw;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=MDYQl4JA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZQUUU5NV48jFxmhLwXwoUwGKDKvh6scuO/M6jetNByI=; b=FsJ2bdqwfkV4cB
	mR2tAehQQ+X1/4FgVzHYK0G8WlI9pVpwrzzfYgihUoCZ7SfAUg16dlx5poaX4f0NqIN+M1gOJwopn
	jYZYKdj23KqksCuhDA2uorJd35fJM5L66UGbYXwHyfM5ifEVdQqJYChAuWwVf7N/xmifoHTiUC5tY
	HSfAzyDYoolt+PbHbjkj5wo7SN1HG7DTcQiH9uLd3FtSO9LlXH8YYrIzKVcIPoLgkdGfYpQ4gW+b4
	Pz8Z+PWj4/N24cJ0TJzubboq4aiO9xhw0vf+2ms2b7A07RmLJhz4VjSG0B22unh/CCnzuzpGLZM0Z
	yWKnKQHWmjBHPRdoLhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN28P-0000000CylV-0GfU;
	Sat, 31 Oct 2026 06:00:09 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN28M-0000000Cyl6-05MX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 06:00:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA32B10C023;
	Sat, 31 Oct 2026 06:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793426397;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZQUUU5NV48jFxmhLwXwoUwGKDKvh6scuO/M6jetNByI=;
	b=MDYQl4JAL2Ow0vIaYrvXUgbtOXtWCti36l2IM/CQZ57X8mAXKXR1zV9pPAUQN9SAn0GQSN
	FttlfrEjkoxLdzCBPzvKxrLy53OCXRPJ23us2Hcn4CcbbYUG48gPmGcvJASiuOR/HGsG/K
	15DtR11ksWAi+c5esj2dPfZ5AKT+Q7tSF0d32pniSfYCsrxkDMy46vBaNG07hEE0repfwX
	UbMsNaW93y9N6CHWZtAX+L68nftaN9JX0CmUrjMrtIkID3CeS7sZKg16GrQ1+aVfzKzn8f
	FIG1Whji46nfsixQ26NB91ciyAClw2MslChZCb/M0m1A6NCnl2vNCoavRLMUuA==
Message-ID: <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
Date: Sat, 31 Oct 2026 06:59:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Mateusz Nowicki <mateusz.nowicki@posteo.net>, mcoquelin.stm32@gmail.com,
 Thomas BOURGOIN <thomas.bourgoin@st.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lionel.debieve@foss.st.com, amelie.delaunay@foss.st.com,
 patrice.chotard@foss.st.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel <kernel@dh-electronics.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Stefano Babic <sbabic@nabladev.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_230006_316130_0A8D3D4C 
X-CRM114-Status: GOOD (  18.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/28/26 10:45 AM, Alexandre TORGUE wrote:

Hello all,

> On 9/7/26 11:14, Mateusz Nowicki wrote:
>> OP-TEE implements the STM32MP2 watchdog SMC service with function ID
>> 0xbc000000 (CFG_WDT_SM_HANDLER_ID), not 0xb200005a. With the current
>> value the arm_smc_wdt probe fails with -EIO and the IWDG started by the
>> bootloader is never refreshed.
>>
>> Fixes: 89fca38168c9 ("arm64: dts: st: add arm-wdt node for watchdog 
>> support on stm32mp251")
>> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
>> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/ 
>> dts/st/stm32mp231.dtsi
>> index 9e1d240888ff..35e247af957c 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
>> @@ -35,7 +35,7 @@ arm-pmu {
>>       arm_wdt: watchdog {
>>           compatible = "arm,smc-wdt";
>> -        arm,smc-id = <0xb200005a>;
>> +        arm,smc-id = <0xbc000000>;
>>           status = "disabled";
>>       };
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/ 
>> dts/st/stm32mp251.dtsi
>> index 9c63fdb5a885..2dcbba65e298 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -36,7 +36,7 @@ arm-pmu {
>>       arm_wdt: watchdog {
>>           compatible = "arm,smc-wdt";
>> -        arm,smc-id = <0xb200005a>;
>> +        arm,smc-id = <0xbc000000>;
>>           status = "disabled";
>>       };
> 
> Applied on stm32-next.
Since this change, my STM32MP255C board started rebooting after 32 
seconds. It turns out, this is caused by an ABI break.

Here is the thing -- old ST downstream fork of OP-TEE OS did expect ARM 
SMC WDT ID 0xb200005a (that was the ST ecosystem v5), the OP-TEE OS 
4.0.0 fork seems to have handled both, and the new 4.8.0 fork expects 
0xbc000000 ID only and does not handle 0xb200005a .

At this point, with Linux 6.18 the kernel is trying to trigger the WDT 
using SMC ID 0xb200005a , which on my machine works (older OP-TEE OS). 
When I boot linux-next , it is using ID 0xbc000000 and my system reboots 
after 32 seconds. (not even mainline Linux versions are consistent here 
now, sigh)

I actually found this behavior the other way around -- while forward 
porting a system to the new OP-TEE OS 4.8.0 port, which I installed, 
then booted Linux 6.18.y, machine started rebooting (SMC ID mismatch, 
new OP-TEE expects 0xbc000000 and linux-stable sends 0xb200005a), so I 
booted recovery, and ... recovery is also Linux 6.18.y, so I could not 
recover the machine that way anymore.

Currently, I added [1] to OP-TEE OS as a mitigation of this ABI break, 
but I don't think everyone can still update their bootloader stack in 
this way. And with this patch in place (and inconsistency between Linux 
stable 6.18.y and upcoming 7.4.y) the ABI break will cause some serious 
mess.

How shall we deal with this ?

Thank you for your help !

[1] 
https://github.com/STMicroelectronics/optee_os/commit/8450f25923c0c98465decc975f25efed19f82ba0

-- 
Best regards,
Marek Vasut

