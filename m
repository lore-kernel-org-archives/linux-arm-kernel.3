Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63BAC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APiwPwxrp0Nqxoas85A4o7DfSgVInEX2Y+304zRUNvg=; b=1BYpMi/0tw6yvqRnIQArhY0k0B
	nZdR+dqKGAgB3KlNmVLtkHJJDZWhQcw5e7oTvNKhvLETjjjVx27sm4thKGFsvS2bIbNMqnuvISZ5U
	nc913ge5gG8Fj53W43rnlhpTokjOYsZ/SXU1RGPEmtrRD9TjXDLkmZPDKv2+IlrAW3Mq0SfvNVpr7
	86RULujvRN5eY3yg10xM/IqA/QJ736eVd9nL0PoUiIlG/QVbqEyqXHVXdGm9jfnMdl2710e1GE+sT
	ovkDlaZ0XI2rNt90ALDbt+yeK7F4yD6oCL846E+dfJXghGl5eQG5v39XbkT4E25wwH1RJVGO+X5DN
	17fg9Fpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP0J-00000000AVb-1BEq;
	Thu, 16 Jul 2026 16:32:07 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP0H-00000000AUe-0Chp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:32:06 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-9696369925aso2237659241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784219523; x=1784824323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=APiwPwxrp0Nqxoas85A4o7DfSgVInEX2Y+304zRUNvg=;
        b=MRF6m+xF5ump3E5SeWtctr+W8fG60xWvN19iYXlqWu7GMgA1l0tf0uQQP/NF7sGex6
         am75VxxKMi38fsmeOMmHt1Vh9Nj7+0aeqZEj7BQBPTU2toqTfVolxNIK+8J49ZIKJLHF
         1sQ09L34EqPoCPvDbr5JvN4LNu9CTx0iKJcDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219523; x=1784824323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APiwPwxrp0Nqxoas85A4o7DfSgVInEX2Y+304zRUNvg=;
        b=cGSXQfQZ4PzNQbq+Bui3xWSCRNd2TuNBBaZhEq+5NajwqImOQ0vPkG8L64cXGU1AiO
         tN7gKxBr28kqBt0knl9h5D60gIcLsKxAg1VXP+di5gHyKpwQ+rAExULBPX1XI3jmhMJ9
         seRBPFirgrYykkvGAiYeq2cNYYvbNa2GG39fns9O6EOeLcY5IIutHIuMXWWp4q/Q49De
         oaey4mRk0jtDzyS8FG7dywWPvZCOKWVm0SiG2hAC6qwr0vANnsiELtLUTwmuXLlsPGQQ
         iHZWIaRNYA2iXttyh6TjrcWhfmU4g5mGfB08hCbRFBh1Ms1pHmGayBAkejIbwbtCBy6X
         CMKg==
X-Forwarded-Encrypted: i=1; AHgh+RrCV4IbWzZ+F23MwxuARr2L9TM3hZIDJ34GiYyBOdeG392RFy20w0c6pF2Gql87tYD8Jq3PRLXzMhCf6HuIS2ZG@lists.infradead.org
X-Gm-Message-State: AOJu0YwF8/DMFAzwKPjfEhGZDCHpyek5XdT09segFVZiP0itE/G35Y+q
	UuW973H2tIVmDCw+WmrTV2bNnc4IcGUU4JHNxiJrdmqgDLpfpCYo+q6ut7TxoAJuhQQA7TC0SH1
	CyBk=
X-Gm-Gg: AfdE7ckgiLhoZy61run7VJd80AThIdBlvjbeocrM02fOA8NPD8kmwi6B5XXJwR4du2S
	+TDPPQh5hgMqhYX+j+l6RjgeqFuAS4Ka4wT8DU762KJEpfDl8KOURgA0E97YieeYKaHbglRWQE3
	ZgvwxejLe3CHTcZpRhOSrOdvCccpXWOnOSwGwurW0sLS6wQUjFpZJgfEZ+gBwuz7MevLJL/X0YE
	vayqDXaS9+1uE7HeMYG0z1wD/eojfzxLhNqWT72Zpkf5KFRbdy1mtSKMAjfS9BmEkTv2LfYbt76
	HtGyLAJRkXnqwC0Z7LyMYwAVrLktKu7pvzLhDY3lPg8v1Ov4iptP2bj2Q68LgXankjYOYF3RShA
	jDjS2ZDLCaC6s+V4C4qZ0VVQFKa3iGX5VadoeN0Q4FEl1IlR/jAu6mctwgqlpRVEPVHz/zG2Tku
	NTbu2I7YpBV8zidZ/mEZbp9RDpvoBnq72FR3r2OJJmXLqebDorOEk=
X-Received: by 2002:a05:6102:e10:b0:73e:c6a0:331 with SMTP id ada2fe7eead31-7457e72d5admr7259432137.10.1784219522808;
        Thu, 16 Jul 2026 09:32:02 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed3868749sm12480615241.7.2026.07.16.09.31.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 09:31:59 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso1454574241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:31:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqx3mHzlPbc4PDqhMiSAohhxrJ5c9vX6eKQoQRPDHorFBypQ3tzdKnYLh6e38OKsoH1tL5lwVXXKgLA89R6ekLj@lists.infradead.org
X-Received: by 2002:a05:6122:208c:b0:5bf:8fdf:89d with SMTP id
 71dfb90a1353d-5c10eddf329mr6674207e0c.9.1784219518543; Thu, 16 Jul 2026
 09:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org>
In-Reply-To: <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Jul 2026 09:31:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
X-Gm-Features: AUfX_my0b9oOkbCP3pS_I5q2w-6_jGf9HQ5lScUiSPnwh5yrj8idkqJOr-EqJaY
Message-ID: <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_093205_142912_F4EE354E 
X-CRM114-Status: GOOD (  58.42  )
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

On Wed, Jul 15, 2026 at 10:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > I don't suppose I can change your mind here? If we take
> > "google,lga-mailbox-array" as the generic, then going foward a few
> > generations we end up with:
> >
> > properties:
> >   compatible:
> >     oneOf:
> >       - const: google,lga-mailbox-array
> >       - items:
> >           - enum:
> >               - google,next-mailbox-array
> >               - google,nextnext-mailbox-array
> >               - google,another-mailbox-array
> >           - const: google,lga-mailbox-array
>
> This is the expected appriach.
>
> >
> > If we keep "google,mailbox-array" as the generic, then going forward a
> > few generations we end up with this, which seems nicer / less
> > confusing:
> >
> > properties:
> >   compatible:
> >     items:
> >       - enum:
> >           - google,lga-mailbox-array
> >           - google,next-mailbox-array
> >           - google,nextnext-mailbox-array
> >           - google,another-mailbox-array
> >       - const: google,mailbox-array
>
> It is the discouraged approach. I already have a few real examples for
> Qualcomm when people added such generic mailbox and after some time it
> turned out not generic. So people wanted to add an another generic one...

OK, I'll change it to use "google,lga-mailbox-array" as the generic.


> >>> +  reg:
> >>> +    minItems: 1
> >>> +    items:
> >>> +      - description: Host registers (not accessible to client)
> >>> +      - description: Global registers (not present on newer IP block=
s)
> >>
> >> You have only one SoC. One SoC has only one IP block, no?
> >
> > Nope! There are several instances of the MBA IP block per SoC. I tried
> > to explain the situation exhaustively, but there's always the tradeoff
> > between explaining thoroughly and providing too much text.
>
> That's ok, the "newer" is confusing.
>
> >
> > To answer this specific question concretely, there is one MBA per
> > remote processor. Looking at the downstream DTS, I see at least these
> > MBA instances:
> > * AOC (Always On Compute)
> > * GSA (Google Security Anchor)
> > * GDMC (Google Debug Monitor Core)
> > * CPM (Central Power Manager)
> >
> > Each of these 4 MBA instances has its own "global" registers.
> >
> > To provide more context, each MBA instance can support communication
> > beyond just the AP (Apps Processor). For instance, the AOC's MBA
> > instance could be used to talk between the AOC and AP and also between
> > the AOC and CPM. Let's take this as an example. In this case:
> >
> > * The AOC is the "host" of this MBA.
> > * The AP is a "client" of this MBA.
> > * The CPM is another "client" of this MBA.
> >
> > The AOC is the only one with access to the "host" registers.
> >
> > Everyone (AOC, AP, CPM in this case) has access to the read-only
> > "global" registers describing the MBA instance.
> >
> > The clients have access to several banks of client registers, one per
> > mailbox they can access. The host (AOC in this case) also has access
> > to the client register spaces since that's where the shared message
> > memory is located.
> >
> > The overall MBA instance is best identified by the address of the host
> > registers, even if the client (the AP in this case) can't access those
> > registers.
> >
> > On newer versions of the IP block the "global" register bank was
> > removed and the read-only registers that were part of it were simply
> > copied to each client instance.
> >
> > Does that clarify?
>
> Yeah, just s/on newer/on all/ ?

No. Although this driver only supports the "laguna" version of the
mailbox array, I tried to look forward to what was coming in the
future. On "laguna", the "global" register bank is needed. On SoCs
past "laguna" (AKA "newer" ones) there is no global register bank.
This is why the global register bank needs to be optional.

Yes, I could add some validation to tie it to a specific SoC version,
but that doesn't really buy anything. It's just as easy to say that if
the global register bank is defined in the device tree that it exists.
If the global register bank isn't defined, the info must be in the
per-client banks.

If you insist, I can make the "global" register space non-optional for
now and we can re-litigate when official support for newer SoCs is
proposed.


> >>> +patternProperties:
> >>> +  "^mailbox@[0-9a-f]+$":
> >>> +    type: object
> >>> +    description:
> >>> +      Each sub-node is a single-channel mailbox.
> >>
> >> This does not look like correct representation. You have one mailbox
> >> controller with multiple mailboxes, not multiple mailbox controllers o=
f
> >> single channel boxes.
> >
> > I spent quite a bit of time debating this when rewriting the driver.
> > While we could certainly hack things into the existing "mailbox with a
> > bunch of channels", IMO it would be a worse representation of the
> > hardware.
> >
> > I discussed this in the wall of text in this patch series, but
> > re-hashing it here:
> >
> > Each "mailbox" in the mailbox array is more like a full-fledged
> > mailbox than a channel within a mailbox. Each (single-channel)
> > mailbox:
> > * Has its own client register space.
>
> That's nothing special yet. Many providers of multiple resources have
> these resources in dedicated registers. Arguing this, each GPIO in a
> GPIO controller as well has its own register space so is basically a
> GPIO controller on its own.
>
> > * Has its own interrupt.
>
> Just like GPIOs...

Sure, having a giant list of interrupts and register offsets isn't the
end of the world.


> > * Can have a different amount of memory for messages.
> > * Can have its own conventions for communication.

I notice you didn't respond to the above bullets. How would I deal
with different mailboxes in the array having different communication
conventions? Different mailboxes in the array might have different
"payload" sizes. Some mailboxes in the array might use "queue" mode
conventions and some might not. Do I need to devise some complex
scheme for describing which mailboxes in the array use which
convention?


> Well, this could be. But you still have one child per channel (cells=3D0)
> and all children address space is in parent's space, so that's clear
> indication. It's one controller with multiple, although some different,
> channels.

Sure, it's definitely one IP block and I'm not arguing against that.


> > If we tried to represent the mailbox array as a single mailbox with a
> > bunch of channels, each instance would have a different number of
> > "reg" entries and a different number of interrupts. We would also need
>
> No, you would have only one device node. Very clean solution instead of
> 100 children for each individual mailbox.

There are definitely not anywhere near 100 children. At most a given
instance of an MBA IP block could have 32 mailboxes. In practice, most
have fewer.


> It's the same with clocks (TI) - you do not get device node per clock,
> even if TI did it 10 years ago. You do not get here device node per chann=
el.

Sure, the clock history is one thing to look at here. IMO, this is not
the right comparison, though. Trying to describe all of the complexity
of a clock tree in device tree is an exercise in futility. It's just
too complex to get it right, and there really are hundreds of clocks.
The mailbox array, on the other hand, is a much simpler beast.

I think regulators and PMICs are a better comparison here. When we
describe a PMIC in the device tree, do we have a single PMIC node and
then have clients refer to a "regulator ID" to index into which
specific regulator in the PMIC they want? No, we don't. We use
sub-nodes for each specific regulator. This gives us a nice place in
the device tree to put information about each individual regulator,
since each regulator in a PMIC is different.

Certainly if we had a mailbox controller with a bunch of identical
channels then describing them as sub-nodes wouldn't make sense.
Existing in-tree mailbox controllers have a bunch of homogenous
channels, and thus the existing solution of using a channel ID works
well. Here, the sub-nodes buy us something and provide for a cleaner
solution.

I don't understand the downside of my current proposal. It represents
the hardware better (both the HW designers' intentions and the reality
of its structure), avoids adding complexity to the device tree, and
feels clean.


-Doug

