Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F08C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COVKnxaXbvkMkEzzbEMC1ENd8eyx/4BNqddLa1MlqMg=; b=bmX5+6qWCI/IlU
	so1RSFlxCQK9mExKfSNcv8lUP68nVHR/UCp8U/jM3Gl68d8nIwsgDnbtmq75o+NqWpcvNvZtuf14T
	USmFrETH8Qr76MFNWSmOxCUvT7M5V1Z1vKbpoiZvYgFmEidn+u+QRzs0UwSThZYD18bTZVl3Vxvfz
	BO3fSqdxy5gFdV4Bkt4ueC1Pl34UCC0p4TFbbxaqywitg1AWubVTdgFLzsIEmPpGpJpx5uC+Fa6Xh
	X1fjyS0pU2YP4ZUtQvQjb9GtcxiTYDO1xVYSjBDrrJG7VUolLL2UZ2CVhzh6mUMMPyH8SQrFMADDU
	thrxXv5F2z6ds6tgbcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtSi-00000005EWx-0WBi;
	Thu, 06 Aug 2026 08:28:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtSf-00000005EWK-30tV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:28:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495590dde14so20669435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 01:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786004900; x=1786609700; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COVKnxaXbvkMkEzzbEMC1ENd8eyx/4BNqddLa1MlqMg=;
        b=GxN+B1Dgi0En6Jic/mehWDXWZ0NkmHH1eB+vCKT4giQITVuleUebeS+TDh2vN1wIQf
         zPFkxlX/O0WzYGD93VzGVlcggudDKDUA44oEuThW7L178S5TXo9r4/F2WpRNASybuVQe
         iCjJ+iCwERyUwxsxdqtbgKmQJ8PEMhLeFFnm0X0iL193g9Gqip+0qqhoDRtJpVBQJ33S
         XeptW5gNVYn/8SNmtOyqgrYE/gn0etXTP9xu24bTJSqZtl1OUDelrqdzMXNaDen9cmF7
         6OiJnE2FPrfQT84y9un0iDJxpQ8CSc+5a6Kzzg+kBktKaKl8koRcSTzGW0VxbjM+RSkZ
         DCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004900; x=1786609700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COVKnxaXbvkMkEzzbEMC1ENd8eyx/4BNqddLa1MlqMg=;
        b=VzgkgYjm13jnHHHCikNZ7Xr6/bIV3XndHTECXftYXTLCkdaNG0so2UyWngzVn+lqNp
         pcJ/5ocXcUfDT3YooX5KSjiPWlE8B46VE3BN4Zd9FzPeHQ2zunw3nSDie8zYtH1dM/j0
         P4OkyrSX/DbtB7CIwPVnF7tUxEg6FvJLm4i5zIxf80QSM8JHgMWfb7hTwc25OYkMveMj
         7Ppsp9FhU5xaEl2zbdV/VAchTo/8RKD74kEDIpcdaeNfsz3DOctlNiUeXTnrj3a+C8Qb
         h/ca1G+bIKCdzmRG8pAk5vQe5lWdbT9zDaZ7tLUz+mwy87s3RmPO7O49kSIvShlQ/jba
         kOQw==
X-Gm-Message-State: AOJu0Yxt9Gs5svH4oGWy98gGuOGWkgDskGYDQLyrRcV8EYi6o1ax42fN
	jyoSQR80Q5iNgmoY5cOekoVV+z8vIsl8Ee0t6zC7JylnD2w4ue2xZCsV7qkXNchrqus=
X-Gm-Gg: AR+sD13VBcvyFBVCkza0A56PPSgOHed1vfiMWAF3IfKTIuFKTDJZh0GmBuD8YaTT/gj
	O693bdKQ1GYygRVfSjdmKOFPueAF+8d2dMCyd2BgfjUcb1RL+0aFm0INiBJhCCeYPBcGU/Xah1R
	5FckWneo9oJrodFhS0NEQjD/ZqYNy5Pch/vYr4xN5bsDv76U1NJAYM4h0Pv8exVC71ZkOdfMmho
	zEjfe+1RjF4E7odK1jeTO1EeWDtpKfe6P8U3RVWzlJcptwxE91l0N9hLSiudUN77gVdIUL690NT
	yXdCno434Y3yX7t0E1ZA4Vb7WzfNpCa+vei45RjETy7SSql22WzAUECPCBaK2rUCP4794K7j5X1
	f8pP1FFpSsb8yCoSOf4rDZTF7ZskO0CIX6CEg+aPO/mDhwqmawmTQGUKZVB1QDBNy+HsujB6cG5
	szzUN0Ip30tI90M8fwBLp8ycTuV+4lDoH6Fr+6ExWUXgSUJ0Sv46ZfcAbo/Ub/Iw8Xnp/AJdKZL
	cmYlSSHdZmY5MfAHqzdzqTamDWxIcW6DOPitw==
X-Received: by 2002:a05:600c:35c8:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499593ba192mr6111495e9.1.1786004899623;
        Thu, 06 Aug 2026 01:28:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b250e5sm4410098f8f.27.2026.08.06.01.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:28:19 -0700 (PDT)
Date: Thu, 6 Aug 2026 09:28:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 02/20] arm64: percpu: Fix this_cpu_and() mask
 generation
Message-ID: <20260806092815.082c6b2a@pumpkin>
In-Reply-To: <anM0S1jVmwO0mqEt@J2N7QTR9R3>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
	<20260804170503.3513916-3-mark.rutland@arm.com>
	<20260805101416.454a49b6@pumpkin>
	<anM0S1jVmwO0mqEt@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_012821_774183_CC04DFE7 
X-CRM114-Status: GOOD (  27.02  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 5 Aug 2026 14:02:03 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> On Wed, Aug 05, 2026 at 10:14:16AM +0100, David Laight wrote:
> > On Tue,  4 Aug 2026 18:04:45 +0100
> > Mark Rutland <mark.rutland@arm.com> wrote:
> >   
> > > The arm64 implementation of this_cpu_and(pcp, val) is built in terms of
> > > ANDNOT operations, which requires the 'val' argument to be bitwise
> > > negated. The bitwise negation is not implemented correctly, with two
> > > bugs described below.
> > > 
> > > (1) The bitwise negation is performed as '~val' rather than '~(val)'.
> > >     This won't always generate the expected value when 'val' is an
> > >     expression.
> > > 
> > >     For example, for this_cpu_and(pcp, 1 - 1):
> > > 
> > >     * 'val'    is  '1 - 1'   ===> (int) 0x00000000
> > >     * '~val'   is '~1 - 1'   ===> (int) 0xfffffffd
> > >     * '~(val)' is '~(1 - 1)' ===> (int) 0xffffffff
> > > 
> > >     ... and thus bit[1] of 'pcp' would be preserved unexpectedly by the
> > >     ANDNOT operation.
> > > 
> > > (2) The bitwise negation is performed on 'val' before it has been cast
> > >     to (at least) the width of 'pcp'. This won't always generate the
> > >     expected value for the upper bits.
> > > 
> > >     For example, for this_cpu_and(pcp, zero), where 'pcp' is a u64 and
> > >     'zero' is a u32:
> > > 
> > >     * 'zero'           ===> (u32) 0x00000000
> > >     * '~(zero)'        ===> (u32) 0xffffffff
> > >     * '(u64)~(zero)'   ===> (u64) 0x00000000ffffffff
> > >     * '~((u64)(zero))' ===> (u64) 0xffffffffffffffff
> > > 
> > >     ... and thus bits[63:32] of 'pcp' would be preserved unexpectedly by
> > >     the ANDNOT operation.
> > > 
> > > Fix these issues by adding brackets around 'val', and by casting 'val'
> > > to an appropriately-sized type before bitwise negation.  
...
> > >  #define this_cpu_and_8(pcp, val)	\
> > > -	_pcp_protect(__percpu_andnot_case_64, pcp, ~val)
> > > +	_pcp_protect(__percpu_andnot_case_64, pcp, ~(u64)(val))  
> > 
> > This one still isn't right.
> > If val is a signed int with a negative value then it is sign extended
> > before being inverted.
> > 	val             (int)0x80000000
> > 	(u64)(val)   0xffffffff80000000
> > 	~(u64)(val)  0x000000007fffffff
> > Something like ~(u64)((val) + 0u) will DTRT.  
> 
> As above, where have you got that idea from?
> 
> AFAICT, a smaller signed type *should* be sign extended, and that must
> happen before bitwise negation, since that bitwise negation is to cancel
> out the NOT part of the ANDNOT operation.
>  
> Think:
> 
>     'pcp'                    is (u64) 0x0123456789abcdef
>     'val'                    is (int) 0x800000000
>     '(u64)(val)'             is (u64) 0xffffffff80000000
>     'pcp & (u64)(val)'       is (u64) 0x0123456780000000
> 
>     '~(u64)(val)'            is (u64) 0x000000007fffffff
>     'pcp ANDNOT ~(u64)(val)' is (u64) 0x0123456780000000

The problem tends to arise with (u8)128 << 24 which is signed even
though that is never intended.

To my mind sign extension prior to and/or operations is almost
certainly unexpected.

	David

