Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C4EC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 07:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6uk2vSSK6kqFUYuqq9wRIV5THBtnHlaQCSQ8TziC3o=; b=Sy7j9CpOwk53a1DzIvN/YCQbVn
	/UQtIGhq1C2XOoMJ+N+lZ3mbRppLbbPEsFbDaqPjhseJ13bSeH+WlguU30UnoRXL2uSQ3lu9v/t8t
	47g45H/9q7QrzpY/UU/eUUwqUshpLgQ6iI8VGLQ/AWuvpcT11MHaNHWxPVGL51aBLnptdsb04zLIW
	heQX9w1axfXmslB4/YSOXPF7lRc8PP9wg1GWlNNiARk1AQ5NDBQqKz1PeOhqRaCBV/RMghGbHO2Ou
	OY+dPFsFdzUn+gXYT41f+nPrWFcLDU28v3smG81JkhOrrxrJTICHVimaSsFqLOcBcEoPXyk6YE+KG
	tBhdAwwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqyL-0000000HRHl-3R0E;
	Sun, 13 Jul 2025 07:18:05 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaqvw-0000000HQyF-1R3D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 07:15:38 +0000
Received: (wp-smtpd smtp.wp.pl 19348 invoked from network); 13 Jul 2025 09:15:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752390932; bh=w6uk2vSSK6kqFUYuqq9wRIV5THBtnHlaQCSQ8TziC3o=;
          h=From:To:Cc:Subject;
          b=FRjGIAFts+ncFni3a1QtStmqoRjGSBbzbv+fu3CCrvg0POfGxtRWy1qe9BDOdMv05
           Jgufu28olMCo4lCy3gPEaC8Dtt0HTwAAUJti3zEEq+lbgP+qGGTjSgNVYY7tF6ECtG
           GLQpn2fay8FHGilvqOc+/+XeYVIBavvoXRz6I9Qpj68JowKrrd9YhnRQzI28eb+A9C
           8BtpVXwEBMRol9SJUvlvFF9aoE86vfLer19dJtVHzi99olSl7rMbQt7zuNt1FvEW+K
           Bh6ZGVr4iRyVqvJVOEwHWe9OvldV49IM5X77YFpIUJrZS0Tuj3is0zaL+EJ3N0s+aJ
           qbF6niVbKxudg==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rosenp@gmail.com>; 13 Jul 2025 09:15:32 +0200
Date: Sun, 13 Jul 2025 09:15:32 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv3 wireless-next 3/7] wifi: rt2800soc: allow loading from
 OF
Message-ID: <20250713071532.GA18469@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-4-rosenp@gmail.com>
 <20250712101418.GD9845@wp.pl>
 <CAKxU2N-RXgFKYPAqEu3iZDMAisj_K-b+ZZTGFsabWz7pMK+02A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-RXgFKYPAqEu3iZDMAisj_K-b+ZZTGFsabWz7pMK+02A@mail.gmail.com>
X-WP-MailID: a575d8a94d89fffda96a0f3af808d2f5
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [kZMB]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_001536_852703_CF42E61B 
X-CRM114-Status: GOOD (  24.12  )
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

On Sat, Jul 12, 2025 at 12:02:35PM -0700, Rosen Penev wrote:
> On Sat, Jul 12, 2025 at 3:14 AM Stanislaw Gruszka <stf_xl@wp.pl> wrote:
> >
> > On Thu, Jul 10, 2025 at 01:08:16PM -0700, Rosen Penev wrote:
> > > Add a single binding to help the already present dts files load the
> > > driver. More are possible but there doesn't seem to be a significant
> > > difference between them to justify this.
> > >
> > > Use wifi name per dtschema requirements.
> > >
> > > The data field will be used to remove the custom non static probe
> > > function and use of_device_get_match_data.
> > >
> > > Added OF dependency to SOC CONFIG as adding of_match_table without OF
> > > being present makes no sense.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >  drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
> > >  drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
> > > index 3a32ceead54f..a0dc9a751234 100644
> > > --- a/drivers/net/wireless/ralink/rt2x00/Kconfig
> > > +++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
> > > @@ -202,7 +202,7 @@ endif
> > >
> > >  config RT2800SOC
> > >       tristate "Ralink WiSoC support"
> > > -     depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
> > > +     depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST)
> > >       select RT2X00_LIB_SOC
> > >       select RT2X00_LIB_MMIO
> > >       select RT2X00_LIB_CRYPTO
> > > diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> > > index e73394cf6ea6..db8d01f0cdc3 100644
> > > --- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> > > +++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> > > @@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device *pdev)
> > >       return rt2x00soc_probe(pdev, &rt2800soc_ops);
> > >  }
> > >
> > > +static const struct of_device_id rt2880_wmac_match[] = {
> > > +     { .compatible = "ralink,rt2880-wifi", .data = &rt2800soc_ops },
> >
> > Why do .data = rt2800soc_ops here and use it via of_device_get_match_data()
> > in patch 5, insead of just use rt2800soc_ops directly in rt2800soc_probe ?
> I see more of the former instead of the latter in drivers.

If there is no technical reason to use indirection, this can be
simplified as well. Can be done as separate patch since you already
posed v4.

Regards
Stanislaw


