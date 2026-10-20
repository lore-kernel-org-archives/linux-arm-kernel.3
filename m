Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579A8606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3e+3MD7x;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=YAgmFXmj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Vdjp2tjY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbtBT1zpSxLsbcMbyYVhf3JDYC/W4xf5mt5D10gHvo0=; b=3e+3MD7xj9/K6/XBqBegtQR6KY
	VO7zdQxEplUsQJY5KzvavvQsUQ3vW8pUPLd7hGn+SW7wWZdPijFIknJC57XpN0fFdv7IcmLqWbCVr
	pu/2eS726smaUDny4urNhipA74h8bZkumcZpOKmrU/uydTNUKBDtgrkfY610zIwzrJo5t284AaOQN
	bZHW1eMO78m7QWxSlF/0+OqsneuV3nN6KISOnXTp/XpOXKCGyj9aRv+XR7R5pmsZ37xdfhTY475UV
	gLCA+6rSGSHJE9QXlcYmz+I3y55LCSZUFENnojbQjTO/acMT8y1JW/mEqusY5GMcvJJTi4MKPJicE
	kRoBK5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5oH-00000009GDJ-39OU;
	Tue, 20 Oct 2026 09:07:05 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5oF-00000009GCV-2iYx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:07:04 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 996D41D0014E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 05:06:59 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 20 Oct 2026 05:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792487213;
	 x=1792573613; bh=qbtBT1zpSxLsbcMbyYVhf3JDYC/W4xf5mt5D10gHvo0=; b=
	YAgmFXmjB9LJCqu5UhfWhrgkMQ+78wWrQqA2QRxxmQ9mmdJLYKjVExsXPcIQ1nCY
	HYO0VQW8oNhgA78fDNH9KiQwpz85a4KLmWQcxjENLDhNNFKaWVTlrH6JqKhVZxjN
	3ayzQ+9YE2HyrkD2JbMfaAOOsgfxFQheg8Yr56I4HrD3FQb8nydfmBJjHSc9WLH+
	rH5SOKG+M2XhFzmE0+Ah59kMDRtPzHItkPXQ63e0SN2z3TANvWi+jN/1E2dmDXLj
	YdoQzjMWcbmNMNLIAk4Erj05hkXqVezobDhOHEOnPxn+EkjpbZY9awVsB3a2zmX+
	hX1W5EDi23GiFOXKV9UGmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792487213; x=
	1792573613; bh=qbtBT1zpSxLsbcMbyYVhf3JDYC/W4xf5mt5D10gHvo0=; b=V
	djp2tjYjltPD9WauoYY13RPgdVY2L88pxKoNitXC4D+yzKb20SlGcgQlumZ+iSSs
	w9PoA4x4okUEJqt7BkhuhkHhMGhAoamuvH4xLGNYNFOAB0baTFjUmqzyO0ZoaTDZ
	o7MZb8yO3DpsVrQcw0g202eYqvjCqPn5rXdvnNPHS3dYjgnthyF3ddnLNAN/mC08
	X5W1Fe4fKVkWyw9WoNuR54h6fULRnD+ZaN7zLV99fohkG5vu5ckL74K/UzRJVEj8
	AyRUZl13q7NmSTU8enZ9nQ6yQiJsv+9FQvcuXq/iztp66w2og2JWwO7ERo7bwx0H
	OMS1QMQBLoMZFeBHGHwnQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792487213; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:lZBuYsct4WUlyAc3qfGKfQhBtM89reYmq3X2ES4HYjOt06M
	ZJp8pppXbEmzknRamYuBhtSRO1W+cKoN90Se4CizMmnz2pQoSUPtBczFoJBO0fEm
	AcHuAa8QYr34eGkBAwlLcTwOb1omjpVeETttC/RuYlwGDIo1yrRAH39ftkGu8MpL
	7VTaso+GoHgjyyXiXt0YNVRNAcWhqkHrUlSC/6yBUyEol7MKjaxIJqQjtzqtE3t1
	NyfBHJbel0OZSUvjiNpvgTogiruk29lzi6Z/mHLGTfs0xt2xoUUseLegMKF3DGyF
	7BDYD/OP08CtikzLQh/GaWs4yZcWlAdzOf7KRHw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Zf6XtnsRdLogxNdsFsiNl9U5lteyoRFbzV8KFT94ceY=:P1+4NKlddnjAdfdPKXMMf1nmswzQ3j+bprK9cbCihoY=;
X-ME-Sender: <xms:KC_XaqGFWnH2TWivi-2RBBGAC3gfA1D44CKdS271GMmheqTagxxmpg>
    <xme:KC_XamJflEGblbMedxlEtVC_s5MGvmo2Yf9kr6TZtso4llSvLhiruS06StW3YjncF
    YOs8Zbcc8OjYTp2Pu1vhNOCySecE17SXKovaGln_CMCURUaMvHYS98>
X-ME-Proxy-Cause: dmFkZTE6pYZjwqD9MuJZc6oGG5G4d8tXnhSRk+nCvHZBTrmX1lvtdBB2z4mSt0mtErSvno
    uKHAQgvOcedGlRXGN7ggqvLURejOEB3vEgubbBGVASzH5JJGm6qRIN7+Gu8ohdrqvGK08J
    9BbwSughj3UMjk4bVE1QdUhNjKK7NLUIqJUN5sOIHEt5TldzHgx1WzzQ4L7xS7cooChcY7
    rv9AuZIKyXllIY9hKA8K1G8fT7AhYuwJ6qGIBKV8AnLHrcr1onLXuEYAENhM6M9GpdYJdV
    vkCe5+12oZhdEE/U4lNHMtLhbLVabIlgzVVGYs6J/gKl8M51RVdHoeS/WfEqq9dzde8cNA
    eNHfYge7WVbCoY1+KLuQFPAMWOF66HrRo+3NmsOZYMQ8MlJPXBpLhIW/NYglbhGmndf001
    A/6CMGeBVygqyslGZMOveGymtrbbq+TtoAE/SJdXKT1O/6B+CIsxWx5kQzJAhUh3o3S+ya
    ED2Cy9rqkUtvjKWQYuULfth6786qsr9yRxVAWVY1kxTZGxiLaoGHBG0CuazaMdF8V4RGTy
    Kvq2LFyyqME+xXjn42vkYOKvHkXbnS/HPrkOtI5grRs9rvhzIwVtVyB/u/3b+cDvGF++rC
    V984mXo98wkevu6m2MU40qe1fO2ZJ+FRXK6bm1CfEyG+jjKniYAIhuMEKouw
X-ME-Proxy: <xmx:Ki_XarPN-YD47sw20HPwqP0y1YQFzBJbYIa-_vpY3eKV9fNEPmLSvQ>
    <xmx:Ki_Xam7lZ3BlCeOb4CS1J2ll5g6bloQEIF--CeaWUTZR19J7JwqUJg>
    <xmx:Ki_XaqmJcvhx29A0jrkaPFH1VNRUcUzJ6p_bZr43kzs83eEn5NWfoA>
    <xmx:Ki_XauI8wNPpH7dGH-8y2tvBNNfnnLoEDZKtvDALjuQxh7dvfLD9HA>
    <xmx:LS_XatS6u-867GxncqjomOrKbuKdTDKjIWZKuU5iq2LF_lGuz1Vopv4I>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 506CA32A008F; Tue, 20 Oct 2026 05:06:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATLhSvAouVZo
Date: Tue, 20 Oct 2026 11:06:06 +0200
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
Message-Id: <fd21b7ed-003e-4c7f-a60b-0f9918b2bab1@app.fastmail.com>
In-Reply-To: <20261020-zealous-warping-quetzal-84479a-mkl@pengutronix.de>
References: <20261019201257.3805356-1-irogers@google.com>
 <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
 <20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
 <d2afb4cb-145e-488b-8f6e-c83e38735526@app.fastmail.com>
 <20261020-zealous-warping-quetzal-84479a-mkl@pengutronix.de>
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for ARMv5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_020703_731842_C2224043 
X-CRM114-Status: GOOD (  21.51  )
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

On Tue, Oct 20, 2026, at 10:41, Marc Kleine-Budde wrote:
> On 20.10.2026 10:24:51, Arnd Bergmann wrote:
>> On Tue, Oct 20, 2026, at 08:44, Marc Kleine-Budde wrote:
>>
>> That would be better, but I still hope we can just get back to the
>> portable code across all architectures for the in-kernel version.
>>
>> I have one more request for you: can you check /proc/cpu/alignment
>> on the system that shows the performance regression with and without
>> the patch?
>
> I asked Stefan Kerkmann (who wrote the original regression report) the
> same question, but we haven't had time for it yet. We'll get around to
> it.

Ok, thanks!

>> In your original report, you have shown that Ian's patch
>> caused the drop in performance and that it caused the added function
>> calls, but I don't see any sufficiently hot code path that would
>> actually explain the scale of the regression,
>
> Don't underestimate the overhead of function calls on those old CPUs
> with tiny I-caches.

What I meant is that I tried to look for calls to get_unaligned()
in the code path you'd hit with UBIFS on nand flash, and I only
found a possible call once per page written
(ebu_nand_write_page_hwecc), which should have a much lower
overhead than what you observe.

While ubifs does use crc32, it uses the lib/crc/ version rather
than the crypto/crc32c.c that you listed, and there is no
get_unaligned() in the lib/ one. If you have NOR flash, the
caller is likely do_write_buffer() calling map_word_load().
That one could explain the problem and could also be
optimized further if it turns out to be the bottleneck.

     Arnd

