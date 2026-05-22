Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8914ACD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXVYxOlGxnFpjtqebPHdxb2rapBSyMJrkchK/E0p6rQ=; b=E0Xkv/AKEPhozB+3IXOpb1fClo
	nkKP9oLF42byzCWscyrjtUVeFVe+D3slH1erC50/P6TSCaISmNxo73/ULdIwPLKHRZeVojPayt/IB
	quqzLVzyVJ/arzCxg+V81tse/NcUnbZVJax/SUEmVIwfG35PPllHKtD/faOW/Q+f4DEG2HVxdp9Ld
	HH6calN2o90pRF6CZ1bQdOTGwItWvGffoSnKUB39wEG9okvep64NOd8RfTJXfF/FxFa60gScLnSBa
	k7eOI0omCO3r+J4GekXc3Ty+b+e0J7n+FLU+4jQTedWeoDQfototpkUNaKP5Ed3Tn9gN0iaRKiiss
	+39nMwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXIK-0000000Bwg6-46v9;
	Fri, 22 May 2026 21:20:36 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXIK-0000000Bwfe-0DD6;
	Fri, 22 May 2026 21:20:36 +0000
Message-ID: <ca29c0fe-8725-4cc2-8f4f-db3f80ccafed@infradead.org>
Date: Fri, 22 May 2026 14:20:35 -0700
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
 <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
 <6270885.lOV4Wx5bFT@strix>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6270885.lOV4Wx5bFT@strix>
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



On 5/22/26 12:31 PM, Stefan Dösinger wrote:
> Hi Randy,
> 
> Am Freitag, 22. Mai 2026, 20:44:24 Ostafrikanische Zeit schrieben Sie:
>> Does this mean that you will be merging this patch since you merged the
>> original patch?
> 
> I am new to the kernel development process, so I don't know what's the 
> preferred way. I guess for me it is easier if your patch gets merged as-is.
> 
> I can certainly submit a pull request myself though since I made myself the 
> maintainer for this thing. Does that go to linux-doc@vger.kernel.org or the 
> soc list?

The same way that this commit was merged:
commit 220ae5d36dba
Author: Stefan Dösinger <stefandoesinger@gmail.com>
Date:   Tue Jan 27 20:52:08 2026 +0300
    ARM: zte: Add zx297520v3 platform support

I guess to the soc list.

-- 
~Randy


