Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28783C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oua6uu1FsiEG+FbQxDQznAhdN0yrac6Ee4wtUSAb7QQ=; b=X1kxp9jQfRKppr714jLpG2n/Tw
	iUK4UdbSSWW8zoC3MwRauGBGCCy/hCryfOLD6sYNqyF1CBt5X0oUbPl7U5siE6y3A16peJODgrmBz
	6MPvc48slDmMdD2BrlZLfq4zX0cwKtu1KN3x9hbUbdQO++4MAZTom2kBczGybiCl7/htkb/lrRh96
	Lr5uQo+JDVun83evNUXw+tNzG0RynlkckQ5n2d+bnaZYT39gbJYF1wC5SqLkO51xBl+IEfA5+nwbk
	5b+EwyYxq7T70eBRSVgObzENht4ZF5mI8ZG8lMxkM/6okdF3uSW4uNWidnaFDcn8OMNvRUiEIRyr8
	mL+irdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQs3-00000007YH9-0WdQ;
	Mon, 11 Aug 2025 11:39:19 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQb3-00000007UoB-1E8i;
	Mon, 11 Aug 2025 11:21:46 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e903140d6c8so493340276.2;
        Mon, 11 Aug 2025 04:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754911304; x=1755516104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oua6uu1FsiEG+FbQxDQznAhdN0yrac6Ee4wtUSAb7QQ=;
        b=QE1Bm6mIj5TsOk59mp8WwcmfF7KEDjpT0k+kDlft6StJhPXQzQT6eR9rjkEXjwv694
         epMiswWV4BcE//fM3YWQObd26y/6iVPozwMlsJya0SP7UppZMGdpbjYRNVBoEeqD1yAJ
         7y+Uh2ivYKlYFgemgLD1WHIib2Q8xSQQZqNswXStE2V6yLq6m3Fi+JPWicDXfNKEAnuS
         /jQWYhRfrZNO6XAwecjvpaHpq46B03BFthsU0gxBpkW4El/1czp2uCtngLPSVWi8kRbu
         jl133whJAH9CZ73xKl71M/AZjvHzYo/lavdaxBazChDvTTr2Pa4MyagP8Bql/2oW1I5B
         5PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911304; x=1755516104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oua6uu1FsiEG+FbQxDQznAhdN0yrac6Ee4wtUSAb7QQ=;
        b=bcYZGJ3c1YhOLYErx0ZvyklppzwIR++ybOYsIv9KLEl9eb98FPcxZQHT4pderaccV4
         pqptVApBNoeM5HPZLwTNjzZBVwNjpktY1mi3fr2Z5C3T2EBQW5OAoqTj9xTFTmbc3tWK
         Pz5O00n7qBrTr9D0igHAgXQoEqK7iFo4HYuisDDc8VeHoSTI+eMvMamJ3Vkt3RrUKZ3B
         /ZpBdFf8vc3OClz2N+6Q/6rMHihmm6X/41ZmVA0FLkwP0QNkYgbKXCzwNtT08aaeNJqN
         JK6uOETvvNl3nrACBDTl4g8Vj1whao17/oMnDu4kSssBMF7dO3xIobmn+3G6VvWaw5sM
         hnZw==
X-Forwarded-Encrypted: i=1; AJvYcCVitZgOqokvtOXLqNPH+gmZWts3hZzj7omVKaFSqoivrQEkoI9U4SW4jcWWba7zNtASdvz1+1dZKJKrxnepvJI=@lists.infradead.org, AJvYcCX/eNKOU6Uxl/NZFOTuHgfCTiDP+Xc1aycCemovHMRjWwhPz0c7IGKIZZVkLXdRWE64ovSUH5jLEsZ/iOmh0w2x@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz1LJLYPrjY2RYyy6RNvujcErsDFHKnEfR4LDOjHBwnw86/jzc
	gtpgYV0D02/fLkQFr/ACH2V8fmQRE3wSShOJQCi3yG1pm7+oLpJIamh3vGF+YPDmRpjrWiXzGZ7
	ulvyMFbDBlRRb65pXwmANqyX5xP5ObCCABYT6AWnGAw==
X-Gm-Gg: ASbGncvZavfKIbmm8Vb1NgA8f2ooCcGZXyTT+EuwIrLFh4r4u5Q0URilYaiNUBOaOXU
	Rl0G68awP4BwheqMQwmyLZHlnjcjsy105JPJ89/PVQmEBHEyxMbf6vTscA6lMzf/PD6jpRADXr3
	MyOd6QpB5uejyhjVoFG9WhEQc5BZP6pHXKYfCjR2q/NSdlV/XAufuFuMCgZApMMu2egL3kai7zk
	M5d
X-Google-Smtp-Source: AGHT+IFal31QTX372Rt1MAx31/CoJRJqKRAhiiSHSEoIDYyMcyqwKzlo0opbeNHOvKi39NcCyTZhsFoMxqBqcu6XHeU=
X-Received: by 2002:a05:690c:630b:b0:71a:2130:a8ef with SMTP id
 00721157ae682-71c083d4aa4mr54748447b3.7.1754911304256; Mon, 11 Aug 2025
 04:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
 <20250811081543.4377-2-ot_shunxi.zhang@mediatek.com> <b41749ae-640b-4911-976f-8aa36d40ed6b@kernel.org>
In-Reply-To: <b41749ae-640b-4911-976f-8aa36d40ed6b@kernel.org>
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Date: Mon, 11 Aug 2025 15:21:25 +0400
X-Gm-Features: Ac12FXz5R8bUd6DGN4oYRK6orLAYYfuyZ4YZlmfC6PZBO9X7PAQ1xeup1WjaCmM
Message-ID: <CAE7dp2rxfgj6FKoM-kesX8632t3AA7Lk5rC-uasyQUS2hQuUfQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU register
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ot_shunxi.zhang@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_042145_335860_C7B7CCF9 
X-CRM114-Status: GOOD (  19.72  )
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

Cc: Krzysztof Kozlowski <krzk@kernel.org>,
    linux-mediatek@lists.infradead.org,
    linux-rtc@vger.kernel.org,
    linux-kernel@vger.kernel.org

Shunxi,

Can you confirm whether `RTC_BBPU_PWREN` (bit 0),
`RTC_BBPU_CLR` (bit 1) and `RTC_BBPU_RESET_AL` (bit 3) are documented
in the MT6397 datasheet (please cite section/page)? They look like
standard RTC controls (power enable, clear/reset, alarm reset) and
might be useful to include, but I agree with Krzysztof that adding
definitions with no users can accumulate technical debt.

Suggestion: either
- add the definitions when a driver actually needs them, or
- keep them now but add a short rationale in the commit message
  (datasheet reference + intended use) so future reviewers understand
  why they exist.

Also: please split cosmetic whitespace fixes (RTC_BBPU_KEY) into a
separate patch to make review/merge easier.

Thanks for the patch; I=E2=80=99m following the thread.

=E2=80=94 Giorgi


On Mon, Aug 11, 2025 at 3:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2025 10:15, ot_shunxi.zhang@mediatek.com wrote:
> > From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> >
> > This patch adds new bit definitions for the RTC_BBPU register in the
>
> Why? There is no user of these. Don't add useless defines.
>
> > mt6397 RTC header file. The following bit definitions are introduced:
>
> Hm?
>
> >
> > Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> > ---
> >  include/linux/mfd/mt6397/rtc.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/=
rtc.h
> > index 27883af44f87..001cef6b7302 100644
> > --- a/include/linux/mfd/mt6397/rtc.h
> > +++ b/include/linux/mfd/mt6397/rtc.h
> > @@ -15,8 +15,11 @@
> >  #include <linux/rtc.h>
> >
> >  #define RTC_BBPU               0x0000
> > +#define RTC_BBPU_PWREN         BIT(0)
> > +#define RTC_BBPU_CLR           BIT(1)
> > +#define RTC_BBPU_RESET_AL      BIT(3)
> >  #define RTC_BBPU_CBUSY         BIT(6)
> > -#define RTC_BBPU_KEY            (0x43 << 8)
> > +#define RTC_BBPU_KEY           (0x43 << 8)
>
>
> Why?
>
>
>
> Best regards,
> Krzysztof
>

