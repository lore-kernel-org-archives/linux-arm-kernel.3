Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632CDC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E39Ml7fCBZbxfVHzjpdOttpEvi9Y8jkd/560+rZTYD0=; b=Sru+WMVpSAnw7nzpcFHzu7joAt
	yKtAtpWQ/olv/pdx+94p7KgLB00JSpGOA45iOMjLH29nSQCYmSxNWCZUoZZrz/qciTjupdoEUc3WP
	igVx3XqKSuFJeqvhfLxqQKR7hijb+qO7QshqtSMrpIi2wiQafHgZf6h6227g5tAjsLXs9nM3R0Z5v
	JbJHKUwN5sdMMvoy7QP7X3wY7h8IgZBG++FJpR9gBICglC8KmnTC7A6iWlEEY0ep93hJ7pPTcO90R
	A6acaSVp+ID82AFiyO3C4Bv7CgiG8lPz7AmdDROxLQRTj67FSYR8SwjgEMdEiooFQv46ag6JgenDn
	KHpHfUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBA1-0000000B2Qn-0MZN;
	Thu, 06 Mar 2025 13:21:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAn0-0000000AynF-09lg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 12:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E39Ml7fCBZbxfVHzjpdOttpEvi9Y8jkd/560+rZTYD0=; b=KDezkDtsA4G0QK6WXBt/7+ZQhC
	Hsix1ZALP5G7XSdP6mTqGQ6NmavZUXU/MxmtRIypvMoOiDJAFy73D9e1uO9oA4tS0ST++fFKb0N2l
	6oRm6chm4k/6/EDGXqvmoRTbed03FZTuEXZbIgLlun4owAhaGGiqIA3lBKEKH3xTkC2k6wy7ODMtL
	dx1QQ9hKGyNfnW8wIoFqNw1U0QraqxjMaA2XNJ1zJP3YJEcih5NXApHy7ayl5upABbiZPN6asvDFd
	Qx5EQUl3Hvg2yOh0Kwvjq5e/TxWSJcGrkVppR/lw2tVpLA3UxAkSpjHeJOasgYTgso8JkaBKa0qjq
	gLRkcG5Q==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAmx-0000000157c-18xq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 12:57:24 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f74e6c6cbcso151038a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 04:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741265840; x=1741870640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E39Ml7fCBZbxfVHzjpdOttpEvi9Y8jkd/560+rZTYD0=;
        b=HBxN7qr9NVTTgkZph2i7pZPWxLx39TercWkotQEEWUS31AkETuQTB8qd2XlXSjHkg7
         RtyXeKd2NHdvT+/OIZ0os8OLK3x3sCSE8KoHasYdhkpTqnN7OS2XxqIm1rof20pV7Dgp
         SlOBXtqKEjgFvbVuD/9cRQickS3z2ejP1bWr7k/6TfdHvynwkNsfVdlCJCFwuRyTtdoS
         MigK4/Gc2QSHpVRcVcoSzT5RahGvZ0K0Ki6TsyQVXvZtSaZcnSp5lpC7unMjA8ycJfyA
         OqJ4bIsHBob4xrTVEZjQDxJ/0OFa8L/o67bfHlYUKZiEj/dCRI2XBpQrLl3EA8lnv8wq
         4lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741265840; x=1741870640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E39Ml7fCBZbxfVHzjpdOttpEvi9Y8jkd/560+rZTYD0=;
        b=t2+9UvVotlRZ9xxPywat96RR9r53xeB+7v6TsIUpKUiIuqJQPl/O8gEM9RMtADdd+p
         LzELMOfc1Y22tl8ZOznN72K03541sC4wOkp5AuMg59dyjGKMfSdIDRPN0ZeUrctdn7Fj
         S37uwCi3O/n24/E31fIUYtvH6SeQfq8tplnK/iCrsXMp3lnHrtm8POwF5TYhYjtFe7hb
         d/eYMge4jPTCQhp9LvMDhCc1COzMrfwaAPXgbVnm1VorCb4dMo+iRG6BJfeBY14oa/PU
         69p1I92HaUfrTe0MEXP8nRxDvuaP6lFsBm8G0bsaGmqGw7yvSfAIqRl8FKa5UEkK/Ceg
         BAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq6Qg0YPbLdUZpe5BeDSVU8SOJAi+56X6vW75pXugvxtYADX3c4no8xeDPKbjdGUyusbddl3NUmebBZ+1YEQmY@lists.infradead.org
X-Gm-Message-State: AOJu0Yye2v1MBU8dtqRx1cdq2c9iBVUKyjTlyycGkgfK/sveoNc1BVeG
	8WK/2pPG3aeqUjuhCMF46NmGqM+pvT3YBjp2dW6U/XqD9cshI+EXUpUGhqhrQI7caL1uOY2fBJD
	e9guAnIyWsQAq3T0yiAd9rp3jR6w=
X-Gm-Gg: ASbGncsCqV3ZBssgVHFzjUTrp+cVDMc8CD3oE8eDnVf6EPFMMBS+0xaQRet0en6Vqml
	vv+nb/bLDNatS8Pu6G5Ot5hklCzmRJm05cRv8KNUL9b3ouOnQ6XOdLYf3m78hZRg4YSqutVNAaU
	ddPDzzsYmZffgj7UUgIJrLGbJO7g==
X-Google-Smtp-Source: AGHT+IEWKk04PIz7Wk8c0F5vZKKvySTmpJETnfri4bCYCQcstfnihMhMTAiUwNPxtpeY7tThxygpdKPz6oh1oX3Y1Zk=
X-Received: by 2002:a17:90b:17d0:b0:2fb:f9de:9497 with SMTP id
 98e67ed59e1d1-2ff498223fdmr4702572a91.5.1741265840262; Thu, 06 Mar 2025
 04:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20250210164245.282886-1-ojeda@kernel.org> <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
 <CANiq72n=95jgJs17NFAkit5uzxqtO9xij9Um3ybd_RiMCpFrDQ@mail.gmail.com> <CAK7LNAQC5Q5EQjuvMEWS5NAs-pixj3b--rkCHZ=xGQDTHqBBFQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQC5Q5EQjuvMEWS5NAs-pixj3b--rkCHZ=xGQDTHqBBFQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Mar 2025 13:57:06 +0100
X-Gm-Features: AQ5f1JozzC7HXKLXrrD94nPS6o7fBCrwM6b7SXP64UvI5vEbi8ijBc_ec378rj0
Message-ID: <CANiq72nYUcGDmDG9Sx1AqgyXfkUWA4B5M3d5PexVfN7JB58Ryg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_125723_360497_410EC887 
X-CRM114-Status: UNSURE (   7.44  )
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

On Thu, Mar 6, 2025 at 12:37=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This has not been picked up by any one in linux-next.

Yeah, I didn't start yet, sorry.

> I applied this to linux-kbuild now. Thanks.

Thanks!

Cheers,
Miguel

