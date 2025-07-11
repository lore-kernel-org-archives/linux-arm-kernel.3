Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD22C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68zxtYLTKBpsqGG1ojSx4GWgoXoxkdYc8QUb/iTWC04=; b=uMz4eRVakJdnybD6PkpgOya0iH
	Z1/3wsyFvxDLoGofXvhraA9FCJBdqsS/Kwoz44mc9Vpc0R9AOxNSZRoRamfRqi8ZgieO4CYiqTfds
	4z0O6/vgnWThMMXGDybTad6jkGEd6i23Uiv93xuYfu7PRl8n5qUZVGdFo/MoQn6Z4XqeF5cs8oEly
	/mSpu5SVZsrDfjGy5rKBeZ/o8PSxE7SnejQKFmuM0BfRvserkDmWoOaHXCz0R6qeFuWUkCMs0Uc/g
	t1inJTWcfggYz+Sgw8n8e0mbczTTcIBAtZUS3ZHUM3dBUC3Zdrum1TilN2C4OUQhnCdWMbqMGUJq6
	JcfJFfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKna-0000000FrEk-0LLv;
	Fri, 11 Jul 2025 20:56:50 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKRA-0000000FnUR-2ng3;
	Fri, 11 Jul 2025 20:33:41 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-710f39f5cb9so23799427b3.3;
        Fri, 11 Jul 2025 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752266019; x=1752870819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68zxtYLTKBpsqGG1ojSx4GWgoXoxkdYc8QUb/iTWC04=;
        b=JgDDLVZDUOnkFoaRuYo764Z2qfYGVvZmDFxsN2tYHf+yp9gJFBJl66pvBhTqqPnlML
         ceaDYXGudvJ2SrLOD2hEq2oE8eZ5GxkWBoWQiEb9udVpmbr7HvB4ufrpJ0QoujpHj+wG
         sgT3rNqhs2IjbiTFYZHcvu7L9CNPTGp4NYngQDxVtT+FSoiFFPZLLqn9DWp/eyAODEW4
         Ti91ZM/5qLYdqb1xE81KNkGQFlAmjJdtgyvq6xaH7DhnM32UZMs7GZM9aeWEGbDtdk4+
         xTOyHUMRnaG0JPMoGfYVeirqNIYUOS9rP54/oF7/jaBHmr4En6G8uiCBazZigAXVLZfe
         Tt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752266019; x=1752870819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68zxtYLTKBpsqGG1ojSx4GWgoXoxkdYc8QUb/iTWC04=;
        b=OSO5zZFryaChCw7afrjgTnZX7DCmcfaraNvqoOAZq5P9qz/4885YrZB3Sgcgo6uzFv
         vYydDnHcUxYPTlXcIIQ+GN0+JKIRE6d64e6NAp9r9Vd+Em/VEG+K2kqM1I2G3wsSZNrZ
         /aBICUPlL071MjhQqqkiuANoIFWaPD1whCQpzzqRfvdqzexsqKj9QQ3BxpQhI2AB30a4
         l8OIow5SLAwtSoON98TOwnjCaMTajPCaRbb00NxTwMbzihrR32nyK+JausM5arF1GGz9
         icW0nD1RG3yX+4DC/1vjPH0QgSe5djqEMoKRW1WkiG5orvm+nB2LRDtoWtxPDf45/arQ
         AM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8qQyVMJV2q/mFAkmqiR9z3Xqj89f1wg2cMzTXwQHWtQC87eD+QzCR3xFjwzbcJK7LZsN1t3ETT/y7ZaH1wzU=@lists.infradead.org, AJvYcCWyYDeuxG5BCQr8T87S77Nu9oeKeKvzC5AV2OMkqGFw23myItacHffJCKkAN215R8hQ9ouSTrXeHAJIGoJniXNQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1pOb4MwEtsr/E/bGzj51k2nYFW4O38es3NSJksC2SRMVpu48h
	YDjV2NZuPLjJxeFB16s0S4f03LTbJaZ8249G16UBGPucp4T1Vh3FxbEbzyskWr0fbIczm9DxxVw
	puyCJgiPrK8LycKOSIkYy+PM1ZuC8D8c=
X-Gm-Gg: ASbGncuoIKjQNXkqTiebCPCfCXtwtn3s7BkkfjNs2Cooo4fzkQX1dRl+lhjqlIb+la2
	EAgFsNiMfwlJwPKoNkNX3S2RCXqFBDFyxdE9Z1pswDiOO5cjm+EisiG1N3zVxha7420TdPlwDL9
	DXQaIZJymOfBuyCcL0zmRRe6NDkW1g0HUEPAriBoPasosirg3lZD0BXKtntucPMYKOM3JJ4Vqp/
	DJzk4kKHIGTARW/bZqZ
X-Google-Smtp-Source: AGHT+IFg+WUq3I+LgojCtWQCG1ohGsNvGS0P6Am8moryAkN0ougdp4dlLradnGh+qIDN3ZBugeMbcm99Mg21Si+jSDc=
X-Received: by 2002:a05:690c:d18:b0:710:e7ad:9d52 with SMTP id
 00721157ae682-717dad97268mr58784337b3.14.1752266019055; Fri, 11 Jul 2025
 13:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250710200820.262295-6-rosenp@gmail.com> <20250711140130.378067-1-oleksandr.savchenko.dn@bp.renesas.com>
In-Reply-To: <20250711140130.378067-1-oleksandr.savchenko.dn@bp.renesas.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 11 Jul 2025 13:33:27 -0700
X-Gm-Features: Ac12FXwXTVmcvlOTDwwKq18nH8e2J52S9X6I5huP6K-iIbpG3IV0HKFlWIK1Dro
Message-ID: <CAKxU2N9bjn5ybyTpk9Cc4B_GcLYdbEwPtzoxQkuEKH=MeTi-dQ@mail.gmail.com>
Subject: Re: [PATCHv3 wireless-next 5/7] wifi: rt2x00: soc: modernize probe
To: Alexander Savchenko <oleksandr.savchenko.dn@bp.renesas.com>
Cc: angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, johannes@sipsolutions.net, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-wireless@vger.kernel.org, matthias.bgg@gmail.com, robh@kernel.org, 
	stf_xl@wp.pl, tsbogend@alpha.franken.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_133340_704848_F0ABD38B 
X-CRM114-Status: GOOD (  11.78  )
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

On Fri, Jul 11, 2025 at 7:01=E2=80=AFAM Alexander Savchenko
<oleksandr.savchenko.dn@bp.renesas.com> wrote:
>
> Hi Rosen,
>
> looks like here are memory leaks in the patch, PSB.
>
> > +     eeprom =3D devm_kzalloc(&pdev->dev, ops->eeprom_size, GFP_KERNEL)=
;
> > +     if (!eeprom)
> > +             return -ENOMEM;
> > +
> > +     rf =3D devm_kzalloc(&pdev->dev, ops->rf_size, GFP_KERNEL);
> > +     if (!rf)
> Here driver must freed eeprom memory resource.
> > +             return -ENOMEM;
> > +
> > +     hw =3D ieee80211_alloc_hw(sizeof(struct rt2x00_dev), ops->hw);
> > +     if (!hw)
> Here driver must freed rf and eeprom resources.
> > +             return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allo=
cate hardware");
> > +
> > +     platform_set_drvdata(pdev, hw);
> > +
> > +     rt2x00dev =3D hw->priv;
> > +     rt2x00dev->dev =3D &pdev->dev;
> > +     rt2x00dev->ops =3D ops;
> > +     rt2x00dev->hw =3D hw;
> > +     rt2x00dev->irq =3D irq;
> > +     rt2x00dev->clk =3D clk;
> > +     rt2x00dev->eeprom =3D eeprom;
> > +     rt2x00dev->rf =3D rf;
> > +     rt2x00dev->name =3D pdev->dev.driver->name;
> > +     rt2x00dev->csr.base =3D mem;
> > +
> > +     rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
> > +
> > +     retval =3D rt2x00lib_probe_dev(rt2x00dev);
> > +     if (retval)
> > +             goto exit_free_device;
> > +
> > +     return 0;
> > +
> > +exit_free_device:
> > +     ieee80211_free_hw(hw);
> > +
> Here driver must freed rf and eeprom resources.
> > +     return retval;
> > +}
>
> Also need to check the rest of allocated resources: mem, irq, clk.
The point of devm is to not have to...
>
> BR,
> Alexander

