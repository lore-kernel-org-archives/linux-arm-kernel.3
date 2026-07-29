Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65E2C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 21:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=An3JzZeshZc1Fa35pmrkEuoUxcWgUoTFrN6jXuA4oC4=; b=fpo6KEMOaWnYYtac2Dze7YxjKV
	OKH5ZjihnaB0S8q9IfrUE+gceRUR2NW1PWpkaEexdufiLkjwOfeePBl2YpNFBgHarZOMpCtH+8Ohi
	utN+TkAZr0NjYVxSGkqUqH/7ZP4JLJm5FpA933hYnn871FLUHckdJugt2Ei4Hl2d7IX6vw5sv4eb+
	LCGfLhk6PT1yf4mGIifn+KCaiT0/NJ5mIgqB54sTvrVxdTJvA4dGPG/yzG7iHS2lE0nQwRF7JN2Gb
	0mEU5KrlIk8K3s4v0TQ5iZWad31HmWlAqSPPs1poWWfd3P7/d73Wj9dm+icAQUz0wTNStOjeJyFJ6
	D0KTtrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpByP-0000000911I-1ndr;
	Wed, 29 Jul 2026 21:37:57 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpByM-0000000910u-3snh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 21:37:56 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8efb708b1a0so9256896d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 14:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785361073; x=1785965873; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=An3JzZeshZc1Fa35pmrkEuoUxcWgUoTFrN6jXuA4oC4=;
        b=lKLT4QhVM+s3hkNB3ZEdk+AJFmLQkjB1Mbo4D1fUM3ZHFHp/IzgJmqgNPjBNLjacPs
         EnkvzZJsXBPmo53TIYUnv2HkF/01wLLFJoheuCZWGYwSeE5LHoY0pZNyKDAwoljB1ytd
         mZ+xtpYIPgc5WGvEUi2kWFqgoSsg0eNZQ0Gec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785361073; x=1785965873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=An3JzZeshZc1Fa35pmrkEuoUxcWgUoTFrN6jXuA4oC4=;
        b=FgbCJuAM5PEx8lik+QKF14YTL+6Bw9OJN+DAgH+KqML82MQ/A89ZnSNYWleV3+RZ0O
         zG2KWVtye2GK3mc4+/adl5eONZrfPVR10ORzTvUgJJElfBGGQUeN8ZT+Ns7hoh+Luxc9
         YtESLZcAh4BJiIiDC6D+7IjB+G4MnRwzvXRN8+svHgvoJYEgRKTChp7vUU04cRjHvzzD
         xOuTvSywnttSB48CZ1hSGp06G8Z3p8AqSy8SzIkAfdOMNRdYE3ww5J3+GSLCujy5NOBK
         Ftpii7DpqJoS3/nTiAcC49mh7Q/dCq/Lc6TqUoRPpOmp7jbrkywHYsbITOrf6Lf/H4CQ
         +WbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7rC8oEfdPleIrMTt4xG62K9rCdilXUbaso4O4E4XcElq0BuH0nGN63zKVoUGicA1jker1Q2uKYIHMRy6kiev1@lists.infradead.org
X-Gm-Message-State: AOJu0YwwGrDpyb48ER5hSy+U70i6x1iMjglGt8XcmFpKpHVPLAuPpn4G
	USC8s0KFFPyJrkMBVX+oNHlQcQ3v/xjUjxcMaosDaFPryXC18s3dJn7CtsXZcXMCXnuH+Cmt8aY
	zPbc=
X-Gm-Gg: AR+sD10IhxW3BHoGw/yGyH/gQkunF8zXwCJb8xwALF/isYf6nF2nCouACl0yqBRwJZD
	T6GISJHZrdJURIlnXMr3foZxrg6yyu2gTq8JRZij/Aus1X5q2ZRvwsJbq6D6vSoLzLht6UozAhs
	TfXm2giASoxH5yuCzYmt87uQZWX1MDV5x7CaMy8O5betC0DFbo0ts7XrfkfrbvVLbHuQDtuyaDZ
	mHKXt59DuUzky7SDdIyCkfYEmRgT4kjAa2KtovE8Fu6JMNdsfH/LKgqSNF1QAXzmF59LgeTWgOI
	cZXxWePcf93mp2a/i0qGQMz5ENdCJ32jp/VnFxbYrp0KttvPPPv5R64VxbBjpIKi03GqR5RQLIr
	sCPVk2YvWhigUWixZpzPczaKZSmLNEot2Um0PaON/E3mbtyaUVea/g44Bnrb29zw6K5UgQb/EqV
	Uf1TlLqJA7hl5omGXDInbl8Q428JVu3mlYKsrTuIrZsrs3YqAPYf+THlDP/h6thdVJHg9B1/OdQ
	KbpQ4pgx9alO9eAAY2Rv617hnx5
X-Received: by 2002:a05:6214:4989:b0:8f1:4bff:3a55 with SMTP id 6a1803df08f44-90830257f43mr8023656d6.38.1785361072614;
        Wed, 29 Jul 2026 14:37:52 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908323e7697sm455976d6.25.2026.07.29.14.37.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 14:37:50 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8f0d6853360so10133876d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 14:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqMFO7f0Yp0b3SjQp5WKDEQVd3zWtkkqCENfmvWgpdKM8Dzsrq+bRk86uIu/AEegHBDc1wZFVDwJpRXYwhoJ9zM@lists.infradead.org
X-Received: by 2002:a05:6214:194e:b0:8ea:10f8:ae87 with SMTP id
 6a1803df08f44-908301652admr8189126d6.11.1785361068683; Wed, 29 Jul 2026
 14:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782744912.git.kas@kernel.org> <ak_IRHwd02EjWMf8@thinkstation>
 <amYR5VWHWC1WdFXc@willie-the-truck> <amZRtS2Lu1epc0S4@thinkstation>
 <amiDoZdszC1pB6Z2@willie-the-truck> <amiayYZA2kBSTzFB@thinkstation>
In-Reply-To: <amiayYZA2kBSTzFB@thinkstation>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 29 Jul 2026 14:37:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UN8+Yydm1G-afbaAfh2ZF7MzEE27UXoDOG0HFB0cwyXg@mail.gmail.com>
X-Gm-Features: AUfX_mxQN96FUqkYM85HsMzl_ulE8Md6LA-9M6sqY7EHnB4PXM5UtB67IbHenI0
Message-ID: <CAD=FV=UN8+Yydm1G-afbaAfh2ZF7MzEE27UXoDOG0HFB0cwyXg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] arm64: cross-CPU NMI via SDEI
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_143755_010792_EA38BF35 
X-CRM114-Status: GOOD (  12.03  )
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

Hi,

On Tue, Jul 28, 2026 at 5:18=E2=80=AFAM Kiryl Shutsemau <kas@kernel.org> wr=
ote:
>
> The piece that isn't boot-time yet is the hardlockup detector that drives
> all this. perf and buddy are mutually exclusive at compile time. We want
> to use perf watchdog for FEAT_NMI while SDEI needs buddy.

FWIW: can I ask why? You're worried about the "all CPUs lock up at the
same time" problem? I am aware of some work towards solving that (even
with buddy) by letting the hardware watchdog driver's "bark" interrupt
run at NMI-level (or pseudo-NMI-level). With that change, I'm not
aware of any benefits of the "perf" detector over the buddy one. The
buddy one should generally be more efficient (fewer interrupts to
process) and less resource intensive (doesn't reserve a perf counter
for the whole boot).


> But it is solvable.

Yeah, someone posted proof-of-concept patches that made both
selectable at boot time. Nobody was really interested in shepherding
those patches all the way through.

-Doug

