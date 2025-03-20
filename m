Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1805C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MXWVPiHsl/ybfeX0fVWWFkRY/xYzUHOKzudQkSQFpg=; b=1eKOboBgQv30ieaBum9N1Eb0IA
	PgWrJrmvUsE9OWQLWJ4Yb8hA1u7sk18Bn/oXNBWRMHFZ7Qmz0jNgUtTnDpg0tpq+vQt840i1nRNvD
	M2V3XMyETDdmryCeCuffPpjEeNkLMu4m9V4Xs0JMV+ln0pmlPtaBinm387WgD8w4v6K8nW/VV0WYK
	4Z74KeDfqP/C+q5a9P5v8t33pSYRqnyFgEaaGCsmunUwlw29ouPTh2lZ13aBGs83FkNKKETq0HXc0
	9gXO/+pfV7DTSO15U08Aoq8R+dOnnqGyhAp8XeEcthuY2dNceNRWJihDLQzzCVzfmMpp6gXnLcHcw
	CV4ZarmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHOF-0000000CSx7-1r3z;
	Thu, 20 Mar 2025 15:00:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHMW-0000000CSfV-36GZ;
	Thu, 20 Mar 2025 14:59:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3913d129c1aso670314f8f.0;
        Thu, 20 Mar 2025 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742482751; x=1743087551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9MXWVPiHsl/ybfeX0fVWWFkRY/xYzUHOKzudQkSQFpg=;
        b=ZZpNYaVMAqdOTENoaxUs98mCgt6ei12/YxlfLtQrYE6oyzjdeI60L0idhK3+vHMo1U
         1ILnCRwPMAp08XmnJ+yvklDF7Evrr7CssJ25MHfRkSVF6ImrHbObvNUjuV2f6AiEpkkj
         9T5L7lqetuoDfzZ91H/rlRsMQRXLlBX5TlJMFDshrX0JY+/OnvU+5yQ0f3yZ4CYBPG+4
         DjHMEUs3Ry+leuYlBz0RsH8FSRT7FY0KWlK21FA6FkuQeTrd1UEM7+ls43liFyHVsCTC
         jkUJncl5TTo26auixKLxpYPE2y0sP+6ftMq5AC51V6Mr/UTiz51m6kzt2Be6EuXJnB5x
         hynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742482751; x=1743087551;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MXWVPiHsl/ybfeX0fVWWFkRY/xYzUHOKzudQkSQFpg=;
        b=jG4LoEQ+JZ3WabNDUyP3EL6wIwgzLUaCeY5qjZtMO8OiQ0m4tSsJP0s8roZ6mxPaXP
         nsJpHMJp/p/EGZXgUhC0yMcsc3xCZ3GKTNOqDR2m1AZBJK+30J6iO/MRk6PTwhx3A3TV
         Z66B426XmcMKA8E1YFWfob86VINGZEN+NnUPS3UGISMgKMu4xPrzRBX94R8r3D4G6O4V
         1oxrYf+kCwss4kNzrlORG94yQcg/ZAq/ZB5nUd0u8JExoSOqy+B4Lbd28GZnlxeTC/0A
         FYPrmZ8QM12HG8zT7lWniYIVOX+bKzbZ3XG1ZfYwsdvVVKm/NbM/c+/kOskUiDRsq3ji
         7Tgg==
X-Forwarded-Encrypted: i=1; AJvYcCU/ycUZx7lzoAJRur+Sv3RsIucltD0kaaflhKqvBYyWR8AlTdT6uUSBTCtlvewpxkfOlPEsLJwHN2+E8cdda/M=@lists.infradead.org, AJvYcCUVKHk6uz1LpW8n0qrk22b3pB/EXf9TAQ2etaEH6s/qefQO979dYv0uUOoK55EEYmXqurBUvsfP6/Qp@lists.infradead.org, AJvYcCXabvfeuwj2hNl8sYFsYqqfAGS5dJe1AVAHS6/u7x8IELK0XpdAqB50iGxdmwEeK7S3NFK3fdlXrOTkxyri1ImQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxUf5tjjxt3onPyDAnFspF+gRV5W+yn0P5ACe4duOP/sCwcrHjh
	id5qSqnnomclT28CwhrudzxcFU6hVIq09LIP4SaNhg6uN82h38Eg
X-Gm-Gg: ASbGncuWkzePYkm5ryUijjTeD7WvbMRuAgNCdyjAIX3+9cwzyq+JJUl26+VtP9iQAKw
	wtg59qNOboMtWj6eKX6nxftu8ylPDuqPgfrB2N4nbBJ7aJxbmq0+6T3Wbfoqa952aHhYgytGbci
	aFGOpv1bDw7MF0BDEq3swWMddTB1teSHRZDCxqhVWhvpFqxsUgEaCEDlqhI688w7e9XFk8kUzcS
	QZE4HiQQUwgha5ku1/UUfc33QjRuBSHueOEmpscdM+O5nreNAHu/p5eFJtL6mJEEHgBYoU2CN3R
	V/xKAXzuRrgjq/bWL4p9e9tGqKW0QGIi/gx4iOUG7BLZQhnV50L7n40TMmH3mPxxV5x0tEUgqMs
	u
X-Google-Smtp-Source: AGHT+IFSmo8fFuEqajq9aZA55RF0/kNYRGkGPQelDDCd7p8x/2z2TYhPjj6gPq4JZPeYBBnh3Gq1Ag==
X-Received: by 2002:a5d:64a8:0:b0:390:ff84:532b with SMTP id ffacd0b85a97d-3997955cc22mr2933292f8f.7.1742482750791;
        Thu, 20 Mar 2025 07:59:10 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43e35sm51134405e9.14.2025.03.20.07.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:59:10 -0700 (PDT)
Message-ID: <67dc2d3e.050a0220.2e39a4.c3f0@mx.google.com>
X-Google-Original-Message-ID: <Z9wtOv-ttPCY-Lpg@Ansuel-XPS.>
Date: Thu, 20 Mar 2025 15:59:06 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>, Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 04/11] soc: airoha: add support for configuring SCU
 SSR Serdes port
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
 <20250320130054.4804-5-ansuelsmth@gmail.com>
 <d6e27266-dc5b-4ef8-b708-21cedd06621e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6e27266-dc5b-4ef8-b708-21cedd06621e@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_075912_779566_C1818E2D 
X-CRM114-Status: GOOD (  28.44  )
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

On Thu, Mar 20, 2025 at 03:49:08PM +0100, Arnd Bergmann wrote:
> On Thu, Mar 20, 2025, at 14:00, Christian Marangi wrote:
> > Add support for configuring SCU SSR Serdes port. Airoha AN7581 SoC can
> > configure the different Serdes port by toggling bits in the SCU register
> > space.
> >
> > Port Serdes mode are mutually exclusive, force example the USB2 Serdes port
> > can either used for USB 3.0 or PCIe 2 port. Enabling USB 3.0 makes the
> > PCIe 2 to not work.
> >
> > The current supported Serdes port are:
> > - WiFi 1 and defaults to PCIe0 1 line mode
> > - Wifi 2 and defaults to PCIe1 1 line mode
> > - USB 1 and defaults to USB 3.0 mode
> > - USB 2 and defaults to USB 3.0 mode
> >
> > WiFi 1, WiFi 2 and USB 1 also support a particular Ethernet mode that
> > can toggle between USXGMII or HSGMII mode (USB 1 only to HSGMII)
> > Such mode doesn't configure bits as specific Ethernet PCS driver will
> > take care of configuring the Serdes mode based on what is required.
> >
> > This driver is to correctly setup these bits.
> > Single driver can't independently set the Serdes port mode as that
> > would cause a conflict if someone declare, for example, in DT
> > (and enable) PCIe 2 port and USB2 3.0 port.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> I think serdes drivers are usually implement in the drivers/phy
> layer, and I see there is already a drivers/phy/phy-airoha-pcie.c,
> which may or may not overlap with this one (I have not looked at
> the details).
> 
> Have you tried to use the phy subsystem interface here instead
> of creating a custom in-kernel interface?
>

These really set 1-2 bit and I think PHY can't describe PCIe in x2 mode
or in x1. Also I think PHY is used for more advanced stuff and usually
have dedicated register/maps. This is really to configure 1-2 bit and
provide the mode, nothing else... no enable, no power up.

Do you think a it's possible to implement a ""read-only"" PHY driver?

The PCIe x2 mode maybe can be modelled with
phy-cells = <2> and adding a extra entry to enforce x2 line mode?

But I feel it would be wrong to say that the SCU expose PHY as it won't
be true.

Honestly we should really consider starting to implement a generic
provider for these stuff... it's not the first time we have bit that
configure part of the entire system.

For example this is very common for QCOM with TCSR and also for Mediatek
with the TPHY. (but TPHY is at least more realistic as it can enable and
disable serdes port... here it's just 1 bit)

-- 
	Ansuel

