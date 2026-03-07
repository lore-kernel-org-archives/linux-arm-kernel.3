Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05691F55104
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8t269qI4kdA1DU9l5jve4mAHmOdAC9k1jnaSrHc+Rc=; b=Uq3XsZRGABMef8gkdCrGQ4t2Vv
	qYnhQKdtY5rov6L7846qujTFxfMJEYCzPHJ7dvw7nPtO+klC8vR4gSXaWCrMUbGDQLv+UT1MkoEma
	w6UCtI3hokE1uTC5VSyIHw0CS1I16x31O7ouzDTfJjUx0HRgsGVU3eN9fSFmUaD7d34O9bvNaVnuQ
	ix848BNAt/rSO6ENGF82nD7rUqljLhiTyP08Mhm6Pe9nR+n4v7rjm2fPQQzHvsbxOgtI0LwdUGbja
	run+bRfXZ2oEEajj/Klt3MgnaUOjmTxWH6To9kq8aSjpE1hPHGsaGEC77MVLPthCYwBA7+9WWnHK3
	SKunA5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyxe-00000005VsQ-3Fsu;
	Sat, 07 Mar 2026 21:13:22 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyxb-00000005Vrw-2XO7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 21:13:20 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3B999240027
	for <linux-arm-kernel@lists.infradead.org>; Sat,  7 Mar 2026 22:13:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772917994; bh=w8t269qI4kdA1DU9l5jve4mAHmOdAC9k1jnaSrHc+Rc=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type:
	 From;
	b=i+7+xMyUaRyLma3TOZp6aKmBCzp+qx5AvH3jRwQ+7OTt8+QGu3bHpFia0dZUX+UxJ
	 UmmWUP6r7B9/42G2K0b7VdwBuvleh9rKr0XxHmtvKx5UwBfzUDJNnAHCiY8NGcK4OA
	 2smb7y5boa3tZWP3MASz6eFrrCydqCOgVz/Kc/6CanqerTlaAuR8bkgESzWPfv9tyj
	 wqlaqphECY0c2E/NFZaabujyXQHXKh8LDoJXV6+TJFwQ46G9c8djJn1CHEcapcMQk4
	 f6NTcDeyk996Sfgu+jwemfAGP98w5UXCYdWHo51e+Achp83WCPiS7iJ1Fcjf1AUigi
	 QBu86GytgtMrQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSwwl4JjWz6tw2;
	Sat,  7 Mar 2026 22:13:11 +0100 (CET)
Date: Sat, 07 Mar 2026 21:13:12 +0000
From: Marc Dietrich <marvin24@posteo.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
    devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
In-Reply-To: <aaSsgDqmTLEQQqK0@google.com>
Message-ID: <78b4684a-0e97-ebac-c955-6c77c3edc47f@posteo.de>
References: <aY_BpRQmLdqOOW2K@google.com> <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de> <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de> <aZvdDIYlCjg8sVGT@google.com> <99ddd816-f19f-cda8-15a9-6273e26e9e8b@gmx.de> <4a1bcdfd-e308-e357-2409-8bc82f115928@gmx.de>
 <aaSsgDqmTLEQQqK0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_131319_808455_3BCA8240 
X-CRM114-Status: GOOD (  14.03  )
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



On Sun, 1 Mar 2026, Dmitry Torokhov wrote:

> Hi Marc,
>
> On Sun, Mar 01, 2026 at 09:55:45PM +0100, Marc Dietrich wrote:
>>
>> thinking about all this a bit more, I guess your approach to just convert
>> the driver to device-tree and not change any functionally beside it, is the
>> best solution for now (and good pratice in general).
>> Maybe I can get access to a machine with bluetooth (or some other user steps
>> up), so we can try to find a better solution, if required at all.
>
> Thank you. I believe your tested-by is applicable to the current version
> of the patch as well, so maybe Thierry can simply pick it up.

yes sure, thanks!

Marc


