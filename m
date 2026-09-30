Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC6CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 05:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z88uSrZzf3WqWpaerAtQlUMg+QaLLcZ2DE7GqcNb1wo=; b=ECmapASaDBQMbNZZdJCCPB0B4+
	osCN0YQgziAmy+N/4tW4gkuapQ7SnXH0jg9hq733atfwa+ozY9LaTbsyScKAiwalRqehNpMDDoTd2
	Bg/XsVgbK+tN2+Nu0A8syD5LyPqMCv8rhnq9MGFuV1t6EWDKMEifpztxnM3uIrNBYp3DVSV4rz4QR
	7SeVJG74y4gb/hmOy31AGu6IR8+IxGGgSj6URU4KqaTohz7oqgLgNL8oynGU5O860HWqWb4r+2tDR
	gAWDcCRJxMdrOHAHV1UncW6E+H73WgB1YWmMdL6KvnkJ1+06xuce2dXnuuy+auaYN+dR3UlD1l/8S
	f3cUNwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn3z-00000005429-0bLt;
	Wed, 30 Sep 2026 05:41:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn3v-0000000541u-3ICi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 05:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z88uSrZzf3WqWpaerAtQlUMg+QaLLcZ2DE7GqcNb1wo=; b=PqnpOKRCbc83BhgS2/ia2wwR+1
	xID/BgY43anb1BBv1yOLTBgW5gUXxGg7Qgc/5Py+DfG+DCy3nDhbrowByR2GeMho/cUdPjwVglgAV
	UkDZfYqh5Yv0SJW/gDXymglyWzZ53mip+DRZTcNm6RK6KaTkseVclFKYoMs+Jtzgl2OjOu/SMcXT0
	wcLk5ELerATJDDHc28Zzu3aBk/c8jtaD+r2TcW5gPzSJr/3+zDafbyNS+2ICgJuWXEYhkgVb8WNax
	LLu/X4MsOgMAQfhEcl7fisplG2SfNykzJGGm76WbL8jGgfmMAMStFa/iqQ3iCfd7iMxurEd9FT1kW
	dVJIeAGg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBn3r-00000003No2-31WZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 05:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790746860; x=1822282860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wxe/DM7r2GKzQHbMz5VnZ0DQNy8nUUAohTi8urqGk9E=;
  b=GPlBeZYBKIOA3qZFuCf/AG6uScyYhR5TqzCp50Cqn2m7ut4VqktTk9eN
   L++OQgANHV65gsFjciL/jyHbIAH7vc1v3iKzj1XPOEsqIQS3CcimUtTgs
   PXXzXu7BFOJtg6KhFl9SQ8mr82XUHU54hnroAuyOux5qZ5rck2hRNIBcL
   IkVpemVV2abl5YdaZ7KVq1Al7koKqKgvGxIMmJSRuCNuhXM+WUckpMTVw
   24OZoqS3GIYh4gHo7BbdRFUDTN3vrTKNz97QsGu+flow/0Vp2kiPWCfeR
   e/zIt8gV1UDUeo4Y8MRbQiuiJeU4ezhxhyAtmIC2ujWVPHYVGZ/ck5164
   w==;
X-CSE-ConnectionGUID: r6MIbcMDTVezUi7qzOnxbQ==
X-CSE-MsgGUID: RjhBc48MSSqW9sF5CWAFqg==
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="64358277"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Sep 2026 22:40:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 29 Sep 2026 22:40:53 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 29 Sep 2026 22:40:51 -0700
Date: Wed, 30 Sep 2026 07:40:50 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Quentin Freimanis <quentin@q-lab.dev>
CC: <netdev@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: sparx5: start the domain 0 TOD counter on
 non-PTP lan969x variants
Message-ID: <20260930054050.hrvaydgdczkizuqt@DEN-DL-M70577.microsemi.net>
References: <20260928044955.29647-1-quentin@q-lab.dev>
 <20260928151453.fzch356vrp3ergy7@DEN-DL-M70577>
 <4e1ef527-e843-4f1b-9f7f-cf2400fa443e@q-lab.dev>
 <20260929120900.zld2c3h4keqcnmcj@DEN-DL-M70577.microsemi.net>
 <09daa7d0-16a8-40be-999b-9cc608e700db@q-lab.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <09daa7d0-16a8-40be-999b-9cc608e700db@q-lab.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_064100_641669_A8860930 
X-CRM114-Status: GOOD (  36.05  )
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

> > > > Ack. Not initializing the TOD domains on certain variants is a problem.
> > > > 
> > > > However, TOD domains shouldn't affect basic forwarding. I tried it on my board
> > > > with PTP forced off - no forwarding issues.
> > > > 
> > > > Certain TSN features do require TOD domains to be configured, though. How did
> > > > you test this, and what exactly did you see fail?
> > > 
 > > > > Fix by moving the TOD counter start code into a helper and calling it in
> > > > > sparx5_ptp_init(). Non-PTP capable lan969x parts now start the domain 0
> > > > > counter, and PTP-capable parts start all three, as they used to. A similar
> > > > > workaround that starts all three and registers the PHC clocks is
> > > > > implemented in the vendor BSP 6.18 kernel [1].
> > > > 
> > > > What we do downstream, is to ensure that all domains and PHC's are configured
> > > > and registered on all variants, with a very simple is_sparx5() check.
> > > 
> > > My reasoning for only enabling the first counter and not registering the
> > > clocks is that the part does not have SPX5_FEATURE_PTP, so it should not
> > > expose any PTP features to userspace.
> > > 
> > 
> > I acknowledge the problem, and I agree that the PHCs should not be registered.
> > As for the solution, downstream we always start all three TOD domains, including
> > on sparx5. If you take the same approach here, you don't need the new helper.
> > Just move the existing TOD start sequence above the if (!sparx5->ptp) early
> > return, so the counters are always started, while the PHC registration below it
> > is still skipped on the non-PTP variants.
> > 
> 
> ok, in v2 I'll drop the helper and always enable all 3 counters.
> 
> pw-bot: cr

Thanks. Please also fix the small nit below:

> > > > >    int sparx5_ptp_init(struct sparx5 *sparx5)
> > > > >    {
> > > > > -       u64 tod_adj = sparx5_ptp_get_nominal_value(sparx5);
> > > > >           const struct sparx5_ops *ops = sparx5->data->ops;
> > > > >           struct sparx5_port *port;
> > > > >           int err, i;
> > > > > @@ -622,8 +657,17 @@ int sparx5_ptp_init(struct sparx5 *sparx5)
> > > > >                   sparx5->ptp = 1;
> > > > >           }
> > > > > 
> > > > > -       if (!sparx5->ptp)
> > > > > +       if (!sparx5->ptp) {
> > > > > +               if (!is_sparx5(sparx5)) {
> > > > > +                       /* the base, non-ptp-capable lan969x variants need the first tod counter
> > > > 
> > > > Nit: s/the/The
> > > > 
> > > > > +                        * running to forward frames.
> > > > > +                        */
> > > > > +                       err = sparx5_ptp_tod_start(sparx5, BIT(0));
> > > > > +                       if (err)
> > > > > +                               return err;
> > > > > +               }
> > > > >                   return 0;
> > > > > +       }
> > > > > 
> > > > >           for (i = 0; i < SPARX5_PHC_COUNT; ++i) {
> > > > >                   err = sparx5_ptp_phc_init(sparx5, i, &sparx5_ptp_clock_info);
> > > > > @@ -635,27 +679,9 @@ int sparx5_ptp_init(struct sparx5 *sparx5)
> > > > >           spin_lock_init(&sparx5->ptp_ts_id_lock);
> > > > >           mutex_init(&sparx5->ptp_lock);
> > > > > 
> > > > > -       /* Disable master counters */
> > > > > -       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(0), sparx5, PTP_PTP_DOM_CFG);
> > > > > -
> > > > > -       /* Configure the nominal TOD increment per clock cycle */
> > > > > -       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(0x7),
> > > > > -                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> > > > > -                sparx5, PTP_PTP_DOM_CFG);
> > > > > -
> > > > > -       for (i = 0; i < SPARX5_PHC_COUNT; ++i) {
> > > > > -               spx5_wr((u32)tod_adj & 0xFFFFFFFF, sparx5,
> > > > > -                       PTP_CLK_PER_CFG(i, 0));
> > > > > -               spx5_wr((u32)(tod_adj >> 32), sparx5,
> > > > > -                       PTP_CLK_PER_CFG(i, 1));
> > > > > -       }
> > > > > -
> > > > > -       spx5_rmw(PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS_SET(0),
> > > > > -                PTP_PTP_DOM_CFG_PTP_CLKCFG_DIS,
> > > > > -                sparx5, PTP_PTP_DOM_CFG);
> > > > > -
> > > > > -       /* Enable master counters */
> > > > > -       spx5_wr(PTP_PTP_DOM_CFG_PTP_ENA_SET(0x7), sparx5, PTP_PTP_DOM_CFG);
> > > > > +       err = sparx5_ptp_tod_start(sparx5, GENMASK(SPARX5_PHC_COUNT - 1, 0));
> > > > > +       if (err)
> > > > > +               return err;
> > > > > 
> > > > >           for (i = 0; i < sparx5->data->consts->n_ports; i++) {
> > > > >                   port = sparx5->ports[i];
> > > > > --
> > > > > 2.55.0

/Daniel


