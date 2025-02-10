Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB93C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtKdGCmuQba4xz4Q1ol+VDvF7rgjIz28hjlDE8JNUn4=; b=KRtX2+Qkhq9LyO42Tg24iFTPBW
	cBHY3XdMSOuZDZhm4SuEwzvQwKcRULMU3rofc0vhdYsv340jxXXEwCxMp/UJH6g7Lqg0AJdD0zrX1
	Lm6gTnTTZKmpaUpfqkO4idHm49yVPMR22xbsaUJu7rBk7tP25s7GzQ4mMvUoo8dkLGpTzTyxFRMjY
	ze4G4TSX/zJETDFjK/EinRZUg9N6cQFK0OylMLcaD5ohttajrrYgRTpwm+2S5QQbY38ps4oUS9isa
	cLltfXgytY1GvcxTArJ3NKpUDICVCV6wdhdTf1nC1cCgfNuCEZvW9jAu4Sl8rZhvfZnLdmxUfs3FL
	FMNzTJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWkv-00000000XYK-1s9S;
	Mon, 10 Feb 2025 16:35:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWjW-00000000XIa-0WMH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA0275C2750;
	Mon, 10 Feb 2025 16:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB4BC4CED1;
	Mon, 10 Feb 2025 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205245;
	bh=ypPI17tsQZJ+km5A1XxVr29qienQSziXYMYp0ksACRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbOAsLYbiPDE6IFDnojp9BT7SnzxEB0k4y8Gx/Svk6KcuRA1k7MSlL6OqBePE5pZh
	 ySqQaoBi0SE09abNaCF1a7/fiigSXGwH25hFaURTqp2GbnNFdEbln50QVCbf3m+upp
	 2NbxQSXcrc2i6tlRX/HG6iB8yAiZbWImA7PF/5Rbq+Q54UR+5EWm7XXYkYnt8ojPep
	 jrnnpDqf0zbexT37ShYnK4LId2LeH9Pe+UyditJy5p+X+uy58+Ojt6ZCwV47QjdYu1
	 ytnMly3T/kptepApjA0OYMFUCgahrWZUvQskboDowaB+TGCb94BBp7Ft6XWD5hMXC0
	 RNs7Yji3cEKDA==
Date: Mon, 10 Feb 2025 16:33:59 +0000
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 4/7] mfd: bcm590xx: Add compatible for BCM59054
Message-ID: <20250210163359.GA1868108@google.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
 <20250207084852.GC7593@google.com>
 <bc9df0fe-ff2b-439b-a434-b6b88ee8e25c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc9df0fe-ff2b-439b-a434-b6b88ee8e25c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_083406_202210_575FB44B 
X-CRM114-Status: GOOD (  27.47  )
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

On Fri, 07 Feb 2025, Artur Weber wrote:

> On 7.02.2025 09:48, Lee Jones wrote:
> > On Fri, 31 Jan 2025, Artur Weber wrote:
> > 
> > > The BCM59056 supported by the bcm590xx driver is similar to the
> > > BCM59054 MFD. Add a compatible for it in the driver, in preparation
> > > for extending support of this chip in the bcm590xx regulator driver.
> > > 
> > > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> > > ---
> > > Changes in v3:
> > > - Fix compilation warning about device_type pointer cast type
> > > - Name the device types enum and use it as the type in the MFD struct
> > > ---
> > >   drivers/mfd/bcm590xx.c       | 6 +++++-
> > >   include/linux/mfd/bcm590xx.h | 7 +++++++
> > >   2 files changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> > > index 8b56786d85d0182acf91da203b5f943556c08422..23036157480e0116301bfa93932c92f5a80010ea 100644
> > > --- a/drivers/mfd/bcm590xx.c
> > > +++ b/drivers/mfd/bcm590xx.c
> > > @@ -50,6 +50,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
> > >   	bcm590xx->dev = &i2c_pri->dev;
> > >   	bcm590xx->i2c_pri = i2c_pri;
> > > +	bcm590xx->device_type = \
> > > +			  (uintptr_t) of_device_get_match_data(bcm590xx->dev);
> > 
> > Why are you dividing pointers with each other?
> 
> That's not division, it's a line continuation (note the space before

The space is irrelevant in C.

> "\") - had to insert it for the line to fit in 80 characters. Though
> admittedly, there's probably a better way to do this than to force it
> with "\"...

You do not need to escape the line break in C-functions.

> I will clean this up in the next version.

You can use up to 100-chars these days, so you don't need the break at
all.  However, if you insist on keeping to the old 80-char rule, you can
just omit the escape char.

-- 
Lee Jones [李琼斯]

