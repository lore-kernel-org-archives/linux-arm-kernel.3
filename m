Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58647606A68D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eM/139gd;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VRoRaG7r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fb3Zd3ut8454HotwPwPAYB7YyRUaA3GgbhwCbjm8lMI=; b=eM/139gdxUpD10
	ScrHl9borfvAJ+yzrFaqpUcRLltI1L3LiGG8of6e4bAimY/wkD4F16j0fuHy/nloE8jY8PaMvMEEI
	Bgl2QXxBBBLLgHDCogYS6+Lt3kKrHmLlGm3ukJArEMdW3QmffKzEFkH2jzGDmFTdckUeh85EurStR
	LzZXPNsMRAYVhJZLSfI/ai0y+qyN3YLJs7OvufOCj9omFjEjb/Uva8mOXCzyD8CcZ12Vcsm0DGUVv
	Llir5gg8klvePO78kjz5jJyTS8MXKyqJnzv8IE7PhZ6F8CK2NY6pHhYkkUqQwHYXRctjoncu7MKMF
	P/5TzaDHgfD2I66ze48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfEb-00000006Klv-0RY1;
	Wed, 04 Nov 2026 17:57:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfEX-00000006Kk3-3u2q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793815031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb3Zd3ut8454HotwPwPAYB7YyRUaA3GgbhwCbjm8lMI=;
	b=VRoRaG7rtKfYwQkZSkYr52cmYppxXIOqVJOZysx+UhyEXSlPg8aQm8Nm/CjuhDAYHa4Vdj
	dFiMODZ38FrHcpvCVnFoxe+JYks/WAFNmL+FDGEmKEmcPFU4T1Z4OUgv6BBr710dHTIUbn
	vHO2MJYLNlVtATUhuSPT9pxU6wPOxaE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-L5cWp7zlNceN5ViIyM62zw-1; Wed, 04 Nov 2026 12:57:07 -0500
X-MC-Unique: L5cWp7zlNceN5ViIyM62zw-1
X-Mimecast-MFC-AGG-ID: L5cWp7zlNceN5ViIyM62zw_1793815026
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ab23d7c824so1277471fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 09:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815026; x=1794419826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fb3Zd3ut8454HotwPwPAYB7YyRUaA3GgbhwCbjm8lMI=;
        b=sZKW1oBGyAMJVRMBw21O+37XIJUYFRutPESgT0wmIbr8fGY6nnsXhYWtaMA5QFT9Tc
         H5PvTpdlg1QEkfT6M2faMgH3M71KIx3rWcAGj8JAQiM0Wm4IspqRYtazQmrEfw9BObRA
         n/Q5UPFA7FefaVasaG5mZthbn5agAGy74EbGSIF8C7gs0TnFWkV3XIMW0xtzutwI6A3E
         3IohAVZ0RHtm0C/LiNIhc+dK91cylSCF4aYx/l7B3ek4sVuMrCeNXDAaJDR6XnETUZjy
         ryyGyHkrxe7E7Ctk0MDj37UCymCcpMsxNnRjSsKJnyrm36PryGd5q87LuXng1eUdhbnc
         aqzw==
X-Forwarded-Encrypted: i=1; AKwUvBzyeD46WirkKfJaI34Igzv3QKK56PJQg+ebJJO5qBd7ZLdRvbc+PuTGGZUX9WByrgTZTnMSLwsm46CVMGCIEDEQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/4Vlfd5ATI+zG/mA2jSslKw3lv2gP7UF2A/3tVnnGIa+Ftj2cj
	N+s7sIOSCC7VyZwhBeY+++I8nPUlyL8d2d+jVd0A/fe+AzDXgd+I6+YPGI6aCI84tdB5T12t1wO
	XD33Qv+7hhZr4j5rkBh9L4iEP8ZjN9pZQNXLUVAu2jEWAnO4rbOXaEzmLImqdyDWoG7QtmS0JKU
	/7Rd1+0J133ZQ3/ofplbSJmUgPuKcJjFIqkelKuoNF9KLkyudaTCY=
X-Gm-Gg: AYBFou3HkYMsEMLJXH4hTCELYYBK1kuXJiS47nRT3rdIplGIIYdfY2zRB7CNOcWJPSb
	nMfT/+lUSZf+gRhQEmH0CP8Wbke4G0+PI8JriQZzxLfajDIoEaS/0hXzBA9nPzqNuQY8taJJc2M
	B4xzk3cYY9mLNHxIOpX9dvJooBhy1quMS+L2+Y8SEJUcsB1cAwI5PYjIlR
X-Received: by 2002:a2e:97c9:0:b0:3ac:ddd5:55ee with SMTP id 38308e7fff4ca-3acddd55907mr4690941fa.2.1793815026172;
        Wed, 04 Nov 2026 09:57:06 -0800 (PST)
X-Received: by 2002:a2e:97c9:0:b0:3ac:ddd5:55ee with SMTP id
 38308e7fff4ca-3acddd55907mr4690781fa.2.1793815025627; Wed, 04 Nov 2026
 09:57:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com> <20261103154246.S-8NqN99@linutronix.de>
In-Reply-To: <20261103154246.S-8NqN99@linutronix.de>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 4 Nov 2026 18:56:53 +0100
X-Gm-Features: AclHuK931Qz4UJ3O8Has-FEwEeK34WYcv8yPrDJgYS60eLd8ID20u55CvxuZARw
Message-ID: <CALE0LRsLS9Hsr_vUZ7k6YA4DJB6Su=E9r-F-btpyOXSvv6cMZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix NXP STM clockevent bugs causing lockups
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 877ybMqWQNvqJcLdtdxnt7Gz1apqHJdPRXPDAXCUtss_1793815026
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_095714_048342_A8F347F1 
X-CRM114-Status: GOOD (  23.18  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sebastian,

Thank you for the review.

On Tue, Nov 3, 2026 at 4:42=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-11-02 22:16:19 [+0100], Enric Balletbo i Serra wrote:
> > This series fixes three bugs in the NXP STM clocksource driver that can
> > cause soft lockups and missed timer events, particularly visible on
> > PREEMPT_RT kernels running on S32G platforms.
> >
> > The NXP STM generates an interrupt only on exact match between the
> > counter and comparator registers. If the counter passes the programmed
> > value, the match is missed and the hardware must count through all 2^32
> > ticks (~32.2s at 133 MHz) before firing, causing soft lockups.
> >
> > Patch 1 fixes max_delta: on 64-bit platforms, ULONG_MAX exceeds the
> > hardware's 32-bit compare register width, making it possible to program
> > an unreachable compare value.
>
> This looks fine
>
> > Patch 2 fixes the overshoot detection in set_next_event: the existing
> > check only detected counter wraps, not the normal case where the counte=
r
> > advances past the programmed value during the read-modify-write window.
> > Replace it with a signed comparison following the pattern used by
> > timer-imx-gpt.
>
> okay=E2=80=A6
>
> > Patch 3 increases min_delta from 2us to 20us: under bus contention on
> > PREEMPT_RT, 2us is not enough margin and the counter frequently
> > overshoots the programmed value, triggering repeated -ETIME retries.
>
> This all sounds like the hpet trouble on x86. I'm not sure what heavy
> busy contention means and why the device is enabled/ disable during
> setting. I would assume that the programmed value hits the HW after the
> wrap so you wait until the counter wraps again for the equal match.
> Worst case would be you read back the expected value but the HW sees it
> later (after the wrap).
> hpet_clkevt_set_next_event() does in principle the same check as you in
> #2 except it compares against the "min" value instead <=3D0.
> Would this make sense?
>

Yes, it does make sense. I will look at the pattern used in hpet and
send a new version.

Thanks,
  Enric

> Sebastian
>


