Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3288A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3KCz48V0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPZFFODh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8ru4HSnwu1oQ4oTSKgIFmon8BQMS/0IiXPCyBWh94vo=; b=3KCz48V0xQsI9F
	9JDmCaTMUVxXdnXZHd3hsqQ5GB6h7fWhIh4ySqmIennXA//1nqEvbpVXIgzpIrXnsVLaKBgTqCNFw
	DljmmU+PFsrcumTEroVBCvLIkPYXi/k/umENZVfJ3Teal3Tp/IqI1vNRaB1rPzv3K7DM/u0vsh4oi
	TJKLDiZAGxYGyfarvVLb6ns7Bi3koEwF0KpcFW/WY8fLuiovdKvwVWYutsqXTgg9INPgzbAAf2Yxy
	0wQSMzF92KwFFvsQSlAPytYqlIYbHbTedHqTZrjhFVCyBGi/9mg9EQczBHQ63eLjBFzeirFAreKEX
	CACkD5OaB1M+0N0UO6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxVg-000000097k7-3zvF;
	Thu, 05 Nov 2026 13:28:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxVf-000000097k0-1yuI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:28:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CF2340A77
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 13:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219841F000C1
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885287;
	bh=8ru4HSnwu1oQ4oTSKgIFmon8BQMS/0IiXPCyBWh94vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XPZFFODhwzMFOPYnFOG/f2gIhmZlzFGR3VM9E9oC8a4Qge/gN/2bdc8JVTBaYSriD
	 dnajOTcdBBJpTxMHp+10l0Hww4xnVZ0fetIDHktnLlpt41TdKtG0jLRinIADCl4h2G
	 H9jkaltZce3g4ycvP2X5mPYMBA1gfAjsP5sGOg2OuR4EM5LCfO+vp/8U7tRacofM34
	 iDJ28HZWn6GSeK6C8KNWCQLlFKH/3v5rxnq3Z53fw/SOOGmAcXpl7LJJaarkym/vD8
	 qRWNwk970yF+LqVNBMWI1q5U5bK09AqlTE7+DQDj2FA3l1W0Orkngo/IVOfFfSff0z
	 AmmNONwv4RLBA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1582737e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 05:28:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwaR+ddvclAN2K3G1GPIfOo2pTHBEBIdsH7NqOEWfY9SErYiRXe9kJhXhr3rYJTfj+3jaLGtyYB1OcPcDOf665m@lists.infradead.org
X-Gm-Message-State: APuU4Z8lis/FI4HGNLJ+aa1nqEPctxpedVyeBxr9QVLYnq5Cwpw52CuZ
	AVGMxxno2U+Srt5EbJcOkwm2wMonA30u6m+dLjxo/KW2OupjJtKULk9R9Py0ixdW8vZszY3y5sP
	UdkwdvXZML468Ojg2ZYLQKCLmecNvP+Y=
X-Received: by 2002:a05:6512:68a:b0:5bf:ec95:41f5 with SMTP id
 2adb3069b0e04-5bfec954634mr3564188e87.36.1793885285940; Thu, 05 Nov 2026
 05:28:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
 <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com> <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
In-Reply-To: <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:27:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRNSXt+Er3tnnucpAAj=wPa5JFMsdLLixT=8MnGYJoMw@mail.gmail.com>
X-Gm-Features: AclHuK8sEV6qv2B1_vrP6a-7LhjJiL37qYSrwskqM676CSWb53N83wbpRw8_kUI
Message-ID: <CAD++jLkRNSXt+Er3tnnucpAAj=wPa5JFMsdLLixT=8MnGYJoMw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 4:36=E2=80=AFAM Prasanth <prasanth.padarthi10@gmail.=
com> wrote:

> I will verify the requested base, rebase the October 22 version
> and resend it as RFC v3 for renewed review.

Do you have to still keep it RFC? I normally do not apply
"RFC" patches. Consider dropping the prefix.

Yours,
Linus Walleij

