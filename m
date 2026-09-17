Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53B0C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dddSXRxdIdu49NHzZiLViRMhRwi+PNMj8+As+AEkJag=; b=bFP4Y6cc/y+ptZv/fN/i15dt06
	uF4QQ7kveG6ZEmV8joxd+9KaVoJ+6W8JPh3bTot68Boml7vL2phFYNtfujkr8yvn9e0jVQChUVlLb
	O+KY6qNrtd0tL147n74COBn7Zdj2z8Lee8WsyBKwHLwhsczjuj2A+yoGIM9TD5NCAtv/yyCAVwLMW
	X3K3+BlAaqt4uN+jUAU78sqo+LluMtKDS9ziHBYhPLkkzp/9ks+5aU49xWZFAKyb4epD3hZNs+9sV
	7fKPEm+ioH0mqn0M2vYcL9Nd5aqmzDf5bo4g1akT9i1V3yuh1W4SPvD6tH5uKgqK9J/axgyq9zzM6
	QmOU34XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H4z-0000000CGhb-0eDA;
	Thu, 17 Sep 2026 18:43:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H4x-0000000CGhO-1e4T
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 18:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dddSXRxdIdu49NHzZiLViRMhRwi+PNMj8+As+AEkJag=; b=e8jCdtCffmsg6WRBTNSJakrPMd
	rICXtEB0U+xm+sfwM/4Dv5ocICOzKsqeXRw6D9h8jKr0iuQCUhcYI/1gQx2M7AfBwSCpWilTsP74R
	30Fvg1pORhfvlsiY7xr4QQxgx4BPN1W+J3Tr0rsxmyO9rnn2Knr2rPkQT4WWEfVSZYN0H+C2nsvju
	0+1wkbszqi7nW0KkjtaxfKrkCCyrnBu0o6pIzu2JXfkmRQbWBrchOoZucOK0agX0313UzPlwbf3z9
	zwKGt2YyDgPTg5jzBW/eeE4AMIJ7niu8vHk3RE8mmd23/tMTw2TFWxH/miofYanktJ1vwehAn2rq1
	3go+a3Kg==;
Received: from out-234.mta0.migadu.com ([2001:41d0:1004:224b::ea] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7H4u-00000009Alz-2T28
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:43:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dddSXRxdIdu49NHzZiLViRMhRwi+PNMj8+As+AEkJag=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789670600; v=1; x=1790275400;
 b=TbclyN/ZVuG+rU+4xjm75+piq9TJqCokLY/I9maxgGVgt1b0d02dbe3aecqderwMQxnMCF4e
 BIP9aDx4SxXpWXx+fALzWVvwEI0rAHZLp0T8W7rxGIrX3ePOBGCwzzr1IJsJ+ITRnI0E+6TywSm
 Z+40JyM+wKYISNLCILuPmlHY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f7d7a0ab301b37dd;
	Thu, 17 Sep 2026 18:43:20 +0000
X-Mizu-Trace-ID: f7d7a0ab301b37dd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso1667e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:43:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjB5MpcAS6+sbSpY5B9CB1TVYkYMdEjmhxLf+SBhv+a5iOsOLmFdLD9Z4zDH3TxILmABvNCszhCU33NfjM4iDr@lists.infradead.org
X-Gm-Message-State: AFuF++kNKw/V5a/DaBeVXcw/dLcghmS1Q7WNQ9QvkejeXBZ4nmHjuGDm
	LjsO3EEmvQ/FfVkpMsY2r2jFdJI4814E2DNxA/12ohnVlpEIOYddbllp1UVBxqbhFFSZkQ+4msr
	tANi4DNqtxJJEPvWn4a2SCWeYebHtpaf3PUcq6Mr2
X-Received: by 2002:a05:6512:2241:b0:5ae:b918:79d5 with SMTP id
 2adb3069b0e04-5b8c1021042mr20644e87.2.1789670599138; Thu, 17 Sep 2026
 11:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-16-fuad.tabba@linux.dev>
 <86a4ph5fb9.wl-maz@kernel.org> <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
 <865x045mke.wl-maz@kernel.org>
In-Reply-To: <865x045mke.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 17 Sep 2026 19:42:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx1rGTZ-8Knj_JJJJtcUhU1o3Qmw8gr=iNkWEgX7Lv6vA@mail.gmail.com>
X-Gm-Features: AcwNN1W2zdyru-EwkMeGvOAl12MsTWv2Fg6M62Lipeq-f3z_dccz0p-vzgpTsTw
Message-ID: <CA+EHjTx1rGTZ-8Knj_JJJJtcUhU1o3Qmw8gr=iNkWEgX7Lv6vA@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] KVM: arm64: Reject host access to protected VM
 private state
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_194324_745900_17A4879C 
X-CRM114-Status: GOOD (  14.71  )
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

Hi Marc,

On Thu, 17 Sept 2026 at 09:06, Marc Zyngier <maz@kernel.org> wrote:
[...]
> News flash, this is not x86, nor s390. I don't feel constrained by
> other architecture, and we deviate *everywhere* already.

Not x86 nor s390: and I'm grateful for that every day :P

[...]
> A protected-aware VMM already knows it cannot obtain the registers.
>
> I don't want to have to revisit the userspace interface once you have
> to relax it, because I know for sure that you will have to.

What the error buys is that a read outside what EL2 copies out fails
rather than returning the copy, which is what a register dump would
otherwise print. But then how would the VMM know, once EL2 starts
copying more out on an exit it already gets, that those registers are
now the guest's? A cap is all I can think of, but I may well be
missing something. With the error, the relaxation is a window on that
exit for the registers EL2 copies out, and a read that succeeds there
returns something EL2 copied out.

> As far as LD64B is concerned, there is no place to copy anything in
> the run structure, and the relaxation would require to cover all the
> GPRs, ESR, and FAR. At this stage, returning whatever is there is the
> correct thing to do IMO.

For a protected VM the operands would go through fixed registers, the
way x0 carries the MMIO data today, so the window on that exit is
those registers rather than all the GPRs.

Hoping this one doesn't return -EPERM :)

Cheers,
/fuad

