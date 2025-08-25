Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E875CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81ThnHgRyfJ3VAWTq+xvaABvLIKtK3i4qxFSEaYkKCo=; b=DvSw25sLyiCDTp4hddGcJezysn
	I3F8UP0gb07lEhC65mjBwprgwgevIjZSobZCMql7Wx3Lmd/ZxJOY2d6xVHoEAyDnu7YheyJ/PLxST
	30Mep/rRCvnKtrOvq3mQbYL44G/kKJtrIzWNxCBp7Wd9O3aG2yV/WKz9qNVvs1huM2HipEl3K+kLg
	Hl2injthP/fjJmc+eURxYob4bnreoZJt1tZRQELVJ28UzoMrM/Xsok2sT7WPj16pIbSnFpqbPZKsL
	W4KyLMGFaWzg9T2bA1IcAtLOTh3A0j1hOolMOvyonpdq6tBfOCpl9juFzpEU8nM/jwKdOmzArz4gi
	E0kwAM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcyB-00000009MJI-0wWo;
	Mon, 25 Aug 2025 19:35:07 +0000
Received: from mta.outflux.net ([2001:19d0:2:6:c0de:0:736d:7471] helo=smtp.outflux.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcvO-00000009KgR-1h7C;
	Mon, 25 Aug 2025 19:32:15 +0000
Received: from auth (localhost [127.0.0.1]) (authenticated bits=0)
	by vinyl.outflux.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id 57PJVcXW012364
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 25 Aug 2025 12:31:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=outflux.net;
	s=2016010; t=1756150300;
	bh=Cc0A7KST88BbLESFvBNiNEgFzJEi7Yi2EVmfXhRgL6M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=dmm7Uk1rljY/b4/3j8njDIEy+Scks4cnfZAOL8qtbXCH9h9jV621co70Fuer5Vf17
	 2vNGEXeFRnmarqqQKCQXq3nlyBV+sTTzdmwDNFgEktyxTZkW7g83isIllAWQ5Jvik2
	 /8fn12aBvHvvu5EXYWBmhf7ySJSjrTUnGPHeNjnY=
Date: Mon, 25 Aug 2025 15:31:34 -0400
From: Kees Cook <kees@outflux.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Kees Cook <kees@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
User-Agent: K-9 Mail for Android
In-Reply-To: <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org> <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
Message-ID: <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIMEDefang-Filter: outflux$Revision: 1.316 $
X-HELO: [IPv6:::1]
X-Scanned-By: MIMEDefang 2.83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_123214_457925_1DE5E44C 
X-CRM114-Status: GOOD (  13.21  )
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



On August 25, 2025 1:00:22 PM EDT, Miguel Ojeda <miguel=2Eojeda=2Esandonis=
@gmail=2Ecom> wrote:
>On Mon, Aug 25, 2025 at 5:35=E2=80=AFPM Kees Cook <kees@kernel=2Eorg> wro=
te:
>>
>> Yeah, that's a good idea=2E What the right way to do that?
>>
>> config CFI_CLANG
>>         bool "Use Clang's Control Flow Integrity (CFI)"
>>         depends on ARCH_SUPPORTS_CFI
>>         select CFI
>>
>> ?
>
>I don't recall what is the idiomatic solution for renames, but I
>remember Linus talking about this topic and about avoiding losing old
>values if possible (perhaps getting a new question in `oldconfig` is
>OK as long as the `olddefconfig` respects the old value)=2E
>
>I think your suggestion above will still make it appear twice in
>`menuconfig` -- there may be a way to play with visibility to make it
>better=2E
>
>A simple possibility I can think of (assuming it works) is having the
>CFI symbol for the time being introduced just as a `def_bool
>CFI_CLANG` for a few releases so that people get the new one in their
>configs=2E

Ah, I think this works:

config CFI_CLANG
    bool

config CFI
    bool "=2E=2E=2E=2E"
    default CFI_CLANG

I will add that for v2=2E

-Kees

--=20
Kees Cook

