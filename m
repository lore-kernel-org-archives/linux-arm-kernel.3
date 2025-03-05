Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21509C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGHqSgga9ZWqhfiXbeTFLx+tMRtdQJt+JKetm5hHuhA=; b=oYk7Ad34/v9qI+08hMVbKPXNqT
	G1U4MUyUO8/Gy7EW6mMZkVB81JbjJ01Qafg0DPxTIlYkx9qH//rkfomOoEmL+82CGguZY2slHJ1mk
	IvUwyd0ZxDyy8S4c5pjPg4pTJXxXf2brbSMnc2/hN1xx4y0dW63Slz4AK5aNS+yypsWMzT1I+EcPU
	mZtgV9uvZrjA24BwPplWvx8Gvnmpfin04CT4bsugMkWRBBX13y2MfowHBeocOMrEUY4mA1MIuApeN
	PvZAuZNeVoUM0Ve1NDLbF1HRAXRgDsty9mVbtd/a/XOsxWSUs7ZKoUrSFE9GcubR/XFJ3LgSb/Pp7
	MBCVZnVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpl7p-00000007WS1-0u31;
	Wed, 05 Mar 2025 09:33:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpl6F-00000007WGB-1JN7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 09:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CGHqSgga9ZWqhfiXbeTFLx+tMRtdQJt+JKetm5hHuhA=; b=feFcngrrJuJ84n4qx9pkQPz5RL
	HtIE+H3WOG9qotKIuWGy8PcyyfKHHds7FRx7fDMJbwLYiefCjZMvOS/LDcAhVA/4djjvIkOId40he
	TGGlUeIy6mAqUV1iHa4WIo2b0pZ/ilmoTWL8nsAKmCYy0zDe8XL44J04AYJ9htbBnbj9S5jKNaBnY
	7tA3rRbIrCHvyosfZI0uGkp6AuOjFvtt7JaiAFP0sLbOjKfgGKi9PESslzJfxnZNOjqxlvTwa6N2E
	pSjpTMFoO7qV4R6LvcWPESosoMtH8R3zPQXD7j4H1C8d6iyXGEdw3xypIS64O/wtOioFXQDExTX+G
	67L5lorg==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpl6B-00000000RV4-3lIf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 09:31:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3884307f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 01:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741167089; x=1741771889; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CGHqSgga9ZWqhfiXbeTFLx+tMRtdQJt+JKetm5hHuhA=;
        b=gy1g8Qfg3CNIcTnHL33kTlbbLyNf2UwAQiMtvZjAuXDG6RIfbG3sUq8VbNsoenpd1h
         IF0EhhUt7tfbFU/mRaPcb8JImMbBrI3cy6XveVGALCa+rgIYzeFuxXoB4M9IO1nGgwSo
         9osD1zUzMIvVbX7NVEOuMgf46vJRzomlAedytEfjolC936evkyp5sIbidXINvTUstnKw
         jOjE8P0/ZmlYY86qxHGnrJYNRLspzhQYXcmUKdZndt8QdHbhniaXx+fc3qqQ6iL5lupy
         ilmXaBY+e+CC7aKGoQ9jCoEKenucjNC5XQYJ9Rlewz7SWNNMFG8FY7SdmdXP+8qxvs2W
         pjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741167089; x=1741771889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGHqSgga9ZWqhfiXbeTFLx+tMRtdQJt+JKetm5hHuhA=;
        b=l+si3vcY2zVeW+38HI4TsKCRK7s3Y2qB2jiWpzD5pWrl9QjnXGX+nqEaSD7irun81X
         fDLD8Mv0WR10dFl00fszPWxaq/EYrcO0RZxxWCw9HR+kSSqyEaAffXrUW0zjMJ5iU88v
         ljazHhHOETz+WenVQAAinipCvrxGxcPYcVw1UgIUO8joMswKMgNQhtCTU41LKkRbf7n3
         Wh5e70aW0ZulZ80sFt2sULHxV7kzeRwGtq//tOMI95WajfMemMxSETYgJal+x6ZuqHSH
         q68eEuYj17r6jgMExfrf9a5TPsgkZzFOYwmVtysyqElP3gCk+nDAw8kWTu7fqtq9i2f1
         CHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLrjs8XQqq3Voht9OeHoRqtAujh/0eMRoONE32mvAoO70Thi2/TfDyjvqG6BJK654mZLlWLiiAloXimOHO8DNV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj0TEGKhJkmz3ouB5O5+oJxTkfMQAOrmJUmwsFrZXFNOu3iky0
	vD/MXUTaDHhOzIYX0rX3HvrZEwJ2vyInZMvbvIdeWxi4BCq59RPmiJvXMzq6ejA=
X-Gm-Gg: ASbGncs30GNTPDBHQLIAwREjni9aGp4AVJ+7hetbmky8KR76dTjKqvvd9JewOq2u60g
	wf5D2hkE0dKoXQMHpRVNgw5Fk3FFlxWjDNM9lTqF9qU86E1vx9xZIh3LiYc5Bd1PsMcUmV0+gYD
	aECSvZDKR4cob1SFkfpEGBnUPvz2YMEfZ3flMgEXAXTPwPmlRRrNtPuq3TA1qzP4a+YnRNY6/pG
	DfmQH22jPV00yylaixNCu5CNMnFo6L8AwcJNnPJ8Yge4Z+7ce3mIkOEdz6UtvjTnqSTbcDsWEUW
	VGI0N8o7BIbNbSUYX4qRsAYnirv6G/pEEXZMo0oDcPOF1/a+TA==
X-Google-Smtp-Source: AGHT+IGBjeO6TeQERlVAAv2wJR2v/E9DyRfr/DsoCry1ZVSWVEJcRLW+vugv45aqXSWg1cQhm5oZnw==
X-Received: by 2002:a5d:5850:0:b0:391:4f9:a039 with SMTP id ffacd0b85a97d-3911f7400aamr2203099f8f.16.1741167088987;
        Wed, 05 Mar 2025 01:31:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd42c5b33sm12065705e9.22.2025.03.05.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 01:31:28 -0800 (PST)
Date: Wed, 5 Mar 2025 12:31:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, u.kleine-koenig@baylibre.com,
	matthias.schiffer@ew.tq-group.com, schnelle@linux.ibm.com,
	diogo.ivo@siemens.com, glaroque@baylibre.com, macro@orcam.me.uk,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH net-next v3 3/3] net: ti: icssg-prueth:
 Add XDP support
Message-ID: <5f716740-ac45-4881-a27d-91a93de6f8c7@stanley.mountain>
References: <20250224110102.1528552-1-m-malladi@ti.com>
 <20250224110102.1528552-4-m-malladi@ti.com>
 <d362a527-88cf-4cd5-a22f-7eeb938d4469@stanley.mountain>
 <21f21dfb-264b-4e01-9cb3-8d0133b5b31b@ti.com>
 <2c0c1a4f-95d4-40c9-9ede-6f92b173f05d@stanley.mountain>
 <40ce8ed3-b36c-4d5f-b75a-7e0409beb713@ti.com>
 <61117a07-35b5-48c0-93d9-f97db8e15503@stanley.mountain>
 <fd989751-e7f6-40bb-a0bf-058c752cc7bc@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd989751-e7f6-40bb-a0bf-058c752cc7bc@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_093132_099875_977921E2 
X-CRM114-Status: GOOD (  20.64  )
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

On Wed, Mar 05, 2025 at 02:53:07PM +0530, Malladi, Meghana wrote:
> Hi Dan,
> 
> On 3/3/2025 7:38 PM, Dan Carpenter wrote:
> > What I mean is just compile the .o file with and without the unlikely().
> > $ md5sum drivers/net/ethernet/ti/icssg/icssg_common. o*
> > 2de875935222b9ecd8483e61848c4fc9 drivers/net/ethernet/ti/icssg/
> > icssg_common. o. annotation 2de875935222b9ecd8483e61848c4fc9
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source
> > of this email and know the content is safe.
> > Report Suspicious
> > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!
> > uldq3TevVoc7KuXEXHnDf- TXtuZ0bON9iO0jTE7PyIS1jjfs_CzpvIiMi93PVt0MVDzjHGQSK__vY_-6rO7q86rFmBMGW4SSqK5pvNE$>
> > ZjQcmQRYFpfptBannerEnd
> > 
> > What I mean is just compile the .o file with and without the unlikely().
> > 
> > $ md5sum drivers/net/ethernet/ti/icssg/icssg_common.o*
> > 2de875935222b9ecd8483e61848c4fc9  drivers/net/ethernet/ti/icssg/icssg_common.o.annotation
> > 2de875935222b9ecd8483e61848c4fc9  drivers/net/ethernet/ti/icssg/icssg_common.o.no_anotation
> > 
> > Generally the rule is that you should leave likely/unlikely() annotations
> > out unless it's going to make a difference on a benchmark.  I'm not going
> > to jump down people's throat about this, and if you want to leave it,
> > it's fine.  But it just struct me as weird so that's why I commented on
> > it.
> > 
> 
> I have done some performance tests to see if unlikely() is gonna make any
> impact and I see around ~9000 pps and 6Mbps drop without unlikely() for
> small packet sizes (60 Bytes)
> 
> You can see summary of the tests here:
> 
> packet size   with unlikely(pps)  without unlikely(pps)   regression
> 
>       60        462377                453251                 9126
> 
>       80        403020                399372                 3648
> 
>       96        402059                396881                 5178
> 
>      120        392725                391312                 4413
> 
>      140        327706                327099                 607
> 
> packet size  with unlikely(Mbps)  without unlikely(Mbps)  regression
> 
>      60         311                   305                    6
> 
>      80         335                   332                    3
> 
>      96         386                   381                    5
> 
>      120        456                   451                    5
> 
>      140        430                   429                    1
> 
> For more details on the logs, please refer:https://gist.github.com/MeghanaMalladiTI/cc6cc7709791376cb486eb1222de67be
> 

Huh.  That's very interesting.  Fine, then.

regards,
dan carpenter


