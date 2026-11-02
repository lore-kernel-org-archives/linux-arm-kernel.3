Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25201606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 22:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SWfJjg4s;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhvbXSKe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e1YYB8A6hDEHHLeE7ijygK35bswGqWpmgHbadPgu68M=; b=SWfJjg4sg82vRe
	DxIQkdGSGSghqz2BM5LMhaBcyqCA6lut4GsNzuf4f9jk32otfCJFij0akuqMaxXu4iiizi5QVL6wM
	SEPg4+beeL66tJ7yR5KvwhpR0lUlgkn32lVD0pUIJHqj+dxxsybjA45daXAjHJU/sBaES2RXip9eE
	SNMNrggZCbACOZu1bF5rrHBXzjL7fWJVo+vZ4BZPKlR5eP6XZoBvkxjD4dptdNFYKaL2RYs0AoCio
	xfCwJ5fZUBnyePEXQ9/UGnZuvWi+dN9GIYQfPpMfqRJi1xhAHj4yZy0inflDtbBUsXbjlIeik+eG5
	U5cV+m+xNOW4+Hdyel2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0GJ-00000000XHI-0p1E;
	Mon, 02 Nov 2026 22:12:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0GI-00000000XHA-07je
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 22:12:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E35543DB6
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 22:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664431F00A16
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Nov 2026 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657537;
	bh=e1YYB8A6hDEHHLeE7ijygK35bswGqWpmgHbadPgu68M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nhvbXSKeFAKz2TvfL67iWPjkMQIkR+O3mbwAbG2uKjAc5raQh+WqmuEfYg+dWf98o
	 mzvBpztd3vo9fz5NaqQBFv4LGSP6jMVAYMWcX5ZKeWDptLdq8ghIopc9K8UQoRyCgT
	 z5LkVUXkImpwb7pYOhPRmfMOIovDOKBR29CVgmQb1Q03MZoh93nRtLKo5cdNGLUCG1
	 4tgslehg/1XaowqxEIpsylnfkm3CyBgzF0p2dEcbqc/iFhiXZAcp0GGJUeL3y1aYeh
	 vEwu/GfMKQtwDVi5eHR3jfQuUZfZG6EY+JHCm64Qo4KsADuPVTN0fvbAODq/HpNgnO
	 2SagBt4UNZt1w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfc346401aso2533842e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 14:12:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwfLgx73pvtxR6TsORRUPVu12jzgl1giHfs0AzLtYvLzObCEPP1Au9kSgmfOErGQTMO5HxX2WpiI8gqVBcOyHwh@lists.infradead.org
X-Gm-Message-State: APuU4Z9UIRrASaJCqPJ8jFHxuV0hT8hkpj2s4jvl/eCd5Cisbto10TTG
	DwOLg1/tQTYXMdF2j1lafzw7R53ActvTt3dA+v8UPvEmqEoXAWAddtvn+EMthdGmRJnmABQ682b
	wi/H0fN0P0K/tWkIt+4hembghuw7548g=
X-Received: by 2002:a05:6512:10cf:b0:5be:5394:162d with SMTP id
 2adb3069b0e04-5bfd954b775mr3148381e87.3.1793657536092; Mon, 02 Nov 2026
 14:12:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org> <CAPx+jO_KJJ6ORKuw6VJmtZAOEnzVz0+bq3bEFupAK_4UROKBAA@mail.gmail.com>
In-Reply-To: <CAPx+jO_KJJ6ORKuw6VJmtZAOEnzVz0+bq3bEFupAK_4UROKBAA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 23:12:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLkC7XehyM3Qh4mDu1zB+_MKhmFn6ae1sA4XCxeS1btT9g@mail.gmail.com>
X-Gm-Features: AclHuK8dNHZsRqLthhksQhjLhAkrSznv9BcaYJhCMzuzVcpQer5tPiLaX8qENy8
Message-ID: <CAD++jLkC7XehyM3Qh4mDu1zB+_MKhmFn6ae1sA4XCxeS1btT9g@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 24, 2026 at 3:27=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:

> > Hold that domain while DMA transfers are active. The DMA controller is
> > runtime PM IRQ-safe, so keep taking explicit LCLA runtime PM references
> > from the descriptor preparation path instead of relying on a runtime PM
> > device link from the atomic transfer path.
>
> A bit of an orthogonal problem, but related to the above. The irqsafe
> thing have been discussed in the past for DMA controller drivers.
>
> Would it possible to get rid of the irqsafe configuration for the dma
> controller device, altogether?
>
> I don't recall exactly, but not the entire consumer DMA API is allowed
> to be called in atomic context, but perhaps that is not sufficient to
> allow us to drop the irqsafe configuration for the DMA controller
> device?
>
> If not, I wonder if the consumer of the DMA (like an mmc controller)
> should be assigned as a consumer device (using device links and
> DL_FLAG_PM_RUNTIME) of the DMA controller device. In this way, the
> consumer (mmc) would be able to control the supplier (DMA) through the
> device link directly using runtime PM. This could potentially avoid
> the requirement of having to use irqsafe for the DMA controller
> device. Maybe someone already tried this?
>
> If the irqsafe configuration can be dropped, in some way or the other,
> this patch could become less intrusive, as all that would be needed is
> to create a device link to sram device using DL_FLAG_PM_RUNTIME.

I looked at it a bit, talked to the AI prompt a bit, thought about it from
my (limited) understanding and while it seems possible it will need a
substantial amount of work, so I think it's best to get this powerdomain
migration in place first.

Steps to actually go there would include getting proper consumer links
in place and verified, remove all atomic resume runpaths in the
DMAengine, handle requests without a device such as memcpy (I guess
by simply using the DMA device itself as device link?) and some minor
refactorings of lifetime for channel setup/teardown.

But indeed we could use the pretty well documented and supported
U8500 platform as a canary, I think you have access to this platform
too, the upside is that it is "simple" compared to some recent SoC
monsters so it could be an example of how to do stuff.

I don't see much generalizable stuff apart from things like the
pd-patch to the SRAM driver being pretty generic.

Yours,
Linus Walleij

