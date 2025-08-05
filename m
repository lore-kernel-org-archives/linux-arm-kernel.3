Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCD6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAh02TkFyzgFFZr3oxHjXV6dZOI2X7cgUfbU3vh9k5M=; b=zS4kci53UoUgpso0eQow9T0xUG
	U9PFjo/h2peZJCP1zBFIX+N3ZiNG+ILWLGj+frvIIZNDbOA0bdvkXjPJAS8K6MDSYprmi8hyMhSJl
	q8JhCNnj+W/lebxGuvs125JNs3NQI8uAVE9CJjdMUrZvVMWA4Z9Px/2ciqNhOmxsROxnwzCvYF3ht
	XUZsOao0p93q+QuIr9ISnxPizAN7KcrThRPfp/JGpz4ViRKfAffOoTMZ4iq9NxYl8rxUSLt+ebYWG
	PRKKPVnhSwQOgepezz+jS5E+5Bweb47Vgp/TLFf6YdvOitwtR5RrKZf6LxDBTpKeVb0Lq9kNVOUuV
	eRNwZwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHPx-0000000CnLX-3PpN;
	Tue, 05 Aug 2025 13:09:25 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHNJ-0000000Cn4G-1tRL;
	Tue, 05 Aug 2025 13:06:42 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-af96d097df5so374750466b.3;
        Tue, 05 Aug 2025 06:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754399199; x=1755003999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAh02TkFyzgFFZr3oxHjXV6dZOI2X7cgUfbU3vh9k5M=;
        b=em8+1WRhmPZPt4Y66SvlRUXXZiC8eAzU8UIvI2ZX3kc3lQMC839NOXMKpftsQ7zRmx
         I4kIMZSqa4yxDGrM28akD5zc5bkprCMD1qWL7W9ezCrU+oFHsFEghEhU5hksSSaUHER8
         iBk41YJAg/uHLigAvRuoZVhuvybLi57lTqeI83VBxHg+d05fEsg2bUU5gDoRK0Cj9RUE
         M8RbxU76saHbxe2ImqItzf9blvD905PEMfIJdm4VlFvk33nG9S6ZjJMmjvkC15dVvIMT
         bGF81yEA1DTxeSETCcM2h5zQPFlR+gDM7arMPq84laNNkmkQsbZqw2WRV9FY/NucBUV/
         Pqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754399199; x=1755003999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAh02TkFyzgFFZr3oxHjXV6dZOI2X7cgUfbU3vh9k5M=;
        b=TunhO/Ckb9aWRH/5Vw1uDUZdLR6R1bR9gj2wWeg8hWkcxf0YHr3bMisviSSa2ZNVzK
         /KLw1kWV4ZMFvmZZU52gATKgJRYEuAsN/S1P62abW3ZUoO+hnAcpiigoYIOSLG03kIXL
         4k+oTXte5fWX5zbn321VskPsVfE3QIR1CfA8/7MhCEJCxO4PcGpTXEVVTX4HtfLCTEdN
         xCWTz4az6Y9381Jbl4M6cwiY30+noVb2GZ/AArpxV9ElQpf8LvuixlpY6i8AKyIM8yM9
         Fjfgtxr7pool1qG6n4ZxAi7DR204obQP7S6ScY+b3wHMz8OT/yryCSV3+mFtn+C/RXwj
         cEXg==
X-Forwarded-Encrypted: i=1; AJvYcCUnYXvY1DibOrXLh5ShTuy64lhjgXX0WywtUdRtpteUb2UyKbaQgppWgO1TqOsdklEkRjEo7KyHBoZVR2BdziA=@lists.infradead.org, AJvYcCWgMjOItWwJm1TgWN1iuoPx3j7vr+zXZ0yECfKFUkRMvYhe0YuEpdCs4+bK0ewjbsalVKvoGWv2wyiTwfil2ilU@lists.infradead.org, AJvYcCWu6LnPxjN62XsOtlT9HG6esECOYMyMgkI1+b0N++AQTSLN3Myx9c7ZwGdlL2HQUfqzZTocbPkkFX8G8GruF3A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwP61JizpLtx804Vo03LURnrRJfMNpjh5lLy4GYzGac9v0SXHkj
	Cgwm4dAiJzbLn9njhQBJjr6pMH43qL9os8NdCNgOrF8QDxk2xRCn+vQbVoAN7TeuIn+f36JYlCT
	roVN1M1UAI+W/WMWPBL99TWLPv8S2uj8=
X-Gm-Gg: ASbGncvPJ876qndu8ADDXEJ2tQLzYAatplUmhTDDqRHKssd0L+167AlBS80DCMlLc5p
	RVBzzjUy/j3QALkONs465qwLjJa/2n7ns/krJUh084F8ZmbrUpIkt+fkg4SXxQ2LBFdhgrzpxen
	IHXzMg/fEEUmHSTxyHxKyXp6eWWGi82Nw9ppXq7H/aqwAN0tzehUm5i+0Zfa3mLFefta4tavqwW
	YMVp+ST9Q==
X-Google-Smtp-Source: AGHT+IG+UhvnR8PgL0a0Zufs5S7y3V5pfr4M4F2QIupH8Wrp93UHwXEqXJVmQMM5LOZynRuY87KMSNBR1QBwOUx0aD8=
X-Received: by 2002:a17:907:6e8f:b0:af9:3a3a:227e with SMTP id
 a640c23a62f3a-af9401bb461mr1278298266b.38.1754399199235; Tue, 05 Aug 2025
 06:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <pndectqm7te.a.out@axis.com>
In-Reply-To: <pndectqm7te.a.out@axis.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Aug 2025 15:06:02 +0200
X-Gm-Features: Ac12FXzfhgsKY1Z4mDhPlXC5tTUlolIHxAiCVq_7VMItomP-88jysmgI3xJFCTw
Message-ID: <CAHp75VeGvgv6TAYRRtEySmESkjygW79ms-Yd64h08_+7JjJMJw@mail.gmail.com>
Subject: Re: [PATCH v2] iio: Remove error prints for devm_add_action_or_reset()
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
	Mudit Sharma <muditsharma.info@gmail.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Song Qiang <songqiang1304521@gmail.com>, Crt Mori <cmo@melexis.com>, kernel@axis.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_060641_492882_2BB0EE83 
X-CRM114-Status: GOOD (  10.61  )
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

On Tue, Aug 5, 2025 at 11:33=E2=80=AFAM Waqar Hameed <waqar.hameed@axis.com=
> wrote:
>
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.

Even more, the devm has tracepoints in case somebody really wants to
investigate failures.

Fully in support of this change.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

