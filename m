Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02739E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/m6mQE93XRbEC7aZffF1JFPjsU9ESCMe5TCbG/hYT0=; b=Svrm+7YW2NhAa2InRcu9W2us4L
	anZxMxH88Ku+wMlXE+S2ZnxZN253JrWNmkRmgPnn1VGsfGINgvZbKKT3ZJdb1Op4M2R9ld4jBdn9z
	O4KEGB4JA0OTIzf4g8sTgry7pYGjKbucoqX7ziwD+Z/HIwQHf16YwiUGouBU7RI01+A2d0hgBg6zn
	bd15hZJA+LvssYV1WU3IFSNdtS/ib8jMUHoaIuX4xEpSsA5ne0Jb6qPWL2LBZbbrjHtzqTENfdTN/
	q3ZmwKMYDOnftY4z06ltkS8k5YR4Ggfnykj317tP6ncglliM+GIYKHsvKvmcr9iuFWqcFup+RTTDo
	+FfMEU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyrr-00000003oL7-1Xg6;
	Sun, 29 Dec 2024 19:22:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyqf-00000003oFJ-3Tpf;
	Sun, 29 Dec 2024 19:21:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso55944505e9.3;
        Sun, 29 Dec 2024 11:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735500072; x=1736104872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/m6mQE93XRbEC7aZffF1JFPjsU9ESCMe5TCbG/hYT0=;
        b=Aflu3pooNLReYrwN/l9eh7qUwyLwx9Srngp72itxT692SBz7ncECPuVrtFkDErB/T9
         uE823FPsyBFEKmzcpttnnUVfa8p/n/V0+FPd9aiCVdAMZEXkU1k5tupaMxDnfoOINZHm
         acLoXFHtrxtxpZbSKXSpKP2SExQ8wLDQnC0M2M4J+t7y8A4FZTAN0gvjAGycc0U2kMkM
         v7D+4VwZEVkvqmIGFwdtUDrz2Q7OlRyOJQnlRVsXmXpTYRkERaURTZSqXXEYacWeg2Au
         opwDFwWeQd2f7+RzKbjXn8fTQ0I70SfD3SzH2iIfkaDuF8RZ7QOEcyK0yMACA/+lzsv9
         rsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735500072; x=1736104872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/m6mQE93XRbEC7aZffF1JFPjsU9ESCMe5TCbG/hYT0=;
        b=epEg2Tr+qGN8tGbh3eWwv4K6zb468ghzffN4zVtlTqKpks9U0AH7X1rgJ1RPvzVDSn
         1z4EskuHM7qTgHmbIci7/E0U6HB0gW/3UP777Z4Dy85QRzcKV5yrFFywO1x89KVcMNaI
         ZpyoLLPasq6iVMdhwvHvnXtiWCW8zouZs8ibfHoQJ7Xgkkx1MAEgj+ZhIbcAssEGdbF2
         qeg6FeOM33pZBMe5vcOKYn45GytmVTjpr8F87pKHxG8+175TxYm71ayNVcwKB4cCa+5x
         lRvENxjl6At+A0IySpw8y7ythw3LbN53BcPoSqf0mCBnfLzeJ8bo+OWXuy6RZU59Xnka
         iOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeyx5y1dXrTf/Bvl3P/+0f4iqh7MIbmVRFuS2rEeDf8FUypCdo8FFbwQjD+cvouqbiX2TojtC+3FC+asyq6rc=@lists.infradead.org, AJvYcCXoDKpen7nxG0EidTf35HGON8TIGl6De+eX/772RBvh5JNQ5lVOUjTIpqPSTn5xdfPzb/vTZ4QSAQLVadMnl9aA@lists.infradead.org
X-Gm-Message-State: AOJu0YzPSL2c39AW8nCvPnyNEYw77pmZMXW1sE2FASNRWUBN7lrat4Ts
	6GxxOPz23i1ujfcHqSlC8SkJJt4o3NIGHPQ44FLNxOYH0iTv2NL2psn231ANEEetbRzcjgQ2TB+
	Qkr6KZ81XnrArHV08kvxAL+kN/jg=
X-Gm-Gg: ASbGncsj87tXl2ysxYKq/DCYpb7ZDi+WAUa8PGWVK81Ve7oc6r6+f+voR4sGxw3apvj
	fqLxQJUEROAOchO/NY7jC54t1jBH2MBDeHYzjGD7E/1OO7mc8Edj55drdUNfhp9NheS/rdA==
X-Google-Smtp-Source: AGHT+IERbyKDJY64pbsXCfiLuatq/oqkmWljGpRnNR4+iBZE0z2MspqeiGU222OSzsWUzmZRuvrFwmm5Of+SKsxCHM0=
X-Received: by 2002:a05:6000:1f84:b0:385:f349:ffef with SMTP id
 ffacd0b85a97d-38a223ffa57mr22988717f8f.41.1735500070610; Sun, 29 Dec 2024
 11:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20241229184256.1870-2-honyuenkwun@gmail.com> <20241229184256.1870-3-honyuenkwun@gmail.com>
In-Reply-To: <20241229184256.1870-3-honyuenkwun@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Sun, 29 Dec 2024 13:20:59 -0600
Message-ID: <CALWfF7Kg9HQoqyEYaj9FGPYu3+vAzZNLMVhSr_90SFDg5Syc9w@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_112113_881269_9F317DC4 
X-CRM114-Status: UNSURE (   8.42  )
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

On Sun, Dec 29, 2024 at 12:44=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> =
wrote:
>
> for Orange Pi 5 Plus/Max/Ultra and AI Max
> ---
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 833 ++----------------
>  ...gepi-5-plus.dts =3D> rk3588-orangepi-5.dtsi} | 195 +---
>  2 files changed, 77 insertions(+), 951 deletions(-)
>  copy arch/arm64/boot/dts/rockchip/{rk3588-orangepi-5-plus.dts =3D> rk358=
8-orangepi-5.dtsi} (80%)

Heiko,

Should I go ahead and make a v5 including the following in my baseline
before the refactor?
- GPU power doman dependency [1]
- USB 3.0 on 5 Plus [2]
Do those series look like they'll go in as is?

[1] https://lore.kernel.org/linux-rockchip/20241211143044.9550-8-sebastian.=
reichel@collabora.com/
[2] https://lore.kernel.org/linux-rockchip/20241220161240.109253-1-wens@ker=
nel.org/

Jimmy

