Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77E6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 22:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q/NFcbhl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoG3Tpvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LUzzsIAM6IlGqlO6QeE7+4Pmhv4eAgzjV7MKduHlPpI=; b=q/NFcbhlm70m5N
	VhBy98VCaEPEYnevtJf7OIfJg/vAdkqdUYfl9szDo7M7E903piQsJsuzKDhSDEVHk8DmvVqt5ZHGE
	PufP7b1fi49voby3fsLUT2lt50cpY0xLHcsyNJkOtmuKikzZ5pdizH4hDjs/FsipTxxW1v000Kblc
	IxmwMY+gn+D9Tt05LFtulUyCGd8y8IISsdKJ7fBnFzrvny9brwp9P/bHJbXGRDZtjpe2D/UW3fesO
	VVpD13YMhR6vKU/eWj/NpOKuuZga1UtXnDdQphTdPEJTwSKMoqWJam/9ymfbFOTlcp6VzQROKfFWv
	XyV/iVnhIf6D38b5j4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCW7-000000082nr-2ZZe;
	Wed, 28 Oct 2026 22:53:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCW6-000000082nj-0hj0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 22:53:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3D6343851
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 22:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DC21F031E9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 22:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793227987;
	bh=LUzzsIAM6IlGqlO6QeE7+4Pmhv4eAgzjV7MKduHlPpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MoG3TpvrBpkcNOjjXlzCqkry5e09Sbh4WEMosecwIm0u4ucwfmxyGCSH6HmVBLD+E
	 mqnizOjovDh3TSi8hfYf1rVMAOGP3Sb6kXOELfx52ckxd8gMtYgQ3On7WqlUiS7ArT
	 JWqMZmtJ4vCAtC6uAVKi0bEueAN7uWAFbG3DqtVJoxzjjkfb1dvSk+WJbQ5vBaTI2V
	 OePwGMMsXiu1K8mjxMbs/4pzQehbukEjthpphFtH2j3MehP7uF5L2a1OpcsQWtl88F
	 kyC3lhriuzdzXzzQSvd+Y3U2nXTKABoymr5BNtHdbnNHPkQiGJoww8nQmkWNNqbFbk
	 dQPs7jqom46rw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so153747e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 15:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxViupfYS2F9Uu4bnWKmoIBOnsn8H3KdlDTqbUseQR1dcZSb5dp+tpas0uM99H47zv8BBcOs777L4utbULCA4aZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJW9Zc9ED+6Asz17ruOV1tZnyHZL+z/Y6ZlmZVGTK4xHBkdBJQz
	nSUfR4yIfaPm93Vylg1cf5oXNv8q5d5+cqocFVuwvjzG6oUkD+iwvaSwqKWtkamRbvFaobl+RvB
	cmA10/Cj60H1zAQTEIWVGU5N2pgW22CQ=
X-Received: by 2002:a05:6512:3186:b0:5bf:b7d3:beb4 with SMTP id
 2adb3069b0e04-5bfd11acd08mr221499e87.15.1793227986490; Wed, 28 Oct 2026
 15:53:06 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com> <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Oct 2026 23:52:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLngFzjoieJNkpp5-m-86CqNNfK3TDw9NDa1S7oMhOm1sQ@mail.gmail.com>
X-Gm-Features: AclHuK_KQ4oBhICxbJAF69cbCxAU7hikZMXoxY43y-DzbhGz00AVIZeTD4WQFRs
Message-ID: <CAD++jLngFzjoieJNkpp5-m-86CqNNfK3TDw9NDa1S7oMhOm1sQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 1:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Neat!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

