Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D12606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x2yEiEtW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3b048kK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sr19VKYUvxwLrJlgEMdcLVEIVJZklrD+FybJ3ZeZXGw=; b=x2yEiEtW5IkMgI
	0wVYclSjK9NNUtt0lDcOFlBgqhausqbMdgJ822HvYeDPCQXZ+A43ZwP7mdNvtlKY9I0v5xJQIo8hX
	W+mI6LYL5PaOJ9RhXQiKV7G2Prr2PFlSmMo+QM12CyAQ/oHcBm6/lpa8iC+P/fTU5HAVoIM6U+UrG
	g46TYqSnaHFExnuLFgzjUGlE36IxwpBgIj3eoFSKrNskNVONhoNroVFyhIPXGcTzdXATzVeRZzUau
	/KKaojbw5lB5tDhdOYVu0y/qTMlzY/yTeYvbttF4eCQ0s8kwpkENL/DIaVnoU+i3zfVa9OAiauvoT
	XfogBc/yMT6uPReiKjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEsR-0000000GKyK-1e9W;
	Fri, 23 Oct 2026 13:00:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEsP-0000000GKy5-33C1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:00:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90ABB43E0D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A07D1F031EB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760403;
	bh=sr19VKYUvxwLrJlgEMdcLVEIVJZklrD+FybJ3ZeZXGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n3b048kKb1PgtvbhAx1oJQLSk/xFZgNmv8qTeNvWni2JXqRPAezw+xIkNJtW8uarj
	 eNfLC86mRiNlo1HYYvauwH5Y4zlYITncn7JnpGtbsxk7n4cGeETq6R+MwRdb9nKFUu
	 RZzgS8/zXAF0lOg3lI/sJVzLrBfvrz1BsYN32R+98eMUJQ87hhhnpaTlUuh4AvtEk1
	 yT/hUx4TCKNCtMTnkGzm8I76x339WOoxQm4rja12pod/FwXYpLgbAXiyM0M8BQrc/W
	 yjsuqbpbDNPYMihVezf9pYFVzYL7xp70t1bvJBHg+e4eraqugYKki+NLkEqxTR/ptu
	 Q2jx4BzZBKi1A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so895218e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByE+1nYTOWOATjyP0vJb+XP5MNnOIhNE0eYNa4zYKycWZlqgfaikj1A5Ipe/Lm+GbOP/lyGtoJPQhtu0Fv10n8Z@lists.infradead.org
X-Gm-Message-State: AFq9FYLRE35MbSITBg6IhYlpX5XrgNROU+3BSQXH5h0bbKHqJSBgQMGh
	pNO3B+cezsreQmUSzdWnAfeUiMEG5/zU5qcU/0kmxpD41lWfM6/OuvIwS8rJEmdBCaTCfFd3DfE
	Tzba03PXiO2paBb/acjOdyzY+x3L60kg=
X-Received: by 2002:a05:6512:1244:b0:5ba:3632:cf9 with SMTP id
 2adb3069b0e04-5bfb0a4f3a8mr756271e87.66.1792760401405; Fri, 23 Oct 2026
 06:00:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-4-9352be6b86b1@kernel.org>
 <179242679515.1178810.16625867453853597322.b4-ty@b4> <20261019163732.GH2663669@google.com>
In-Reply-To: <20261019163732.GH2663669@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 23 Oct 2026 14:59:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8ZgrUHoRuPA=tWnP=iODE7hR_zOGUmTS1p7iRNggivg@mail.gmail.com>
X-Gm-Features: AclHuK-ukw_Hgb4DIFvnusEPhIMVNTAyp8V0dmIgTflHNqlHHkK-tLLwcaoopM4
Message-ID: <CAD++jL=8ZgrUHoRuPA=tWnP=iODE7hR_zOGUmTS1p7iRNggivg@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 04/18] dt-bindings: mfd: db8500-prcmu:
 Deprecate EPOD regulators
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 6:37=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> > On Mon, 21 Sep 2026 00:48:10 +0200, Linus Walleij wrote:

> > > Deprecate the db8500-prcmu-regulators node and make it optional as EP=
OD
> > > control moves to generic power domains. External consumers of VAPE an=
d
> > > VSMPS2 now use the actual AB8500 or AB8505 buck regulators.
> > >
> > > Stop requiring the individual regulator child nodes while retaining
> > > their definitions for existing device trees.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [04/18] dt-bindings: mfd: db8500-prcmu: Deprecate EPOD regulators
> >         commit: c8132247fe4df52e9982d74c986bb199d792b85b
>
> Hmm ... or would you prefer for the set to go in together?

No this is fine, thanks! :)

Usually I prefer to trickle in dependency patches.

> If so, how far off are you?  How many more Acks to collect?

Not too much, it's some review comments from Ulf that need
addressing so some banging the set into shape in early -rc shape
and I expect we can merge the entire set for v7.5.

The endavour god a bit sidetracked because there was a pile
of technical debt to churn through to fix bugs in the different
drivers which were of course extensively refactoring the
same code lines...

Yours,
Linus Walleij

