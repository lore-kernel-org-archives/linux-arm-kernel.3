Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C47606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u9Iqqp9y;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWeb/I3C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MXajDzcXzw8HFrD8vEhPMO3rOmoG3zJCn9w9dmNaD30=; b=u9Iqqp9yG5T3l7
	WhMxyEK72kzfI59F/O4OOEkeIar1cObr1JsFoEKYgv/pE3/Q14kxJuEaaFOE5yYsUt89dgasyjJoa
	FtPc70lX9fo6qZymU21XGc7/dsGpwZZSyaATXik6dV6MvO7KMiTTEkkCbK5jUZUQx64H6B7CbkdKO
	Y7imspAMbl/vUO7I9EzNZjxMOI1wsdQ64yQD4M+jpKgEr+XM5KsS5GtqI0E9F+uisp+iJphLCGB02
	HSBSeMFaARjg9gcHjk9OW/cDoe12mP3ed/XpqKzGAJDetFFlDstU/4Z/qlIaiNPIuCZqACM4xroFZ
	4M3/M704sjuoRY/3pnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsmv-000000089WK-1IRX;
	Thu, 05 Nov 2026 08:25:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsmt-000000089UE-0UKM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:25:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6946A43CBD
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C65D1F00A17
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867134;
	bh=MXajDzcXzw8HFrD8vEhPMO3rOmoG3zJCn9w9dmNaD30=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cWeb/I3CUOf6GV6EV+or+YbPD42zxND5eYvgZmaTp1vxDwPhjrYTcTmDFXOiPPUAf
	 xnzXOLVNszc/Vv+Utbzhhj8hnvCik/aTr5MdC44PX0h6eExGOZDfHzCLvfe0XIsg7u
	 0ypBEHuzN4JlkRzZbNjrPIB5Ue1hlf4/7++sPCYwOcYz/ilel4OzvBLq95TGL12Rh8
	 f6MhWCmjO5hUEd/a/xAtgiNa/FjVZb5nb5g23/LdUpFH3lXWdOyhFU29jqEyS9BUuz
	 AAiPVPE0OQpKhxtwOlZQ2Y0BnTerZHROjRrxuGgLeEZ7EvE/Iwpl+uOMFKpD0o35Hn
	 dS3uWKT7106Kw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so1301314e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:25:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByqpaLq3PpbWxbYsymudduN7xP/UnU4ddKQdnRllpNSEEBaSoQok6RzMvmUmJAixNeDg/sB1x5cu9LKXlma/t2p@lists.infradead.org
X-Gm-Message-State: APuU4Z+mx0+tSR4itcXK7W77y5tf/IIvVkFHMQN5cqXDDH6S3FBX+J+K
	vwy23jdUsB5F+Wj58vgClY038pG+ttqGYKvunFBpBaekk5cmdT4oQE8iPlb2kyDdluFzhmE2zpc
	ysrlLdd9pCmTjUHJ4nbP7hQV3D7Lyo6A=
X-Received: by 2002:a05:6512:6694:20b0:5bf:d9ca:657c with SMTP id
 2adb3069b0e04-5bfd9ca65d0mr3770360e87.27.1793867133080; Thu, 05 Nov 2026
 00:25:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031120700.42576-1-mateusz.nowicki@posteo.net> <20261031120700.42576-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20261031120700.42576-2-mateusz.nowicki@posteo.net>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:25:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmJnxdJ9-X4hThz==Q8ZJScb567VwdAYebGsSqA_KJsjQ@mail.gmail.com>
X-Gm-Features: AclHuK_tVeDfi38_WWdEZ3DB94ymBMDKaW_qe7crMyvj_c5Kzm5MMFqKOFgn5mw
Message-ID: <CAD++jLmJnxdJ9-X4hThz==Q8ZJScb567VwdAYebGsSqA_KJsjQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: mmci: do not count a data CRC error as a
 complete transfer
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org, 
	Christophe Kerello <christophe.kerello@foss.st.com>, Russell King <linux@armlinux.org.uk>, 
	Yann Gautier <yann.gautier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
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

On Sat, Oct 31, 2026 at 1:07=E2=80=AFPM Mateusz Nowicki
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

Looks right but we really managed to make this code hard to
read, we should think about readability improvements.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

