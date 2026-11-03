Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471DB606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2krQds0;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CZsXOHdq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8gprV7xy1a71HLe2DJEJ0Eloi4n12O+LyzqN8PR9KuU=; b=F2krQds0ESM2FS
	8xTa43zu7ZlAqrFIDDirCitAvAkVs2auFkLIC6PrPSlHQvGxtN++4C7cmZiEEJf54JAwPf3CvBkRN
	Tv0AYWcGFikqzoaeQ4ts+pA+d8Mfo/lYIt5VSxr6kDEva0dvE701DivuudiU6/gt1TiRm/mWgbFsq
	yKOnVy9s63yTTgRXFWUTgvwOxPKoRJ/zDHOL0G5/yzZUirW/T7lTkUIKv0pNfTmOH077MLOf6kNlS
	BEKFtayejImKBKHfGbfm1prl2YYLUxu4R5S7fdVymyfIWDkS43gFRTwhOD75qfIhDb20bAW0H1Cbc
	FfUzACAxYnYeFcvOAs+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIlY-00000003Lcb-1GcQ;
	Tue, 03 Nov 2026 17:57:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIlV-00000003Lbq-3gW9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:57:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a20d7a8984so52985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 09:57:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728664; cv=none;
        d=google.com; s=arc-20260327;
        b=RqF/NCGsLg8amjji4aZ+EfzO+C21zodTNhtOrBeqyftQXPVVTCcxRUX91YVM+mzZ55
         sxzYKxnCVYQ4XvkL+sRd1YNRHgcx38Vl0Drll6w2bpNUL8q9h/wKBDUBv/86P1cog4uG
         xnOUkn8EF9JJjB01DqyfI6ERj8jc5pIFmWEcf9GTCGLIqL9VGWcz6y2vTHhwTDEZ1WwP
         pS3/t9U3ywo6La8xpUsHuMD9cP5h6rtTR5mhIQ6LHqYLthOW8lLigup5z99iUZc1R9no
         03ft5jyOdcFE8aWq1L1No+VKHGJCpIJgjdTrsv0ltwOOmGgMI7c8ZkMIOsdj1Na3x5CX
         SaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gprV7xy1a71HLe2DJEJ0Eloi4n12O+LyzqN8PR9KuU=;
        fh=WFvD7WXiltJtECydWcLudiP+Jd3jiwmKTZCrVjoAkNY=;
        b=rcObG4+cb+AEqNkMjBqKplUEcLDXo89MIBe5BxG5fBOUy8MAN+0P0XbRDgt3wfmGZz
         jiYGIuDcMIQypaNG2ZQR1JsHIYNrSDteLrai4/pzsjo6GwWK3NfCcMZ27wQkDUlVF1yR
         XuOoLxcxLm+K8fxKelJJZPsHa4NJTWE359KySf6uU/8vpv2upauzL0ZKYdW9KNuf/oRA
         R3Z6SD6TMdOhzPYhVEffdwuFbY+UndICD9LaZHSy+MMxHhbMyPlOhwUJ01VxfC83+oqN
         dSD/d23q7Fdx/VGiGMDuTbbQAnlVQjCk5m8Rk0z5CLAyqpls5ifbKxZBwpeotQMyaCaW
         0rQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793728664; x=1794333464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gprV7xy1a71HLe2DJEJ0Eloi4n12O+LyzqN8PR9KuU=;
        b=CZsXOHdqOGYZKQ7Y5BWW/PtC/eoARuIVuXjqR37NpZ7DSE0zOgD5BcgkBDjm82EAcQ
         M9ut38bHo1eLctke0WgcCmnp0X4uxCOK8GlZ6YGWtkerDnyq7B/sAkhedb4ltOx3AVaW
         1CTwP2RgPg/BDtvEpy1xZ4RrcG1FrQiferS7oyZEiRzBRearysB074HvAQpF2aaSHc5x
         /oQ9UIdTkQP13Y1hDB8j7h9H2SjaYaxDNEKin+SpJFBt7AJftYR/dvv+Q5zwOyCT243a
         Wx+glEWn8Gx5L/YIpW4GJb4g4MNwQV5KIy0UosqLTJfntKqG4mPQFFYPftdPoa+Vb1BH
         xkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728664; x=1794333464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gprV7xy1a71HLe2DJEJ0Eloi4n12O+LyzqN8PR9KuU=;
        b=g+lhxblTO4OGFZow/cXsymUFvk3k6rpKH6YieffViDTHDcoOSguPymv2CDNF/dCiZl
         8IJqyM32BVd/1KMSr3qkCnXYvbb2lVGH0QPJWkoG4Dqc2AmXiPpciTOAKEZ2Ud2vddg9
         ClrjCCgw1gsQKIivBkSVrqR876BFHTt4/Ywhrrmld0XsB48evOjhxxI4kZGi02QWIL9g
         JLT0Rm+6UnN+eHJNG3SLjyA4ND0MUsjDdzpXQcufnG4R2Tit0LcPpzMBqpCuEeiKd3R7
         B6RUMpz48w0oIQNKpNtSNgiB697ldRnon0YzoAB5F+4filM3ycFHccOq7pfxo1fJUZ27
         LfjA==
X-Forwarded-Encrypted: i=1; AKwUvBy0X9oX7XreUQPMHYhVUlcEgVuKYyKHU9ULWEc55dX7tnjpU3t5h0D1xPvGRR96j4TiyZ0eMvdIBp91b8lp6oab@lists.infradead.org
X-Gm-Message-State: APuU4Z+LjfIxnyWmInzjqGFMPS2mDJgTpJWlNe8DJTeY2HR1pAvmlP/I
	KOk1xidoaLE35diFL3bjXSJKJgkUBAfmvTvokvLEoDL8o4AY4Yh21Q6bKOdxRDDgvK/B5W91yyS
	eFaYdh7rM01xGBRd4A6I//XoV6Du4TjjH8icsPr7z
X-Gm-Gg: AYBFou1dc8+HZu9XK3L4IMFHVEv1GvDoYZnLPGAW22U3cy0ovPMa/rP9md3JH8djlkp
	LQnzyZSyGqa85vtjz68mYyBO/ItHRGGxB93o6BWEVLm96zoHjhs34tj/Ry+BsZ1koPbfNPYund9
	Q/qYWsR/C343L4vk9l03D+oue4QFqui0iZ6tpykv/l+o70f2gq70MGk9xDN73aFXaIXImnr1PPz
	/TusaXw/VP1Vuixb9+bMaG07UPZopsxMd01XjUVjPqWnrznDI95SbGOUgvs7uO9aizYzjmR4csx
	zPdU8+ejTCzFsohhAdRfyC3E9rXbyXYOd9Q0v+5pK5GIwa8twrOczNfSjyCRqIxuredP5WhKxxU
	5rSO4v3EPH+z1dlVtXmJViJdBtsMqJ2AI5Qgo88VkLvvtWCT7VJAs1CcC5YCrpaagwi42lV52ZY
	1PHxe/TkddHq1g1eh7ZxGT
X-Received: by 2002:a7b:ce01:0:b0:4a1:d75a:8b4 with SMTP id
 5b1f17b1804b1-4b2e3c650b1mr815155e9.12.1793728663404; Tue, 03 Nov 2026
 09:57:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102234813.1069156-1-wvw@google.com> <8f1ccb65-e4a2-450b-944c-9883ff12bc37@sirena.org.uk>
In-Reply-To: <8f1ccb65-e4a2-450b-944c-9883ff12bc37@sirena.org.uk>
From: Wei Wang <wvw@google.com>
Date: Tue, 3 Nov 2026 09:57:31 -0800
X-Gm-Features: AclHuK8vz5vkqxj17UdSeFCslNabswTrlQCvg-mwh5UYxKg3Wjf31NJ5q0jNNus
Message-ID: <CAGXk5yr4LqdguVMBeXP=pkraY7rbQWMePWs0Dq4tbGE-dCLe=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	wei.vince.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_095745_938826_FB9B58B3 
X-CRM114-Status: GOOD (  15.31  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 5:56=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Nov 02, 2026 at 11:48:13PM +0000, Wei Wang wrote:
>
> > On systems with FEAT_SME, TPIDR2_EL0 is part of userspace thread state:
> > the AAPCS64 SME ABI uses it as the ZA lazy-save pointer, and the kernel
> > context-switches it eagerly in tls_thread_switch(). While a task is
> > running, the live register is the only copy of its value.
>
> Thanks for catching this:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>
>

Thanks!

> but I think we're missing some other registers, I made the same mistake
> for GCS with GCSPR_EL0 and GCSCRE0_EL1 and I'm not seeing where POR_EL0
> is handled either but possibly it's somewhere I didn't spot.  I can look
> into those incrementally once this gets applied (or if you do a v2 and
> roll them in that'd also be great!).

I think you're right. As far as I can see, these are only switched in
process.c and nothing touches them
in the suspend path. Unfortunately the hardware I am testing doesn't
implement GCS or POE per cpuinfo,
so I couldn't test changes there. I'd rather keep this one minimal for
stable and leave those as a follow-up.

