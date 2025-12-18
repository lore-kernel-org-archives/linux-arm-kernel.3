Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC03D68BEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAc49f+PjPPGA8grm1vuuAjvrrxPgXOlDCLFKLaY32Q=; b=D8LkvKYWxU6tvUySv9ytm5xf5A
	HcZwWCne+vtQGO6979pWdtH8PssP4tkfHHqI32K8a2P979XskqimmJoSpwi+ehRRCX2vv/zQ6TLZ4
	/pHc9OeSsYIxWB8W58rbZDHPd+lq/b64Q2vBFImnVukfvfJ+0ezPf/K7aK7ekd9b2q6D45/tXQ3Il
	G8TVVO4m8ur5oUIsbqgUvSigfEpAHUu7jemgd0l+CtYquEkl/m1NTgB3fKgR3g6inG1rzjF9BB3b/
	B0eTcTmIlh4bdLcwEHZoNPONUcJCBS/yVTrmtq0ExC+PHxVKBa9iFzcjFYQxTzBTfD3dmVmJJI+7W
	fSIDLWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9Gm-000000082nu-0n8Q;
	Thu, 18 Dec 2025 08:21:56 +0000
Received: from mailkram.bugwerft.de ([2a01:4f9:c013:7eaf::1])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9Ga-000000082kd-1DzM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zonque.org; s=mail;
	t=1766046096; bh=n41lyNSoQuYpdPqcvETyvQJamEbAi8/jglp1oEC2UoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LUsKvlneD1aEiZdlieFQ2we1bSEAq4rzRKwu1L+ljZIDhSuR3ua7gBOrbVXcNbyms
	 JILQcubDuvtfgJHBBirMMIQHp7QYpu7Alcv1catZTk2u6Lm6TqrMqV0J6dy9ZpJJEH
	 x6QMFcWQOizJXVVZ/GfCCjamnKXWDLvHMWcAuC/8=
Received: from [10.10.3.104] (unknown [62.214.9.170])
	by mailkram.bugwerft.de (Postfix) with ESMTPSA id 81A0B4168D;
	Thu, 18 Dec 2025 08:21:35 +0000 (UTC)
Message-ID: <700e5050-aebe-4ca4-b02d-8ffacccf7045@zonque.org>
Date: Thu, 18 Dec 2025 09:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
To: Arnd Bergmann <arnd@arndb.de>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
 <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
Content-Language: en-US
From: Daniel <daniel@zonque.org>
In-Reply-To: <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_002144_516162_BF28710A 
X-CRM114-Status: GOOD (  28.32  )
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

Hi,

On 12/17/25 17:04, Arnd Bergmann wrote:
> On Fri, Dec 12, 2025, at 22:58, Robert Jarzmik wrote:
>> "Rob Herring (Arm)" <robh@kernel.org> writes:
>>
>>> These .dtsi files are not included anywhere in the tree and 
>>> can't be tested. They have not been touched since 2018 other than 
>>> clean-ups.
>>>
>> And yet, there are used by people using pxa2xx board with an DT 
>> support (like the mioa701 for which a board file was never merged).
>>
>> If you remove pxa25x.dtsi and pxa27x.dtsi, you might as well 
>> remove all support for this architecture from the kernel, as
>> these are the building blocks needed to make it work.
>>
>> That might be what should be done, I'll let Arnd and Daniel 
>> comment on the future of PXA in the kernel.
> 
> I agree with Rob that at the very minimum, any dtsi files in the
> kernel should be build-tested along with the rest, so either
> we add some dts files using them soon, or we can remove pxa2xx
> (and maybe pxa3xx) completely.

PXA3xx is in use by the Raumfeld boards, and I would really like to keep
them around.

For PXA2xx I'm torn. I don't have the capacity and hardware to work on
those, but I don't know how many users are out there with out-of-tree
dts files.

> I already plan to remove the remaining board files for both
> sa1100 and pxa soon, as nobody has picked up the task to do
> any further DT conversion after we removed the majority of
> the files back in 2022 and left only the ones that someone
> said they'd be interested in keeping.
>
> Robert, let me know if you or someone else is able to spend
> some time on sending (warning-free) dts files for pxa2xx
> machines soon. If not, I'd plan to remove whatever is there
> along with the board files and drivers.
> 
> I also checked the pxa3xx Raumfeld devicetree support that
> Daniel added in linux-3.7. The manufacturer's firmware
> download page contains kernel images based on this work,
> using a 4.19 kernel but built in 2022. If we remove pxa2xx
> DT support, it would be good to find out if anyone still
> plans to use something newer on that hardware, which may
> happen because of CRA requirements.

As I said, I would like to not close the door on this one if possible.


Thanks,
Daniel


