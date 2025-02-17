Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8082EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbEfh1V/TCyzyVBnzOPjw0bmm27Qjtw3b9033vGjqT8=; b=pMW+eEgdBy7pklM4UxaZTzR2I2
	ey9lSb4K0C5NDILEa+4CYDsfZOLBh83ni7qybVJ2UrFIautgIoFk9FvrsJXhMNCqfpIMoOXRTfMzq
	ut4kZh/vU8UaM9HdFKoCykoqPNz//w4BnKwLw9RYk7Ky0mk2zjmiDMYrIQjrkCHXhxlgQWV0yX3Ob
	JOG/6cp0o5WNfwEfetYc7l4QenvxoqJN1ZLeTbGExNmcUfalrS0a0uslxL8rpPxiG/IKYKQ3sbAfj
	EJj/yD00mgIwPzyvsK46+NJd88d29qBLAv7kLGZjwyMz2IalJdl+867kJ5bgVWT7a6c/XYoYUoan/
	5/CN0rfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6NQ-00000005h5k-0cvw;
	Mon, 17 Feb 2025 19:01:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6Lw-00000005gnj-0mNU;
	Mon, 17 Feb 2025 19:00:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so3521095e9.0;
        Mon, 17 Feb 2025 11:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739818822; x=1740423622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbEfh1V/TCyzyVBnzOPjw0bmm27Qjtw3b9033vGjqT8=;
        b=DSELSRsGXZvfXblulTuQ9TX2zYCRXjc6T6P36XbbkSoflm7PuKKdVmaqOTC9cohv1g
         92Al3zJnNupTHd0Khr1afkdJQ+fpNmnNGvL1bbVStYTSaY/JVaHA+zRmlvTWxaekmY/z
         8QpcWTfWWHL+95wlEHWsE9f0ARBm34BWo/gqcc6HHRYFnpi+AxwREAXLyYR5zXFvpfDq
         Hnx9naabq+zyMDe1G2fCA3yt3tPZBWJA36UDuLlvPWRLc5i6NlZAq10OrnPzRKPgdITl
         Q1qb1tnMRVVelChICvVhRA6/L9SjDuBCfCwxDXtLJOVT8qEqSmHlvdjdB/5cHfF4yKcZ
         Mi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739818822; x=1740423622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbEfh1V/TCyzyVBnzOPjw0bmm27Qjtw3b9033vGjqT8=;
        b=Sf/VVaPXX5pWl+TUNqrS+fz616IH2mVW3gUFhEJlHyg0cAAuP/7M+yxNy5Latgqy3a
         7mv7DQQZVSpxyV0BzJrritsVXdWtOsCkvh1f1Gtt7/74QSBvvH/luwHVHhIuIS/6SC1v
         dt3DokQJrEWXipxlk6tM6sYe7ynZqUwCYfs0NW9Zqp46RTdnoyIlC8Z4FV0NUncnEEF2
         o5zN9a+7jQJLiJlLhS4Q/qgK1HR9IcYDRRHMaD8O0JPaKAlVYhHgze7tKwchmpgAgTxw
         c6VxZytXUpJH4X3pYI5vu2CXDgGxlyjMSAXNzbBMbgxE4JeLLd7424m5LwliVQbJVqBG
         +dvw==
X-Forwarded-Encrypted: i=1; AJvYcCU7jOR1Bqf0eBSZv7eiDi75e/hhBZeh901fsmEdb8Vou4sAKeT6i4pHB0QoKCwePHAgnbD513NdA7kFM94=@lists.infradead.org, AJvYcCXejj8CFj4bHIvK7mQaHEcyTWV/ThrM0Gt+1mT+30PsHeSnnrF5NJdOsRuQw/kzjviCvWDORDKAEHVJYVSuE5Fz@lists.infradead.org
X-Gm-Message-State: AOJu0YwACgD4E0vWDXB3g7UJtPZhWfwaralxzKfZBpYtEAkVzcDJgtCo
	etcjfzClvoWS8DL2z7xL6qqgYO9NMUc1O80fxd7Xyduu9ZbRluV34fqX5tmyfRSCQ0THuu7LkG1
	n464zZCU162T6Swq2CSE8iSGs88I=
X-Gm-Gg: ASbGncs1GBKTk/ec2J5vWb5qY8Nvvx8rxX4g13aoWvyV7h7770rG/85Kg8cuw/w3Qsx
	BjJ2qcwn+1qeAN/7Hu60Q1SW+6uBJuOMjdQcB6kxwvPL2QgFFVPK5xFSEd4KxQ85n1LyN7CaEU6
	U=
X-Google-Smtp-Source: AGHT+IHcNajZe0ENO6NqqO6ktnv6S1yT2v8yKjsxjfUHFFdU9DGQ1lgEBrKS4eB3xN2pkGDfNvSOKZpFCcjlLy+KwRc=
X-Received: by 2002:a5d:6d81:0:b0:38f:2c10:da1e with SMTP id
 ffacd0b85a97d-38f33c288cfmr8157628f8f.27.1739818822023; Mon, 17 Feb 2025
 11:00:22 -0800 (PST)
MIME-Version: 1.0
References: <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
 <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
 <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
 <sjownmnyf4ygi5rtbedan6oauzvyk2d7xcummo5rykiryrpcrt@kasomz5imkkm>
 <tuwambkzk6ca5mpni7ev5hvr47dkbk6ru3vikplx67hyvqj2sw@rugqv7vhikxb>
 <CA+fCnZcHnWr0++8omB5ju8E3uSK+s+JOFZ3=UqgtVEcBzrm2Lg@mail.gmail.com> <kmibbbrtlwds6td64hloau7pf3smqth4wff33soebvujohsvli@kni5dtvpwsxf>
In-Reply-To: <kmibbbrtlwds6td64hloau7pf3smqth4wff33soebvujohsvli@kni5dtvpwsxf>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 17 Feb 2025 20:00:10 +0100
X-Gm-Features: AWEUYZlRIhjmXsKyPCZOszIx8_jhLBbTZLCGYgAeVzNSeJCRFZ5-FeRBt2Jwp0w
Message-ID: <CA+fCnZfBsQd=nJVu7QOX09w6uR5LK1Gc5UqiHS8aCxzhDJsssA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_110024_223412_8565045B 
X-CRM114-Status: GOOD (  15.45  )
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

On Mon, Feb 17, 2025 at 7:38=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >I'm a bit lost with these calculations at this point. Please send the
> >full patch, including the new values for KASAN_SHADOW_OFFSET (do I
> >understand correctly that you want to change them?). It'll be easier
> >to look at the code.
>
> Sorry, this thread became a little bit confusing. No, I think the
> KASAN_SHADOW_OFFSET values are fine. I just wanted to embrace the idea of
> overflow for the purpose of the check in kasan_non_canonical_hook().
>
> But I'll put down my train of thought about the overflow + calculations i=
n the
> patch message.
>
> >
> >Feel free to send this patch separately from the rest of the series,
> >so that we can finalize it first.
>
> I have the x86 tag-based series basically ready (just need to re-read it)=
 so I
> think I can send it as whole with this patch and 3 others from this serie=
s.

Sounds good!

