Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47099CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdiPPLZWJJB7/3u42OQnI20Eaqu3AwluA7etN42m9mo=; b=JpWbrJBJVFKj4sCtRnoFwMqb2s
	17PgcgTS0cB0V39iwSRdZuIrLdZpc0MaXcsuM+JLP4JbkiRXb7pn/K48QDMVnBinwiJwxYZg11e5t
	omeZ5TntLC0h0Pe66ME2AAMqweD908Zs1ced7hasuJAOmhO6qMuBK3jJzWBzxBE1en4D1Zi5sk8sX
	/KjW6v4sqInxeqYlqCAbL+S6WSypE7+Hw/dmUTNjo4UqxwTZ5W2fMSdvY5fk0zwNl5UVanAqgtt9G
	i93QheU/+6QA+JLCskWOrZCU5t5SJPIEeDKVLPHwzgPDsqCIZBjRvnhfoG4qSziOktUQRpXFLiKBD
	C01TsX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6D5-0000000D1A1-0fdA;
	Mon, 01 Sep 2025 15:12:43 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3gg-0000000CUdo-1ZRq;
	Mon, 01 Sep 2025 12:31:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-325006ff07eso268205a91.1;
        Mon, 01 Sep 2025 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756729865; x=1757334665; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdiPPLZWJJB7/3u42OQnI20Eaqu3AwluA7etN42m9mo=;
        b=UXrfosH4BxTwvYhANy0VxOjqW+4GZbA7VunSFBKBNdZew/vV0YcV+x1Pcc6CU5Hems
         PRp4LzyZ1q+dccLx+YVNICvwjUTjELsOyReM+EbDWyV+m0I/839HFRowCSKyMzZiN+PS
         l07TM3kSPQt+JmV6713s23hJ3mytMXNwzyJvnjNqEbtNj/HWeYRk66Q1D97tCAI3CYFJ
         s7d/RiLqEiXqaGxbvIwVfKnP6TuU/lw9F0qTIQYnq2Brn0baDBiyO21DzHNQqi+arxOF
         FwUr8c8kIy1SIJr/yp0uUvM+w/W8+0N5wpVN3CJ6tBarNAldc7kUxI6JhcA2cQ0a/8sz
         wolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729865; x=1757334665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdiPPLZWJJB7/3u42OQnI20Eaqu3AwluA7etN42m9mo=;
        b=J7CXjHql9VElIDw472AgEJu5Kivpax/SfuZJDChrW+deAfab11isnYe04PjN6xJ3WH
         XglF1r1Z0f1bjPUDYuyzRHedTvJpO8lottMnL8Xu/aO+c1qwoEOSkDp/AI9e+n6BrOcY
         i2sv/1tY6CZ3uT8LfE0VIf9kg9x23+iTIcZwdB/OOEO7j8h99LnTiGXW4IcZ9g+cXXBK
         jo50AED8ETa4/2OmF5vh5TLKzT1HCX7RY6zsrWeukR0Ab8MVJ6fWAkFsgeRDxSFCUBVF
         DFzjeD5zKBK+hPmW4fqSJcDSQF6zGcewUWGLuIct82Xi5h3qm/T266reFLqACdooTwua
         kaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPuavi7sDFQBFkyx4j1LFd036hpCBHMezvpg1wzvv8gaioTRA/iSrr+RVzhy+SOEVwsUCyZcF9Q7aATF5aOjrV@lists.infradead.org, AJvYcCVsyvjLxAO+25bp9k8iyzEFds/SlFxSY9pf0XHBfiu1a7kobESxHBowBLLk7Pp7Ii1cgQNZlTNvXSknYgM7QqIqVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4zwNTWey71wngsu2Pgr2DKju7Qd9X0+07m6SRNQ3KYOiujawY
	s73JnjF7yKzyq2nSr3+UZF00dUZGNvmH5EUSnbncXFzd5Uhh/QErtxJ/o4T93g==
X-Gm-Gg: ASbGncuhbe6o/Z1grNGWNjIGM6f/sh78IqC8nFpJKa78zF+LV21j9ZhZDLObYEq0nOq
	OExjKd99v4ih7evTJRAkPV49dMLKHQWMVqh8kLtHL/GUF0AGGfFqzm3bUrGoPvLdYWRE9DYYhZ1
	HtkKfn3yodAu4P9RsvFS9BhzBIpB68qryDvPIUSl//6tyR5Qp0vum6zvAuVDz6WjP6j9zIglW1O
	Y8CpevFZOhNDGdcuK601kF9Dc6gvIcaXC+X78Q6pT+gh7HgEHJHaJzcUhgvTqCDXT7mXs5tp/w6
	jo2kb1oxtyCPr7ybJP8BccyFIDwsK1/HYK5ykvshFnhfv29i3x9GpEJvon5thVwrHWxGMTNUKC1
	EpQJc6E6Ax4VfuS3e
X-Google-Smtp-Source: AGHT+IHuPeIgSdm25HDXIhjWczun9s0SrO4hSzN9HThHTxxeNAPcVKH5+g+uW+k/rl8zuQL2W/L6jA==
X-Received: by 2002:a17:90b:1e11:b0:31f:11d6:ce9c with SMTP id 98e67ed59e1d1-327e666d073mr7238986a91.7.1756729864986;
        Mon, 01 Sep 2025 05:31:04 -0700 (PDT)
Received: from fedora ([2400:4050:d860:9700:8e8a:52de:86af:cfe3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ade38sm9252219a12.34.2025.09.01.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:31:04 -0700 (PDT)
Date: Mon, 1 Sep 2025 21:30:58 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com, hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid
 -Wformat-truncation
Message-ID: <aLWSAiAA8Ombi0WB@fedora>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-3-nogunix@gmail.com>
 <20250830212923.GB16364@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830212923.GB16364@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_053106_416903_DABDE24A 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
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

Thanks for the explanation. I understand now that this patch is not needed.
Please drop it.

Best regards,
Masaharu Noguchi

