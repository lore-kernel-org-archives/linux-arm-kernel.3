Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C6ACA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 00:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktkbla4NPIaC9jC6psct3vSFUUII2FVq3tu2TmWqa/E=; b=BVYGnpTHpZxaNDuc3/nu8tcwiD
	zGBXxkKzk+PbuEtJNMNFJm/5DQwlWlILqZTbSCuaGIPWZ4n7YD8xmbLwTHV3c3FTYS+sHTiF9vPi0
	JAB2L+RtAnfb/tbSs9rKYadrmQ6ZKdjChdrV90bM5G/9MRPOx05uParKsoC2/5/RcM8551OuqkjEq
	rQy/ERWUnMTZ33zMuO0/0UB8mKl1L1g2wXO6OZRIVAQ7YRhAcp6GERgf85C/oN6dAnoTDSi+Chse3
	6rz648LVGRW5oc0OmQSabunBwh/BHpesAX1XuVBkVuL5imF7/UqVfKzIjkbLTfKlOjF8SDNEvPtZP
	Ew4QKxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussI5-0000000Arct-3uL9;
	Mon, 01 Sep 2025 00:20:57 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussEQ-0000000ArNq-3mgm;
	Mon, 01 Sep 2025 00:17:12 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61cdab7eee8so5045829a12.0;
        Sun, 31 Aug 2025 17:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756685829; x=1757290629; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktkbla4NPIaC9jC6psct3vSFUUII2FVq3tu2TmWqa/E=;
        b=VzFObhKBtqB/tzokicnV21LP7MdDnTK4PUaWQ/9mCg1oJSyzO8WCG8RGkKnp7IY5T/
         iaf57ukbqgKvpR4yvxlJT+oXOm2hrX17645cRWPsHipTUIW3PU3vtA5Exl/EQb/mJvCN
         bxdAr1/zbFtZPZYEOYusp6y2/G/z3IGx6FbrHc2rlhHAMsXW/0uALsQWW0LpYW9Fbdjf
         RBw6/YigZ6FzqO8GrjGk8guV+jBNa1x4xZwrOhWrSlzC8HTr+YglXr7W6vHkfF7QWeZN
         G/DQT4Ql/q068Qo9rPL8wvSC24dpzOEMflIfy3ZJI1Qt5BQok7ShmRUCftacEFqeHnwG
         O2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756685829; x=1757290629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktkbla4NPIaC9jC6psct3vSFUUII2FVq3tu2TmWqa/E=;
        b=EhKc1KtPVUbcjxsqdfnrkks5EKyrbgybb+wJLObxJgbri4YD+C6fhSfgATDOP1bzfQ
         Yoy8vaOdgZkct2M/cKY7o1Roi2d3HQj+TPYYt0rJvKU+OM9EwiThJby7gRwTNMt1OQUj
         aBUbY33aKMvvvbb5YrMjv901NvQCz3JGnZZef6kHrlGNYXcgPesHNhUPGefG3ETQF46f
         f89xQttZFigsWwEMwn749TfcfKRAnrw+nGhzgTTim0GTm6lYQNOnHeFQYDQWqG0op1a4
         gyLGWCO5i163Pm4fp2YVbg4BZTRw6hYETbGiPIWSMMmrv9nwLrmZqmTgFmB3UsFmw0qX
         rpCw==
X-Forwarded-Encrypted: i=1; AJvYcCVcNFMK1tpC//L+VX7AUZcEGq1aTHze32473KRbHUqf+/OOexXQpZUE+pNOIfwsjKAwvFGmXF9Kw2Suq/gwF7XG@lists.infradead.org, AJvYcCXsdoMMpjiaIARkrSeSbX3YhJ9ydlV0dO1ZqiwbJMWqKvOcf1HZNQp61ZZvHC7AWPmLPSvR7oWBj7+LHwTK3L4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzKlRPdj+YAZYbeCQSZ4vITrrvr0yQGZZRAg2GNju+hx2DXxIM
	gRyAag/JxuIEXuFW5Qy8c360ZMDSf5MTQPxc2ipFu3iHYqZz99IJNg41F9haf5G82Y7L37pl/7H
	34T1ojSgaJ/a6nx363bcYPZPeHRITvhc=
X-Gm-Gg: ASbGncvHCABeOXZXRrFGr0MKDWDjcc3nMz+4TmSqPxOYS0zxnk0w70p8EmCzfJz+baB
	S1l8ZKypkdBqJDYz91zW0M2JUb6T9Oiwc+mIRuz8TTgzN5AujZjNbAZp9ezC/tXd5qfcQgE909E
	Y7yjKkNnOaZg71mKiMwShrlAoydSDGFFrqTOYlz8+SzwtJYnqcDRQQljt8rsnjVNklxf9u3lxql
	Eg3/Vr5oAjArg==
X-Google-Smtp-Source: AGHT+IGHE8aXMx7ALK07ZZk4ApSRlHpCLRxAscpFITkZtZyfxE5oqk93LXZDU0pPe6ZM5AlFYhwbpT0EWRO3nMFED/w=
X-Received: by 2002:a05:6402:13d0:b0:61c:cf8d:e51d with SMTP id
 4fb4d7f45d1cf-61d26d78f71mr5111270a12.22.1756685829050; Sun, 31 Aug 2025
 17:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <20250831104855.45883-4-cn.liweihao@gmail.com>
 <2235041.irdbgypaU6@diego>
In-Reply-To: <2235041.irdbgypaU6@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Mon, 1 Sep 2025 08:17:00 +0800
X-Gm-Features: Ac12FXwV9Ji8b_vqPwpDGDVUUVyRfoYaArbF6DLUc5xbBllmI6nYQLBSmIsHBpA
Message-ID: <CAPEOAkQYA+XSx9QJSmNFLypH0ifE1jvui=MHiEHZ+5a3SR7=uA@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_171710_939415_2A88A7CA 
X-CRM114-Status: GOOD (  18.02  )
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

Hi Heiko,

Thanks for your review.

I actually used script to get the maintainer list, but I was not sure
whether I should send-to or cc every maintainer, so I consulted the
AI, and the AI said to try not to do so because it might be considered
noise email, and only send it to the main maintainers.

Should I cc all the devicetree maintainers with the next patches?

Best regards,
WeiHao

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=E6=
=97=A5=E5=91=A8=E6=97=A5 23:00=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
> Am Sonntag, 31. August 2025, 12:48:51 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> > Add a clock id for mipi dsi reference clock, mipi dsi node used it.
> >
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
>
> you missed a number of devicetree maintainers, Rob thankfully does
> not need to do this on his own anymore.
>
> so please get the appropriate list of maintainers via scripts/get_maintai=
ner.pl
>
> Change itself looks fine though.
>
> Heiko
>
> > ---
> >  include/dt-bindings/clock/rk3368-cru.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindin=
gs/clock/rk3368-cru.h
> > index ebae3cbf8..b951e2906 100644
> > --- a/include/dt-bindings/clock/rk3368-cru.h
> > +++ b/include/dt-bindings/clock/rk3368-cru.h
> > @@ -72,6 +72,7 @@
> >  #define SCLK_SFC             126
> >  #define SCLK_MAC             127
> >  #define SCLK_MACREF_OUT              128
> > +#define SCLK_MIPIDSI_24M     129
> >  #define SCLK_TIMER10         133
> >  #define SCLK_TIMER11         134
> >  #define SCLK_TIMER12         135
> >
>
>
>
>

