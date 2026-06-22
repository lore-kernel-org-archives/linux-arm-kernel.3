Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3BBCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 20:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/eI1igp0jhTQQcKbkxniVkr0wAf2k+Z91+811cqNa0=; b=wXIdNpcIEGLF2z7he+QJL3YTPi
	ZpnciWu7euBafsuOhkoUbrx+Fi8eGL8j5a8QeKUh0lheFj5WUoJp+QqaEbX3cMVm5g3jKJj5rU0fl
	uCfpLBGgnS0JPuIIb8i4XSf2SyqXqz6u5ipXJ6sXwcL3F/uoKxdHIujiRFgO3p7BD4011+pw5seLZ
	c14LdcIQX/yFZIdw2tW5/BH+FEnrfL/6U+Nie/Z4iryJDr4aH8G522XdbeM/Bwvt1p11iyGZ4ZIAI
	/SLDbXfA4rt3uqP3GfjPrHooha6y5fL4Wq0ULGmrdwEX8MhxaesCm89PfA4dQKTrfXV4wIb4D/l8E
	7aJAoDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wblQ0-00000005N2a-2P74;
	Mon, 22 Jun 2026 20:38:56 +0000
Received: from mail-yx1-xb161.google.com ([2607:f8b0:4864:20::b161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wblPx-00000005N2E-1l2K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 20:38:55 +0000
Received: by mail-yx1-xb161.google.com with SMTP id 956f58d0204a3-6611669cd16so5806690d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 13:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782160731; x=1782765531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/eI1igp0jhTQQcKbkxniVkr0wAf2k+Z91+811cqNa0=;
        b=dKgr+dvHxgypI9zZvJL8vId1P1+bq9D4Pi53tJ6N3uP/5Y6n3OeA2WNHg8hvQmvPzS
         eo/UrcDQnG38fC7PhffFXPgWPVxJu45J8Be4VB6QtYRt6WQ6KzhW5wOzQYsoWoW+V3Mg
         1UlO6IhFYHyZyOXvvfVXsJhgGR9MJo4g8GDmCFOhPr5p/ZB1q+sPNKnb8xXp+RimyA2F
         3vDDX5KyR7Zh2+fG2ZdoVTAKjp3J4BXQnMHziblvcR2UXnDd33bLFPc+CpQlTMbJXooX
         DjupMpE0Xu1WGRiqXdPcezWxU5mZFFjL8ZesoM9tA4yWoCJtwCELC3uutafjmUhTnYQf
         ypHw==
X-Forwarded-Encrypted: i=1; AHgh+RpDMl3w4L2VaPN2y4sM4IwI07Zy5YO1aZktE63oKTFkGshikubUD4KddYC9ZUTQBEV/aqlzW3ij6D0911Ccs1XJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzNbO6bvKykwWVPM8pp+OWraZJV4Z9ZNTUoOjdlakxQjpmiOEwp
	nj4PgB3MyHEflUG1HYqhF1JSwBG1x4rGTnUvvsg18O4Wu8Dkwrp0OJ8eAuu+EMhkIX6KOL8asvi
	92ogzE6bSMuAFzSGZ76/1IAL8zQs0rSQHx/P38Oz5kPDSpLM7qot7PQm2q9MTlu5Jm0N+hXp+6j
	Tb5mjEJ63C2sVFf2kSftMcYsDCb0yPucJ/WEUJCn7T2dy2WdIddnTGagrvs4laslcMMXwhMwOxH
	YGctfZZ4IgG90dVjvO+yYTOuIbln7U6
X-Gm-Gg: AfdE7ckh2Ig+oBP5EJxAgCFs8+NsCFCR/zu7i3EiJl4J/OR/dP96WWRzKYVKFQEWSqE
	cD8OiM4qZCKCgqkGYgFDdOrs3NUKniUDPGFXw0nDfMsJt3esIWZj7GV4Rpeh/EeXQSgjkBl1xfc
	Dt0STbgLoK/yb18X8eqH/D0SX3/ltdFStwN06OZwk/aqm7k7Ju8FUa5GT4Hud4csOhZMQ2KDBBW
	1CgEdAjhBL9ovftSVqBhCcHklLm6fvsDiyWpBwJ0uD6WiOaCEjTc3SznrCg78YTtP6r6uRTPeEh
	nBdip+M9dASD+bOVbQ2d0uhyYjtuO4JVk/6q3IUlBgGZHXU5Z5S8Mg+ik/TxDYiX8pvv03s6IxH
	5HCzk9sQXpjbSA8FO8diXPDL2Spw4F53Nc7R9N3dvLLMmNCeo/bNv96UVCE1AQ9n1nJLhlstP1i
	VgwkNn+t3h3h5t/WNgyx7dzS6tIYOQxeCFdWNMpfHCedtE1sgQ
X-Received: by 2002:a53:e046:0:b0:660:4936:95d5 with SMTP id 956f58d0204a3-662ffed721bmr11095929d50.40.1782160730888;
        Mon, 22 Jun 2026 13:38:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-66314ce3621sm541259d50.26.2026.06.22.13.38.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2026 13:38:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-bfa400102d9so511576166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 13:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782160729; x=1782765529; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/eI1igp0jhTQQcKbkxniVkr0wAf2k+Z91+811cqNa0=;
        b=FQRdMhLYn/LF3kl/zUuQWCTfRHJW7KSBOpHkCTZWETC/MqqoJgTvJ1kNDNm8LaiEEi
         ww8xzB0110ciJO5dA36glPx67uiSkDd/aInaWfLJK7kZ4LgkQ3wGZMcp8te9s5XgkviK
         g4OXF2ga3avESTuo9ZSsA97HPUbeD9htU0iE8=
X-Forwarded-Encrypted: i=1; AFNElJ+Jr4r56oVETjveQ0lAy2FGwbNumceZFztzRHD+YQFpB53m2WTl747h4sHti9Mjm6ZmgB1/F3e9WsLjNgZq/ty6@lists.infradead.org
X-Received: by 2002:a17:907:60c9:b0:c07:6a7e:3a4c with SMTP id a640c23a62f3a-c097cbc92c0mr971238366b.40.1782160729197;
        Mon, 22 Jun 2026 13:38:49 -0700 (PDT)
X-Received: by 2002:a17:907:60c9:b0:c07:6a7e:3a4c with SMTP id
 a640c23a62f3a-c097cbc92c0mr971236666b.40.1782160728684; Mon, 22 Jun 2026
 13:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231205184741.3092376-1-mmayer@broadcom.com> <20231205184741.3092376-4-mmayer@broadcom.com>
 <e63906cf-9f76-4fed-91b0-1a9168b179bd@linaro.org> <12f3c515-71cf-46a5-ad92-15bf6c4c2f2c@broadcom.com>
 <c483e962-a565-45b0-91e2-41f47e2cf4bb@linaro.org> <CAGt4E5smwohGsPkvFOY8o270mNQnTkSWz8UKh3un2=XtEibzAg@mail.gmail.com>
 <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
In-Reply-To: <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 22 Jun 2026 13:38:36 -0700
X-Gm-Features: AVVi8Cdf8blAzch-m_uqCV7tC2oS17aknTGmI48yeh3qAuFBG7a4R9Q-ey1Q_vU
Message-ID: <CAGt4E5vemtkfpdz8k8mS5LeZF4SzZSgm0d7OORtDonagF=hwYA@mail.gmail.com>
Subject: Re: [PATCH 3/4] memory: brcmstb_dpfe: support DPFE API v4
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, 
	Device Tree Mailing List <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_133853_540591_B60D00D6 
X-CRM114-Status: GOOD (  24.28  )
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

On Thu, 28 May 2026 at 14:45, Markus Mayer <mmayer@broadcom.com> wrote:

> > > Thanks for providing justification, quite reasonable. A pity that none
> > > of the commit msgs answered this way.
> >
> > The real pity is how this API was designed, making all of this
> > necessary in the first place.
> >
> > We can definitely spell out more clearly in the commit messages what
> > is going on and why all of this is needed. I'll pull all the pieces
> > together from the various responses. As long as there's a way we can
> > reasonably implement what we need, we'll be happy.
>
> It has been a minute, but we'd like to resume this effort[1] to
> upstream these changes or some variation thereof.
>
> What are the best steps to resume this undertaking? There are still a
> few topics where I am not entirely clear on how to better explain
> things or how to address the feedback provided. My apologies for that.
> I will do my best to address whatever concerns there are.
>
> Should I put together a new pull request that contains improved commit
> messages and addresses some of the feedback and we hash out whatever
> questions remain on the new thread? Or would it be better for me to
> reply to the old thread with some of the questions that remain before
> sending a revised series?

Any advice on how to best proceed from here?

Thanks,
-Markus

> [1] https://lore.kernel.org/all/20231205184741.3092376-1-mmayer@broadcom.com/

