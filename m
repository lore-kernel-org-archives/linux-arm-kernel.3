Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83623F3381E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M98aQTjWa8T+7ERPNFsSGl3sVEntJ3KUS4g5D7crqo=; b=u5qu01D0q331rJ2I3FgGAjTMSB
	q3bS1G1ZY6wa2IUepfyjepAdNGtmL7NMIiTBCmSF74t0eMTZejh9Kj4z5Ql5xUEKiVUmdng8a9U8L
	nCjuY0g84dBqad2I9lCqOnR3CM0q6bbmPmD6mNNjvaLevkygddSzTc4r6PLjKATiHnmYjg2bV1saJ
	oMMk4mP88TyxdZyorJt7DkmuOe8Pi6Ko1qHSea723mtPJm9E5JENtDaNlHywaRUxqifdtqADK93GB
	dLFMBDPZSTa5Z5sU+GT+8Q0jhpHy9fxx+PE2yQHqxD3LbMb/gEtUKED0o1n1SkL3ik9X4RSG+y+0w
	46COFSZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QY7-00000005q2W-37Y2;
	Tue, 17 Mar 2026 09:17:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QY6-00000005q1p-2SXz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 09:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6M98aQTjWa8T+7ERPNFsSGl3sVEntJ3KUS4g5D7crqo=; b=UKY3PNus5M6PNnHDI9W5s1kzAU
	vwYEEQtyzeGr9kyA3nUkXX95Xok3g1yzWqD8GE8pHv0URwJ5v5FdtpyyVvtJPhkTzR3rfMSOLqz7f
	yDZgv/suNxu51jROdS18yHEHVZ6jj8WZfNyYgmSoAtPuWnFYgVwrA7EB8SVPkbwPxm2RS1vHVwXfq
	G4LIWLwgiXJAYcdGO9YHUZIdaoNLnwwUvJ882SHBExsJ9nbYIMHSUR2RKgz+SRzLiigLuhelfTxDi
	UwTE362hakiU7MkBGM900JpXRAspkqM18RcDKhFNCkOvQd+m0Mq9iaJwAekGVvspkRgBprHCZYgR6
	Yw7dOPhA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QY1-00000008VXK-3ITj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:17:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48538c5956bso5316515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773739028; x=1774343828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6M98aQTjWa8T+7ERPNFsSGl3sVEntJ3KUS4g5D7crqo=;
        b=fnrDprCkiP/VNgnx0DrnseZSFIHc9S4hIvmYM3nYz1UOZ6uSi4twW8SMbN40fs4Vlw
         8b6Gvf0jQki8iMJTssXYkaVcRyPaZPE50O946ApTAp05P/13Vs46QG7fedFxlxeGn4dB
         TGgy7OiIq4zooaRusaDDntTU3efC6hsWxCpIHlJXP2X3UY3fbbBLioBUUoRbQ4wALrB1
         ylxY1TxhHifeF3W7F1kqKw1cODul4Xewz5FhCTM7jJ7htPPO3ZxKAVwZhwIIKPuRPBRt
         xv/0yKthe3HD+fp2usWlQ3KP16tCZH2QCT7ujWwBmwVuFAA9voiEjjG3e9sZr74GEoIz
         FIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739028; x=1774343828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6M98aQTjWa8T+7ERPNFsSGl3sVEntJ3KUS4g5D7crqo=;
        b=TlFu0syFB1yqvbRlXmHhbBbxWuGyAuq9QDSKdmUOgWW9Iu7RZsR2Z2UwBI9ksZUWwW
         0K3bfswdZ6+lzD3fZWWpK133gYx0MoJD54cD+nxOgAWw5R6OkBM3YmSl9VLS3sC0Z/H/
         fqKpzAYHXeoVdPNGVMciPerqrfoJ/y2cWFrQJkIFgDyGIsBI74/QyPGxHDWzHNXbTnZ7
         Z8Mx/ReDSvJeUSyd3dtwfn37Jv0RyblBURXU5TKH6Um5n/J0qA9GGmJdI1z6SIYqYSWZ
         6BqQtaHejgVy82brEj/PerYrgZ4uzO5CWRKASzW02uRLnl4v2U31SWnah3oDowiPHT8/
         tuAg==
X-Forwarded-Encrypted: i=1; AJvYcCWeBlM28gSht+VsLxZH7kpE+/BAmOonkNecOI8+6gaO15/OdWEklH1jxSfSlB7Sd2Q6Ju+ORs2UnWwMps6dR8QV@lists.infradead.org
X-Gm-Message-State: AOJu0YwThEdyICOn+xQ4UemP/thyZE65Pd62GMiHlJbKH34DyEAJI9/F
	xyZ1f4oQi6fcoKpBMNVAd33u38CnvoPTejokUcsvIuuG69+BYQjgWlAN
X-Gm-Gg: ATEYQzxpvKBskybvNEnmsQgdkAulYVEMXcpSg89c5FVtm+WE3dU6FsNessv8znEL4SB
	ZEmjNJf7EpFsX2GBfZLf2jJcTdvejFR9dH1XeYSH6lQOLHl9sgw4C5cwWGj8+/MztrolgXbRD5l
	8ShB4IVvyuqbI9Q3ey+DKAf6nknTFYYJsruj0nACEodp+aYDhbSgBmrmQxFT3buMqOM+EwYAVNm
	8sPRrwEVoU+H/k7/38eDzJuYdJti9UwmbM/Foz/bH/LwF3kyiUslF2FcVCD4yiLb/fzZRIk9NHQ
	X9zRRGrtV7TOL/3tT6T0lF7laD9vpKYkDrUJCysF0uoOw+lVdGbTAVf4M74Ze8K/z0urIpMkaW8
	XFKA9lAQVcmI4p6gyuT3CT1AtaBVxXfohjWpqXXL+I+JHjCNpTMBTv4ypf7shi7Dw/tMIq7cfSx
	WTwLbTzL287o310sUp4a1eTrXRCLNxoIwRwh56uODdZxeM7V2K27i9d24QvOEzjKqi
X-Received: by 2002:a05:600c:5249:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-4856eac2b35mr44375555e9.7.1773739027522;
        Tue, 17 Mar 2026 02:17:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm99153105e9.3.2026.03.17.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:17:07 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:17:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
 catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org,
 mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com,
 zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <20260317091705.5a64fc56@pumpkin>
In-Reply-To: <87ms07rlp9.fsf@oracle.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
	<20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
	<874imftol4.fsf@oracle.com>
	<20260316233712.7cbfac27@pumpkin>
	<87ms07rlp9.fsf@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_091709_935960_B6436A5B 
X-CRM114-Status: GOOD (  16.12  )
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

On Mon, 16 Mar 2026 23:53:22 -0700
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> David Laight <david.laight.linux@gmail.com> writes:
...
> > On arm64 I think you could use explicit sev and wfe - but that will wake all
> > 'sleeping' cpu; and you may not want the 'thundering herd'.  
> 
> Wouldn't we still have the same narrow window where the CPU disregards the IPI?

You need a 'sevl' in the interrupt exit path.
(Or, more specifically, the ISR needs to exit with the flag set.)
Actually I think you need one anyway, if the ISR clears the flag
then the existing code will sleep until the following IRQ if an
interrupt happens between the ldx and wfe.
I've not looked at the ISR exit code.

Ignoring the vcu check (which is fairly broken anyway), I think osq_lock()
would be ok if the 'osq node' were in the right cache line.
I've some patches pending (I need to sort out lots of comments) that reduce
the osq_node down to two cpu numbers; 8 bytes but possibly only 4
although that is harder without 16bit atomics.
That would work for arm32 (ldx uses a cache-line resolution) but I'm not
sure about similar functionality on other cpu.

	David

> 
> --
> ankur


