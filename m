Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB45CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmFgzURQRJc5L2lft5L4sVl4gqbG3tZAM2TpKGs07Uk=; b=1ADdhnQBTVkrWwy6rLQceRlKyX
	3y4H5O7Lbyjl1clZlwz5Mwzp80p/Qt+HBkNZ3Bq5W9XEVuZO28oDs9UeaX22/8nOvGzzwSwDJpSEj
	AIKs9n+D5lMjpsbe/lCbf5EOtj5DYrvGPXsv4aWNGvG/vfIoDwyGcH7OkETcRMCG9iVxIwA/6EVVU
	OHxdfGvIqsJ1J0U623KTdmHplWkhpBQHZJrWFUtoUYPxTsxTk2/N/v9n8XFJGiMrCJ0Iclp/zdGSH
	xIJ7WJjYO+cYwiIt8RHhh8HsgD0WJWfYSh3ohE8migONzxqONuw/17plI23ec5bA8pbryLZjoPnI4
	L67ySQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9A5-00000000Q7t-0I11;
	Mon, 28 Sep 2026 11:04:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9A2-00000000Q7H-3ArF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790593487; x=1822129487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZkjFAi/k8AmKcZuYiJLAefOEjecRNWDOt5UnznZtXIQ=;
  b=AUIN0/Tv4ST4dOX2Zn5e9zo08WByXAPCAIDj8LowYVPyijKMuJ677m9V
   fk5Xkf/IykpjzgfK1BBoCUwWE77OoinwGARmVqRDSsGwNyNPn8y1kXGBs
   BgFg7XDr237ml+yTU8kLDUiQliRDHcxKbf7nZvzCPb4WS5sWEYd61lS/S
   xVCalMjicKWVvfCmh5EotSe1FyiY7PoxI3caNEHwL/ANuxSTy5x+jwIUU
   gfxYKA4XvKUn4SpVJKaJs+MwmRoOHtoi+fo0ZKAH6niaHMqgurqofcWj/
   e3VU1Bc8zRKCZ6tILBbZ4xBZcdt2lyIO6+B5yYzM7tEFBK7Uyze1riWay
   g==;
X-CSE-ConnectionGUID: b2K+lPFjT8+AVcLXeOju6w==
X-CSE-MsgGUID: qWsRg5LPQEadkleZV6n17A==
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="63312697"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2026 04:04:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 28 Sep 2026 04:04:41 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 28 Sep 2026 04:04:39 -0700
Date: Mon, 28 Sep 2026 13:04:38 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <UNGLinuxDriver@microchip.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <luka.perkov@sartura.hr>
Subject: Re: [PATCH net-next] net: lan969x: correct RGMII port mapping index
Message-ID: <20260928110438.unoxnyymg7zwuuqk@DEN-DL-M70577>
References: <20260922125112.2111256-1-robert.marko@sartura.hr>
 <20260928091804.hjnabzi52kz4ktmf@DEN-DL-M70577>
 <CA+HBbNG2nGXpXC63AVUJX3KaqzJG+Q=-Md92eTpq7Y-O4CHMzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNG2nGXpXC63AVUJX3KaqzJG+Q=-Md92eTpq7Y-O4CHMzg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_040442_860831_AEC9037A 
X-CRM114-Status: GOOD (  35.48  )
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

Hi Robert,

> On Mon, Sep 28, 2026 at 11:18 AM Daniel Machon
> <daniel.machon@microchip.com> wrote:
> >
> > Hi Robert,
> >
> > > Currently, the lan969x_port_dev_mapping does not check for RGMII ports
> > > and just returns the physical port index.
> > >
> > > However, this does not work for RGMII ports as they have dedicated DEVRGMII
> > > register space with an dedicated instance per RGMII port.
> > >
> > > So, check if requested port index is an RGMII port and return the correct
> > > DEVRGMII index.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > index f3a9c71bea36a..bf5320c7a6ca8 100644
> > > --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > @@ -142,6 +142,15 @@ static u32 lan969x_get_dev_mode_bit(struct sparx5 *sparx5, int port)
> > >
> > >  static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int port)
> > >  {
> > > +       if (lan969x_port_is_rgmii(port)) {
> > > +               switch (port) {
> > > +               case 28:
> > > +                       return 0;
> > > +               case 29:
> > > +                       return 1;
> > > +               }
> > > +       }
> > > +
> > >         if (lan969x_port_is_5g(port)) {
> > >                 switch (port) {
> > >                 case 9:
> > > --
> > > 2.55.0
> > >
> >
> > The mapping itself is right, but as far as I can see nothing upstream
> > uses the returned index to access DEVRGMII. Every caller of
> > sparx5_port_dev_index() pairs it with sparx5_to_high_dev() or
> > sparx5_to_pcs_dev(), which never return TARGET_DEVRGMII. Those paths
> > are also never taken for RGMII ports. The code that does access
> > DEVRGMII, in lan969x_rgmii.c, computes its own index with
> > RGMII_PORT_IDX(). Sashiko, correctly points this out.
> >
> > So I don't think anything is broken today. Did you see a problem on
> > hardware that this fixes?
> >
> > FYI, we carry the same change downstream. But there it was added together with
> > RGMII MTU support, which reads and writes DEVRGMII_MAC_MAXLEN_CFG() using this
> > index.
> 
> Hi Andrew,
> As pointed out nothing yet is broken, hence no fixes tag.
> 
> I am using it downstream as well, for the MTU change support where as
> you pointed out RGMII code
> uses it to get the correct index.
> 
> So, I thought that it would be good idea to send it upstream before
> eventually getting around to sending
> the MTU change support as well.

It wasn't clear to me that this was preparation work for a future feature. As a
standlone patch it does nothing. IDK, to me it would make more sense to just
send it together with the patchset that would actually use it.

/Daniel

> 
> Regards,
> Robert
> 
> >
> > /Daniel
> 
> 
> 
> --
> Robert Marko
> Staff Embedded Linux Engineer
> Sartura d.d.
> Lendavska ulica 16a
> 10000 Zagreb, Croatia
> Email: robert.marko@sartura.hr
> Web: www.sartura.hr

