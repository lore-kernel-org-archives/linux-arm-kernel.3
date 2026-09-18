Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33851C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+xIqsm9yQ1hNrqrX4cwXF5kuEUp8+h4riZn/pmeeOU=; b=If0l3hakiDrxoP6+FsZhQ6XW8R
	ieM/JyH4mwMcokNrW6BaVN4HEhZfCTFA/sqT29Mxfi7OwLpR17kG9VnkwQxBxMaaaS5fYCS8BDfwt
	xPU9QERdbwyVz85VV2itG44O49BCe9dl1abwcTzFYJfatqjvIq0BDCjP8REc7udG7vhmXyYhXaj5R
	TXLTSmJtTBMLDnGpl2kxCxGXQBu52011RMCeVSAv4YaOM959oaSnK5ADqARtzW7i5dYEBBMqRj4q1
	gpUrHOhM2WPkTA/l1PSW9Xtstbn52iTae7cRuksPjyY7jLvlo/GJ6PaVAhZSGAxHozURy3TK0kuum
	jOkQVqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ejm-0000000FSth-1CgS;
	Fri, 18 Sep 2026 19:59:10 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ejj-0000000FStG-0Q16
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=k+xIqsm9yQ1hNrqrX4cwXF5kuEUp8+h4riZn/pmeeOU=; b=enFP9GrW0aNsR1AnDePgll6kXa
	vIUTHl3x2i7bi0JOHfQhu/GOcv4bXVvs7H5FJfUcCgjOyeKGTjts+iY1Zvkws7+bj7Qysy9o3dwQp
	xRnQUwJYGvxW7K6ziJ/X2c4IGHstnPwpuLIWaPspZ6i2NvsdSv/1rckyjGt70edc8ML4QTeCAiLcl
	QTj7TgByRBDVHi0zdfzfoH8zLfAzXgfzAiiGDCO9uNWclsaKQAzFS3Q5hVrC+7tWPJz33DZbFXBjA
	5QKIVmcofx7BtJd1lIuoonuJ29TYG0eaWljjEEWJh0M7olZde1T4okg1Fc4blXbk4fy64HDParCMP
	bQHv07LQ==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x7ejU-0046be-TI; Fri, 18 Sep 2026 21:58:52 +0200
Message-ID: <77321b17-c533-4287-9b05-98003959da70@igalia.com>
Date: Fri, 18 Sep 2026 16:58:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/13] scripts/syscall.tbl: Use the common table
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
 <20260917-tonyk-syscall_table-v7-3-f4cd8f8e3265@igalia.com>
 <6cd76fb4-0834-457c-8188-c68a507b6a6f@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <6cd76fb4-0834-457c-8188-c68a507b6a6f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_125907_138890_6606ACE0 
X-CRM114-Status: GOOD (  16.65  )
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

Em 18/09/2026 03:34, Arnd Bergmann escreveu:
> On Fri, Sep 18, 2026, at 01:46, André Almeida wrote:
>> Remove some of the duplicated code by using the common syscall number
>> table.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   arch/arm64/tools/syscall_32.tbl | 69 -----------------------------------------
>>   scripts/Makefile.asm-headers    | 15 ++++-----
>>   scripts/syscall.tbl             | 69 -----------------------------------------
>>   3 files changed, 8 insertions(+), 145 deletions(-)
> 
> This somewhat desyncs the two copies of the arm32 table, which
> isn't great.
> 
>> diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
>> index f1c3d287c14b..b09dbc8992c3 100644
>> --- a/scripts/Makefile.asm-headers
>> +++ b/scripts/Makefile.asm-headers
>> @@ -15,9 +15,10 @@ all:
>>
>>   src := $(srctree)/$(subst /generated,,$(obj))
>>
>> -syscall_abis_32  += common,32
>> -syscall_abis_64  += common,64
>> +syscall_abis_32  += clone3,common,32
>> +syscall_abis_64  += clone3,common,64
> 
> The clone3 variant is wrong on nios2 and openrisc, as they need the
> __clone3 version. These currently redirect it using a macro from
> syscall_table.c doing
> 
> #define sys_clone3 __sys_clone3
> 
> which will continue to work here, but I don't like how this is
> inconsistent between the architectures. Let's use either
> syscall_abis_* or a macro to pick the clone3 variant on
> all architectures, but not both.
> 
Ok, I have dropped the sys_clone3 macro and added clone3/__clone3 for 
the all archs that uses scripts/syscall.tbl for the next patch revision.

