Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C9DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 10:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBZorERfZGVAeB4b9MQwohizAQ7RVji7qJz8RExp9pY=; b=s4zPrgnbMmLBI2/ckJZARBeCeQ
	iDexdgNFFakMKcJEoBmuEfb905OYyv+a/Yj3fB0I+pwE8nNJ/8IK1L/j8+Hv9NlSgJtJSTqbgudej
	RndLlpSkF96f4SClrrqcbg0cfqITjQhY03afRbiDdfE+Q8QAkLH775szh9F4d7l58H8NLEE7rY6xF
	N9OOB49JqC4pQqO3No1+lwu/1ukuq/koGjGivcTNQx9ltF3EwcSWLiBVuIGWmte2v5uxM8jMDMiLV
	Ozs5ZdEyDh8RMIVI27IV5o17uvlTZu7Y9R/uBpLQmq6/UkXIOjCwGo1obO4B0Q/NCAmUr55PT5V8M
	dBHWWGRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlLD-0000000D8Qa-0VlV;
	Wed, 04 Jun 2025 10:27:27 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlJ6-0000000D88j-3Aia;
	Wed, 04 Jun 2025 10:25:17 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b2c49373c15so4222268a12.3;
        Wed, 04 Jun 2025 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749032716; x=1749637516; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QBZorERfZGVAeB4b9MQwohizAQ7RVji7qJz8RExp9pY=;
        b=BBT4U4RgFOoisWya4/xmaQ68YPbj8PctaV0C1ANOW0vxbV8SNjupXhEH+6gCPK1uUq
         F6M494IBAHHH+4Un3aNigazQzGGRYZ9+Y1804MPHMS9w2k4Irh39GujAO3ugn6U1czJ7
         7khilFMonLla1PeauhBGXJRpU/v6pRvpKzQiXCZlaC/hrudUPYSRMoIPWdOJcUcaKjM7
         bU55LtXJzfBY7ilpuupmaSvVmb/cQ1uPGyE+YcfSkcRHQePdawP0XFQZX+74r7homSca
         Tv5O5XWbIFn6E7qhS7vCjYQacP+n5XXlJm+Ny5tuhNm/3unbntue+kCNgdDKUr1N708I
         NuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749032716; x=1749637516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBZorERfZGVAeB4b9MQwohizAQ7RVji7qJz8RExp9pY=;
        b=uxOfCiLZ7Cpi7HYchIcWHRum/LLKjN+cBkyG2NwY6ZTvJ46eBNPJ/9o+fyPLcjKhzG
         g2qJSuWxObqD0BpLcFJekgIofEfzrqh31oNS2FM3d8GiffG2RJcWvcFTdATC0NzeViPe
         AfJTIxMJWZIGo9ZcxKKBMrS0xY/ohYbEQqF0A/cSM0EOm1yW1K2Bn0JLW4+hBs1OhXRd
         ortlYx8+yum+e8EiWoxWQVIqzwxSj65SuOiRjdeYkipsL/AUx3Z38lj6n0IMXt1YYWj0
         8DnlmsY8A6vFV0rPrF0h01VRO7Bi6OUfM0Nka94HFJIKhwKlLR9z9uUf1lUwQDobFgJn
         VPjg==
X-Forwarded-Encrypted: i=1; AJvYcCWY9oHiyhtms9IjNDWjvo+U9NGdvGQgRt9tnu6e1rdnxhTXnFL64KWFkL7SjxOTguBMmSI+08AOAQhG61wR5u0u@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh96x2rkSIj0YfIxQ4W312U8KXfPsxL7AKEoA/I5nqwHwB6zpV
	FiVZ4FPgf+103AT60u5KWtdZW7/YmQoxhMy7+RpJpxdI3p84NcGlvX/lthkJAZmB
X-Gm-Gg: ASbGnctFzJSYqFdZAf59D8C6J8A20uE6KtPESTHakBHm2AmWVFmlBf+tU0BQGBPBRD3
	ms3IcvDFU1hS4JxXtI4SxMNN/ph037vKaZt09wrGSDDLPuyLsxfK2DEC87j/0vFQwPeX1OG8ud4
	x3ReJO40CsWsXAKVWPcUl+3ZGjb8tLMshdXlrz+6lCEUOvpMOXPg6CZMgd+QcmdRbQ+gsxeEVDM
	yWZtKzWAhXOoTIA00q4u4apN6F2rGELGK2NtfOQr0zWnO3Zt1afh8GLaXTxsS7Yoex3sYxLpwpL
	GITTRo0E/pLGyE5im2cTZHWwafVp8DNpnu13m0HaV9en1Uip
X-Google-Smtp-Source: AGHT+IEKyQ32HiyWlJskTxRYL8AQnVG4qWWHt6Qqr3ywr5giPCq3wD9L9VKOqjgiM8Sod4EwUE2ZGQ==
X-Received: by 2002:a17:90b:38c4:b0:312:959:dc45 with SMTP id 98e67ed59e1d1-3130cca4fdbmr3399852a91.3.1749032715722;
        Wed, 04 Jun 2025 03:25:15 -0700 (PDT)
Received: from geday ([2804:7f2:800b:7b3::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2c2fa3sm9473906a91.19.2025.06.04.03.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 03:25:15 -0700 (PDT)
Date: Wed, 4 Jun 2025 07:25:09 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <aEAfBc3gsVTmkCyE@geday>
References: <aEAOiO_YIqWH9frQ@geday>
 <317943F7-8658-436D-9E3C-05CB6404F122@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <317943F7-8658-436D-9E3C-05CB6404F122@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_032516_792700_9E7748ED 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, Jun 04, 2025 at 02:20:20PM +0400, Christian Hewitt wrote:
> I think you have me confused with another Christian (or auto-complete
> scored a new victim). Sadly I have no clue about PCI and not a lot of
> knowledge on RK3399 matters :)
> 
> CH.

Hi Christian,

I did not confuse you. I thought your work with LibreElec partially
involved getting the ol' hand dirty with RK3399 patches. But if it's not
the case, I'll drop you from future Cc: on this subject.

Thanks!
Geraldo Nascimento

