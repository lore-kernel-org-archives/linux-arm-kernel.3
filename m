Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0F1C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih2qmbw0kIlUrbc6K54EF8TQLIe280fNI5rV3oonE98=; b=0zf643CHmrcdmPd82A/zNEYgyG
	6BVAbEQeiUIJiWc+wVdwFhj0x1L4lHBkq3NPOe0qtu+9blNWyUixDz/Wrq48kML6/FIarXDuSgN5Q
	993gCBzZZnfCCM8Eu0bFokurUz3SCWkx1pGsBxwikz/MaovrmkHuqEaLUv2Fm9jWpQVnhi17eVXRy
	sb43jeOf1+/voNM1cuT2q8IUr2T02WHVar3qTn5fOVfgaZ1R2O9/rKeXzRWWbIVEiwU0YTuwiBZ+h
	9AB0AY63EHK1G/55ToSFBCq3hbmaNidZQ5k9vWeYSnpft2xaHSF8VSjBfE2iAO9pmUPCIU1pBfp7h
	WSCQ1J4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggZk-0000000GOCJ-2gLf;
	Tue, 29 Jul 2025 09:24:48 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggLz-0000000GLal-2P5a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:10:37 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso10172990a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 02:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780233; x=1754385033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih2qmbw0kIlUrbc6K54EF8TQLIe280fNI5rV3oonE98=;
        b=cgTizAzbgZhy2aTFKFkqKQsriYPhYoka5qiB9/Y/QlU2Gi/JKg1iaT36qMqV9EQgNA
         0AcDkwBHqTv94iKQXGCw5ZfTJ5w78m8WxUx9oPQ0aCaUoFI6YH4C7CgxG3VQ5fdAXKBc
         ciqzeUSGWEl9oFwcoBGu7z4R82QSTB/hDrNGI7BMPm2ieXxf2x2UK8ruy+b8jAnEqo5B
         vBTFMgw9KULLSlN9ZkU3u4QnYsiPnYzCF8THVi9M6Mgx2vWa6DFil/KYOELuQKpeErL8
         nwTL8TrmDJqho4wp9pVhj8CCb9lfQCKBE4UjR8U3RF0VQdaknosAoFEv9Tq2u0eeZ6hN
         7SXg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ppsvei5LKh5uQxpI56kXezqsEUcRLgazmUan3HvSRoBW6Qu8/tOonHt7R2utZymBaWy7abG65g2Mu2n9PHaA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7gLZNA0YiEJhRs16pjUz9aKgsK3n/jN3B1nhkEv7qp/64cXyj
	sb3wffGC6Mv1Mi0RvcenewVV9a5l6bQUfcblpgzOFMt4EbC3ro7BfCrQ
X-Gm-Gg: ASbGncvl6d0iLVMdyg4Y5+C2oMA4Vbi8BtpRuWY+EvTJ9PwSXCfLqLCSFlPfb9x+kSX
	RDZqPpheRCQVIoSMWlgQ0OjRLxXxMh0wLEEbK6TFxuba1w95/e3ZiJHyWC79o2hL3bl0tPV/JBz
	SQBTvwBDFwa3DCRLuORANaXb0Qk9hDz/X5htupR+qx3Vnikws59HfHGJLN68N35VeQvngjRDhx4
	wdPgnTg44WaLZLWhMwm2menhp1vdwKIBRMXX/LZjIiGFM40lZdCcnMmFM+piXheUE6la/74LxnJ
	iChszkNl4ivuDfwXoIoPvO7i7FPztYJJiKfAGJ/etCifciSkBbkr6cHdePA5YjjH6uF8quB/0es
	WrH0y7bIkb9JgJGGmv8AoH+hO
X-Google-Smtp-Source: AGHT+IGl6n+ifSL/KMMTqTxzwuB1z4pRgpR79rQhN5RUlYpPobdpUuW/5vOu1d899LsLXtkRT0+q+Q==
X-Received: by 2002:a05:6402:27c6:b0:607:f63b:aa31 with SMTP id 4fb4d7f45d1cf-614f1d19bc4mr14119485a12.6.1753780233258;
        Tue, 29 Jul 2025 02:10:33 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615285de7casm3178237a12.46.2025.07.29.02.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:10:32 -0700 (PDT)
Date: Tue, 29 Jul 2025 02:10:30 -0700
From: Breno Leitao <leitao@debian.org>
To: Jason Wang <jasowang@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	Will Deacon <will@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, eperezma@redhat.com, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>, 
	netdev@vger.kernel.org
Subject: Re: vhost: linux-next: crash at vhost_dev_cleanup()
Message-ID: <ppjmgrtdfepjqvrnqo6xuuxipgu2s6edfboy3ymoe4h7cxr3qw@qtjxjnd7ocfr>
References: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
 <20250724034659-mutt-send-email-mst@kernel.org>
 <CAGxU2F76ueKm3H30vXL+jxMVsiQBuRkDN9NRfVU8VeTXzTVAWg@mail.gmail.com>
 <20250724042100-mutt-send-email-mst@kernel.org>
 <aIHydjBEnmkTt-P-@willie-the-truck>
 <fv6uhq6lcgjwrdp7fcxmokczjmavbc37ikrqz7zpd7puvrbsml@zkt2lidjrqm6>
 <CAGxU2F5Qy=vMD0z9_HTN2K9wyt+6EH-Yr0N9VqR4OT4O1asqZg@mail.gmail.com>
 <bvjomrplpsjklglped5pmwttzmljigasdafjiizt2sfmytc5rr@ljpu455kx52j>
 <CACGkMEt0ZBtcAUgc1RBU7Gd3JGvC-eszEOexee-kx7TgoiMGtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEt0ZBtcAUgc1RBU7Gd3JGvC-eszEOexee-kx7TgoiMGtA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_021035_616196_A65187F9 
X-CRM114-Status: GOOD (  15.86  )
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

Hello Jason,

On Tue, Jul 29, 2025 at 03:44:49PM +0800, Jason Wang wrote:
> On Thu, Jul 24, 2025 at 9:50 PM Breno Leitao <leitao@debian.org> wrote:
> > > The initial report contained only vhost_vsock traces IIUC, so I'm
> > > suspecting something in the vhost core.
> >
> > Right, it seems we are hitting the same code path, on on both
> > vhost_vsock and vhost_net.
> >
> 
> I've posted a fix here:
> 
> https://lore.kernel.org/virtualization/20250729073916.80647-1-jasowang@redhat.com/T/#u
> 
> I think it should address this issue.

yes, it does. I've tested the fix on my machine and I was not able to
reproduce the error at all.

Thanks for the fix,
--breno

