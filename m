Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4160B606D801
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3iGxR8ZB;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQrjd+q6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nyw4uo1UMx2UMwcj5/86TrpcocSt85lTij3scmNGbos=; b=3iGxR8ZBXSYa8M
	//Y0iGPo7mQqy8dBNzcIs61ioTQlKdJZnkMIQ6fFso+Rc9HQVisYo2/TNpI6VhVDJNz+v2f1VEVAd
	RJmeJquF5DJFlU5Fgc5AUCs6MgZJ4jX6xSa1mN6Tj7Om+St5tShyyWx5rVMVSx/ZPrEgCW9veJlcc
	EDlxPH387CMlsj3lH7Euy8zqNoI9Pvi02NDHIYJ9hY8Mhgu9ATrfiv+0gvI5XY0MtxSQM02gg3oBs
	0YLkbEAzE1FLcTDs+s+ByhT41S62yFITgYaOmGzZVGxAmV1uWaGe4GHpNVZ+j7n4teSA6R3Z8V0wK
	DwgaymKzZLeTBbJkq1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx2V-000000092N6-0j9f;
	Thu, 05 Nov 2026 12:57:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx2T-000000092Mb-212N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:57:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4199743241
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 12:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263321F0093A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883477;
	bh=Nyw4uo1UMx2UMwcj5/86TrpcocSt85lTij3scmNGbos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cQrjd+q6nNpH2xoYNC3OC/u9iIITjUzXz6ZPttJw7Yk1JV+VJxUNiRy6fOdG4bo9h
	 GFL0O6lgYfzlBm/5jsmbAw21QmT0Eh8QxIptTWVhMwkCm4qXVZz/CshS+7P4QBCqq8
	 gW+LQNqBud8EGNAJrdghHpvGnQ4zBjEQH/6kSAzl4d1gRk88I0MYMfGmyR6M9rWkRX
	 UVdzwh0ZHGw+rb+WR7LAKULmUgS6ZY2jnsiYd6BSzAQRB9fL9iLfnR9M5XDOTbZ0wD
	 Lh4aQYThFILqsEH6JCp+daJ9LvCemhjVrSJ8c3hux1kPtLmdfD5BBANf0wCmCtwJUW
	 V/IbQPTgfpjvA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso1718041e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxwH9UtPi1WZyVQibZcKG1+k2vN7s9clRlqBKf1PQVqZ/QOUKQlFea4+RldUk4QniGEId4Ou33ooEuYpgFldQDi@lists.infradead.org
X-Gm-Message-State: APuU4Z9sQnrR0Yr7ZhKabyrNQeqFda5Z8h/gxow338bo3TiMVPK5WUvL
	97gfeh3mx7ynkeBX7cAgVaWLUQPmUkoYvFU106T9LpxiZ6KPxrufxaFBFVSOZiH6DUFidvPSN3V
	b/5l5HG33opVlZxUNy8A2tTe6ELSBO+A=
X-Received: by 2002:ac2:4e0f:0:b0:5be:536e:cfbc with SMTP id
 2adb3069b0e04-5bfd9562ac4mr7119062e87.17.1793883475976; Thu, 05 Nov 2026
 04:57:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net> <20261104152657.14909-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-2-mateusz.nowicki@posteo.net>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 13:57:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYxFR89WGnQKvPgCLYaE7Le06U45Cqn9yR05fa5C_xTA@mail.gmail.com>
X-Gm-Features: AclHuK-1e9C4sXwoHJ54MvMjIKaAAfliTo1iA6pakb6j7gBlL_TeQYZIIK87yhs
Message-ID: <CAD++jLkYxFR89WGnQKvPgCLYaE7Le06U45Cqn9yR05fa5C_xTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] mmc: mmci: do not count a data CRC error as a
 complete transfer
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Yann Gautier <yann.gautier@foss.st.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
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

On Wed, Nov 4, 2026 at 4:27=E2=80=AFPM Mateusz Nowicki
<mateusz.nowicki@posteo.net> wrote:

> With datacnt_useless (STM32 variants) success is 0 on a data error and
> a CRC error subtracts one from it. bytes_xfered becomes 0xfffffe00 and
> mmc_blk completes the whole request as successful, although the
> controller stopped at the failing block. Reads return stale data and
> writes are lost without any error.
>
> Tested on the STM32MP257F-DK eMMC in HS200 with a forced bad tuning:
> without this change 5 of 14 reads returned zeros, with it all 10 reads
> were correct.
>
> Fixes: b79220b3e0af ("mmc: mmci: add variant property to not read datacnt=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

