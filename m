Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D39606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OCQBJGnR;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=gVsMzc4p;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IBiQG7Ut
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOWziecHO99tmLi2InK5sCFNWlNwHdhEH/JAdyr5Svw=; b=OCQBJGnRjMYDTT+kJHWGSAdCLT
	Ba72/yVZcW6JNpt4ysomysJnwu0wCjPWybjwqfN+xmaGPUBd+Nnlytb25SZlwgBrscKeVyW430oif
	Utfn7rwACAMkvc7GOtYCsjVguUWfYpKkicYas5UEUZdlLqwQ7b3yjarNXgb1iVukA0zP8v3gq6Mc9
	9FcbKIGdtKscp6gMo/FH6rF7orUovGL4KLrIlb9fhWwDBCVO4G2NW+U4qu3yf/NxKKS5gLlxvXLtx
	haJfMTj4pJvk+9iKXMPEzn/EPlw15Hs5X2XCHcdh3eVP/t9W76LI0GRqEVFrll0SOxPqa3yhW+biF
	DkN5mkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5A8-00000009Auz-30TP;
	Tue, 20 Oct 2026 08:25:36 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5A6-00000009AuZ-0BlR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:25:35 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id CAE451D00151
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:25:32 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 20 Oct 2026 04:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792484726;
	 x=1792571126; bh=OOWziecHO99tmLi2InK5sCFNWlNwHdhEH/JAdyr5Svw=; b=
	gVsMzc4pE7RXb0PD1PFSe7U9KAKo+LOfnrpCZ9bGvHxQed7bfXRPVZaXFO6RI0rE
	gYqVssJtY3XpYADIXLgRBcAivyYUTqSu8/U6eyNyRwp83RN01jMkBsdi3XSrhfGn
	kcF6F5coIfSOKgdgbd85wqMKYqRaJnkQlyeHKPGzHIqseXyjDgBaqtDhCRjj46g7
	68UwP3Q+PH2S8H6mzo0CE9icu1ZVRb4prOaDAupmoyxVSNeCP69TfOUMleKnhNMm
	8ENYBcOnJ+sGDMOlWdebTCqj9MCTkHYw6M9FqX6TSr5+advz0T/TTmuGuAPIkXsn
	kVpNl96YZB5Kp92uAuC5HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792484726; x=
	1792571126; bh=OOWziecHO99tmLi2InK5sCFNWlNwHdhEH/JAdyr5Svw=; b=I
	BiQG7UtPpvPCySro50zQU5JqtAIrUz0JrU5gJXsRkNxCic3ZY8SiKef5exwqvb5B
	vp49UBM4fWL/diBc3NpoeR29xdBei4dSPQj9oYTlEQEgveGPxzhNmuRKE7uwiL1n
	pyXdAjkvfkJkSUpax6c/pNurM+2SXECpBDAJYjS5Sa/2kL/U/12swZ0ZUb2v0JDY
	vTembThXwFHx2QUSa0abSxxuX4NFFPzN0hKVXFvsRCv82DbGTr5AF3LpmeZN43VC
	0XvFd3hjxHZMmRm0gs3K2Y/TKq4TRz/cEIdcuXJJ+56HNYZjjvoxWpsqbCORpA4V
	P69rs+rDWFvNO/FEHUeGQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792484726; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:hqbqsPHGoJMxtWYt2xyUU11RL/Y8gTp7jb1yfDih7mhjKUi
	IzAuUltS4Psy0msSem9lMQfjE0ho3GdKLOgrL/xBJ1iBoYwBTosTUvP5epnL94d0
	u+/zPQOUsgnjo3jie6vFuUn93kxidyGTcbLNMMCrcMJbaM45VdEOqu0vneSGdDqn
	+H1SWqKX8LmsPg4ZX2AZnr7FGW2LkLoufr3pnFL1nFA/OIetXC92ePdrROzWJZjg
	DzwmFvXf0E9ogKkHt0tFVTqJmPA5B13yqgZOM5IsVp2nXrqXlIaDSVoaKs5QAY2e
	yZnnpt3nMp+gpcV/T0nngfHCjVfPnCTasN52Nig==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cNtNee0u9nf0BQwKITDllCmw839Es7Nzqxp6USKMn7I=:zjOrROw10opHbIrx9y1YCbZGw8cKUW0tmJxEUPyp5KE=;
X-ME-Sender: <xms:cSXXavuXr_oR9TttEhY3jnM7ek0xt-zPp5V24wUYJ-hsvYHZ8QYjJQ>
    <xme:cSXXarQLQiAu_-g06K-OFmt7RHvAPdIS3mou4Q2pW8Q5GH_FkCLZtw1ekTO4-RSIo
    48fwg0FvnC4EySl8wGi3Aw-D_qbWXrj8BG2Pmb71WI0CLm_Sm5u-Ck>
X-ME-Proxy-Cause: dmFkZTGzVLg4yuouvFwz5PrOMh7i8iS+/9vnsYEjZvv91aX0C/a0or3CnXqR+7HkqrsIiK
    +hbffc7OOTeXxTe1v9gFoS8U9vff/jgK4QFpfy8cbkxv4eAUv56tiyScm/QBvbm4RDlUyy
    iWngEYpMK7gGQjp61AP6vkDvTpqlvIdEIHhJOIc0z/80tKwxgojEYw36ffUsZT7g5//AwT
    mWBIWSvEfnJN3aqM8IxjtEndMLYwKs1m7VhEVf6nLsTvrWFLY6G1zP4njgQwR1UJVpZuXf
    FqFDYDwlN5ARRFzRFZcVaO0tsI1F6BzU94OxKNK+hUUOqwGbZLmaqQa8pcE/xQtRMO5apF
    7dE8Sgl5caMJsXZpb6zjnBgWORBsiJsebqBq2oMbYzsbUZh0DMQYBoe795+nrObGTFmxG7
    uj6oNWndAeqc8k22aR8UNBzzmGn62bA0KLJ6ImNBLOFZfM7I7Fq7xLkqJ3OoIFIjaoVs9P
    cZFunWvqyrM8QPQm+6EVIKsKAGO/U2n6r8fpt5HwpV6E7hQ8aUUsimkyZXc8ullR/9cAbS
    yldvWHI9p7AMheF9F3ruGAsVVMA/pGhcbPS8JFgiel5WbD6XbntgbTEPdwN/vDezQ7Ss63
    M06F6G0F1gCQsadzsoRaGkAY+M3aoYyrR3oBcz3NGBYxjyN3wnnGLAl0pNTw
X-ME-Proxy: <xmx:cyXXaiBEe6m2VyR1-2qmJUdiZyq2c0jIqKNI95ZZU7EsXIf-HAECqg>
    <xmx:cyXXanPH3VQ4SyHaeVYkVBEa3wV4P8G1aU4o9eL5me7WzKXmABtmSA>
    <xmx:cyXXauQHJakWwnfhTPMAJ5IHUPAIq5R8hCl7RMp6Rrb-3o-T9-ZEqw>
    <xmx:cyXXan7WAAK-b5pSlQRTzRNSjuNrbupUP5PyhKJFXGYAHB2gGSbB_w>
    <xmx:diXXatkkvVghptf4jn_4AAkjBNPb2wpqxtasfqzSdthrDUdky69a8qTu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 44A6232A0093; Tue, 20 Oct 2026 04:25:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATLhSvAouVZo
Date: Tue, 20 Oct 2026 10:24:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>
Cc: "Ian Rogers" <irogers@google.com>, "Thomas Gleixner" <tglx@kernel.org>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "David Laight" <david.laight.linux@gmail.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <d2afb4cb-145e-488b-8f6e-c83e38735526@app.fastmail.com>
In-Reply-To: <20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
References: <20261019201257.3805356-1-irogers@google.com>
 <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
 <20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for ARMv5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_012534_471125_49E21A64 
X-CRM114-Status: GOOD (  24.99  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026, at 08:44, Marc Kleine-Budde wrote:
> On 20.10.2026 00:12:57, Arnd Bergmann wrote:
>> On Mon, Oct 19, 2026, at 22:12, Ian Rogers wrote:
>> > +
>> > +config VDSO_UNALIGNED_PACKED
>> > +	bool
>> > +	default CPU_32v5
>> > +	help
>> > +	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
>> > +	  for unaligned memory accesses. Enabled on ARMv5 where GCC may emit
>> > +	  out-of-line memcpy() calls instead of inlining byte accesses.
>>
>> As explained, I think this misrepresents the problem as Arm specific and
>> isn't the correct method for -munaligned-access targets on Arm, which
>> include CPU_32v3, CPU_32v4 and CPU_32v4T along with CPU_32v5.
>>
>> I still hope we can use a version that just produces the intended code
>> on both -munaligned-access and -mno-unaligned-access targets like the
>> old version did.
>
> FYI: there is the kconfig Symbol HAVE_EFFICIENT_UNALIGNED_ACCESS. Can we
> make use of it?

That would be better, but I still hope we can just get back to the
portable code across all architectures for the in-kernel version.

I have one more request for you: can you check /proc/cpu/alignment
on the system that shows the performance regression with and without
the patch? In your original report, you have shown that Ian's patch
caused the drop in performance and that it caused the added function
calls, but I don't see any sufficiently hot code path that would
actually explain the scale of the regression, unless there is now
also a case where get_unaligned() ends up doing the wrong case and
running into a fixup handler. If this happens, you should see a
nontrivial number of fixups listed in /proc/cpu/alignment. On
a working system, the numbers should all be low but likely nonzero
because there tend to be callers that still lack get_unaligned()
wrappers and just access misaligned pointers directly.

      Arnd

