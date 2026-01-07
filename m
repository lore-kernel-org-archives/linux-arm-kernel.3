Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168DBCF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yQRPN2bRGk3Fc8VecQayp5kHElaztK+y5PRLikB7fk=; b=qqBuxFYKNf0c9Rz1Hhb/juAzTo
	p1MNe5PDOktVw9v2mEa9dZhs/xV85/exRLn38wqGJPk2HHKnhVAJhiijRv4MEAx2NwZCGiOK5Eb4+
	0xN/7SAcTlDoQ+l16GC0hUth1zIju6QaFwc1lxtMAJFhRb009Ahw21vNAlbZ4T7Is+ugsg6H6jiCu
	I5LDloCOVr4XrEf4HwcDyT/WoMdiiDPQ2HyM0zqzYy4eD5yeVtHdWwRzQJTjALBrfFhpCRVUGK+UY
	VATRnoNjmNh4ur4e1oVG1BO2rij8FDIS/eDpAJx5kEHrEOh7M7Y30+tkkQ4wl2TYwpE58UUVz54Rz
	wQGh+gOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJaV-0000000E5rv-0y7M;
	Wed, 07 Jan 2026 02:47:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJaS-0000000E5qR-0WnM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 02:47:53 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso1196666a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 18:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767754071; x=1768358871; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yQRPN2bRGk3Fc8VecQayp5kHElaztK+y5PRLikB7fk=;
        b=fV57hfcj5HTvhMqubhiDPvL/EJm6ojrUdAGwQR+bTd34SXcyIkihFXunxSMVXCLEex
         ObB2aQxi0K0JiRr8Af4vk3al6Ce8+s03N4vAy6llKuAjms10C30bD2MelrliWNNkrtEu
         PCXPQXFbDMpeFPoxXIkAv4UqfZ4lVsGfzZsGmZWwxcS4Z2HHUhxtjjlUnXQD0GmslNP4
         X6qU8zm4RWmY2Nb/pGHtDbSHkhVvoO3TQLwoAZGBBpXEOwQwWtl4MGKA87PQe6bUtYi0
         D1mUakCwjb5WtxJRaNArWZPiDkCT1Q4NDxy+CEo1njf8gZXVVnUxvaUHu4rJ+jN2+QtM
         Qfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767754071; x=1768358871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yQRPN2bRGk3Fc8VecQayp5kHElaztK+y5PRLikB7fk=;
        b=MKsf2/vD7INh6jHUiAIK/VYwhPTFGygOVTNK7DXbhjRxA8FJ5Ht7FnhHKMGzp2PaZR
         JUbzVTgl4m5D85SJn+6h1g9FzDIrNUquKFtsj+L2sA4HsBdtzQteS8TRDnsp365dgoD2
         L2Mvk7JJMmhO0UHFMy6YOBoTBAWeR2iGweFcSMer8T4JjLG0xfzW78COIhp1s7tZ5Snq
         /zmKIaBJ9UXXg8m0vZFNjWRzV/SFHfp0Ic/Gs5hTurFlP3JxR4lc9AINe+rV2AQDS5mX
         6wMoYujYb0Fxqt4+/8pZE59nxYcpZVlFHMwg1ZbIIZHET9y0wNHRRw4j+Wrlsm1YNbDk
         IiSA==
X-Forwarded-Encrypted: i=1; AJvYcCUfgK1eTX58ag3WcVpSGvzU7ko4bOIonsd2O0BetWZBW7/GgGBe5OJAs8cnztSeb2AJR48VLtpTD5ckSgILEhol@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0l8IcSkbWme4UEmXQxg57HVlW2+IXcQSvaOWPhJFpx4RCphgb
	F8FM2flh7oc/aGKMzMLoXGXv/HDtg8lL2zxesxwMtWlsPgbQPvI5rY96rbm9wwai
X-Gm-Gg: AY/fxX46thxMv6liw8YcyGc8cFhTItsIwUVTVHnFtnRFr20w38v7pQe2Z8KKwUdum72
	nYAlOQ4GMfgOWYU/f7P++SnJo7NcSKSdXiUNJGAFNBMD3GAZHA0Wzj0mnJLTRYSuFxL2L/+f1tr
	hza2ajY5xQg4x5xF2FNuxTx92NsBtb7X0urXvoFQGwKo3+u+UBUwOYYrv+zE56QPFv5TBxVV7nT
	ovRVgh/ldWnGQh7fhEVdDBfT8Osn+ziM2CZEOiSaC3SDbfANmHdh7guln8cAEws/dLlcZ3pUUt7
	UXON4aUKKqHWoar42GmCySF6M2xPgkYgy+Fx0ZgAbIXw0uUHDBRSgXLQKkrYQJ9iKWjray33rnx
	CaLtAj2KPl8CIIrA22gw20hrq9XEkaY+b4ShqDpkyHy8SPlRJfh2bLyw+YlxYIKdANWScPcWqZd
	L3EzTOsBXSjhumdm3GuZZSRtBD1GpMCdQivnOixW2fkJNYEWH3PAjeIc9J9nQJ42KaFydqBZT9T
	xXnQOdMk3cMMLY=
X-Google-Smtp-Source: AGHT+IG5ln7HBmFkYUtgtCJWbHsit4QUg+m7/QlpcPikX3dXSHbBBf5OWyElnQmQUiI/+hz/5+QSXw==
X-Received: by 2002:a05:6214:590f:b0:890:2df9:c6a3 with SMTP id 6a1803df08f44-890842a264bmr12754276d6.50.1767748105800;
        Tue, 06 Jan 2026 17:08:25 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772346f8sm24105326d6.35.2026.01.06.17.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 17:08:25 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 81DA5F40068;
	Tue,  6 Jan 2026 20:08:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 06 Jan 2026 20:08:24 -0500
X-ME-Sender: <xms:CLJdad6yFd4A4SYS7HRq3AX_2t4vwARcYtnzkYULI0Q6RZEWrXA5dw>
    <xme:CLJdaW2yxe8cFxXbBevKWnpOTk5okqtJ488BEjNFkIZfsubfPBNLHedM91nuDnCpa
    _Lor5ns-hZIagmtrBODTYqyOYSlUr1AU-VfmEzVPUIMe0_VBC8A8eA>
X-ME-Received: <xmr:CLJdaXgDiFVsHGf2kB7EmEeO7fri4d-JS1CNBfT1yWhPp2V440ReWFp5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddujeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peefvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhhuhgssggrrhgusehnvh
    hiughirgdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrrd
    hhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhujhhithgrrdht
    ohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehlhihuuggvsehrvgguhh
    grthdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrg
    hrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:CLJdaRj6dhDVq8lxTc8HuDnERZb0ZcrKm75Ob5ByOTBCMMbT-xt8-w>
    <xmx:CLJdaTIi709hg2yhV8aB01YgGZ0-cshTZTMwVvNA6j5bcIDTXjSbWg>
    <xmx:CLJdaRhjE2LrxMqGD0j71yzr6022CSN7H5VH_V8JVg8dgxEh4cPfnw>
    <xmx:CLJdaXRCQvODOvo4irJon2oa1PJOB3MEAv3Bx2i8VY_lhxuGZqT5IQ>
    <xmx:CLJdaWY-ekMv9Tn3KnxmEGKAGEkIvGzwbd-tjpW-Bc2jbiPOwT55pxku>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 20:08:23 -0500 (EST)
Date: Wed, 7 Jan 2026 09:08:21 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, lyude@redhat.com,
	will@kernel.org, peterz@infradead.org, richard.henderson@linaro.org,
	mattst88@gmail.com, linmag7@gmail.com, catalin.marinas@arm.com,
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, mark.rutland@arm.com,
	frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de,
	jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk,
	brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
Message-ID: <aV2yBUW7W_dytCUG@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-4-702a10b85278@google.com>
 <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
 <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
 <20260106152300.7fec3847.gary@garyguo.net>
 <aV1XxWbXwkdM_AdA@google.com>
 <4f3f87ad-62f0-4557-8371-123a2306f573@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f3f87ad-62f0-4557-8371-123a2306f573@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_184752_166445_EED44008 
X-CRM114-Status: GOOD (  24.26  )
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

On Tue, Jan 06, 2026 at 04:47:35PM -0800, John Hubbard wrote:
> On 1/6/26 10:43 AM, Alice Ryhl wrote:
> > On Tue, Jan 06, 2026 at 03:23:00PM +0000, Gary Guo wrote:
> >> On Tue, 06 Jan 2026 13:37:34 +0100
> >> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >>
> >>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> >>>>
> >>>> Sorry, of course this should be:
> >>>>
> >>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> >>>> +{
> >>>> +	return hrtimer_get_expires(timer);
> >>>> +}
> >>>>  
> >>>
> >>> This is a potentially racy read. As far as I recall, we determined that
> >>> using read_once is the proper way to handle the situation.
> >>>
> >>> I do not think it makes a difference that the read is done by C code.
> >>
> >> If that's the case I think the C code should be fixed by inserting the
> >> READ_ONCE?
> > 
> > I maintain my position that if this is what you recommend C code does,
> > it's confusing to not make the same recommendation for Rust abstractions
> > to the same thing.
> > 
> > After all, nothing is stopping you from calling atomic_read() in C too.
> > 
> 
> Hi Alice and everyone!
> 
> I'm having trouble fully understanding the latest reply, so maybe what
> I'm saying is actually what you just said.
> 
> Anyway, we should use READ_ONCE in both the C and Rust code. Relying
> on the compiler for that is no longer OK. We shouldn't be shy about
> fixing the C side (not that I think you have been, so far!).
> 

Agreed on most of it, except that we should be more explicit in Rust,
by using atomic_load[1] instead of READ_ONCE().

[1]: https://lore.kernel.org/rust-for-linux/aV0FxCRzXFrNLZik@tardis-2.local/

Regards,
Boqun

> thanks,
> -- 
> John Hubbard
> 

