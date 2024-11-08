Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AFBD4335C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 02:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr8eRs4SHjPP0r1sxbAC2kP54V3AaKPgJpNWlRyvXaE=; b=jnbfKBOgRON3fmfwLDQROVd9hR
	56+G5sToNXcmhKvgjsKytnU2Nz8f+1pxZJeV/eQU1YodcrXIHsW8q0LJRFTOKgMtOYqnzZdC4mclX
	AuMSHGV1752t53IQ1IXwkA0Gx+tk377WB+A7+fQTCwiFpnvZFVpUyXBQXEJez7ZX/YKm9g5S48AMH
	wb9cXx5jLUfMSxwiJQ68X0BWB5dV+iG6FDHQXtJ8dKE8pCf0eHD6JAd6tEJUYw9jfRIqXaMn9bt3O
	sPQyKB5vR/HB4Bi+Llp0bAYemXTQ9fyVjowLX6Kgqur+i34xfptk9NMU158fYTnkcTkVsdTgz5qDj
	kBjSy3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ekn-000000091YU-16qL;
	Fri, 08 Nov 2024 02:29:41 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ej3-000000091J0-0miL;
	Fri, 08 Nov 2024 02:27:54 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4609e784352so10567721cf.0;
        Thu, 07 Nov 2024 18:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731032871; x=1731637671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr8eRs4SHjPP0r1sxbAC2kP54V3AaKPgJpNWlRyvXaE=;
        b=WwBA902o0bn7fZPCqxRexHVo1X0nEPoJCToMOdXQ6YkjcEbQidEmR/zptvucWnK9Fu
         xOnFVDPOM7elBpTX7wYDYbApHvub8ENUD7PDqSghg7YtjBNQALyHyQbw56BcQIc5bssC
         dR71KlidcdNI6FVlSMsdx6Y5DVtakDemBl4VgaPNLDl0XLyDidXVd7vT1N07X0mWFoK6
         6PI78z4nmF90e80GPH09jsEylA64yT14xmraEMuMAyezy5RI7MfAvTfWs7vxALCQEnDE
         8/RQFV/pbQ8fONXxldXfyH+mqvMRkgF58cp4jxN1naUwYphu3+3WVNnaVANmt9bsqD8k
         jj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731032871; x=1731637671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr8eRs4SHjPP0r1sxbAC2kP54V3AaKPgJpNWlRyvXaE=;
        b=Z0B/bbpw3+QIRpPAqiB96VyewUj3XmXmJ1V76AXbvhDC+zSh/qc1E/U7naDzZZ56Ci
         cwPREsl70AWc02mnUzAzTMKEzkWeAdYN7JUytrdgWxCxbtTtPvLjNaXllsNmMbSBM47G
         UODV5kg76hgd49YhWQZYgxaa5WjTsb1Tgky2seV1AkF1fegunsAIweXAiP0dYCMWfmiF
         b0i5VlGQfLY1Nn0u9Y6Sfjet+z90pAETq/nRV+AKzx42hmWXwFdgiv4mOYCFXXEHPBHp
         HPKQnfoIoZmJvVCdLkoaAg73w+gz37ToDvSieKAho6GtXE607JCRIKIMJ516fRx4qqqN
         p/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Zg5GiyxCLgZY0JOdbVdZAKkBKGo7BWNyGydc9Rp3LyR773yfOeWtLKE1lHo3X3EjTteHPcryX+gBjbFgi2Y+@lists.infradead.org, AJvYcCVquNxgLxfFciPJuIaMSIe6JvRgvqb5M3oVRaMHcL8UJ1SRUtq4Wwn4YjmjEcE8PAB59sV6A6YU76SPj3oqFYY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxC88dJSyNDghJN4kP5x+21eqGI7CUGjU6xCBa0bi8nNO4MYOKT
	+oDctHnICgnQRAL8iVv+K140qbWWa43NNy/2jQ7HunEsd8Ke1TzoU2DymsN2YHai9bgdDxIDQNN
	ZIl6GacvdFhZ/fjX6zcdOwtant3c=
X-Google-Smtp-Source: AGHT+IGstj8nLMBZdK2Z1wIjI3I7rWSl0VEyifRSPPCGHaKum3jtVpH8xqXOtRxg5JmV/A5VNiW2fozV+dPrbpUNYRE=
X-Received: by 2002:a05:622a:4e8a:b0:456:801c:a20d with SMTP id
 d75a77b69052e-4630930ee2cmr18727101cf.2.1731032871559; Thu, 07 Nov 2024
 18:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
 <20241105161820.32512-3-jiashengjiangcool@gmail.com> <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
 <fj2vssllh7zgl76a4jfakrcngcflwvqxzwwa2dhpkauli2u7wb@pz23fznmy25e>
In-Reply-To: <fj2vssllh7zgl76a4jfakrcngcflwvqxzwwa2dhpkauli2u7wb@pz23fznmy25e>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Thu, 7 Nov 2024 21:27:40 -0500
Message-ID: <CANeGvZX05=ePpV4iG2EAQtdnx1x7xNtmLXWe2iH7ATwChPaQpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: rk3x: Add check for clk_enable()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, rmk@dyn-67.arm.linux.org.uk, 
	max.schwarz@online.de, david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, 
	wsa@kernel.org, manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_182753_254582_44E98458 
X-CRM114-Status: GOOD (  30.15  )
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

On Wed, Nov 6, 2024 at 6:01=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Doug,
>
> On Tue, Nov 05, 2024 at 01:29:40PM -0800, Doug Anderson wrote:
> > On Tue, Nov 5, 2024 at 8:18=E2=80=AFAM Jiasheng Jiang
> > > Add check for the return value of clk_enable() in order to catch the
> > > potential exception. Moreover, convert the return type of
> > > rk3x_i2c_adapt_div() into int and add the check.
> > >
> > > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > > ---
> > > Changelog:
> > >
> > > v1 -> v2:
> > >
> > > 1. Remove the Fixes tag.
> > > 2. Use dev_err_probe to simplify error handling.
> > > ---
> > >  drivers/i2c/busses/i2c-rk3x.c | 51 +++++++++++++++++++++++++--------=
--
> > >  1 file changed, 37 insertions(+), 14 deletions(-)
> >
> > Wow, this is a whole lot of code to add to check for an error that
> > can't really happen as far as I'm aware. Turning on a clock is just
> > some MMIO writes and can't fail, right? Is this really worth it? Maybe
> > just wrap clk_enable() and spam an error to the logs if it fails? If
> > we ever see that error we can figure out what's going on and if
> > there's a sensible reason it could fail we could add the more complex
> > code.
>
> We've had this discussion several times. I'm of the school that
> if a function can return an error, that error should be checked.
> It's not spam, we do it everywhere.
>
> On the other hand, there is another school, bigger than mine,
> that doesn't want such a check.
>
> I decided not to bother. If someone adds the check, I'm going to
> accept it. If someone doesn't add the check, I won't bother
> asking for it.
>
> Said that, MMIO reads and writes can fail: in other drivers I'm
> seeing bogus reads due to some firmware failures during device
> reset.
>
> I agree with you with the rest of the comments and thanks for
> checking this out.
>
> Andi

Thanks, I have submitted a v3 series to fix these problems.

-Jiasheng

