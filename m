Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D15C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 20:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTOr9pYzPi2i26nHAmvmTE63STw7ueFb8JHzYoT0ydw=; b=WuvrYtiIaYLGlSK8J9Xg6glfkn
	mUVx4qsCxkewri4zy8x5jLC9jlEA+IzdKCAztSSzhjKvvOK0jtNKcIAQL4Zcx6798HLvkEM0sGFNJ
	ixoQzM/HJ7GZ0r5pNnhjZp5DeO4DcuRE+cnjz9NPQOym9RF0uE5tiRvy2rF4fXHjzH8LGr2XhMfre
	NOnV7RNyKUTApx+3ziZAzPWRJSlKc0i7jDcwA0CfNCwVJ3E/XzNB4wJmSFyMiIvtWG2rRhj4RWzEz
	MZwAxE7zwXKoImnWeW2DUzVD88by4LIh8Q7HVVpauInMlDxHLEpr1arKSpsLAhFLWaklEJR0mIvLr
	sommFaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAfe-00000006xaO-1ium;
	Tue, 25 Mar 2025 20:14:46 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAdu-00000006xF2-1Os4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 20:12:59 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e634c42a296so4650635276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 13:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742933577; x=1743538377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTOr9pYzPi2i26nHAmvmTE63STw7ueFb8JHzYoT0ydw=;
        b=RpU+JuxUkU79Ji/nyS8aC+6agJdDyCHfb1Sl4PjR6pmyOepSd9JgNi0Rpeifo4V6cj
         4ALlmoF8qFTR7XSaLxtDlaMVp3yTVJaROxJmOqvRmKAjMfy2R4XeKbZP+L8MCGwUwQIx
         6aL2VIkE1rH+r3n1Ofh2CEqZdXEPArT8Gf464=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742933577; x=1743538377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTOr9pYzPi2i26nHAmvmTE63STw7ueFb8JHzYoT0ydw=;
        b=Dvlkg+JKZfCiI8GMdGo5vF7i42a3Y89XIKDqh/mBQXH2e/2m6I0BcL4saXIP/plYIu
         sr6jjWf5Shx9GS9M+iGCR3WV8Ju7vZ2Y1nFlEtuk4SXc9rkYpuv8I0FSNi4bRjD1mmwb
         ON98HkTNcJwOe5ijM0nUNddpmKueF51XKKNQoDd7O5t9kHsOreu78hPU9U6LFkcKTNVX
         xRX5okmh9xRROXeyJFf1hBuOhRlAVBZHX+LadF+0aNmKttkq7+HCegKCcPpmy4uND3kd
         CS4SOYvhkalwDEmnjwcvIPTpmMffz+cj+8XDCqkBKfjCFfvFaqB/urKVHNvLfuNAgd/R
         pDCg==
X-Forwarded-Encrypted: i=1; AJvYcCWQZFNBIqbMLTWu5qJynQQcjz5zM0Cv1E+r/YIrP03qwUFV+S22UTQWmRBeEW2hB63rrCe49iPHUNWf6nqj8Get@lists.infradead.org
X-Gm-Message-State: AOJu0YyLqg6JtBd07QhXLORfgyk7X4bgHssl8PPVg+m+btUmOSbE3hd7
	bzQtrq2PdQWzA840Tlz9pYUsBSMjrIYxQtFfz8A9Ak7n9qYVwzBCXNcUvwQLRovVduQwOfbkSEn
	WUqgwJZ/AcVKCDMm0BLhWRq90npUo/qKPCRah0w==
X-Gm-Gg: ASbGnctzZ1JvOfpVtRHz4ZDn+MWGP9V6ZL4JCfY2Jr2D7Irt5T5juEqKlMa6BjwVZ54
	9C21mu9wMsQKXyhcaSuJWLIT2nZz/HB/E+Bso6H+kzLKlbX0YPjI9CjfKe2VV3RC+EIoPzGfin0
	C+6tGGRRfENN88fJ/LzUN1leYi7Uoe8KcyjDm2QdM8Cl+UaKC40wpp2Kxm1eY=
X-Google-Smtp-Source: AGHT+IHshVRxFVSRgmqNOPKSsYowahAI37eYtNiXXANKyrruJ3NhdMG0ruC6NnKn7RBoC8thTuxakfabVjdrFAm4fME=
X-Received: by 2002:a05:6902:2385:b0:e60:9821:32 with SMTP id
 3f1490d57ef6-e66a4d972acmr23048136276.20.1742933576648; Tue, 25 Mar 2025
 13:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
In-Reply-To: <20250325195322.3243734-1-catalin.marinas@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Mar 2025 13:12:45 -0700
X-Gm-Features: AQ5f1JroGLoPpd3BNG2lfW60X7dg8N_A3CClyCmOuMjw7azzcTshfNG8StJqxrQ
Message-ID: <CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_131258_388128_84E9246C 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

On Tue, Mar 25, 2025 at 12:53=E2=80=AFPM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> Please pull the arm64 updates for 6.15-rc1 below.

This was in my spam folder. The reason is that your email
configuration is wrong, and lacks the proper DKIM signature.

You have

    From: Catalin Marinas <catalin.marinas@arm.com>

but it doesn't actually have the DKIM signature from arm.com...

It looks like you sent it through the kernel.org smtp server using
git-send-email, but it doesn't have the kernel.org DKIM either (but it
may be that kernel.org only signs things that say "From:
xyzzy@kernel.org").

             Linus

