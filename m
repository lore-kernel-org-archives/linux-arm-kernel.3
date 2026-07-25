Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68A2C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZvKr7FLkhOhBgNOH72CVbm/jH3qBF7NMfB100gIgnA=; b=d//gNf723jv7apKfixeHOBJlLc
	m0v8jQ8k7yKYBnoY1p3xkdYavbbkIKb6mZ53LgBT1sfHlS80cjo56cACT3ECvlCxWp8WkK/mB+PWi
	S7BA3+6lsi+CBSq9sCtNXVZLNJ2FVl50S2yYoYK/g5rB5DW46o8aqgMcswZoM8Ff7SckOVElCVdcj
	QCCXOwQ4whQeOZbiQM6CvedEVmw8O5/gz+7US5rpYVw4kPPS3Q0I013VSduspVuquVSLT2VuQQry3
	EUYZONrRi0cLlOAM/nUs5+8P2QgaswBhq51k1NPXvebRTfZNlaZc8YuH8ZQ6dfjYSP8BzMOikSZiy
	IfrjOaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnY56-00000000BjT-0Y4u;
	Sat, 25 Jul 2026 08:50:04 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnY53-00000000Bie-0yqY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 08:50:02 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8B99E7A02C2;
	Sat, 25 Jul 2026 04:49:57 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sat, 25 Jul 2026 04:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784969397;
	 x=1785055797; bh=oZvKr7FLkhOhBgNOH72CVbm/jH3qBF7NMfB100gIgnA=; b=
	GvsutnXHf0alKXU5SLmPM3Zp9Z7FixNQMkMNKPHk0x4EjPoOsS1G29+9e1fzO9h7
	kYpTXbKeTqLeEJ57rpsvSnzRBS64Y9zjzKMU4WXLPxYgc2Bk5zBl1xzAGFqVP2wx
	LDRGgPC4wX926l5Fxu2/sbkK9c+SUWANlKEQlNufIj42JTsqJy0YP2uNthRIpV62
	PHLynbyIzmJySMIUpeN1AxzlZ4e2dihWzDh5pVxFfafRrSsIaKiL4KM6phblb8dB
	H/EZDnNA4GjHKCVU/iLTaDXvhuycmJ9X2f1D2fJn+CiahbQaG5c2PUGF6H43z5mW
	Kiv3BG3RR5f34TJRmB5Nzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784969397; x=
	1785055797; bh=oZvKr7FLkhOhBgNOH72CVbm/jH3qBF7NMfB100gIgnA=; b=k
	vGmOwiowLxQ/esJdVN1Y7mmnedMNsKZLPdgRb1KO7awqy2Kv84DDCzBfhNlHKgkn
	uCP0x1ne3HfK2/uWMQ2NbD6l6zy1qlSle+1jqQpxpOYdaSwTZAeeIC2sJ77JlqpC
	9MFQOjuGKIA9aHxsndaJ0T43ZoYL4nXAaAIW3onZUJ2rSEk1VLKzvze3d6wlkh3u
	3Gpb7eLiJzWMM1zk/jKHHKmmYEI34NGZi6avNhSmmlZ2S7pQ4OPlijaocKHYiVYx
	7+v4vHY7poue76+1OkbPA0g6L1E4oM8pBOgTIYIUVeEeb1RuU19DTfD1D7XnG4H4
	5TElJZilJIw3fXIxWmnLg==
X-ME-Sender: <xms:tHhkahhuneILHaX3D27yQ2JNVIM3Bg30ml6x_EQxKquc2_SOXlNT1w>
    <xme:tHhkag1EoBdSKiKKzQXk1snmJEZrJ1Qgopj7e28hc2lBk46FLPmCdR85F444MTtCA
    SRVS_Jr6-nGt9zAl1WXhtBIV4qWOo27YiV0mZIHoRCjNQAhLFJ87YY>
X-ME-Proxy-Cause: dmFkZTGATJJ1PHJvWCleipM647oxJa7LJTW39Tau0un9OLsIXjku8Zj7+T9xw+Qoh9GTEe
    DVRBx1VJIubVJN4JYBzqAixtlb+HZ49aWJt2iehzsmgv7oysWMhE3FDW6lXu9Sle+1Elw2
    FNXkf2uxQA2sfUrWk8/+Cugco4O6goRIK1q9ivHvVG2gduv49XY3PqU+3QmiysWM9e3BjN
    6esaS3kQWIbIhVOOi91t8yI1RlQePW+J9UOWUHCbl1n1eZH1l+oOAUcS5/4Aiw/9MYuWd4
    nfCPSJojf9R/0aVfiZR3QcTQ2E4iYdAtUILMgo44mGcJg4F849soa/1wntBiqUU7+DztBl
    2WIw7xDSEpBloY16+7fQ0zpzXKW8P4eERMAwmuOPFTmck5HuioQVj18tuKZagKsz52urv9
    Sv1o5eKx8a6TDIMjji4VE57QoDONKcS7yffUUgRwMqbv3EcQmezq49GukmeM0yXIg7pOmi
    PodhEk4+Y8hXHIcMxEwe8SqQZgDBc2kDLBQYq9mKpNCZYouuMUPBg5pBaA3+7m6Z+D1wX/
    tctbNwxbZUw/1zeg1a9ypS0eimnwV3moI1XWFeYwConJ/0j4aBu4OEusoRBucJ3xvHrsih
    xoZCpdwo3Mbs/KcLhArILHtEUnkM/eZI9wmwXdFLl8v8igKS5rTqToccKLog
X-ME-Proxy: <xmx:tHhkagtFkxK7Z6lxWV_Uq8pUjsEZIe2iVaJYWtQkM7Nm39TJAVUD6A>
    <xmx:tHhkamah3GxMPE2b1hi0voaU6H06o9aK4AyPo8Fb41sK6G8ginfMow>
    <xmx:tHhkanWkMyfrQn8yipVw650ifMUrWHK26ymqKYn5oFjGXrW8gAEIyg>
    <xmx:tHhkajRlCyA0IgeOOt6qSgczLzqEz6mdyCJp2AA6J8JQE38cp02IyA>
    <xmx:tXhkaqHvf6Skj5n4LX7BuSjAS5GwTPQuQiQ7RjaUSvOyPGwYUATMXQFg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C53AE182007E; Sat, 25 Jul 2026 04:49:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A4FDpBWSXDKo
Date: Sat, 25 Jul 2026 10:48:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Kevin Cernekee" <cernekee@gmail.com>,
 "Gregory Fong" <gregory.0xf0@gmail.com>
Message-Id: <95c01af4-1702-4e3f-b2b6-ed6149b9c886@app.fastmail.com>
In-Reply-To: <amPhVKnTgESQQp7w@gmail.com>
References: <20260724174748.65958-1-kmehltretter@gmail.com>
 <0d6dbd8f-c5c5-49d2-b36e-3cdd404eb55b@app.fastmail.com>
 <amPhVKnTgESQQp7w@gmail.com>
Subject: Re: [PATCH v2] ARM: set !LPAE MAX_PHYSMEM_BITS to 32 and remove IO_36
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_015001_349615_2D702260 
X-CRM114-Status: GOOD (  14.91  )
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

On Sat, Jul 25, 2026, at 00:06, Karl Mehltretter wrote:
> On Fri, Jul 24, 2026 at 08:31:35PM +0100, Arnd Bergmann wrote:
>> 
>> I'm not sure why you remove remap_area_supersections() but keep
>> create_36bit_mapping(). I would just remove that as well.
>
> Sorry, my earlier explanation was confusing. create_36bit_mapping() is
> not totally unreachable after this patch. The ARM EFI path can reach it
> through:
>
>     efi_create_mapping()
>       -> create_mapping_late()
>       -> create_36bit_mapping()
>
> I verified this with a modified EDK2 build under QEMU that advertised an
> aligned, write-back EFI runtime memory descriptor above 4 GiB. The
> kernel successfully created the mapping and enabled EFI runtime
> services.
>
> Admittedly, this is a synthetic configuration. Stock ARM32 EDK2
> restricts allocations to below 4 GiB, and I believe the AArch32 UEFI
> specification requires RAM in the UEFI memory map to be identity-mapped
> during boot services. The test setup is therefore probably not a
> conforming real-world firmware configuration.

Ok, I see. I can't think of any scenario where this would do
us any good to have an EFI runtime mapping for high memory
when it can't be accessed by the kernel later. Anyone running
Linux on an arm32 system with more than 4GB of physical
addressing is already using an LPAE kernel and won't be
missing it.

Please just remove this as well.

     Arnd

