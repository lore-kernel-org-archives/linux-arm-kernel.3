Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25ED606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IZzA3dhe;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8vNTmzJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ICv6jUGNVX118Xnl5o38aHDRTyW16gGzo7Q2AcNNu8=; b=IZzA3dheR2viQ+
	MzzERv4Tp0r2cVW5dsJH5HbP0xmBCc6fO6kHxsIY4Rbs3U6w0gH0PynM9yUsRO/G+6wvloHx1r/KY
	1HWmVXDlprr0ov99ZykDBwJsBaE5lUfx/bo53h4LFlVt90FgzMdc9jeBnHGo3CESlGNNUTf40lZfu
	9KScnfZpoqn4iWYx0GqSJsvXo+P7OToUZb7CZC/AKWyb2oSA7T9L29ODwX/KP/ef74iahffXrwk87
	yyIRAdDDNjVqkxsdYuZiWStOwp2FikMyeq01tx6MStpeujoVKy7ztpY8PZ54A7k+V+G62jQ5L0q2P
	fUkFBcsO6vYrueX1Bm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa54-00000005JCb-1VjY;
	Wed, 04 Nov 2026 12:27:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa53-00000005JCI-1Bvv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:27:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3E2543A4A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 12:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72E91F00A17
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795224;
	bh=+ICv6jUGNVX118Xnl5o38aHDRTyW16gGzo7Q2AcNNu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P8vNTmzJRIMd2E7IL1WvPwQv9VKNfJxnrQ89FTHrmdbP1iMwJqZV6PqxBmKHiNDWM
	 RDBGMW/hy2wFHcWPlP7gxBAqKM1vACEz9eUcTy/QowTS2wAlX9VSE7BJBI2udCehO7
	 jqY57xbhHPoa+QRMUrFv50y05VvvXbFgvbewlk6GiUerrS74FWpf4hSc/91UTpKOHB
	 4DyikYHz5S/NGKyrGhVLwjOu4ihOBslcfbBYNvs1FjVVLREjYQGoS6G8zCCP2j6XVh
	 Asl7qTvp2x4f3PTJ+cBngjBp9bx17QeArvc3oNsRdy7jmGPTpPxQ+YWHScmGZ82CPK
	 PwwsJwdsgQkXg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so594568e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 04:27:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxSRJrsDdA2yr4QDdiDJIpBrqtShbmYzYIDBgZjQ5Dtwcw6GErZJ3QoRybcshk7d6kUAOyKQOCM6XrSKqZ14/0O@lists.infradead.org
X-Gm-Message-State: APuU4Z89lm6G3LIpOvOzgBoQw1ZnEYpDoRfzV361Y/xYJ3vBGKiS8n1w
	830cM9DDk19sgjMN1gboMoDM0fFb5U9iBx6dIaNlfWEswyNVRN8g++xQ+x6ECGHP3irY57+0TAp
	XI2597qwr9WEJLdMx0KNhpZ/JbL/m6Oo=
X-Received: by 2002:a05:6512:b07:b0:5bf:d4d7:a3cc with SMTP id
 2adb3069b0e04-5bfd4d7a563mr5048747e87.9.1793795223437; Wed, 04 Nov 2026
 04:27:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261005060641.32674-1-saadanjum239@gmail.com>
In-Reply-To: <20261005060641.32674-1-saadanjum239@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:26:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLkufRNvPrL+Fxd1mp41h1mcJ4sr8kBiMzpkF9PO5FM+Zw@mail.gmail.com>
X-Gm-Features: AclHuK8Ek2fH6rtSpITcfvraWZLhUk2KRiyUzvkvumhGGx1AWYNctAZyF_WLCpA
Message-ID: <CAD++jLkufRNvPrL+Fxd1mp41h1mcJ4sr8kBiMzpkF9PO5FM+Zw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v2: Fix of_iomap() error check
To: Saad Anjum <saadanjum239@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hao Chang <ot_chhao.chang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, linux-gpio@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 5, 2026 at 8:06=E2=80=AFAM Saad Anjum <saadanjum239@gmail.com> =
wrote:

> of_iomap() returns NULL on failure, never an error pointer, so the
> IS_ERR() check in mtk_build_eint() can never be true. The check was
> carried over from the previous devm_platform_ioremap_resource_byname()
> call, which does return an error pointer, when the EINT registers were
> switched to being mapped with of_iomap() to support multiple bases.
>
> If mapping one of the EINT register ranges fails, for example because
> the device tree node lists more "reg-names" than "reg" entries so that
> of_address_to_resource() fails, or because ioremap() itself fails, the
> NULL pointer is stored in hw->eint->base[] and probing continues.
> mtk_eint_do_init() then calls mtk_eint_hw_init(), which writes to
> eint->base[i] + regs->dom_en, causing a NULL pointer dereference
> instead of a clean probe failure.
>
> Check for NULL and return -ENOMEM instead. The existing error path
> already skips NULL entries when unmapping, so any ranges mapped before
> the failure are still released.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Signed-off-by: Saad Anjum <saadanjum239@gmail.com>

Patch applied.

Yours,
Linus Walleij

