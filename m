Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C566F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqNFvjAye24gql8uTmrsq2o023iKQO7uC37aGmkm+1M=; b=0hdtqH4s3OUx5nX2ap7uxOSd1e
	jFrZ3PiD4EfONqOADxrNyPA5kc67seeER5/2VAhdKi24N/OnW8K+biZ13XexlayFZvm8ZTD75bZXM
	rvS/k63f51JcgvZ4Owb7e8wDWzbbkuoyd9KRcj6+wTVv8MJelx3NA4ZwyrbT8r8OEnVHjwUL7MmIf
	V2aUYNCtGypNyE1tQsSLFkNPWbS5NRf60HfYmOQJ91LoCuRSF3HJp2nyZEmlgOTbRffc2s0zYXM3H
	n3JzmSwRgTG8V6eghbOH+7uxVbZVGKBXY3iW+eMjjO7gUQR4oyLnWndzJm/AfFs2/g8y/FZnnBkjw
	WOPiQIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnsp-00000006tUZ-2DGB;
	Mon, 20 Apr 2026 12:37:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnsn-00000006tU5-22VL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A247D441B0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 12:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A81C19425
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776688664;
	bh=BqNFvjAye24gql8uTmrsq2o023iKQO7uC37aGmkm+1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ifM3fZhw5LIis5VLs9SRwND4oFrQTsoLfNKoeJzheUqJarIuliBBRUoZd+qlo5cVz
	 qyfyoV8cwv+uS0jcgGEd+5LbFWrzkXhz2JMn41YxgQKrFbVALjk9WxzutphFtoDTRr
	 bpEBg9QC8GXsbhkDTObeAM+itZFVPaMgPG9rs9OeNdUtlqs5InBKiXsv1Pao0SKRGm
	 qPmisxYcFtLpPmrC/CoLWcTPxNZg0z5DDwAayJy5Dp+Umjk8zeXCxARY2MObcwXdK1
	 4xzxQWZfYFT0rjyyvwpWKCsJBpzaXNgPa6HJ3rt443zOFmWqAYriX4sdAb5TGCGZch
	 c4xPFpPbPkI+A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a402b2d102so3477981e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 05:37:44 -0700 (PDT)
X-Gm-Message-State: AOJu0YwVUWRpDDzQHHUq59H5i5zYKA3X1gl7CVzKTlUeu2u7Q5ynMf8r
	M2r/oc9VU4FLBkS2LjOqNnPfOVqHtam8ZQ0mpiY49ddoEbgzxeGrgwBPwKDQq6ZEintWeIGij4E
	cRin++KenkW+i9JD623T2K10ydpNdKmg=
X-Received: by 2002:a05:6512:12c4:b0:5a4:1687:a32 with SMTP id
 2adb3069b0e04-5a4172e47damr4600775e87.33.1776688663270; Mon, 20 Apr 2026
 05:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260414211215.152850-1-stefandoesinger@gmail.com> <20260414211215.152850-5-stefandoesinger@gmail.com>
In-Reply-To: <20260414211215.152850-5-stefandoesinger@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 20 Apr 2026 14:37:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLmwh=LAz=zmtLYPBAwGn8h0tRX8Dd1wZDXC6+ybO6repA@mail.gmail.com>
X-Gm-Features: AQROBzDjinlKQ9gWdNdj8FJ2Vm0iweUN85M7NxZLVpOLBe90eAXhxK1UPUF7g3Y
Message-ID: <CAD++jLmwh=LAz=zmtLYPBAwGn8h0tRX8Dd1wZDXC6+ybO6repA@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] ARM: zte: Add support for zx29 low level debug
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_053745_547886_BDBC1723 
X-CRM114-Status: GOOD (  10.20  )
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

On Tue, Apr 14, 2026 at 11:12=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This is based on the removed zx29 code. A separate (more complicated)
> patch will re-add the register map to the pl011 serial driver.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

