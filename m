Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B535C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6cqdhJytixSQiatm8SciHLHjXuoZbNQjnnIuK+C7Ng=; b=DcRMNg6RrvrE7uDb76qUpn5r2K
	JBNZLGL+YUni+tfNVgc8n/I90xkbm+tvmWx0SpDEoPmjZuOfCqCjSlEm+PuyF18ZFB3jODTSdta47
	6vNOh/nPtqQaaUmxj3ZRf01gDcuxKLdvHSJwrrjGk2Lgewvh5OfGVbpbkcKWYq5GWXpHlwuFQwPzt
	Xvo72Ije4gbq2+8Z3Bn+7vlWRhT0V7yTr0cHcnPHeg4ud8zyXSwYcQaV901zx3+1SEUy5pBvubVOm
	YMjj4MBW4jY7pixtJmONRxTt1oGtcZkUlmOd0aneEZHau0r4x8QNpY4aGsPbfAqJIreNUtNKrTjfk
	/6yAuQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxzG-00000000Jpm-2Bw6;
	Thu, 08 May 2025 09:56:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxnO-00000000Hva-1RKa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746697442; x=1778233442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nPT/F3W9N+by11bdaqC4yK2ZudPzdLXlWraniupgjJw=;
  b=EXOlYIAkmLHT4WwkvDHp4zet0dXH0CnSYxrO5y9i6rM+tCX77uI/pIIs
   722ty82Hxz17KfEdvUbSXUwUxjPGyhPZ4AK161IwH0aiShRlHdB97S1Ux
   VcuG4ahiBIw9AzVZKkt4OL5yQE7Tr8yApvqvY+KDgMaro2Y5z993VYmuX
   kFF1lOCAAXlO54ix48UZy43qrJHGvAvOv/tzJW13BZi4Cm7gSChVM2NW4
   2nnFqnnyBK7g9uqrQLbJb7EOgLG7G23oasloMcXxAMahxRY1aw6IJ/9HQ
   x4AfYIhG1o2agc68RCl42Gu6vtmvG+hiF2NNiJa1HFUrO/4zXKkUOBX19
   A==;
X-CSE-ConnectionGUID: dgXtX5N7RouoR3jSWbnLcw==
X-CSE-MsgGUID: 6CsaHletTeu58H0FkJHF0g==
X-IronPort-AV: E=Sophos;i="6.15,271,1739862000"; 
   d="scan'208";a="208871395"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 May 2025 02:44:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 8 May 2025 02:43:19 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 8 May 2025 02:43:19 -0700
Date: Thu, 8 May 2025 11:41:56 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Jason Xing <kerneljasonxing@gmail.com>
CC: <irusskikh@marvell.com>, <andrew+netdev@lunn.ch>, <bharat@chelsio.com>,
	<ayush.sawal@chelsio.com>, <UNGLinuxDriver@microchip.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <sgoutham@marvell.com>,
	<willemb@google.com>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>, Jason Xing
	<kernelxing@tencent.com>
Subject: Re: [PATCH net-next v1 4/4] net: lan966x: generate software
 timestamp just before the doorbell
Message-ID: <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_024402_628440_742C05CF 
X-CRM114-Status: GOOD (  28.74  )
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

The 05/08/2025 16:40, Jason Xing wrote:
> Hi Horatiu,

Hi Jason,

> 
> On Thu, May 8, 2025 at 3:08 PM Horatiu Vultur
> <horatiu.vultur@microchip.com> wrote:
> >
> > The 05/08/2025 11:33, Jason Xing wrote:
> > >
> > > From: Jason Xing <kernelxing@tencent.com>
> > >
> > > Make sure the call of skb_tx_timestamp as close to the doorbell.
> > >
> > > Signed-off-by: Jason Xing <kernelxing@tencent.com>
> > > ---
> > >  drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > > index 502670718104..e030f23e5145 100644
> > > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > > @@ -730,7 +730,6 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
> > >                 }
> > >         }
> > >
> > > -       skb_tx_timestamp(skb);
> >
> > Changing this will break the PHY timestamping because the frame gets
> > modified in the next line, meaning that the classify function will
> > always return PTP_CLASS_NONE.
> 
> Sorry that I'm not that familiar with the details. I will remove it
> from this series, but still trying to figure out what cases could be.
> 
> Do you mean it can break when bpf prog is loaded because
> 'skb_push(skb, IFH_LEN_BYTES);' expands the skb->data area?

Well, the bpf program will check if it is a PTP frame that needs to be
timestamp when it runs ptp_classify_raw, and as we push some data in
front of the frame, the bpf will run from that point meaning that it
would failed to detect the PTP frames.

> May I ask
> how the modified data of skb breaks the PHY timestamping feature?

If it fails to detect that it is a PTP frame, then the frame will not be
passed to the PHY using the callback txtstamp. So the PHY will timestamp the
frame but it doesn't have the frame to attach the timestamp.

> 
> Thanks,
> Jason
> 
> >
> > Nacked-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> >
> > >         skb_push(skb, IFH_LEN_BYTES);
> > >         memcpy(skb->data, ifh, IFH_LEN_BYTES);
> > >         skb_put(skb, 4);
> > > @@ -768,6 +767,7 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
> > >                 next_dcb_buf->ptp = true;
> > >
> > >         /* Start the transmission */
> > > +       skb_tx_timestamp(skb);
> > >         lan966x_fdma_tx_start(tx);
> > >
> > >         return NETDEV_TX_OK;
> > > --
> > > 2.43.5
> > >
> >
> > --
> > /Horatiu

-- 
/Horatiu

