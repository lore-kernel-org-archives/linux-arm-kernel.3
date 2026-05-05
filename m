Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B832CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHsw9r8ouJVuHN7GVYsYGMkSmbPo1uSDVRuVT49LD1c=; b=pehG22ssnDE3Tknz5YzQgBi/6b
	yMNml9tgvYFyio7CDDBzhJC13/6KuJVnxvFMTfzLiYEVm0yFV2jPQg8f+kxzllKOvYeRy7nxkEXqJ
	5hjmWMGBBkAmdoqsAv5j6/lZdzz+VNp4cex0oZ3hq8qC0tluZ688Jx6vq2VPyUHrKxT46/PCcvHA6
	meeM0XAAvOg9oQm/4w3/OWnrdEFnwUQoCaKJBsnI4ZB+bwAibzi/90k+eHqvKVpVLYGUNan12NafQ
	k4zw96xvQtzXNVkLErhIyJrKlYijMaDBgxN8PusgNEj7JDnEH63Bjs7y4NF+EfSm2zzs3yh6KkfC4
	cL4iDMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDEr-0000000FvZl-0a9I;
	Tue, 05 May 2026 10:42:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDEp-0000000FvZE-1cGm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:42:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B32A14197E
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 10:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9642EC2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777977770;
	bh=NHsw9r8ouJVuHN7GVYsYGMkSmbPo1uSDVRuVT49LD1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uv8EAWzg8f4IMGFT1DxrnIxFMLOxomtXv8afgkf9Tv7369aKPHfByVxgHhFgyvSH3
	 nVlAQwSzP9fsw1hBgrBEZlO2OtPIdjpKUiOcxL3dQCmTOhBEN/z84m73oa9xHoQZM8
	 LCiQCJ0Hu3YUlf8LppEz50gHbZaA6jiRh2l1GdsuoUcvUi6lpYgyFNHLQwKzbytXuh
	 vkjseN2TNLjhGEAMLvjTcqVjl6axB9BZ44z2wk45A4EdRFn4MYE+TzcQdWAi47cjV7
	 RMBw28UofSc85baut7u/+RB8AzX2t+sidg+bBVCXHz7kMy70UTo26GxDrAaG4KIL9f
	 lR3YuD+4IxaqQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3937014be0cso30702981fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:42:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9dBP04bFYlAW6TClb2htXQQb4hc4eo0gcWXwLGdo8lN6DWNrOHwrFXI4ngStKhxhBCCWT29euSGGLu1eBkvhIx@lists.infradead.org
X-Gm-Message-State: AOJu0YxZWTPXG2rljiy4gZ7WmqQN8TpWNv6EoLyX3KDKfxIGFyfhKHS8
	xxa6ZMyHpNY2WtCTBpxwmtBncXsMVtpuQVjx0Kn8fIqI25pdIep+l8dBmMQl3DshMED6Bc04zJq
	VTBVFKVgnTYtCShC0hecEVn42eGa7AZc=
X-Received: by 2002:a2e:9a12:0:b0:38e:99ba:ec77 with SMTP id
 38308e7fff4ca-393784b08cemr45902241fa.14.1777977769358; Tue, 05 May 2026
 03:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260430143221.108382-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260430143221.108382-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 12:42:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLnm2sPEQQ7cN9Ci+jhNfB=WC2g=36d_N4upyxYUsmN6dg@mail.gmail.com>
X-Gm-Features: AVHnY4JOYfWjGgWMKrRcJKni4iVQt86bL5b2bssM2yVfJmEp4kUj5xOnRHOg9-A
Message-ID: <CAD++jLnm2sPEQQ7cN9Ci+jhNfB=WC2g=36d_N4upyxYUsmN6dg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: Kconfig: drop unneeded dependency on OF_GPIO
 for ARCH_MVEBU
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_034251_443287_843D7DE1 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 30, 2026 at 4:32=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly. ARCH_MVEBU already selects GPIOLIB, drop the redundant
> OF_GPIO dependency.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

