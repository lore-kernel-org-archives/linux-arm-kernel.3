Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBB6606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 23:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MJtJNkBL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDP2AO6L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K40LssP8OiY0dgBWU9vMWrD915dStcY2HaoQYfdzEdQ=; b=MJtJNkBLk+dKTZJmzFVt7rjYP9
	N8rLcL1U5iNgy6sVIDZtaoVgyeWYs8ZMYZ96uTMgKvSRpdZZpR3MPzDs903IQXZTR+yR+alsK8tea
	2XVn2oNUJuUPuUFZ4q+gjyMPax9Dd0I3MMUhuSRDMWb6AoUJ4JgIdrZDU1FwLB160EdNKAWJAT+LO
	K/WbSB2BUIWdVDRh8CgOn+FS4pXHChEn7SlngL8bK2XxdpYi7AQFN9e1i8jH/hajNoGmycoMZyV+w
	yBVdlTd8f5TizMeNprP/NYQjsZbZXHkmGLTscH+ipUt37Ojf9Evg7WxCR8I1IDXEWcYe21syfW3IA
	xxBDtbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfwa-0000000D3Oi-2Wgm;
	Wed, 21 Oct 2026 23:42:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfwY-0000000D3O3-3kbd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 23:42:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1599060098
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF161F000C2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626121;
	bh=K40LssP8OiY0dgBWU9vMWrD915dStcY2HaoQYfdzEdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eDP2AO6L+kkKUnaU0JyIxD94D4aBvCW5MhhC3PF146cPgJU3lcPMltZ20OmUid+bo
	 7P+HVDKuoFfSA2bAbtjF3SdQI2wMgw3YI91iRlfr832ZAzaxHdq1v6/uMKlMd+XOiq
	 j/7J62vWj8zmnqaI5Oj+NwqcLaTimIGXrv67GiNtmPHXOQqNRoxcQC+OBuCUChj3al
	 tA5ELvvXKHVJfAR8NOWAR2lu8NnSFw+9E9JLf4JUQPPuLNIShSpBdbWpLwa7EKYvGS
	 C3tQQse7HtwZexAufMMWpy7uh1Xy0ql1d3Cigy3s2VXS2oDkqMlLVsDh/Nc4ZthCNx
	 rRIItGpFXL5Ow==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso807790e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 16:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxuaUN430zOxmZuRRoqm/RJHpv17RzRSfQlMidB+6V4zm/eGJVHDapgZyTct7O/fNXP/46cEK1WwalNATnJhsKE@lists.infradead.org
X-Gm-Message-State: AFq9FYJqgXqjxzZNrntvxWk9aMArI1N6LnqhmeZGXRsPy8IJmDsAUpRq
	NsFOprhwzErfnMwBFdS/nkoKnCCG3hisdUqCjIIGrcGcnEkUEA81EZ87/PVohhA6TMavh8OwKKD
	Ai7k/XtlAyQCSMFF9JRM/Dg4PVO3qQaU=
X-Received: by 2002:a05:6512:158b:b0:5be:50d6:af8a with SMTP id
 2adb3069b0e04-5bfa1ceb37cmr1176705e87.33.1792626120440; Wed, 21 Oct 2026
 16:42:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021121245.3111563-1-lee@kernel.org> <20261021121245.3111563-7-lee@kernel.org>
In-Reply-To: <20261021121245.3111563-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 22 Oct 2026 01:41:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnXm3aJ4OnN8vNym2fVpU0PdQy1SBrPxLcc69hKA+K2wQ@mail.gmail.com>
X-Gm-Features: AclHuK9mN2gA0wqDEHlNp4kMbBvt1v7fcpPP3f_rBZxENespfrI6p61sISoyu5U
Message-ID: <CAD++jLnXm3aJ4OnN8vNym2fVpU0PdQy1SBrPxLcc69hKA+K2wQ@mail.gmail.com>
Subject: Re: [PATCH 07/28] mfd: db8500-prcmu: Make AB8500 cell and IRQ
 resource static
To: Lee Jones <lee@kernel.org>
Cc: Kumar Sanghvi <kumar.sanghvi@stericsson.com>, Sundar Iyer <sundar.iyer@stericsson.com>, 
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 2:14=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> db8500_prcmu_register_ab8500() declares struct resource ab850x_resource
> and the mfd_cell descriptors on the stack and assigns &ab850x_resource
> to ab850x_cell->resources.  Although mfd_add_device() deep-copies the
> resource table via platform_device_add_resources() before
> db8500_prcmu_register_ab8500() returns, the shallow MFD cell copy
> attached to the child platform device retains a stale pointer to the
> expired stack frame.
>
> Mark ab850x_resource as static and the ab8500_cell and ab8505_cell
> descriptors as static const so the resource pointer remains valid for
> the lifetime of the device.
>
> Closes: https://sashiko.dev/#/bug/linux-554f3a1f-ca41-4078-ae9e-66d0d7fb4=
c9d
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

