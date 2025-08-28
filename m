Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39E7CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x85rjdiLOCFPdJayXqYWI4upB1AsPjUc5jpFEoHoVuQ=; b=IK6dLesO215/41DFs0abJOsHYe
	4VcoPAV4LBQpns9UOq5XrP4B8USlHNX2GcjITPXqz8725iwl8OGb3JTsXuXQIb8biZvisVwL1/jRu
	sckUox1bNmeWcH1BXCeSFnwp95wipW38jlyYKEikswBVDA99QVRLV2pdEoR7YbLRZwnE8R059QgBa
	tWeY+7hv186aYR0mh4vht+eDp8NX67Lqzqe5Da/dnoi/edav2ny+PtRwQdeUKIIvaLMeFGCTSfREf
	97DtwPzxxsd/uIF9IbU410obEF5GQf9uy/69RnnAlW30RyHG9121c4TUSa9ZEHdEXPltJuokqwXSN
	l7epXQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm0q-00000003f7l-06Vz;
	Thu, 28 Aug 2025 23:26:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjIC-00000003BFt-2dRb;
	Thu, 28 Aug 2025 20:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFE33432C4;
	Thu, 28 Aug 2025 20:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34509C4CEEB;
	Thu, 28 Aug 2025 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756413139;
	bh=LJ/nYBW1tIRXTpCBSiKp71T/i9+fSZdNs8DZzPqY1Ow=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DGl5m61tjFO/RGbdmcv8xyDmu/ykBezYs0GHdT4DZw9Xhk3fSMKGKVpOWVqw5/86+
	 jK5yY+L4Bo1ZIZ8v3R6pXEW+Fjm53GisvnYMX/XpdM+rD/Z6hIBavWTcDeIfuLkZV1
	 OujLD+Q0WWVGa/LUPqHTaRku9THwma5s8N+6X6Ert3RAhSE6UW+cGdCYjC4CScygIJ
	 Cj1DHZR7LIX821VJ2VhiEWxiG59HzBd0B8RaijpHpGW7OMJ8muA6HNFHK13GjY0yLf
	 N1Mj4ArOxrslcU9fjauS/Fhpnt/uL/EXomlp9/E5Eieg9kjphzcZPHUoOzR0suUrJK
	 kAVWObwlnDGbw==
Date: Thu, 28 Aug 2025 16:32:16 -0400
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
User-Agent: K-9 Mail for Android
In-Reply-To: <20250828201915.GA219815@ax162>
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org> <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com> <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162> <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162> <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com> <20250828201915.GA219815@ax162>
Message-ID: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_133220_691474_69451570 
X-CRM114-Status: GOOD (  14.21  )
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



On August 28, 2025 4:19:15 PM EDT, Nathan Chancellor <nathan@kernel=2Eorg>=
 wrote:
>On Thu, Aug 28, 2025 at 02:11:51PM +0200, Miguel Ojeda wrote:
>> On Wed, Aug 27, 2025 at 9:38=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l=2Eorg> wrote:
>> > Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a u=
ser
>> > selectable symbol and making CONFIG_CFI the hidden symbol that both
>> > compiler symbols select=2E After a couple of releases (or maybe the n=
ext
>> > LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated wi=
th
>> > CONFIG_CFI becoming user selectable, which would keep things working
>> > since CONFIG_CFI=3Dy will be present in the previous configuration=2E
>>=20
>> If we are OK with something like this (i=2Ee=2E waiting a few releases)=
,
>> then isn't it simpler the `def_bool` approach I mentioned? i=2Ee=2E it
>> means one less symbol and one less rename later, right?
>
>Ah yes, I reread your suggestion and that would probably be the best
>course of action, as it does avoid the extra symbol (although I am not
>sure what you mean by one less rename?)=2E As I understand it:
>
>  config CFI_CLANG
>      bool "Use Kernel Control Flow Integrity (kCFI)"
>      depends on ARCH_SUPPORTS_CFI
>      depends on $(cc-option,-fsanitize=3Dkcfi)
>      help
>        <generic help text>
>
>  config CFI
>      def_bool CFI_CLANG

Oh! Keep CFI_CLANG the visible option? Will the later rename work right? I=
'll give it a try=2E

-Kees

--=20
Kees Cook

