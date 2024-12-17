Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34EEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gjynL615gvuMEubyjzZgIcz73t6loj7FWYasvQLRBg=; b=SdRG6nSWYDMpaf90Hni6FX6AYN
	dQTrTxlDKIHjQrT9K5bWFH/oHXE6SAReJdx89XwHhgrXRQRnz9Yt9RJ1imyGn18o7ftmwk1w2dAfs
	hdzvvsNx8XUgsJ3iMBtR/milguhyhJxXnWKuvtG/R/8h+b0HsVSc4A6z62pA9xiC6qTtvwP5FQueO
	Iwyw2tSShBYekQ+IQZ1mms2gLheBfjjYOQImR3L9ieF+EfwmSCTce/XMp02sAdJXKro3irIfSukpm
	lBK3d5swxjQERicDbFqHD9ma4UDvy1c5170EigQ9OPDYwRraFNUZnuQmtn3xzdEfLgPZNK11IvpPt
	Vn+NNQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTQW-0000000CoDS-0Vhr;
	Tue, 17 Dec 2024 08:59:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTGK-0000000ClcJ-2JTY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:49:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43622893c3cso26775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425343; x=1735030143; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4gjynL615gvuMEubyjzZgIcz73t6loj7FWYasvQLRBg=;
        b=RhhJtjVt569KlUbYEg5E6Q3go38RdR4GpzZDe8WlK4mkoUGyN8s2XJR40tf2sIpMRN
         4MOy2NwDcstmiiFQ8Ldc/02NyR+lNLYh9js6WGbBYGt1aigSxO9p14P17UOT4iBBd2hj
         ETjPW26sus7cHi/zTxgcwSMkt7ekEgmLo5gD2JFs73zX7ywpaolSy3ELVycq7k24UnIP
         68nwpN+IkeamsOvNh8INkQJK+PzCZWupxTEE9cJb0dV1+ag+0YSLHTMRI+locEyU6Od3
         jiFaxs6iHviTO8aY6zTOYAEW8eb1eBaWoRqrs4CDiuCkiiUSPcQjfdTDe7upjmtrpmI8
         DJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425343; x=1735030143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gjynL615gvuMEubyjzZgIcz73t6loj7FWYasvQLRBg=;
        b=IuJGM8qEbgpTTpUfrNlZgJktC7yz5E3SN4404TUvmEKmHzqWl2+zr2cavfrL9vgqwE
         Rz8Oug0/nAPFjptLnYBTldLVeffWidAcqo55IuKHYJ0dlJvxlX7hQweIPyXwr/yn0zHb
         HRl8Lr8sGDBvAw1ZYb/qvpV6ZBcJcjpKdBccPkF45UMxx+EHwF+bdNhtymBnugQ/RxRC
         kUTP81Bb5G52SsjWNwX85+jDlDW7vPRM9U2FwIFJvfIjFgLIenV3/NZW/KQhny0AmP9o
         D4cmNcKYweZBai6o8z4el3fjcYB9weXaPkpBfzNPESUDEbBnEbcNeeuPMMK4JN41tkg3
         CV/g==
X-Forwarded-Encrypted: i=1; AJvYcCWkriD+y3zO+jCgVQUEXLEzsuh+kKwiNPdlErToU0l2acz5lhhGCIoUFwo6z/cWzmWdUFRGrCvRU3s9BgUaDPuW@lists.infradead.org
X-Gm-Message-State: AOJu0YzGe0Uoxe6g1bqs1yU6Tp3Ct0RUxhvAUouhP7700BNzBQqCni7q
	NF39KID0JgGC81dLSI434xSZxKJbVkyXz11XCv0CzSy/h4Vfkk9ihEgwZsC3S6zBU8UDRL4aGXT
	aR05ooYHH13SUqNQsDIWPTlDQk1QHXqUK3Ve9
X-Gm-Gg: ASbGnctf2txZ4vrk1cmU4YLhAN2ysCLfLgJhwLs0vhKEhUF+4b4Zky1UrXOMf/Aazb+
	5NhBi39gvVSn2b1jzL1CGpt9MDSHrsd1lhPWgXn8CMrEhyGT4RpX+TSr97Tsx5yjG/OU=
X-Google-Smtp-Source: AGHT+IGAI2rWVb4Uka3Gw6cExIudf/OJEn5z1n6O5hn8Pif2f/f8zmfBayaqT+8yKyhtBHAyACTgJA5pJBzp//b6lyU=
X-Received: by 2002:a05:600c:5741:b0:436:1811:a79c with SMTP id
 5b1f17b1804b1-4364ad4db33mr735715e9.5.1734425342932; Tue, 17 Dec 2024
 00:49:02 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-8-qperret@google.com>
In-Reply-To: <20241216175803.2716565-8-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:48:26 +0000
Message-ID: <CA+EHjTyYy6JxL0EH2=_VQe8+Qz7iCndPaU0C8gH69UnSkKhgtQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/18] KVM: arm64: Make kvm_pgtable_stage2_init() a
 static inline function
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004904_586031_8DAD26EA 
X-CRM114-Status: GOOD (  15.18  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> Turn kvm_pgtable_stage2_init() into a static inline function instead of
> a macro. This will allow the usage of typeof() on it later on.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index c2f4149283ef..04418b5e3004 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -526,8 +526,11 @@ int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
>                               enum kvm_pgtable_stage2_flags flags,
>                               kvm_pgtable_force_pte_cb_t force_pte_cb);
>
> -#define kvm_pgtable_stage2_init(pgt, mmu, mm_ops) \
> -       __kvm_pgtable_stage2_init(pgt, mmu, mm_ops, 0, NULL)
> +static inline int kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
> +                                         struct kvm_pgtable_mm_ops *mm_ops)
> +{
> +       return __kvm_pgtable_stage2_init(pgt, mmu, mm_ops, 0, NULL);
> +}
>
>  /**
>   * kvm_pgtable_stage2_destroy() - Destroy an unused guest stage-2 page-table.
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

