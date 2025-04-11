Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12363C369A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtU+pOoZbsLOnPjUI7YZ5FGGjZ40GzcCM59B/7LbYr4=; b=fihs8HMNQLZ031w9gAjjzwGR9i
	YNLVglhZxNlb4KXcEBTjNw6u6v0nhvtGvq5KrCDpfTSjqgHSQzTX+7+aKLGF30/EbY1KlbFT0Yncz
	FvsYP7HjI0NJYAv5I6zXew5SXo4BvTsBEfp6hFECsEg0ZJTylOeyFrlhIl5PQqdUH7saeUbFfkH5/
	SV2AR1IGib5rPLpkJ82uL9ZmZlSyvwbWGakOFG9EIWmWLhNu9nwI7lqSX0UVYCiBX+fb4+Vn6Czf9
	o5rljBvdMf3m0U++XeUceP1moR5qkupNZ5A7lCrPgK5L8RcBr2ge8Foom120PojVpHenR8qS1vdbv
	SKBqwwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3B9J-0000000DH4C-2n5T;
	Fri, 11 Apr 2025 09:58:13 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39u9-0000000D39H-2UOO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:38:32 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e6e2a303569so1341819276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1744360708; x=1744965508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtU+pOoZbsLOnPjUI7YZ5FGGjZ40GzcCM59B/7LbYr4=;
        b=Z5O4UPlHUsB1G50hHjz7gr66xYgF4h7daqSwfnWrMcCAJG8fWI3SpgGP3evJPpbmfQ
         /Km0PlaQqHbBzdUy/aGdqTP3W8nJMNyEgobhkY4WrevkLpFKKw60Hmu9wf3HibweCpnh
         FaRUYaRHBYEeiKudfNRXglaF/KynWOdwKaVOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360708; x=1744965508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtU+pOoZbsLOnPjUI7YZ5FGGjZ40GzcCM59B/7LbYr4=;
        b=Xbqxzuyf1RNodpUebNReEsP53Fie3iMW43HFjItUFgr3a5UV2FXnoxcLsx4nD3TvZS
         17kfYw5zIdG58//3as/FZPdu0WmOiD439AStx2li9izQ6XLqipbs2/VFQ8n9mVfDJTrG
         mNDr3glr5ivLQTYAIjrnTtpKw2mGZK1ZfT/K6h69Z//CZmg3MVSva4XNg0KO59EOeupV
         11Q5zPpw4AdLyT4I2A8VJEAKtEjik3diey6JqiwZUvpesT6DVK2ybYvpQvemLd6Yn9XX
         lqaZmnP4gdQua+6vcsdxm6vnz44wWWPgvrIEWqbMmCJLTArbWPP4dTBKXQG7eG+y6iLB
         RVfw==
X-Forwarded-Encrypted: i=1; AJvYcCUYb0wQdyJYPIqSvLEKiBa5llRaA3de5Rg5Y7DqS07FRa+lSHcRghF5kA6IurUI3q8Ujj6VByfVQ8ynWqc23H3Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9+r56idBcUDUVXrGBfxTpHv8CeZHbvA/AX8huYDlnO05ettWn
	8qkKJawCqS6hL2iQuM8n7GEIpoy4zFUVERKFozpYKrGDJ2luKGdIndC4waildyBKpFRWVPDiOu0
	3kBa31P13mflE5K4ORKmFzF2wTUDyBrQOO2EZ+w==
X-Gm-Gg: ASbGncv/ODqDOdZyLDlEhprV/UsOHpLC57UxP+Z26FFv9B7N2IcHmyBzMe+QGRiPuIS
	XlHBzsgKtHsUfgNG5alEkIzhD9EDQr1KS0WCHScL1NyXqltrr7BGkxt+X7DfDRaLT56erDMSmr1
	Oeln3l6cC6Ajg/vKPiTTo=
X-Google-Smtp-Source: AGHT+IHCodNLsYqxPgYy8KacCIFQ8uMbF8eAgpfHHABuPW/r+cXCzHR5Dy1G6JiUbudEZgEzb8V1wt8pBrFYRs9UU4s=
X-Received: by 2002:a05:6902:2012:b0:e6d:dfea:8f09 with SMTP id
 3f1490d57ef6-e704decd54bmr3276455276.26.1744360708185; Fri, 11 Apr 2025
 01:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com> <20250314093503.GD12210@nxa18884-linux>
In-Reply-To: <20250314093503.GD12210@nxa18884-linux>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 11 Apr 2025 10:38:17 +0200
X-Gm-Features: ATxdqUF7idGp2hnH8dEoppZJLC3ZC9jhgwG1uStDtkKfsGzYjzpE_DfoJqtsu9k
Message-ID: <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] Support spread spectrum clocking for i.MX8M PLLs
To: Peng Fan <peng.fan@oss.nxp.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013829_652430_53F626A8 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, Mar 14, 2025 at 9:27=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Thu, Mar 06, 2025 at 12:27:49PM +0100, Dario Binacchi wrote:
> >This version keeps the version v9 patches that can be merged and
> >removes the patches that will need to be modified in case Peng's
> >PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> >The idea is to speed up the merging of the patches in the series
> >that have already been reviewed and are not dependent on the
> >introduction of the assigned-clocks-sscs property, and postpone
> >the patches for spread spectrum to a future series once it becomes
> >clear what needs to be done.
> >
> Although I give R-b, there is an idea just come out in my mind that this
> might break OS distribution that use firmware(e.g. U-Boot) to publish
> device tree for Linux Kernel, such as ARM System-Ready complaint OS.
> I overlooked this point in previous patchset reviewing.
>
> Since this patchset is to move anatop stuff to a new driver to reflect
> the HW truth.  And requires new entries in CCM node, so old bootloader
> with new kernel will not boot for OS distribution, such as Fedora/openSus=
e.
>
> Not sure how to keep backwards support as before. Leave to maintainers
> to say if they are ok with this.

Many thanks to Peng for the review, and a gentle ping to the maintainers.
This series has been ongoing for a few months and has reached version 10,
thanks to the reviews from Krzysztof and Peng.
I kindly ask you to consider it as well.

Thanks and regards,
Dario

>
> Regards,
> Peng



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

