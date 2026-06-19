Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC23CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnXI8TAIDlg0jH1qAf9FNl4PXBrwK/ooV2WoJ94aEs4=; b=bP8CqEJo/KJa7RE+UOr7uRoeap
	pp6QpkwYNm17NDBKoSpHuoRgoslXj0vMxRxLtWXBpUgoeiqmOZc3yDwB0iNAKC+tQsr/8yTQyubuj
	J3rPCfbDlkvdu9i7GZd+pzdB7UTw4VzdanHvnmKeLgrAafViX81QGsoKhumXFOLBSaXyJJ6Zg6fff
	lu48dObwFvdc0trHFI/fcOHvh9E2xDIQRkBFS3omsJ27zcxj2jR11NI81zkIv85BndtkL4IRTO/dO
	G32HpeEWQKPaf1s2sNpE1deQPooNOl6q/TQjeTdj/UJA8DFNLMGc9GaAgSJbO0YeF39klUMr2377a
	Dv8l375w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waajy-00000002cFO-1Qmi;
	Fri, 19 Jun 2026 15:02:42 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaju-00000002cEj-35NE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 15:02:40 +0000
X-Forwarded-Encrypted: i=1; AFNElJ/vI9HiZ6u+s1UZqcUqE+/CbkUuH09tH0usy1kEPGuU44JMpnhbZaQEafoKRpzWgNsETIGrR88dKf7dH4rY2S/k@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781881350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HnXI8TAIDlg0jH1qAf9FNl4PXBrwK/ooV2WoJ94aEs4=;
	b=RFXGCht+jcemzLykNoYf9tPYm94vQydc8BpwuReH1HPfROnXJjzsskz9mx77NJjXsjpGL/
	9FQ+0Rq26QR6XYbgwsqolo+7z1AqqKc4pn3JLfLhAnALXfQgBW/Qm/mR3SrPguChESr7aM
	YfYzRwJ0TTpr63QeodDp16Xo64xbGrU=
X-Gm-Message-State: AOJu0YxyrozLU5TNQpCezNUbqawcW4FXjLDP47ybytn7I3QVK4yvOvFw
	EEQ8lLjKrsIpB8TGcbhsxUovgqx6wg8EEyZ8WUIcx6oewOOpROB7iN5z74nRDpW2E0w/t0YRFMx
	1T42Z2RguBAYY7ZNPs63vKbR/y2w8uMUb6pl2N/W9
X-Received: by 2002:a05:622a:580a:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-519e4a744d4mr9182661cf.22.1781881344944; Fri, 19 Jun 2026
 08:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <aicVyebkEMs6w6UV@sirena.co.uk> <87tsrc946i.wl-maz@kernel.org>
 <8eac5e73-282d-4c72-b726-0c5c82fc81f0@app.fastmail.com> <aik_oVrNHUrh21MB@willie-the-truck>
In-Reply-To: <aik_oVrNHUrh21MB@willie-the-truck>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 19 Jun 2026 16:01:47 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwymmZqNM9Yf+PQc+7GgmesDFL8UPj-eA2vdrGqrdAufA@mail.gmail.com>
X-Gm-Features: AVVi8CdfY181qdXUuU8oy4vg1wehcKDqAsafIdw0xh70RbexrFtwO97zRvjZltk
Message-ID: <CA+EHjTwymmZqNM9Yf+PQc+7GgmesDFL8UPj-eA2vdrGqrdAufA@mail.gmail.com>
Subject: Re: -next boot failures during KVM setup
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oliver Upton <oupton@kernel.org>, Aishwarya.TCV@arm.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_080239_362018_C02285A2 
X-CRM114-Status: GOOD (  11.90  )
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

Hi,

On Wed, 10 Jun 2026 at 11:42, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jun 08, 2026 at 10:56:12PM +0200, Ard Biesheuvel wrote:
> > Given we're at -rc7, I'd lean towards dropping the whole branch for now, or
> > alternatively, only drop/revert "arm64: mm: Unmap kernel data/bss entirely from the
> > linear map" (and its followup fix "arm64: mm: Defer remap of linear alias of
> > data/bss") so that the region always remains readable via the linear map.
>
> I've reverted those two locally, thanks! I'll push some new branches
> shortly.

I hit an nVHE boot regression on v7.2 while testing Will's kvmtool
protected-VM series [1]. I found this thread while debugging, and
thought this might help. Note that Gemini helped me debug this (it's
pretty good at debugging).

f2ba877 (the read-only mapping you kept) still breaks nVHE, but only with
CONFIG_NVHE_EL2_DEBUG / CONFIG_NVHE_EL2_TRACING:

  Unable to handle kernel write to read-only memory ... (ESR 0x9600004f)
  pc : kvm_apply_hyp_relocations+0x80/0x8c

kvm_apply_hyp_relocations() writes the .hyp.reloc fixups via lm_alias().
Most are in .hyp.rodata (whose alias isn't made read-only until
mark_linear_text_alias_ro(), after the relocs), but five land in .hyp.data
and now fault. They're all debug-only: __kvm_nvhe_selftest_vm/_vcpu
(NVHE_EL2_DEBUG) and __kvm_nvhe_trace_buffer (NVHE_EL2_TRACING). A default
config has none in .hyp.data and boots, which is why this didn't show up
earlier. VHE skips the relocations entirely.

[1] https://lore.kernel.org/all/20260619115415.5475-1-will@kernel.org/

Cheers,
/fuad

> Will
>
>

