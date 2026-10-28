Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 04:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=plHoiAEH;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JFajXMZH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=; b=plHoiAEHYvcPrX
	kZPhf0iOI+RHTNCjIaqJ5FMOdmgw69rscX3EqxDRPO3hUSzcmKBe/Zk6GNuUWt38oVQ/BYk8CHhR2
	O2AG5RZyCq9wnpnjV1rwOSp1SqzuDFCmbudRkyHUMZRdTCmqtY7aKdF630mT5+SA5Rjz4YckKpf2Z
	nw5nDaknB2xd7YYMur/SkkoQ3i8W3Ojst/iDzpkUfgHh7mqtAgS8maXMLKqb1X0Q6bCUKiMX8hKmu
	/26smVXqssI8yyeG9zpqVLTgZPtvPfysbdksb4zu6PxsFGK689CZ3UrsGuLPzwDuMeF+ZFAh6r4SF
	XgLhKJaQCZXZ85UmQdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLv4V-00000006GMy-3vy5;
	Wed, 28 Oct 2026 04:15:31 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLv4S-00000006GM0-1O5D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 04:15:30 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-676804a3a22so539986d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 21:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793160926; cv=none;
        d=google.com; s=arc-20260327;
        b=enw84KJ0DOaVEkOG8zGudU7Jmv93bZI/iq0fNS1D3KXDJ3G8gKOouv1h2fN4Aeplig
         xAY7bO/1qFEPNn11skJLde+hkTUIm6kE2BC1eHCcX+VOCtDMPxKbpGXNapbBeF0ED8OF
         +MeJssPoBwEiaZGLImEY+akZ4Dorx3mv03ALLMUmugFRXh/pKaz75m1wV++GpuOvjAIf
         MsfHLbPWfx9AD6XSONEd+d/zKYoP7I+01iDjEoCkVTY2/fNUs+GiODv898WrVzUkq+ra
         mbqCZcLLRfFNefvGWNeFtB8J54BX5KYwOxWtCSzPljvU6hZkOmynqM+K6FNrA+nmSngF
         MeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        fh=fnkt7N20p3lAA1YcrqL/fEceiVEfQYUdTKB/TxxoXJU=;
        b=gCbRL4n0uAcZIHFHipCid8O+GqeL0V2+F+2eLhcpN9dLSWmbdNpjJ2NPkTMaWXdfO/
         AS0u/WnaZ1nSDbh2C1vl/zDbw6hUrhBWoPPBAsMbhkXbQEFlJogV0N2yQqhDC7x9OhQv
         52O5X78oNKll8RimzjR6BENQ38f/vZUwGdJRv0NarsKIB9XxuuTUFO8fmp0yEoajEQZv
         oxAZUjwccdWR8ldG4aMKS1MsDgi7Nk+fOdefX/VMTB0QFr/rHevY0eTMRh47lySivEsM
         YFuOSS8iqVlBXtze/TNFsKL1QK0gpEKeksAM3NaYwQrdN2qlvta+A0fU7lFR/ZYdSjbT
         ohqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793160926; x=1793765726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        b=JFajXMZHtvf1VofMxvZD/uc6sJ7YzAQuOkxmomTmI5j87ek+EROLtRIVIJclWL600p
         dX0NTm9/RXKYh3hiE6+wZaIbVXidcUfcU/JsNS+RnBygI8ve6uB6z4JdCtGq2l3/s1rd
         xjj6U/2G7t3A0h8CDd9sJ0KlCmwxOnqUtAKt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160926; x=1793765726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        b=mMaox01hZXk9L6rvM+OTLA5PsWN82xq+nIQnfA1dea2M1ad4toiz3wf1v8zkAiahQ/
         gd/tdvdv9au3sSiZfwq1FcpaCYer+1vDiCCzAnmY/BgpgEdCQGLA73F7I6770B83hSxi
         G5qHQU5oN2jjl2CVLn0FMr8FoNSy/MUjdzIrih1t+/or5DACi8zI29XbBCn5q3zHwf3G
         isAEHYXjl6PwqTYmzf+3c9TX5oYcnIJZ9iC39Sh+61BR1YXJZGuG4Xge1GMrVibIUC+z
         WRxUlXE40nqncTfQwJECQD4MH9U1nTaBXXHE6+2pYP88WOiUtd9y4LIaryPys13PR3qU
         DrMA==
X-Forwarded-Encrypted: i=1; AKwUvByzRt93T+NvNvRi9SHvPVaQ47TUr/hcziiefiNoi+vwTPDVnuYoT52BoPxEdmlrnbLKy9b/xmCPyM43PdzfORzJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJL1Vz5T5/eVKmhxwX3YBRxQOOruRUwXMy+hQHYlrXaCqQYSgfb
	rj51thXIsdlrTQWRQdISO/sevElU6TlgfX7OF2GMwEEF6CUkrdF0OrNHUUDjMiK6wFhUVPJYrSb
	h3tb5IwbvKC9CffRSO8koSYBI/MZKF/Z/5RkAWVhF
X-Gm-Gg: AYBFou2Cz/GDCRo/zFgnm14M80EJY1UW54IQosEaf6829VsG8IWrlTfspLhjnhCXtVl
	FLogWrecBfytblUNGA78DSBSUA7BT7eZ9oM9sjGwb5Mof6y+TCpBTLs4ujQVQ/t+hGJeq0sNw1l
	FGkD7QA8x2wvCVHMr6V95hGr6d2SIS1U9gZaQo0yOhXdtnou3RDECNJEk7N6hch/9Qm39v8m8UZ
	f2Jr3yxV3Fjd7db05bIO++8+Fz9c6OWzN3gZPCWIxHrQITsf8xZMJsRYfj70dazg8M6pQuGLz8l
	gUP/BYi8XMGBk0Xsxn8A/XilrZfS8Ng33utFr9qV/XWQ5njpUZmZ9PTuq6HXoY+B8V8d0p6DW+P
	tpgyPvZBt84+3296MTti2Wqbutp6PpyA2uYcNReUbIQLoXf0mKRWqMqlfYiL+GbIGPk5nwzU4kL
	jHR7Cn7PVF5Z+/
X-Received: by 2002:a05:690e:2047:b0:679:5ae6:b290 with SMTP id
 956f58d0204a3-67a7b9a67d5mr1033094d50.3.1793160926582; Tue, 27 Oct 2026
 21:15:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027093306.2812695-1-lee@kernel.org> <20261027093306.2812695-26-lee@kernel.org>
In-Reply-To: <20261027093306.2812695-26-lee@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Oct 2026 12:15:15 +0800
X-Gm-Features: AclHuK-igjxt6NXixiazz6taDDNXzzugHQY9dV8o_clIASacctwSUFB4CoYNooQ
Message-ID: <CAGXv+5F1WthGsE0zFqThBge=quNQ+8_LTtH4Shsh1dpdvGHV2A@mail.gmail.com>
Subject: Re: [PATCH v2 25/27] mfd: mt6397: Unregister PM notifier on probe
 failure and unbind
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_211528_400794_63860032 
X-CRM114-Status: GOOD (  11.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 6:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> mt6397_irq_init() registers a power management notifier block embedded
> in the devres-managed struct mt6397_chip via register_pm_notifier(),
> but never unregisters it if mt6397_probe() later fails or when the
> driver is unbound.  Once devres frees struct mt6397_chip, the dangling
> notifier block corrupts the global PM notifier chain and causes a
> use-after-free on subsequent suspend or resume transitions.
>
> Check the return value of register_pm_notifier() and register a devres
> action to unregister the PM notifier on probe failure or device unbind.
>
> Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
> Closes: https://sashiko.dev/#/bug/linux-edb62fbc-213a-49a2-be55-c002e234e=
554
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Though in practice, if one hits this then they have bigger problems.

