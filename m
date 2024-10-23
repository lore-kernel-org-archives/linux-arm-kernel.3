Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7A5CFA464
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ay/OqGD2GTrz3V0tm8K+95EMKdw2lJQesOojfLv6f0=; b=VuJQW0HygcK7QSxq4njRzA8an4
	JLEXJi+Z0sov72usLMX1EFk+umEsJqdyUncaR5T/36BvhJXbEXtxk7IYoT7CD3wlc3gpoXxCrfPPu
	mElcr6QfneJBSdSfI+TbIwNUfVRMafM2hLrJ/LpzTeOX+FBbT5fJJOOLJffMlQgZo81iVPP7m/snB
	tFUOHdywARQhlDNqVMY/u4vJyibhg2BkIH+WpPqUeMjm5DJUsyOLa/xSG3AvfETCbBJQLpqwj9F5Z
	PzRwmce6DvnMvKlG2bO1WYV7FaFTmfi9fSkwknlCj/phUHJ46uJ3B9TEksw0Vt1fvZwIfRAYv6hja
	yC7afDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hfl-0000000Flsm-3fvh;
	Wed, 23 Oct 2024 20:09:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gJD-0000000FZXX-2MJ7;
	Wed, 23 Oct 2024 18:42:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d5689eea8so18030f8f.1;
        Wed, 23 Oct 2024 11:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729708934; x=1730313734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ay/OqGD2GTrz3V0tm8K+95EMKdw2lJQesOojfLv6f0=;
        b=ABvicYfiRJppK34YtRIFGqpR72h+qBH9mEfhy0Au8UNt0KiIml7DWNanVxq9EWbxTT
         M0QXzDcRbHSIUWrNCQBredWUn110P0TXeFOL/YODznDjVYhP2aoXfVu07V37d0mtXDoQ
         JaN/21CeON/MPSChoZptnwZfjL1k5UJwLQ2f+2e8ybFGt925gO7ex2+7fdIDoxEcavHO
         kfhicucnY3ENL58EYifa1OS2IevCQo78fCWuKRR6lWNq3TUDpxvTP+s0vAH2EKp+b/r0
         XcURoNRt04RYq7WUJfWvWFT8cO4HcWKVNaj/pxtmasFhR+shNTiY+rUceaLB225v8CqQ
         KGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708934; x=1730313734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ay/OqGD2GTrz3V0tm8K+95EMKdw2lJQesOojfLv6f0=;
        b=QQj7S+iZoHZudlehIivQdrTRPCCEKMk6P85fT0DHEoBnAwRSKfXB288nJwJBNqCirp
         RyANJ8KM1ieeVIWoSEQrZJkLd+8E5/Eww8gvkazpB3gj6SeaKOHrN5HCoHZb1WRHAohQ
         vKOkHi0gnKBhcuiHpmsLm6R3AAxIqbqPBNM6rXFZzR7ErJp9vtrY5BSzOmkoiFJKCp9h
         sDkxipMkh4yggnsmhu/51zjoaewfnMyPjFIZ5Vz0kxy4MqT2OchcfC6eR9hbO+ACc9cW
         IQe1MGF0bCeD5wh78Fgm9CxOQNITrRldBEZvdbyytiKvksUTDTLVvo2z2yFEQjfm2mjg
         ANTw==
X-Forwarded-Encrypted: i=1; AJvYcCUlKd0jZI/zvQmYdeW+PI3V0YSdtVZKMtEZ2AFKSBXS9HDhBpFsmmmSbr8u+Ur4mFS3SQaBshPLXH+qI+TAVT+h@lists.infradead.org, AJvYcCUs9dpQ9/yPSwps3wJSmcgkzTAoTNLysqNg5VmDtThRDQmUHkZES0DcT7carsbYKcgeT4e61ZAGNPbguVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZgYZQGRlOkRaXTiLaaw/7ZVdZyiLeIvDMy4Ydwz+T0aMKgvmM
	0LHKf2RgWVbl3ln63WxOQ6QO+l+/2A2074h2pJmvkk4Pv0SNGUIFx//7irOagpR0NfilY3fTmEz
	xgKrCOgEqAhTO6c6GuYuQae7bDW4=
X-Google-Smtp-Source: AGHT+IFB3tSRsLc8IJ+ZLmbBRgiQxMJcijIbkhHI+LcLoWS2ExMHeUZd0pXljEEFRrdcgGNxkIUIlWkiXJ0JtmbA57I=
X-Received: by 2002:adf:f5c4:0:b0:37d:5338:8733 with SMTP id
 ffacd0b85a97d-37efcf7ba95mr2248780f8f.37.1729708933928; Wed, 23 Oct 2024
 11:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com> <20241022015913.3524425-4-samuel.holland@sifive.com>
In-Reply-To: <20241022015913.3524425-4-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 23 Oct 2024 20:42:03 +0200
Message-ID: <CA+fCnZe49OGG_8J40_d9dTUBktY6qe-1dq1Y6Q+7hY9=xmUWQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] kasan: sw_tags: Support outline stack tag generation
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_114215_627053_A81BE296 
X-CRM114-Status: GOOD (  18.20  )
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

On Tue, Oct 22, 2024 at 3:59=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This allows stack tagging to be disabled at runtime by tagging all
> stack objects with the match-all tag. This is necessary on RISC-V,
> where a kernel with KASAN_SW_TAGS enabled is expected to boot on
> hardware without pointer masking support.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>  - Split the generic and RISC-V parts of stack tag generation control
>    to avoid breaking bisectability
>
>  mm/kasan/kasan.h   | 2 ++
>  mm/kasan/sw_tags.c | 9 +++++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index f438a6cdc964..72da5ddcceaa 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -636,6 +636,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
>  void *__asan_memmove(void *dest, const void *src, ssize_t len);
>  void *__asan_memcpy(void *dest, const void *src, ssize_t len);
>
> +u8 __hwasan_generate_tag(void);
> +
>  void __hwasan_load1_noabort(void *);
>  void __hwasan_store1_noabort(void *);
>  void __hwasan_load2_noabort(void *);
> diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> index 220b5d4c6876..32435d33583a 100644
> --- a/mm/kasan/sw_tags.c
> +++ b/mm/kasan/sw_tags.c
> @@ -70,6 +70,15 @@ u8 kasan_random_tag(void)
>         return (u8)(state % (KASAN_TAG_MAX + 1));
>  }
>
> +u8 __hwasan_generate_tag(void)
> +{
> +       if (!kasan_enabled())
> +               return KASAN_TAG_KERNEL;
> +
> +       return kasan_random_tag();
> +}
> +EXPORT_SYMBOL(__hwasan_generate_tag);
> +
>  bool kasan_check_range(const void *addr, size_t size, bool write,
>                         unsigned long ret_ip)
>  {
> --
> 2.45.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

