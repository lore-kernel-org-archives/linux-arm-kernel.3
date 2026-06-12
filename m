Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCEECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kbuuuOZWUF1RFETFe0hK/FlP92aPI0TPvOQIoPd0E8=; b=Aefs2MmVjFvOgm2rkF4A8Mp9bg
	blqJYZi+VsTSb+n4ww06oeydvaxiWNCJC0re0Dyoe4soknzLcP7pKhyZ1r6C21pxKZ9aiA8k/aWVF
	hNrWShfwDyupTkFGApJn1oV+qPqQbqJpYZtPLioq9t1z0ERFVvtXOTlsA0JCscWbM+PT20uXh/IlM
	BfFYWSsegYqq6nWMnReXBYROXvI5wlV5Cur7cjm88BIFNDWr3qSjhLQt+OqwuHWp0Jwm1oz9X8JaF
	ZF1qTOkcFWb9XC0ljJZGAu806swsxvfFRcJ5I5pOegNtMatp4axGB6FcDaPycUL7TPSLNA0xFFOFl
	LX9RpJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Cn-0000000B0MF-2iGW;
	Fri, 12 Jun 2026 13:45:53 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Cl-0000000B0LG-01jo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:45:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BAC8C49F7F;
	Fri, 12 Jun 2026 13:45:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DABF60012;
	Fri, 12 Jun 2026 13:45:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD0E0106C8B01;
	Fri, 12 Jun 2026 15:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781271929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4kbuuuOZWUF1RFETFe0hK/FlP92aPI0TPvOQIoPd0E8=;
	b=xcIvkfGO6BEMQx4gfN2/H+Sa9bOcBUzyRTA7j5F3DAaNPQ+/ImEN3M+tplPXBhjQkmYBYU
	hLIjk8oORe2+mOx6efgWHaQ6lxJ3jF5bKQHAtniCl90GqD9YvFmpK1NnOb0UXw9843N2wt
	2oU6ZbnPwkj0okTBk4e5tiChliEVEXJ2DENMJoHWvP+VxkbcatMjU/NijU0QZ89uAocdzH
	nysBLkApkGJ96Uxklp+RLr86FrbouBKVYNPP84+GJ3LqVn4QrK06ZIuMg10grsHaKo837E
	VC7z2NYTRhnJTWqMa5qJFvB6dLjvMsuYFZYUUrqEebg11KH2B6Q5AycJrqN8xw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Aleksander Jan Bajkowski <olek2@wp.pl>,
 arm <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
In-Reply-To: <8de15abe-8352-41f2-85c6-bdb50eb18e9a@app.fastmail.com>
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
 <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
 <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
 <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
 <8de15abe-8352-41f2-85c6-bdb50eb18e9a@app.fastmail.com>
Date: Fri, 12 Jun 2026 15:45:26 +0200
Message-ID: <87o6hfc1op.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_064551_216057_43A2BC5D 
X-CRM114-Status: GOOD (  25.97  )
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

Hello Arnd,

> On Tue, Jun 9, 2026, at 21:29, Arnd Bergmann wrote:
>> On Tue, Jun 9, 2026, at 19:35, Aleksander Jan Bajkowski wrote:
>>> On 09/06/2026 18:11, Arnd Bergmann wrote:
>>>> I'm a bit surprised by this oneline change. Since you successfully tes=
ted
>>>> this, I assume the change is correct, but I have two questions that
>>>> I would like to have an answer for before I pull it.
>>> By the way, the upstream safexcel driver works correctly only on=20
>>> coherent
>>> platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-512
>>> selftests fail. Since the selftests pass on Armada's SoC, I assume I'm=
=20
>>> right.
>>
>> It's not necessarily proof that this is correct, but it is quite likely.
>>
>> After checking the datasheet some more and finding that this should
>> indeed be coherent everywhere, I remembered that even the old
>> 32-bit Armada 370 had a coherency manager. At the time, we used a hack
>> in  arch/arm/mach-mvebu/coherency.c to mark all device nodes as coherent,
>> since the original DTB did not contain the correct annotations.
>>
>> I suspect that the Armada 37xx started out with a copy of the
>> old DT files and also never had the annotation, but then never
>> had the same hack because arch/arm64 does not have platform
>> specific code.
>
> After investigating a little more, I think the correct fix here
> will be to mark all DMA masters in this SoC as dma-coherent.
> I thought there was a way to do this for an entire system,
> but I could not find that, so this likely has to be done
> for each DMA master separately.

Thanks for doing this research. I also checked the data in the datasheet
before applying the patch, and it appears the platform is coherent. I
was surprised that when we initially submitted the support request,
Marvel didn't mention this; usually, SoC vendors like to have good
performance numbers. However, they also didn't say anything about a
coherence issue. The fact that the test succeeded is a good indicator
that the SoC is indeed coherent.
>
> Not sure who still has the hardware and has time to
> test this properly. Given that the incorrect DT has
> existed for over 10 years now, I assume this is not
> urgent and I will skip the pull request for 7.2.

I believe I still have a board based on an Armada 3700, and I should be
able to find time to do some tests.

Gregory

>
>      Arnd

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

