Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF19F013D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5rdKYHLZKcPCs+PuT8wvrz6Hsqg7tEiKjR4+wYLNiY=; b=ffffjxYSe9WnxOr6657+6z4B1P
	MVbodFxQHNwVpWCg9M6875QmRwNuRavaxu6TyYy96Dd2hD3YfoMhc4KWrILwjhlZAu8CuUAMPjaB8
	80xPs6CvRP/torVP7NOpEotQ+FvsK2HceCKo9IUPUogUeFJhWhfZnIYo9N5fri7W5ANZm+NopN/tf
	T+fxp76ri+FfOcJuCF5uXVnEIkeU0ZykJOz/tD2ddcV8CodbWiW3XjQGWWgZaubAJyK5PVf9amPiO
	95Ygnerlk+hXkXxALK1lHuKwLtn+1l7Idxee6NpVdNyQKu0SIYc0gjF3j+Ax3n2HW4m3w3pCla2oo
	HEcScdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Wx-00000003ZMe-1ZUr;
	Mon, 16 Mar 2026 08:42:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Wv-00000003ZMV-43aN;
	Mon, 16 Mar 2026 08:42:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2BF8600CB;
	Mon, 16 Mar 2026 08:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1B3C19421;
	Mon, 16 Mar 2026 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773650548;
	bh=9LJ2+2SgK7w+NRyNaEGoZkSKWLsSd19na5lnCcCLdDA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HueAbbgbhxKEaBW7w0dzIcNXgtAE9iyH0WnDtPEOzjPRgM71uZliWj8r0Mz7sQCrS
	 9SwYtorMTIo0o4AfIeBdDWSRXF5TlvCphV36rMWzFcoLZaVnQH4SPhLc3M5TlZqb0L
	 vBkdB79aBc76zAUt2+11fObdKcjBUIqAF0qYW/h354DhJbLj4D4ByTZjqswWFutVFE
	 Sbp+n19NLxxsFope55qDW3egNxCb48nf/BiUjaHT9Gj/TFwXInqNlsxLvnow3vHZrZ
	 05ThNtgMvOZ0L8xV7rj4yEbEmu+rSSb2eDyuLBCyh0Ehst/lK8lGR+IyiVfrES+pTh
	 ffgqQGNEIQF7w==
Message-ID: <2d879c2a-aded-444c-a54f-cb0e8acd89b1@kernel.org>
Date: Mon, 16 Mar 2026 09:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 01/13] media: saa7134: rename i2c_dbg() to
 saa7134_i2c_dbg()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-actions@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>,
 linux-media@vger.kernel.org
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
 <76fd11b2-7789-47c1-a832-12907155ead1@kernel.org> <abfBkg8YpDKIlOVu@shikoro>
Content-Language: en-US, nl
In-Reply-To: <abfBkg8YpDKIlOVu@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 16/03/2026 09:38, Wolfram Sang wrote:
> Hi Hans,
> 
>> Do you want to merge this through the i2c subsystem? Or do you want me to
>> merge this patch through the media subsystem?
> 
> The rest of this series has been dropped in favor of a different
> approach. I still think this single patch here is useful, so if you
> could pick it up, that would make a potential future change easier.

OK! The patch makes sense, so I'll pick it up.

Regards,

	Hans

> 
> Thanks and happy hacking,
> 
>    Wolfram
> 


