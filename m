Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B6CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lpk/G+s3635r6xB3IoMaLT6FJnb35y3X5yGekjIsKgs=; b=iBTrppx/iaa3d5/QAmgocKtzaa
	F8xQPP9LG2pHnyzfOlB4KoYISbh2B1aJEsuDMUFsCvR/sxCKVbRElJ9FgLFDDjiVcHqcmdjSwO5Il
	NckNPnjzEzVK/cm/0faCfcagPVW4jH23kWwNUfuM4bypbC/YvRYBKbFz6Ug+5X3bs6rChCsPLvCAE
	gwBic9VR3sXjyJ4wSJJodFF1AYDQHoeiStNLPAjB3N7AaBWAq9bJKBK2XUpEnZPkY0s+34ncvhsv+
	oYFA/4BoaPnUxubS2zh1EWb6rYmwoNMgA4fABi8+9gxzSB2DdMEx4v4uqaTa00eNoocXFKi+NHWrC
	3fAuPUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTv9-0000000Bao0-1z5Q;
	Fri, 22 May 2026 17:44:27 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTv8-0000000BanG-1Whi;
	Fri, 22 May 2026 17:44:26 +0000
Message-ID: <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
Date: Fri, 22 May 2026 10:44:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260521191458.177046-1-rdunlap@infradead.org>
 <13240501.O9o76ZdvQC@strix>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <13240501.O9o76ZdvQC@strix>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 5/22/26 12:09 AM, Stefan Dösinger wrote:
> Hi,
> 
> Am Donnerstag, 21. Mai 2026, 22:14:57 Ostafrikanische Zeit schrieben Sie:
>> Fix multiple documentation build warnings.
>> Improve punctuation and formatting of the rendered output.
>>
>> Documentation/arch/arm/zte/zx297520v3.rst:66: WARNING: Title underline too
>> short. 3. Building for built-in U-Boot
> 
> I am sorry for the mess. I'll look into doc building before I send clock 
> documentation...
> 
> Reviewed-by: Stefan Dösinger <stefandoesinger@gmail.com>

Hi Stefan,
Does this mean that you will be merging this patch since you merged the
original patch?

thanks.
-- 
~Randy


