Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0505CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhK/MEz8Ecu1hdCgykapg7g4X65fg6YlqCenM+/UkDQ=; b=RyWOmfXRiXCfpJt7Qffvr28xOx
	8LWkdavvIWvjP/eB1P9btR9CHauz2B81pCnD0E4MPJ6UNVzo6OEYNrqwtvirfPilPiYVn5KNZF9E7
	0YInpk9P6/2pGw5stMFRwfuW24gZyF119MtWXlFSSVI8/SPprvi5hgiafVKLGBRh3S/lt9Hd0NIaD
	MWgLYJ1v6yhU4ZscGGNRvVq3klwyy611dMD7Txe4OiDNGKwSn/x+5zk6TFVJrlxnwJcc0GMOYYfPD
	rMB0CLq8fybUaB/yVgJvy4f1x2+QXQYeLXZ9hgLGJW0tNp6ev6pfhAtTeuS6NEIPDFqiqrwyo8kht
	T+GsVVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSibz-00000006QLj-2aVp;
	Thu, 28 May 2026 21:49:55 +0000
Received: from mail-yw1-x1164.google.com ([2607:f8b0:4864:20::1164])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSibx-00000006QLM-0NUP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:49:54 +0000
Received: by mail-yw1-x1164.google.com with SMTP id 00721157ae682-7cd35604a95so129631267b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004992; x=1780609792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhK/MEz8Ecu1hdCgykapg7g4X65fg6YlqCenM+/UkDQ=;
        b=epBVScxeavjHL3t2k0tBhf4SE+PDj/B4zAiCxQYdBAz8XhBErDgsVM1m5/ex44p8Ls
         +G+TB8o2GER7oPtWYw8bpl0HdW3poHIrRD+1XlVmA+C3KyIz0s8haWSf8SZxruX1X3rg
         2B5/IccBNdfpA+M9gMasXMSTMahTs5slgx0RQsh0IfQYAdcQjKl5DzRMZNGMNIIOfbaM
         JmF9S5k+1F3zWCzK2XIULpkkqYB30gtmDRWXqU3ytcwufnxE1NAcPf+OybfsdvTes4j2
         O6bU0RdwKOUMe1sfNEKDDIgzvRcAemiVFuE1to/1GUDvwclg1mI/knmUG+DqOxdeXuB7
         aAWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OgUjuiaJLMfRAb7XBs/SSAI0D1+TSdCEescGEG/yyKhOseDhXVj8QHn2Cnpk2r49moMbv6IVj8DDSurynBNK/@lists.infradead.org
X-Gm-Message-State: AOJu0YwJtL181zEkiaZwVS45CJoFVvU+kMZKVYUj22J7MxPvZ8b21Bec
	Kyn1AW4xvHGaaRvIZZrre9xZiZIHjabP3JL1OSgzUKS6Zdlp4rQ/g+tpsJhn5FOmHGStz2J0CgF
	Y7GipyanHOTP+dL9tn/aQFBtpWSQq5msELjt1PjDc3A9ak2UByUqRxRegE/ItKW6WLKpUtUAr6+
	2AvEHB0+HKINGh/umVBd9jZHKVJ9PU+a+9fntCRMrKkiBZeAj5kJzDbrQizgfyHkrSKemAJn8VJ
	3IcH4FLICxcblL/h5r5CaQcjTFEuWX3
X-Gm-Gg: Acq92OFcvcoQ2Oc+jjOP2SKV/m0q9XZboPxkYsvpZzK9DPbZJQvyo6guLPJYo3aIdSP
	wJIn2AZCoMtYLmrIUXkKJ/w2oeMebVnDkaMH5Tt3WTcc4/hLHQskiIYx7BPTLjqlqSDKIeGlpUR
	mImENEHImA6QgP+kuQw7IljMtw6bsDHfUQbx4NI6fOJTFdXujYEP1LpVewMu9NurnILmLsnYLiH
	8XLyEv2EVJAZHZ1roqhVKI3h9V5aDJaQ+Oth41K+ksQ5x3w8FLg5x8l69pIXHi9asq63e+lj75a
	iTZlzV/s2xVLsPLUnN/CnlEv/dO/WtWaJHNSSq3L3tZ9AWyGlVh/LF8wXxiO6y2x7kOOt51Wfdb
	7DMfXO40LV99ulbEGSEG1hGsvKMQUpw/OKxL+PXeL7MUqsXVktYFomiJx7Al5OiOcak/F2FjsAZ
	XuSfrxYHS+QbbvGzYXKVWeANuIgzwdSsTJEoYfyA1oU9ZWb09Ut4JWtf3mhqzweD9QTu4Owg==
X-Received: by 2002:a05:690e:b83:b0:64a:ce57:cac4 with SMTP id 956f58d0204a3-6605165ca92mr88489d50.24.1780004991868;
        Thu, 28 May 2026 14:49:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6604e10fcb1sm35085d50.0.2026.05.28.14.49.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2026 14:49:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-bd437b46a32so130569866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780004990; x=1780609790; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yhK/MEz8Ecu1hdCgykapg7g4X65fg6YlqCenM+/UkDQ=;
        b=ax+PCA69cM9b0j7iwUBFigBBpTzC70QegIFvvDP+8j8qekl/g+SRKsdXAC4I6OkzK6
         N+nLCo8Np4a+0sW6ql+9poeLaILxuIGamQ/dVYm8yeS5iwKJfvlzj3EXQyO0fJmwV2SL
         I825ECq8A8zdzwEyTaKkGXeB7abTHpUR76aW8=
X-Forwarded-Encrypted: i=1; AFNElJ9GQDuogmX0z28KmuCg4rUUbAh455Xzr1FIGzkfeQemQJRpH5mWga8QTYyA9CsCHjsJj9frkHtadP8MvBdQYR9E@lists.infradead.org
X-Received: by 2002:a17:907:c807:b0:ba7:41d0:5efd with SMTP id a640c23a62f3a-be9a7fab0damr13865566b.28.1780004990250;
        Thu, 28 May 2026 14:49:50 -0700 (PDT)
X-Received: by 2002:a17:907:c807:b0:ba7:41d0:5efd with SMTP id
 a640c23a62f3a-be9a7fab0damr13864566b.28.1780004989776; Thu, 28 May 2026
 14:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231205184741.3092376-1-mmayer@broadcom.com> <20231205184741.3092376-4-mmayer@broadcom.com>
 <e63906cf-9f76-4fed-91b0-1a9168b179bd@linaro.org> <12f3c515-71cf-46a5-ad92-15bf6c4c2f2c@broadcom.com>
 <c483e962-a565-45b0-91e2-41f47e2cf4bb@linaro.org> <CAGt4E5smwohGsPkvFOY8o270mNQnTkSWz8UKh3un2=XtEibzAg@mail.gmail.com>
 <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
In-Reply-To: <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 28 May 2026 14:49:37 -0700
X-Gm-Features: AVHnY4L9UkUBZVKtZIeHcLsjwHBic26vGpnAXVLZgeTiH45cXBZqkqDCVGgyvmo
Message-ID: <CAGt4E5v+=9UpHFV0fv-gNXqF+N38C6+gpAkengNR-NULS+sbCQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260528_144953_162371_F39391CC 
X-CRM114-Status: GOOD (  41.54  )
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
>
> On Wed, 6 Dec 2023 at 10:48, Markus Mayer <mmayer@broadcom.com> wrote:
> >
> > On Wed, 6 Dec 2023 at 09:32, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 06/12/2023 17:18, Florian Fainelli wrote:
> > > >
> > > >
> > > > On 12/6/2023 3:10 AM, Krzysztof Kozlowski wrote:
> > > >> On 05/12/2023 19:47, Markus Mayer wrote:
> > > >>> Add support for version 4 of the DPFE API. This new version is largely
> > > >>> identical to version 3. The main difference is that all commands now
> > > >>> take the MHS version number as the first argument. Any other arguments
> > > >>> have been pushed down by one (i.e. what used to be arg0 in v3 is arg1 in
> > > >>> v4).
> > > >>>
> > > >>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> > > >>
> > > >> ...
> > > >>
> > > >>> +
> > > >>>   static const char *get_error_text(unsigned int i)
> > > >>>   {
> > > >>>     static const char * const error_text[] = {
> > > >>> @@ -929,8 +954,12 @@ static const struct of_device_id brcmstb_dpfe_of_match[] = {
> > > >>>     { .compatible = "brcm,dpfe-cpu-v1", .data = &dpfe_api_old_v2 },
> > > >>>     { .compatible = "brcm,dpfe-cpu-v2", .data = &dpfe_api_new_v2 },
> > > >>>     { .compatible = "brcm,dpfe-cpu-v3", .data = &dpfe_api_v3 },
> > > >>> +   { .compatible = "brcm,dpfe-cpu-v4", .data = &dpfe_api_v4 },
> > > >>>
> > > >>
> > > >> No, use SoC specific compatible.
> > > >
> > > > This is not that simple because for a given SoC, the API implemented by
> > > > the firmware can change, in fact it has changed over the lifetime of a
> > > > given SoC as firmware updates get rolled out. Arguably the dialect
> > > > spoken by the firmware should not have changed and we told the firmware
> > > > team about that but it basically went nowhere and here we are.
> > > >
> > > > The Device Tree gets populated by the boot loader which figures out
> > > > which API is spoken and places one of those compatible strings
> > > > accordingly for the kernel to avoid having to do any sort of run-time
> > > > detection which is slow and completely unnecessary when we can simply
> > > > tell it ahead of time what to use.
> > >
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

Updated the e-mail address for Krzysztof. Here's the original mail
from a few minutes ago.

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
>
> Thanks,
> -Markus
>
> [1] https://lore.kernel.org/all/20231205184741.3092376-1-mmayer@broadcom.com/

