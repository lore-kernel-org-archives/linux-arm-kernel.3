Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F94606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=suME653l;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mUjHI7MB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=; b=suME653lc0zSzQTJyxunAaikyG
	J08nZNaHOX2O8+4H/HDhQnU4jnGSUkCDcJxGbzid4sZ9gwwnu3DCb9FyNNeiIRPMRY79CwRzFPGae
	sid2zbEZ1EVVrLVfFDZmE0JJIqAVl2/OaGYgDarlnrp6F45+cWhEHvXqLegaAeF8qv741dGWdZXtv
	qR4q04+VPUhtjUMg8f1BOjDC6ba2O7soRvtDkwOJkck2UZ5G4wKh7pIHpWjOZB+HzATbBji3lNxct
	ZMtdlqvHmlHIsO8fn5arBGJIaO0N6fHg3Jc5ET0EAaMYBL6o2eWs4WkNZATDYGob45/p5rCRqRWNm
	WFywWyAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLTjU-00000003OWw-1I5z;
	Mon, 26 Oct 2026 23:04:00 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLTjR-00000003OW2-3kq9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 23:03:59 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so1006709241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 16:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793055837; cv=none;
        d=google.com; s=arc-20260327;
        b=g7etdJOBceXolL2m8HpCJNm6GUASCdi/UPU1gzkXlaFgrFgndIlk2L8mVKmUzSOAVH
         hNDGSyY2Giy05DvJ+bqVsJXpoIx0ZnsUX8D2//c/WyknFMIhee7lcOexiT63CaxAYEg0
         2CjSzbJiXbHix/dTEyl6HXEi8/450pHCVE61S+ZCBxpP/H9QGiOyHb+UM5ZcyZDJXNoJ
         ZfXcf33mumMxYsUqd5PfFWg1DCxtHCxARJfcFEjBZT8KEcFF9nNdz2ynptyQTRIadVsA
         Nu4K/LsWeQE9MbSneodzHUM97Pbr3gGlZuse3yebEmbaq4o5lsE3OB2PoJBaTzn0jTmZ
         21xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        fh=KG2ZgMvguKdgjWKXQDJMc0oZSieiPVTcE9QL8RY59C8=;
        b=kKq1UWFVJZ+m18v3qpa7OViABBmmM28nbSbt/mvwsPXkmqXQJzOcc/mn8K6eSCU9Yp
         72iotIRqDx8yGDZTVivUMrO3asT/nlwa8CK21UnL9FJiEkdUg2Iq5l88vmPhDZYa+AzB
         pQLZQPd8y6M8wFGPvvn0Gm6/ASPDt9eJ0URmuJI2g2/J6I235AmfTGWPvssMin2IbiSy
         /j4Wt7/Qha2PM0Z4870QljT6GF/C8wP4Bmocv38seAUQxOf77/3lCCG3r5kf3DsxUKJG
         ZqoKEVXi2bwMmkrxQlDqp99+G7zl70GFaZ4WoAzjQW9zFI5oT+o5ZJPJF8zRlaDaEJFQ
         0znQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793055836; x=1793660636; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        b=mUjHI7MBvjTkEruNTQfsBfAlbj0bV+P7ioHlgjgGoqVNhAv2uMdjR6BiVoJdzUCd/J
         VWBsqfZoEpD2hf5Aord8wQnp4ku1rghnI+mdJXEfqSvHscV6xbEFpPMkPge16iSVnI7Q
         xJpkuYpuGMLaaJDfHhtJ9Vqt7Fwj+3FngJEx/wC0Vl9EBzPMyEneiS1R9bQ8u7lFhC04
         +/Nz4PyeYfS1rd0hGXmRW91JkIvJwhyyfRvRbAgOjEIJ18im9LdhcJu+WYxa3W9Qn+KI
         M2xyZBzm2SF/uZgWEYijm4Ql3WceVyhJKKjfN82oJ94MD7MQNPJF4EmHyYa5Z16dVO/P
         2hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055836; x=1793660636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        b=XoXg92E2arWDFNN0kxb8m8F8oc24z+XW61PVH9Zpc2UJ8BfhN36UIKLR5GaYJVvaOM
         MqKvjh1XarUndSXvFQK+ZLDY+Cpb5l+Ij961rsnxyYIIBL4D53yKQZsoN/iF3okY5dwq
         ArroLUSEJwYxNxfOZJF6QhGKBEgL3Se9jUGeYxfTn0gLpoZxAYvBw6TqXHvTcbXFETKc
         dsP0P0+L5XLRjgngSf7Tvq/JipQU7ynDvnlEVhj0KJwgy+txf2hQa2h5HoQPUiqNeoDP
         YDZ8fHBbeVZ989NRsc27K/R9jOEAA0T4C8R9TKhMBxw7Z+8LoSYNNy6ZwviactAQQuvp
         F6qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLinzR1ZzqD5WAZ364buJh1M5bpgz7YPO3YB1TNEpyr5hxFtBAnSgxYO/kJjDrkqS5yGKA3m+lsYyuUT82IWIx@lists.infradead.org
X-Gm-Message-State: AFq9FYIzQ9rtyHkBTEeN0wTCVl3CGuDQXjRmiT0BX+VhLpaS/HSWFNLj
	L7bUHQBs/M8q3kbdhNkIQDBTZbSFnNyRsDMjA2yb3KYwUC5zD6+v1Frbo+aC3q9I5Lb1Wk9VOK8
	mAx0tVuCLKoDryTza5LzQ7NG64TPSqN8=
X-Gm-Gg: AYBFou3voF8qxW8l36pxQlX7RG+01ONSgvwnAc7jUMuOMgn3KjDKVWH/sfS1Tpml608
	mHKojz8pCNpM/uqLOVSOIqnfUBa7MOSIC6Dg/OUzFVFschtiw5zd7SUDxczQsEU2aEih2X5Mge9
	BCTqPmwg2pAh5++w5IwOQwqvrl2+GX7R17Ey1Vx311tZn62Hfi8t8xQAOr0gaGLeiiQuecgETFY
	bVqCIrjzni8p18mLhiSDjtaxWW9R51VyuEM6l0x6rCle0yIeeeUHubgO32FtRlIzpY8ezlvfI6h
	qzbZQd3jzGiiMdWYELtwur9KuovYJU/TD9ZbleTMYHSCeM27FCapd1HwkDXcmdK0hruJzJuPSC1
	Mb+RVaOcL1GoXi2+eVsHi0/YDuuJSJ8vhwn+WmbQOBz+0If+B4LUQYyIMGT1Y1dEClew=
X-Received: by 2002:a05:6102:5049:b0:7c8:fb4e:a3b0 with SMTP id
 ada2fe7eead31-7ce5ccddc2fmr2242244137.12.1793055836538; Mon, 26 Oct 2026
 16:03:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022193853.670625-1-ansuelsmth@gmail.com> <at_arsis_PFKDFxb@zenone.zhora.eu>
In-Reply-To: <at_arsis_PFKDFxb@zenone.zhora.eu>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 27 Oct 2026 00:03:43 +0100
X-Gm-Features: AclHuK9hoAjXwtHctYpz4oUv0zbqoQn_yeGbBI3iJDzHErUSMIyJMIBdwhVkFh8
Message-ID: <CA+_ehUwY2Z-qvrX5+sdZdrtpF-QtAozi7fHbV7Zz2cM-5UzPHA@mail.gmail.com>
Subject: Re: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel
 stack with reduced page_len
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Stefan Roese <sr@denx.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_160357_973482_909F850D 
X-CRM114-Status: GOOD (  16.07  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Il giorno lun 26 ott 2026 alle ore 23:59 Andi Shyti
<andi.shyti@kernel.org> ha scritto:
>
> On Thu, Oct 22, 2026 at 09:38:51PM +0200, Christian Marangi wrote:
> > When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
> > stack data is copied and written to REG_SM0D1_REG. Equally on the read
> > part, an unnecessary read is done.
> >
> > Guard these extra copy/write and read for the page_len to fix leaking
> > uninitialized stack memory.
> >
> > Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
>
> BTW, this is not a RESEND, this is a V2 because the patch is
> completely different from the supposed first send.
>
> Next time, please version it properly and add the changelog.
>

I used the RESEND tag for this as the first submission was
completely wrong and didn't reflect the actual changes.

(file got mixed on saving and committing)

Had to be more clear and maybe just say ignore the previous patch?
(a v2 implied that i made changes to that patch but there weren't)

Anyway corner case... sorry won't happen again :(

