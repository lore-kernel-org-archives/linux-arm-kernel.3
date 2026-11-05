Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B62606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bjDd2h4b;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kpSPsDb0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J5gXWu5vrhC9QDJv+VoLu5Rd6y7WbcJ3q2qRfmo4/U4=; b=bjDd2h4bSxOu3e
	ojLK22MsnbXTv3d77tiIofJrOJOwIjYodIgWSi3NAW6Gn4WOgZGM3OnNvIK0aU55rq+FJbV41loxF
	y7SGJmjZgjechKeXqG/bVa4VckQG0j4ZY29G7zxPGpw+CX/38nOrOPWtAXxveMvWpuiwNDYKPqbfA
	ZA8oTrEI+SB/NBkbJkEZhhTnAwTViIwUE22XcnF5WLtQRTzvpTX/xoX3HPQSbRihK2ZTWDfeTCA+l
	omv4L1EuFb9/zzkOEK1sL12DCiuAOXJ/SCmbU1+KI+YoCyjZIBOcbjKz2NxOBmQhOsFWg/vs3KaTK
	6J1r4ZEyiiRDB5gkjRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt1W-00000008Azt-2nuK;
	Thu, 05 Nov 2026 08:40:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOt1V-00000008Azj-07cj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:40:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2101160D91
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDBF1F00A17
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868039;
	bh=J5gXWu5vrhC9QDJv+VoLu5Rd6y7WbcJ3q2qRfmo4/U4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kpSPsDb0yPQzspx+pqXsOCUHH+PRE6+AJ0v+Slnebfzq6r6tdzfzzHoYsr5YsL5dH
	 e6Ow5CnNiAsuUEYZnq1+XUDNFXZuN7lKEoIoiAp3mXjJF5sIlRy5ARHl3LFYs1NVzz
	 SvJ5wEm/2nD4A2mG5+XvFKYG3KzUdbW+OjZ5TvnRrOhch6tab3o4uDz1URd+clau5/
	 LAtJlmietwPFF0Q6o7oE2+m3++OMc/iFdLqWBZai6FPcjRToNXZPC6NjBQOOaikJMT
	 tTVw7wloZkwDxq45GG8x8B88azC3zj7gqG5IyaC376xYKKH4PKnnJrFHI4IeoyLFUS
	 xBk+E5aNQPgMQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be416e603cso1066986e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:40:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwtLn9z2PI0R7HddJBNjtoqQ3geLtn5SlUa8IJLqqDDhUgdyAWsqQqvGks0kFVuCZez+arySdMFg49PujZpPU0K@lists.infradead.org
X-Gm-Message-State: APuU4Z+XTSNKtfq4xdukmYGRRDKnQtyYVlJMJwUU2TKmLvRWgsV/FXRr
	lMbrcP72NrJIKxRIRNKqM0fE9cf5G4jHxPOFm9alTc1HWiMEKP4+qOxslAbL2ynXwPotJ2alnCv
	Xl6cwIrAkCk3WzT/RdgPEnQsm2FuCvfw=
X-Received: by 2002:a05:6512:3b2c:b0:5bf:fbe4:4b2 with SMTP id
 2adb3069b0e04-5bffbe406admr445427e87.30.1793868038566; Thu, 05 Nov 2026
 00:40:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com> <20261103-i2c-nomadik-fixes-v1-5-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-5-655c6af2cb70@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:40:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9tVg=mAr=hcJuSKwFdCoRfrH792VUQ7m21avp_-ei4Q@mail.gmail.com>
X-Gm-Features: AclHuK_dYZjPrUpcWVPYkjWE1wavAEhVwWZvTK26ps86c6G9B9jsBZbaCvbMhQI
Message-ID: <CAD++jL=9tVg=mAr=hcJuSKwFdCoRfrH792VUQ7m21avp_-ei4Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] i2c: nomadik: add quirks max_len=2047 and no_zero_len_read
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>, Ben Dooks <ben-linux@fluff.org>, 
	Andrea Gallo <andrea.gallo@stericsson.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Nov 3, 2026 at 9:29=E2=80=AFAM Dmitry Guzman <Dmitry.Guzman@mobiley=
e.com> wrote:

> In Nomadik I2c controller, register I2C_MCR has 11-bit wide LENGTH
> field. Its maximum value is 2047, so this is the maximum length of a
> single message. It is less than the common maximum I2C message length in
> I2C subsystem (8192), so define a quirk in order to report the
> unsupported message without any attempt to transfer it.
>
> Zero length reading doesn't work properly on this controller, so add
> `I2C_AQ_NO_ZERO_LEN_READ` quirk flag.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

