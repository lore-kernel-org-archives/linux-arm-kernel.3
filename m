Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F32CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 18:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvK5NFJp9PSzi9hRYXJM0Oi1MlUUKy+sqFwkKYu8iFs=; b=bU7SDnL76TqIEm69Ic3hQDQx3u
	6sA705h0+WI8P1BvS7ggHCtUqHJb1b2K73YYjxdzP0XTP/dpAKE+gwdA22nxPN7UHCQsFgnhP/q57
	0TvyCs6dG3ukwd9VW96Kc8771A5J5tBHiAKBH0AePw+HESi4zvTB3umRy6S9TrO+883K32qHa2cwm
	rgwOcKFNw3WVcge+onRwVCu0p19JyY5MyiUlwiDR6W3wetCsL+Vf2FpHbb9t2PlzbV/rAwYHMVWep
	6sZ8d/qkMhyOfaN+f9gFLs+p2fKkbrIW5sL0isMy5h6nRuWnfq02YVkJIphScvkNbjElux5PclRUa
	cAQ8ZJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIW0Y-000000069y6-03PF;
	Sun, 18 Oct 2026 18:53:22 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIW0U-000000069xl-3O7t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 18:53:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gvK5NFJp9PSzi9hRYXJM0Oi1MlUUKy+sqFwkKYu8iFs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792349593; v=1; x=1792954393;
 b=dyD9V4zWFb81O7FzhY6EGMAzOP2fP6g7FzdFPL5L3Lpnq4vuziLb7Tyf0snLWJsd1SPQgvyG
 OE50OyO/NwA8dW53zkyaqxjv6xB3ffbzjqHkFXNYHFhEZp2TQhPobm3XGTtFQ9dxQpkn21zlD3g
 pLfaI/aEPpb0Vud8gxMKKRlI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f63848b78e00d965;
	Sun, 18 Oct 2026 18:53:13 +0000
X-Mizu-Trace-ID: f63848b78e00d965
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso5158e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 11:53:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwMY8KikkU7lg4DcXutw4lgWHXAdPHq2EbkhQZTtvqS0yCbo0jCToX2mmqnp5aF6H0w3GaFolHz/sBj/kbDkGlc@lists.infradead.org
X-Gm-Message-State: AFq9FYKUFGrvxoROwjMK6qAPNTjeJbuyJUSyEbzmEan3I7k0QeMqbiX3
	PWV9A8+5BvWlmHNtrNgFhVwKLvgIo5+DvGBWpkyV0kYbyreDqxltCX70m3aRtYAiXps5jZKmM6z
	hJdsTBd9hDhxaOMVuHkCTnbt6ARuC9SgHdkuCgxgE
X-Received: by 2002:a05:6512:3a95:b0:5bc:ce5b:96f3 with SMTP id
 2adb3069b0e04-5be51cf3ca3mr112016e87.4.1792349592319; Sun, 18 Oct 2026
 11:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261018080921.3942517-1-fuad.tabba@linux.dev> <8633u229lq.wl-maz@kernel.org>
In-Reply-To: <8633u229lq.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 18 Oct 2026 19:52:35 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwHP7h_=e1s-iCDekMNvHGAQA3K1zv5v_4=PXQw9ueiFg@mail.gmail.com>
X-Gm-Features: AclHuK_UQW_4n5Vfv2y3fMN8nLjYC3wYR4AsLV2Y4-Ndgvu9PNfAVf7ecY50duQ
Message-ID: <CA+EHjTwHP7h_=e1s-iCDekMNvHGAQA3K1zv5v_4=PXQw9ueiFg@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Only enable S1PIE and S1POE with the
 features they imply
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_115319_237370_F70A2057 
X-CRM114-Status: GOOD (  16.36  )
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

Hi Marc,

On Sun, 18 Oct 2026 18:37:37 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I'm afraid that this only addresses part of the problem. Ultimately,
> the idregs themselves require some sanitisation because KVM uses this
> as the source of truth. I was pointing this in my reply to Broonie,
> and this is (probably) what sashiko is blabbing on about.

It seems so. The trap tables were only one of the places that read
S1PIE and S1POE. Sashiko found another: PIR_EL2, PIRE0_EL2 and POR_EL2
accessed from vEL2 have no FGT bit, so accesses to them reached the
hardware registers.

> I hacked something that could be used as the bases for such
> sanitisation, although it is quite crude and doesn't cover all of the
> possible requirements, see below. I've only boot-tested it in a nested
> guest, and I'm not even sure it actually works (my test box doesn't
> have these features).

I'll send your patch as v3, rebased on -rc3 with you as the author,
once I've tested it. I'm dropping v2's trap table changes, since
they're redundant once the ID registers are sanitised. I made two
changes to your patch. The sanitisation now runs before
kvm_init_nv_sysregs(), so the nested RESx masks are computed from the
sanitised values. I dropped the res1 half, which isn't set by
anything.

Cheers,
/fuad

