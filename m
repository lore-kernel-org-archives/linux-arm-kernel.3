Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3072CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFtFebur4e89Yp2GhL1rRJfGJOlb0c6RszvUZdfId9Y=; b=SSqotcqTfA85HADVh+B+CziBmD
	ECuFx+tbeXXMsVAvvZUt646xnvddtNGVBwcLglNwD1iHs7J7T/f34Fky+H9w5gbYhTVu0QagLOhwM
	FNkP8pd3oABoCs6rOVnynAodbOkWcF6BwUrra8Je1X7ffqGD4uYlF6FpD562C6DDksMV8Q9xMM0Jc
	NN0pzB3pIZ9wDNYfsqW5pXFQT6D9WqEysxgKbE+r/2vaNnaihm+BqmK7iRi1QijYbQCWMYySGL+3P
	CRRGYXjq8DXAVZpSCQyfQGgNfuXUzAVaChiYxBIJdDxbsHsfiYMCSZa6iMZ4VHS6av36wnm8GxeGW
	rRcDnYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiXd-00000006Q36-46B3;
	Thu, 28 May 2026 21:45:26 +0000
Received: from mail-ot1-x361.google.com ([2607:f8b0:4864:20::361])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiXb-00000006Q2M-037V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:45:24 +0000
Received: by mail-ot1-x361.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso11841604a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004719; x=1780609519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFtFebur4e89Yp2GhL1rRJfGJOlb0c6RszvUZdfId9Y=;
        b=q88nInzTuErcuu5iS17W0L8oAPEo/OWggzJ6Hv7LWC/NmkbzoiVrstf0oJUwniLQae
         Fl4ehOXp39JRXy7k8YYwVb64LbQE9K/K1oQzl8ttaHRn0wj2GvKJy5cB/QOxZO2Hap07
         vWQelLcd33hd9tIxklJIWC1ff5nwPBLgTE11LcHLLWXKR4TsE4LC0JSdBOQW+AMMFIE6
         Yf8qnhooFDhyG09jpIkNIIU9BiU+W+vLH86UAsa6Yks5Ythz6/Ru+X7fcIrgHNTSL/HB
         BDwqycTenOglMnKvAaCom73fZNFy8ekmFP89vReSo66/7gzmW3nHxvHAz5k2uKA0LKKw
         rZyw==
X-Forwarded-Encrypted: i=1; AFNElJ/R6LmnLZ+F2FPH0ZAeX0ggf7Kod0mXGToYBH2SHE6DmI9Lissr19+6qTheEc3JWlEWbDrVRDzQrZzy4r+VDBev@lists.infradead.org
X-Gm-Message-State: AOJu0YzcpYRi7VPDjQNA6xrYgaLJPwmpcWbnAp57VrJO35WPu/UNlXx1
	3qbZTGRUr4pbk+RjEXsZj/uW7Ux8/SEfZZWdIutVOXRXUyuHZP4nCQE7oRlrc3ELuDZl+3WXagQ
	ONiOzjnI+5CcCN+Ga7SOhw34L+QcEsZOGVARVQzi1vA5wrg5tnMtYUPL/jYRjgGG5e9EOIOPHNy
	GXHhYle0tRaQ+BS4W3lUSqVwZXNE96niyCBSwptuPwzpQWDrQaXVOBbl/GmGF54HZ2YWNu4CgOY
	LG2KMbkWoaqGU1epV15A6rngGUNqhEI
X-Gm-Gg: Acq92OFHI1FQoHtJmbkwePnSF7LHHfdsIFOr1AX3DsTMHIr9zaC+wSO/3867SY1gUm9
	3yBYKOJKnUN0GhSfORkFhZgDsoYwZEde+msY+SYSeiNtxcITRzyMRg4aFKvboYkKIwkNP2vpiJ2
	WU0P+hO5Y06ksX/zt7NFX9F9Adv1viIGom1L1L0PWcEkUUtm+DI9bt1QysZiszVC5Fn0z2oapYc
	rrIHm+glG9+L/u1w8w/THTZuztsbpvUCna6e9nzVR6gNLOpXtpO3GgYszUi8jUiuc3xMeNIv3n6
	pAM52h5r9Dif5im7UqWOug16hoI8gUObcd9egSPJwfcVB6XqL8esz+n7TimzGCknwHTMt+FViep
	hNXvHoRkOdWRTy/zhJuWevlmzny13DdZSa1dY7Top38bHqB9wOKmbGDy82fA0Sip8Mjs+7320SM
	YXIPBbFv3509afH1GLxmxker5ql+a2W571AMZRoVY6x5N7QctbGs+WF0ugRhCRAPeTPLOQiQ==
X-Received: by 2002:a05:6820:201c:b0:69d:79ff:d3b4 with SMTP id 006d021491bc7-69e03ed0c41mr195254eaf.7.1780004719496;
        Thu, 28 May 2026 14:45:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-69e0413ebd0sm9874eaf.26.2026.05.28.14.45.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2026 14:45:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-bd9a6aae530so973970066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780004718; x=1780609518; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jFtFebur4e89Yp2GhL1rRJfGJOlb0c6RszvUZdfId9Y=;
        b=cVTSyLgsdG6SQRqw3xIVq4n6R5eKV6/F+nPb+atc8k81eNpahWlI7tW63YiJCkx0nu
         QjOUhCXywp5/We889Mryl9UnslpEQsIN8ixL5zEbzYpXEtjGogbfKamWHgmosSYZRXU0
         j8A2tnhu38ADmrbwwU7zS+cAOaFwcg5JIaVt4=
X-Forwarded-Encrypted: i=1; AFNElJ+sKNANVRR2sVtbHqEovsuyVjXBns3TKTWL4xLOeodN/zMC22VKj/gbACXKwlm+oQUkn4w97Wrxx2KZorG5hyUM@lists.infradead.org
X-Received: by 2002:a17:907:9307:b0:bce:804f:f199 with SMTP id a640c23a62f3a-be973e21a03mr53468066b.40.1780004717681;
        Thu, 28 May 2026 14:45:17 -0700 (PDT)
X-Received: by 2002:a17:907:9307:b0:bce:804f:f199 with SMTP id
 a640c23a62f3a-be973e21a03mr53466366b.40.1780004717186; Thu, 28 May 2026
 14:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231205184741.3092376-1-mmayer@broadcom.com> <20231205184741.3092376-4-mmayer@broadcom.com>
 <e63906cf-9f76-4fed-91b0-1a9168b179bd@linaro.org> <12f3c515-71cf-46a5-ad92-15bf6c4c2f2c@broadcom.com>
 <c483e962-a565-45b0-91e2-41f47e2cf4bb@linaro.org> <CAGt4E5smwohGsPkvFOY8o270mNQnTkSWz8UKh3un2=XtEibzAg@mail.gmail.com>
In-Reply-To: <CAGt4E5smwohGsPkvFOY8o270mNQnTkSWz8UKh3un2=XtEibzAg@mail.gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 28 May 2026 14:45:04 -0700
X-Gm-Features: AVHnY4LsuN8khH5Ub8nJHTjQ2-duCpid8nsrQhdGRehtA94tVmwnGX7LA3VIKfY
Message-ID: <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
Subject: Re: [PATCH 3/4] memory: brcmstb_dpfe: support DPFE API v4
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, 
	Device Tree Mailing List <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_144523_096543_F3A9F088 
X-CRM114-Status: GOOD (  35.32  )
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

On Wed, 6 Dec 2023 at 10:48, Markus Mayer <mmayer@broadcom.com> wrote:
>
> On Wed, 6 Dec 2023 at 09:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 06/12/2023 17:18, Florian Fainelli wrote:
> > >
> > >
> > > On 12/6/2023 3:10 AM, Krzysztof Kozlowski wrote:
> > >> On 05/12/2023 19:47, Markus Mayer wrote:
> > >>> Add support for version 4 of the DPFE API. This new version is largely
> > >>> identical to version 3. The main difference is that all commands now
> > >>> take the MHS version number as the first argument. Any other arguments
> > >>> have been pushed down by one (i.e. what used to be arg0 in v3 is arg1 in
> > >>> v4).
> > >>>
> > >>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> > >>
> > >> ...
> > >>
> > >>> +
> > >>>   static const char *get_error_text(unsigned int i)
> > >>>   {
> > >>>     static const char * const error_text[] = {
> > >>> @@ -929,8 +954,12 @@ static const struct of_device_id brcmstb_dpfe_of_match[] = {
> > >>>     { .compatible = "brcm,dpfe-cpu-v1", .data = &dpfe_api_old_v2 },
> > >>>     { .compatible = "brcm,dpfe-cpu-v2", .data = &dpfe_api_new_v2 },
> > >>>     { .compatible = "brcm,dpfe-cpu-v3", .data = &dpfe_api_v3 },
> > >>> +   { .compatible = "brcm,dpfe-cpu-v4", .data = &dpfe_api_v4 },
> > >>>
> > >>
> > >> No, use SoC specific compatible.
> > >
> > > This is not that simple because for a given SoC, the API implemented by
> > > the firmware can change, in fact it has changed over the lifetime of a
> > > given SoC as firmware updates get rolled out. Arguably the dialect
> > > spoken by the firmware should not have changed and we told the firmware
> > > team about that but it basically went nowhere and here we are.
> > >
> > > The Device Tree gets populated by the boot loader which figures out
> > > which API is spoken and places one of those compatible strings
> > > accordingly for the kernel to avoid having to do any sort of run-time
> > > detection which is slow and completely unnecessary when we can simply
> > > tell it ahead of time what to use.
> >
> > Thanks for providing justification, quite reasonable. A pity that none
> > of the commit msgs answered this way.
>
> The real pity is how this API was designed, making all of this
> necessary in the first place.
>
> We can definitely spell out more clearly in the commit messages what
> is going on and why all of this is needed. I'll pull all the pieces
> together from the various responses. As long as there's a way we can
> reasonably implement what we need, we'll be happy.

It has been a minute, but we'd like to resume this effort[1] to
upstream these changes or some variation thereof.

What are the best steps to resume this undertaking? There are still a
few topics where I am not entirely clear on how to better explain
things or how to address the feedback provided. My apologies for that.
I will do my best to address whatever concerns there are.

Should I put together a new pull request that contains improved commit
messages and addresses some of the feedback and we hash out whatever
questions remain on the new thread? Or would it be better for me to
reply to the old thread with some of the questions that remain before
sending a revised series?

Thanks,
-Markus

[1] https://lore.kernel.org/all/20231205184741.3092376-1-mmayer@broadcom.com/

