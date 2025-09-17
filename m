Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EE8CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjnKuNKA4ji6kMyGHxtwUN6WBWnj7945LQCwoquyyQo=; b=oYtcC3GpiYPAlvT45FnZ9s+wLR
	3B6EsjlVUlCIl4ek1H5EeBHTNAX3/H+rIX/KUnwL2AE8jh5+XXWAwLxdyYMLmrfLc2JhrBuRTLUIu
	QEkE+9YGRaYKTCli1/lWpExyzuD5oxv/sFHp5JEzXvGu7Fdzw2i985RKt3ztS+Jqq8ZFHEPckDUSH
	QuY1ShvQCELXvqMzXplj5bq5DE4/RgM0wLVJMwzE8S0vyVuq4DDVciJLLoi9Re9+7FbBbnL57D2OF
	/xs/Uir6rtwaT0xsB01FVrWCY4Fy2WtjOmdGznKtPussRwScNFMxOUM8cut39oTx2Vj1CKGnY3Jmi
	uwEY3GYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysE8-0000000BhtU-3lcw;
	Wed, 17 Sep 2025 13:29:40 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysE5-0000000Bhrz-49J9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:29:39 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-632e9c6b411so1966794d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758115776; x=1758720576; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QjnKuNKA4ji6kMyGHxtwUN6WBWnj7945LQCwoquyyQo=;
        b=P5ja0BB18JaOt9xNtUK493UF/eeFm5xXfokEbSUIrNJ/ckS+Dvb94SuXl4MOvtLKXC
         EGra6sB3maDSt7W4qSUx6nJIfet8EtXh4wUgarxMAcY9jDS8IiqdJnoFycaCKQp84Ism
         Apb2SfJVS9R5oH4X0CQwVVHQ/rXyeRAy0q38rPMjv1vGnGuITSwEeBqbtJUP8ekXhYuz
         HbGXdvX5holcrfZecgkBSNvDvnY4X+gXLnnQu+uyzMpL1mqD1Sj+BqyyEGhw9JKoDVlv
         8BC7ROOc34o50FuEHYQKuFDAUpefwv637pmIy1jzMMRLbhy9mOd/WgAhIX7H03B6dbQn
         ywaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758115776; x=1758720576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjnKuNKA4ji6kMyGHxtwUN6WBWnj7945LQCwoquyyQo=;
        b=a38X27w59Ikf/uOLl4xLzJsDbGqiLeaXswktgqj8NNV19WX7yEwFHnjqDJFr4VH3YJ
         E+MZjquYVITodE0hptUGd0fgZiMlsX+tHOO29g7Hawf/5WbliIhnxGbbeed9LX/cOt6O
         V94SShI3JhR1bsn/MyBEyi4L2VfWeoBYjXkkDMdYlwsGVQA57NE4ZLlPaNkflZDSrOJS
         KZdEDskZXOszlNPzWGP321KPf+cHuSVw6QM/+miwNk95xLacexVATBI+0aYk/KTJjM7H
         BFJlI4EI0AINjta+NMElL+wltdB09sNhup3MtD709vtsl1336OIcCKUN2IPe+h2Wh8I8
         okUw==
X-Forwarded-Encrypted: i=1; AJvYcCXxeNCWYR8hEhRLbo2rWreObFqDCZb8Y2+2QndbLkXQshtrtPRCigjkiFQjLQiMoQ4oYwG9LNaYceKpQsV6WrBa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz23eVHaPkpqFPuAzlXbZ+DVw42v6+F4w6mM9KtMzuL5o4WGbWB
	73/CRdvqWQHxttyxmwIWrVbIp7BNO/beuExyPKFDZwD72Kvj1lrF+7CKSZbqXwQ0GCqWl9u7tq8
	PEVFXAocQEk9kwWaUVjB7N2PxRnRrAZLg2/1gdti2AA==
X-Gm-Gg: ASbGncsIPdAlXxGNKUUVNkx0N/8fjIb5Nq0+CsbTTQEGN4Z0ysyZDrorh8Q0w3j8Ga3
	NeA9T8MZBsa4V9gsYHcUbLh0V35tXt0/1ts533rHx7TOal8aqIq2f+QtC6HURSmIJXpTLdElPTo
	ba+UIaqHWLWHxunrT+lW6cqWG3w9kAvFPiOGm5Jz83cZcYWeJ4pMvc7IUAf+XgyZsQeO5ROPqw4
	g1d9A3M
X-Google-Smtp-Source: AGHT+IHuI5AyhviMUE8d04CZKMsxw84ERhd0y58MB1DDZatjUo51eJKV0sipZSi6vcJejXizNerBql3FasBKpx0EYU8=
X-Received: by 2002:a05:690e:1241:b0:62d:9854:f1c3 with SMTP id
 956f58d0204a3-633b0731376mr1875395d50.33.1758115776183; Wed, 17 Sep 2025
 06:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Sep 2025 15:28:59 +0200
X-Gm-Features: AS18NWAFYxfdM-z9P24XcfzEBx3NAZQo5nY3cbJlHEFPJOB1W-fi7_dweQlyxBc
Message-ID: <CAPDyKFoi9KcsP5k84cSxuXNuMHmcf3a8emfOc6hMjGm_0FMk8w@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] MT8196 GPU Frequency/Power Control Support
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_062938_030532_0A01AB29 
X-CRM114-Status: GOOD (  26.20  )
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

On Wed, 17 Sept 2025 at 14:23, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> This series introduces two new drivers to accomplish controlling the
> frequency and power of the Mali GPU on MediaTek MT8196 SoCs.
>
> The reason why it's not as straightforward as with other SoCs is that
> the MT8196 has quite complex glue logic in order to squeeze the maximum
> amount of performance possible out of the silicon. There's an additional
> MCU running a specialised firmware, which communicates with the
> application processor through a mailbox and some SRAM, and is in charge
> of controlling the regulators, the PLL clocks, and the power gating of
> the GPU, all while also being in charge of any DVFS control.
>
> This set of drivers is enough to communicate desired OPP index limits to
> the aforementioned MCU, referred to as "GPUEB" from here on out. The
> GPUEB is still free to lower the effective frequency if the GPU has no
> jobs going on at all, even when a higher OPP is set. There's also
> several more powerful OPPs it seemingly refuses to apply. The downstream
> chromeos kernel also doesn't reach the frequencies of those OPPs, so we
> assume this is expected.
>
> The frequency control driver lives in panthor's subdirectory, as it
> needs to pass panthor some data. I've kept the tie-in parts generic
> enough however to not make this a complete hack; mediatek_mfg (the
> frequency control driver) registers itself as a "devfreq provider" with
> panthor, and panthor picks it up during its probe function (or defers if
> mediatek_mfg is not ready yet, after adding a device link first).
>
> It's now generic enough to where I'll ponder about moving the devfreq
> provider stuff into a header in include/, and moving mediatek_mfg into
> the drivers/soc/ subdirectory, but there were enough changes so far to
> warrant a v3 without a move or further struct renames added, so that I
> can get feedback on this approach.
>
> The mailbox driver is a fairly bog-standard common mailbox framework
> driver, just specific to the firmware that runs on the GPUEB.

I had a brief look at the series and it seems to me that the devfreq
thing here, may not be the perfect fit.

Rather than using a new binding  (#performance-domain-cells) to model
a performance domain provider using devfreq, I think it could be more
straightforward to model this using the common #power-domain-cells
binding instead. As a power-domain provider then, which would be
capable of scaling performance too. Both genpd and the OPP core
already support this, though via performance-states (as indexes).

In fact, this looks very similar to what we have implemented for the
Arm SCMI performance domain.

If you have a look at the below, I think it should give you an idea of
the pieces.
drivers/pmdomain/arm/scmi_perf_domain.c
drivers/firmware/arm_scmi/perf.c
Documentation/devicetree/bindings/firmware/arm,scmi.yaml (protocol@13
is the performance protocol).

That said, I don't have a strong opinion, but just wanted to share my
thoughts on your approach.

[...]

Kind regards
Uffe

