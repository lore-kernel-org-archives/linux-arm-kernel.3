Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7508D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mXm3Tx4I;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=HM19M2tj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=orKhTfTJ1loFLWK1gC5AQvr+zdn3IizBZw/adtSa0io=; b=mXm3Tx4IdDMp/g
	KwNQs7A7r68TUH3nWsN8v8gVhxgn8Ysq9vc9xsiv9NFj2mTldAzYDlSvApCmbTSwKBq+9Ves0gYHR
	wUjEWt3tgLuhwyxvY9eesA210BvJEel+mIjUho0Hrqk0q1/SljOpFJHfLq4Y/CQppyfhErVcaqRRu
	ylkkAn0HM4h+3SrLupjzfA9Fx0qzdxXZTuJfMnG9TCsROfRaNhwwy0KayH5+8El5kH0D8/kn9OGGy
	PVZtMGq+UQaegCMNAuXZeER6BubsiSY7jBfFB6UzWQgmAzxU8ZudJn3jxFMAm1RAp3eDrFHrXZPed
	OKdtYVcSJ+hqVf1r6elw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6Xy-0000000DDj3-2b9H;
	Sat, 31 Oct 2026 10:42:50 +0000
Received: from mail1.rojer.cloud ([88.99.92.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6Xt-0000000DDhy-3jPv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 10:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793443360; bh=orKhTfTJ1loFLWK1gC5AQvr+zdn3IizBZw/adtSa0io=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HM19M2tj6EbXZb/bdYPKBiqS1WZGxaaXlQL8iTRTsCdIbzH+/igpWkRqByXAFXdwt
	 L9j/QGwr2lAarRbet1+MEYShhpZnK3jcJVqE1TrKuGH1kRfrnNNEj9ERR9uGlvs323
	 /0CT9Y21opwFnlevgLZnGPtbdlgb+qlVvE5J+R2UhHdi7bhUf5W+yYlJFiVfTWpGob
	 acYe+FJr+WeCnIGAzzt2vgnmbZ//uhsX5y5Jp+R/OIRuTWpif6SvBsvNlQbFxVYRZC
	 skvPMKrmOxZ63PdrJw4xEWGI1qcnFkiZIj4PoYaB0LtVj9xmkHlUs0vhSWAGNmEc0z
	 2ak7ritWRnHaw==
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 54AD12168A
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 10:42:40 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6de1ca1b05aso1116649eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 03:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxSC7Nx+qz5NKFDeSHZ2u1lOpCupjAriccId3/p2lFPDBF7kM7Ln28obRGufsnkrf8d8HtAUu5IJtMgn8wKjyGN@lists.infradead.org
X-Gm-Message-State: AFq9FYKyVU+o+BxhdyJy7eFY1PPiRui7yfnUMUx61MNNQq5YA1CmPQX5
	Z5Uc8FbUBf+aO2duadBMDX3+CFgisq6FZ7qZU1yILw7umxWuaAh2FunePrf85ZjQ/aZJMEDsbuB
	nMnyelb4xXtOf9PJaKOEHG39uVWfymA==
X-Received: by 2002:a05:6870:21ca:b0:48f:e363:5cc8 with SMTP id
 586e51a60fabf-4a9077bbf39mr3116106fac.54.1793443359009; Sat, 31 Oct 2026
 03:42:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023235959.2988087-1-rojer@rojer.me> <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
 <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com> <4193517.ZaRXLXkqSa@phil>
In-Reply-To: <4193517.ZaRXLXkqSa@phil>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Sat, 31 Oct 2026 12:42:27 +0200
X-Gmail-Original-Message-ID: <CABFmFwoDKspgTcsStz4WKQZ+diRLLzu+MMGaRD2D9JXqDmg1_w@mail.gmail.com>
X-Gm-Features: AclHuK8EOjybxhaUBVSSjy2qBrrG1wOp4iky1FyIolBHsnDnBLbFpYQOr0Uc5JA
Message-ID: <CABFmFwoDKspgTcsStz4WKQZ+diRLLzu+MMGaRD2D9JXqDmg1_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
To: Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	Jensen Huang <jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_034246_154083_AACA6CA7 
X-CRM114-Status: GOOD (  12.78  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

yes, i double-checked the schematics and this is indeed a difference
between the R2S and R2S Plus, the change is necessary to make the wifi
card work.
sending v2

On Sat, 31 Oct 2026 at 02:23, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Deomid,
>
> Am Dienstag, 27. Oktober 2026, 23:10:31 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Deomid "rojer" Ryabkov:
> > Hi Shawn,
> >
> > agreed, it makes no sense here. will drop in v2, holding on for
> > feedback on patch 1.
>
> No direct clue about the board itself, but I assume the schematics
> should be correct then?
>
> So no change needed there and just send your v2, I guess :-)
>
>
> Heiko
>
>


--=20
Deomid "rojer" Ryabkov
rojer@rojer.me

