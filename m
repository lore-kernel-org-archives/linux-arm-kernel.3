Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDDD1091914
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15qRFIauJbZWIOHfsFfMNQAVUG61meAdvRvs8zItI0I=; b=pj0tRe/ze9FwpyJ3y/4uZrBpLa
	8CLpeQb/Cw/P7k/Z/6bClJsgsOHH+CeaIHhN5mbtIYNeTo2lVPhve3n5bd/fEveUI33DKKXprGqr7
	zSH/flffhiJSy4U6WnljeA7/F2ZrIKEPXt4wns8p1k1gZbItlM2oj6qosZZdGcDtM/GwZZ0lGarHI
	DG4Ek0SlYx/4SUbcxXukX+DDuTUOsn4c2Z01x/8O0In3cQiVBumdNw6Ny6LrAN1LEbpu5pHwyISLb
	v41AGcIY7FXKEoh93HdugDehihQVfiXy3xE6n9klXPjaslZPVihm/C8AZgFadL/OsUmPYdh2YXvJd
	VhTDP0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WCv-0000000CTxQ-0END;
	Fri, 20 Mar 2026 09:31:53 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WCt-0000000CTx5-06bF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:31:52 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56cde28a9b6so222876e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999109; x=1774603909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15qRFIauJbZWIOHfsFfMNQAVUG61meAdvRvs8zItI0I=;
        b=CW1d7Hv319a63lu/T0sfXvl50JJ8MEraAJGUDuuozG32VV/WJRacy8sviOyEqGnGJf
         959XJemXn0ZJ67QZQ3h8lLxbQDUMQ6b0Lnni3f9/qklSR0mO5VAQYqNVJRsPPwbfqwFr
         06bMKJQSOthG1RN5oGz23oPWxS1H7VcUBqbx3Yb592JYRpZua/q9hF8IqKhxfPYZev37
         +qVX7BUADufD4IeQ5pkI4tjv7AWH2xgK44JMSjO93/1zJb2UtvIMlYSCe8M/1rjRjimb
         gjzTK8hi8lSI05mf+8ORSoU0LQMmq+1UWjr/Ta/EpYKONpSK3O6uvcf2W04t4ZvF8koa
         LzDA==
X-Forwarded-Encrypted: i=1; AJvYcCWeVQ10ej3Uu4JS1GuhHxOnGd2pnpyHMB7UpI2U1CXbZRujdSntLMSrI/hybs8AEi4/OnUmkY+iP6g2Ey0V2uQW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2eDn4GpuI7ZHz8LoxlHJq+5/5VQtTCtbKeLvniPDe/I5bt9KF
	4X28p5DOoTPWtg+1f6kIWAs0ZRdyVCcXTZfLSoy9JsoLQxLL1tORmWZu/9Mp1U3zHM4=
X-Gm-Gg: ATEYQzwdQpE3B0ndFAMd5hZ45Gaz1aUBdTIzJjfl0nUGCCvBrz35JoSzUjlQPpcG6/i
	ACLkUR6CX1jTXoUNKSA3Nt3YbChT6en/Ezy+5u6bcBMwuH5C0qPc6F31Icqht5pp2x9qyTuGvf0
	/tGqcdDr/HuFQDIuYXubM89iUBROGcAp3ogR24TjA4KTlyaCIw3SV3x3EWoGEMGfOe+Hk1TyDDR
	NTagJ5Pcx/hg3rPAISpfzSQgDZ+3qJt2yp7/F0WUZ7tc9xwdVGmeo5oOA9JSLxopI8DSGhf+vd7
	JQEtJuagoSSV61fMSb0yfZhbg7GBmmUHKHTTh6q9HIIFLM/iftCU44G2MphSf86KVHU2Dlzu0R6
	9Rh+4BAQz+OQESwT3i3XL54rD8F7hrGTcUlMZexWaLJhuSMaAqe/vyB+ND3gyAE7dKpEU9ZJeqG
	txU4sWY0ar2ppzY2th4+vFDI1qr1lmro/W59AWpQeGvIIDw/IQi7ugTDUh/n0X
X-Received: by 2002:a05:6122:169f:b0:56c:dd62:eb45 with SMTP id 71dfb90a1353d-56cde436df5mr1081283e0c.15.1773999109521;
        Fri, 20 Mar 2026 02:31:49 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f882sm1318908e0c.9.2026.03.20.02.31.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:31:48 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-950b801b75fso388644241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:31:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/0pf+Vca3Xeq8Kw06NQio93lJ73qQu4nJ8bIQ1piHVZj6Bkgqib49pStKs9kc5+DXez7I//Ds3/Y0JAiAiFHu@lists.infradead.org
X-Received: by 2002:a05:6102:4a8f:b0:5fd:ff75:f41d with SMTP id
 ada2fe7eead31-602aecd1c9fmr854127137.24.1773999108162; Fri, 20 Mar 2026
 02:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org> <20260303132305.438657-8-ulf.hansson@linaro.org>
In-Reply-To: <20260303132305.438657-8-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 10:31:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGOchmxq6yiZva43wSzptagKd2Wz0uvAJqq6D2hj=6oA@mail.gmail.com>
X-Gm-Features: AaiRm50bikNxwG5d8QdeS3goOaCSfEY-riZXXOejz7Kn4PitUZ0fSrDHTZqCkTk
Message-ID: <CAMuHMdUGOchmxq6yiZva43wSzptagKd2Wz0uvAJqq6D2hj=6oA@mail.gmail.com>
Subject: Re: [PATCH 7/9] pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_023151_064367_8579757B 
X-CRM114-Status: GOOD (  16.48  )
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

On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> Due to the new fine grained sync_state support for onecell genpd provider
> drivers, we should no longer need use the legacy behaviour. Therefore,
> let's drop GENPD_FLAG_NO_STAY_ON.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

