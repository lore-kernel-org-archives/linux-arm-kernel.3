Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F91606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 22:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SV0nW+Y5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d2TyUmbn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9nvo0dYAQsPs8WnHZoy9/22ZqY9nCZeAyTVnl3n0P0=; b=SV0nW+Y5JasmRI
	RB2/5wGd3jRWFPnXS2bUMMOqbGYmWRLwSu/CK4tCgOOjNZZ+KBnvCkRNF8ccuS+/rkkJzOtOVMrHt
	sksa/2pFlcE51ttegh8rdY37z4INRAhQAsgY4xHm9Nm2gHK91K3YcuvcX6U1augbJoro1NRF8Fpv6
	WemCIKEUhP6Nwscfy+JWGi6vf9DNfOaqP8dGuO7/kXobgHenn+kXeDluoXvosm2G6EzCVkjqhu2NC
	LiVe2WRSs3T9Gvv0GXLGhLP14q9k1zGj45pmb+lNpd6wtNFkwJsAhT6x8nfcgu5xKpBUv8GvHHiXd
	dRpM4EzEvlrckBRItfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1H7-0000000F4s8-11Uh;
	Thu, 22 Oct 2026 22:28:41 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1H5-0000000F4rf-1Cpm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 22:28:40 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so118771137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 15:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792708118; x=1793312918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9nvo0dYAQsPs8WnHZoy9/22ZqY9nCZeAyTVnl3n0P0=;
        b=d2TyUmbnHXe629H+LL1fXsdwIr6oKfCVEQhxn55LPlP5It245GwWWD3p7e46CvKlpn
         JpIp213spfLsP/1I1YPW2JNVNA406NjrQ0MjaSdH0w2+3IqtY3mm65OPZyOkH4eQRnl0
         sZ7F8qcoyyVlVhOgyy8/HQmHg9C6l4I30OH/Q03pGz/xEtNz356PZCfWMPhzDfibIYnk
         pVVq409CcHt/s1zd4p8OX5DrL3q6POiX1/QSfi3dMJiVwIIOUoqACtmp1ZaXX2KKxcho
         LrxBDRnDL3ufnZadvhpif4uyzpEQ/R1Y58HCiQqh+xX+Ye018gnzlj5eVBrzfNxiWn90
         tb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708118; x=1793312918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9nvo0dYAQsPs8WnHZoy9/22ZqY9nCZeAyTVnl3n0P0=;
        b=rPr8qqdvwDIO+ObsCkbV9Ts4IQLhHzdBHTL+L8P3i6wchAIjF0pguKoaAJ/XmhFLfF
         plpj5f97dDJm3Hkn4q7U3ew5hfKf+mqcJCam49yUNsEKZNNAavPJpF44TWkAf4MttsaK
         D3WDTTxnkrrVYc/uL/3NI0M9ZNw+/azjecMCaWWP+dP9Ou3cSwXUvxiUtVwgVBJmhg+P
         5fg5Z1eZxAnBfhw5gw9NiYdzqfr2fuu9rTr8SpJGtCZQ0XO99IM56Sl4YEyK5TJLjPRR
         fRHm/9jSjXC5g/du0P23DyOcHRkg3IZ5lQXIL1mAorp3ap+VvYzeedelqKxzSzy4U2Sj
         kuCg==
X-Forwarded-Encrypted: i=1; AKwUvBzNVXWTie2700Om3+85V8e6qwrf8R6nfNEyrsotRt03mr9lT6iGz2VjwQmNuPXVzJNgtXhs9l462ADQKgm8lAyd@lists.infradead.org
X-Gm-Message-State: AFq9FYKJ+RxSdreLGyjBWOFPnsHfMFuU/m1/JZjsSkbWBXcraYQRHkBS
	ld2DD/lWBYkS5BjZTbHihO5Sv30k0InSggQrBRhF1uNH7ycvOUTT/qNZaMoxV5fG
X-Gm-Gg: AYBFou1ZhpnQLpTiXpHwFMDt1ibiYG0mTYhAFpTBPBvqbMFyagfQl7pxq8uhuY8qcW+
	P7ydopIz15nCOR1LRMLaC6As3k+OPkQ+FRMH2K9NCYT9Sunmzg8LIFo2cH6xXFUHOJvVyEzjU1n
	n8kxBzsbSP7W12YcUNxxAAmJJ0PwAgOo7RA536ONHxF2qB/WiiknAnSpD4i+nbm6sNLfk2Wi6DC
	yEI15kBPtCYzGVT724quG+z34qhJAGftrc69+bdDkFW8mrHeRLKV+IZyvtvIC7d+VAp75G5eXqe
	f2T8+lefwN1kyCwIQnPsTjZGz1Db/kaHnWPM4SPcH+a/eoRHYuqeMmoZw4XWXs3FzrADiI40BHP
	FuV/zjoZkvdWWk08+5fiLJp12qfEcfJgcjMxukhPXm+9UHc+xo8eM/5QqYiGcr2Qx5IxBeH/Fra
	5mMjRnjmJiG6XAd3e149gQT0kCqHRqMP3y0716jnygkErUtzqn6KSICG99vjv1PY6zw98wna3MJ
	BKrhenhNoLc5L5guQETr8bi0UhG+ntXxcuk1W62BljEO7YcGkSgly4vGs6u+/gaVoy+kRH8rU6p
	QLsGWDrYxAV9JXwMfMOG
X-Received: by 2002:a05:6102:290e:b0:7c3:1213:1e2b with SMTP id ada2fe7eead31-7ccc337cf94mr314700137.18.1792708117775;
        Thu, 22 Oct 2026 15:28:37 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f2cfe0sm481582e0c.14.2026.10.22.15.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:28:37 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux@armlinux.org.uk,
	Bart Van Assche <bvanassche@acm.org>,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 19:28:19 -0300
Message-ID: <20261022222819.92507-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87wlr9z8iq.fsf@trenco.lwn.net>
References: <20261022183658.58090-1-breno3011alves@gmail.com> <20261022185224.60700-1-breno3011alves@gmail.com> <20261022185224.60700-2-breno3011alves@gmail.com> <871p9h1kc7.fsf@trenco.lwn.net> <87wlr9z8iq.fsf@trenco.lwn.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_152839_387642_7630BA42 
X-CRM114-Status: GOOD (  16.22  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jonathan,

You are right, and I should have been clearer about the motivation.

The reason this patch exists is that the original assembly has a latent
bug: for odd transfer lengths, it drops the final byte.  The C version
fixes that, and the odd-length case is now exercised by the userspace
unit test.  But that bug cannot be triggered by any current caller, so
even the bug-fix justification is weak - it is a fix for a path that
nothing currently exercises, in a driver for hardware almost nobody
still has.

You are also right about the broader point: "assembly to C" on its own
is not a justification.  The kernel's assembly is there for reasons, and
translating it for its own sake is churn that reviewers have to pay for.
I have been approaching this as a translation exercise, and that is not
the right frame.  I will not propose further conversions of that kind
without a concrete functional benefit - something that fixes a bug that
can actually be hit, or enables a change that cannot be done in assembly.

Bart's Reviewed-by: stands on the technical merits of the change as a
change (the C code is equivalent to the assembly for even lengths and
correct for odd ones).  Your concern is a different question - whether
the change should exist at all.  Both are valid, and the decision
belongs to the SCSI maintainers, not to me.

If the consensus is that this patch is not worth the churn, I am happy
to withdraw it.  I would rather withdraw it than have it sit in the tree
as an example of exactly the kind of change you are warning against.

Thanks for the direct feedback - it is a useful correction to how I was
approaching this, and more valuable than the patch itself.

Breno

