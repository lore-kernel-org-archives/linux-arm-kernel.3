Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CC7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 18:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHMwCYxqYB4K3bjOqiaSP4Irh07mGm4NozXsP5GfdHY=; b=xMfgkSZ26t8+2sF/tkuf79YUKD
	LnBP/IKwaXLzsdr1c2OZlX134mTuFHT4vPlDvLAbL91Og4o/T/DskVIDfnZ073APOFsR7DOoGS9Cb
	KUF46TtLMJtrYQrGXjUCi1vAqJy1ypShji/DRtdMnOhaT41XusEGTC4I30BQg9u5D1Co4V5qktNUp
	o/FeLUNKT2wfW+rqoqxIwWUWufFK/yuxQaFm9jrHX/mWeUq5yLnrl0/slQZP8jI2Wss9IDCIhO4LM
	xBiu+B+6MNec7+bv9V4bBX+iZ46LKEB7BGsYvkx96yy+7oLWTInB7gzWI7uPdvhvdiX1OjMK7x19D
	Hq33ZgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ZUq-00000002tcG-0uVa;
	Sun, 20 Apr 2025 18:34:28 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ZSw-00000002tVP-3mGv;
	Sun, 20 Apr 2025 18:32:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso4419905a12.3;
        Sun, 20 Apr 2025 11:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745173948; x=1745778748; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KHMwCYxqYB4K3bjOqiaSP4Irh07mGm4NozXsP5GfdHY=;
        b=U3bCztutF1TJifRL+EUc3JB6bCJJ9yQfc4++a0lH6Yhhg458Ry5ErggmFW/D2XNedX
         zpxRPxz1TNCd1I2OEGeDfS7CBJ4PCHZyd5tiYBFwYZ2CuLDWMt6jSEEBdLDsRivd3QDk
         QpjqehM+d0oDx0ksaLGx3/YCcfeIBygOar2bXtw18TmUPIolq6tCqKnGHFo9s0xozDPO
         4sC1EpVT8EPxn2Vx4y7dRF4GrGqNFbEFDMZzT0ockbE/b52n43uoOHlIdEhycSmKzE/L
         mGGoZSyMLWIiYcH+bPOzVnw0GMrEOdnbJo3JqvfDdRc44rxLae05rpw4Inzig5AWh0pA
         +U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745173948; x=1745778748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHMwCYxqYB4K3bjOqiaSP4Irh07mGm4NozXsP5GfdHY=;
        b=O77K+GkMh2aKfYvHeXnVGuCLaKRJLV2rjuJ1e0/zbk2tR1lssw619DqZ8+0Tir5Sy/
         0VtDVpTlGYFIIMWq+yz5hE36WWHDhov4tLNPbFvFXyQ5IT11w1xn8cr7aHeCsp24dek5
         BR4CoywdkATSHvI5SuKDLbg/YaRXuCbZmqonH4G/Ogg06KDSXLE2VuolnyI5k3GaX5rv
         Zwe/hmhb9nEYuIQqWLmV50F5X5bmh1za3s4Ayl6QQ26a7c66t8esGoAn6PWut77cHGT1
         hNUx+5TgzIR8ZWwyzUdILGwMbTKJyy6VYugzTBivtUwgelJwy97wjgNPiQSVPjb2BMGI
         8Jaw==
X-Forwarded-Encrypted: i=1; AJvYcCV2ttAuMPGuHJjHGrrYyK9LFqwd5O6h4qynZOjAJpwxwYsIuMQsEhXheU6c91tSAg9aDGIL5yO2MgTOabUSY7EC@lists.infradead.org, AJvYcCWbLQarqdDbrprS5Y5WWKah2f1nAEso0S9PQ5ZKjcaOl+ZdQdPd7a1q7CkKmjA1pnwpwdqyk/4J9yBzPKlEZzA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9wWxJ2BHskbjbj+9fRjHABUIgeZw+y8aRm6IH/HNHasFWkArT
	PJx6Ls199fi3M9lsBrTIcq1+mhtIvfbQc+2S7V73b3/ZzzQNoHdP5EqRIomiemxCNrsiBPXHPj3
	K8x+GK6ZMuzS516xJSL6VCRl/PVw=
X-Gm-Gg: ASbGncvEtSR1dVxwZBSSqTnQj0FHU+vDBs5NOlcQRlEJcz++fG108XjSkgsXEEozmoM
	mmllGypNPdKvg+BR9U5tcZOXBviRoN596FvH1OQ5fZE1ODmQVtVrBnj1HNsUpy1qzLqUCxfCV0B
	FzW2BK0KLo4f7+3l9OT6vE
X-Google-Smtp-Source: AGHT+IEPnmkH31oj51s5hozVKGyKY4kHpuP56H8iCYA0KDxboPaUS8t/fzUA+hf4uNYOr4Ph2UvpcAYZ+IX+97nC6gs=
X-Received: by 2002:a17:906:d555:b0:aca:b72b:4576 with SMTP id
 a640c23a62f3a-acb74b8e573mr850451066b.33.1745173948216; Sun, 20 Apr 2025
 11:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
In-Reply-To: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 21 Apr 2025 00:02:10 +0530
X-Gm-Features: ATxdqUG-QxcvLxPfRs54ioB0-541ISnYj4P0uxPpXHd3OZ6wOWJhvsW_PVi29sk
Message-ID: <CANAwSgTmmqkphvu=S8Li=O=oGNr2T7Eo8ocZpTx3kNix_CyX2w@mail.gmail.com>
Subject: Re: [PATCH] PCI: rockchip: Fix order of rockchip_pci_core_rsts
To: Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_113231_034699_06979AA6 
X-CRM114-Status: GOOD (  19.55  )
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

Hi Jensen,

On Fri, 28 Mar 2025 at 16:29, Jensen Huang <jensenhuang@friendlyarm.com> wrote:
>
> The order of rockchip_pci_core_rsts follows the previous comments suggesting
> to avoid reordering. However, reset_control_bulk_deassert() applies resets in
> reverse, which may lead to the link downgrading to 2.5 GT/s.
>
> This patch restores the deassert order and comments for core_rsts, introduced in
> commit 58c6990c5ee7 ("PCI: rockchip: Improve the deassert sequence of four reset pins").
>
> Tested on NanoPC-T4 with Samsung 970 Pro.
>
> Fixes: 18715931a5c0 ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")
> Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
> ---
>  drivers/pci/controller/pcie-rockchip.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 11def598534b..4f63a03d535c 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -320,11 +320,15 @@ static const char * const rockchip_pci_pm_rsts[] = {
>         "aclk",
>  };
>
> +/*
> + * Please don't reorder the deassert sequence of the following
> + * four reset pins.
> + */
>  static const char * const rockchip_pci_core_rsts[] = {
> -       "mgmt-sticky",
> -       "core",
> -       "mgmt",
>         "pipe",
> +       "mgmt",
> +       "core",
> +       "mgmt-sticky",
>  };

Thanks for this Fix. Could you add my if you can?

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

