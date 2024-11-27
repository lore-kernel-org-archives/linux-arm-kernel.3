Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD64D609A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH5mL4wRTiW49fY5TXH3cCb7VB9lpyJqEtwCttH2FW4=; b=vFLLjI3Wj6uao2Xqp07B7ZINDe
	E4OvwT3JPpQY9xZ1eouFOOh4/nhMsKgfZgGKXivMdnrJMhPgTi/FhEINGx/pJYQMtR+83JXsV3NDH
	LGtB5/lq/5p06T4X65fB88QA4SCzg3fITob+4Z4Pl4tlG/AVtGFT/cOf18KDdwKGfpnJHvxjGjzNJ
	UgW5ORHmmH/PJ0uhos0o02YqTN90jEwVuGxD+izb/+NCwDTWO4/4447dThMKD0X0CBpDUpA1EqvKO
	aUxj25t1eL9Jn1ocpB8yrWzkjkSuYAZp9pTIW7Xq81lHP5mJDUGJMi28Z2xID9ZIQb6EcYtD+WzEi
	Tr4T1n3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCEp-0000000CPca-2mGk;
	Wed, 27 Nov 2024 07:13:27 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCDq-0000000CPUw-01nQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 07:12:27 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A1DB3A06EB;
	Wed, 27 Nov 2024 08:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=BH5mL4wRTiW49fY5TXH3
	cCb7VB9lpyJqEtwCttH2FW4=; b=R6hqUfMXnZ+Zn7nY1F21IEQ2ivu4jGDH+c36
	eeIia4n3sF3imo7exXZM6JEBkP7zeDYRHAO+xCgYHIQti4y8UZKCEKnhiLxDN+78
	kIBmYJt0j+RC6pLDHRQubvjs35YAKuYaVDuC1/O4ZK+1HQ6NNNrWSIYPURZPsr/t
	r7BLhAHAnb60rCVIWNuaIdmKSsqR7CqkGGedvePUYG51HnAE3BKNsIM357djU2BD
	34d+PRao6xV4X4SpPzPGYHl423Ts8hhLaS+uBy0aYZo2D6KdZvEZr5NEuOhWnboP
	JiaOeuwyFUd3wrqJIcPgDDHDlN+eAGsZAeDa+mbViP9dthwA3KBMEfHvWmr1aT2+
	U3q9x86pGNdLwNmsSrOkYbIFpGIaz6OLrmOQ3FGeJItWt5ULfpMo7hItNXCtt6sa
	Ewx+5bCTjOrlMQ24wcsTVBLjU82t1GLlvwHvIdaXsU04xpR+7KAgAmr/X3bHsEgG
	kuZ9+me9UtKV4Sw7Lx9RnrXe6+uzuHAaas5n6X1kUo67sd1I+/WZP3hM6fWad69P
	6VUyCdljZ2bwYJJc6ek6LqOskboWgoZzpZbnSxb/fEwUFWbVZoqAqF2LlnVxHcgJ
	658L38zIuTluCn2jhn3DXyCcV3/aBrQ9upWh9jHJxVPTabLILaBg/ATmu8xLTz4C
	Jhk007o=
Message-ID: <60f52d54-da36-4223-9063-b833451781ea@prolan.hu>
Date: Wed, 27 Nov 2024 08:12:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] ASoC: sun4i-codec: Add support for Allwinner suniv
 F1C100s
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
	<mesihkilinc@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
 <20241123123900.2656837-4-csokas.bence@prolan.hu>
 <d0ecce33-25e2-4711-8311-7788c77b7d2d@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <d0ecce33-25e2-4711-8311-7788c77b7d2d@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.2]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855637465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_231226_501044_49549AFC 
X-CRM114-Status: GOOD (  11.91  )
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

On 2024. 11. 26. 13:18, Mark Brown wrote:
> On Sat, Nov 23, 2024 at 01:39:02PM +0100, Csókás, Bence wrote:
> 
>> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
> 
> When you write your signoffs like this with the , but no "" (like in
> your From:) it confuses software and causes everything after the , to
> get deleted.  Probably just including the quotes is the best option to
> match the email header.

Git handles it fine since 2.46, before that there was some weirdness in 
send-email not adding it to the Cc: correctly, but git am & co. worked 
fine. b4 still has issues with it unfortunately.
Link: https://github.com/mricon/b4/issues/50

However, the real problem I think is that git format-patch doesn't add 
the quotes. What's worse, you'll have a real hard time trying to git 
config --global user.name "a quoted string". Git tries *really* hard to 
remove surrounding quotation (and is further aided by the shell). I'll 
see what I can do.

Bence


