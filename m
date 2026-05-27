Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DF3CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vc12CsyxQZnBff3nclh5xMgmARI3DVC5oAYJEEQSWk=; b=VhcDtt8//O/gdpuWjakGjNcCYH
	rrFocCG7A37rUN3ne3C0Myp2G1Efn59LV2ipp+GJuq+H2jhpMs1GLQAcAmlFHsDoz6A651+/8fRTj
	7mbUi9htprvWTob2Ctoze+hY4BZVm2qqJ8xUDEMgSsaQZiJimEBNbqyY58G01TS5spE1K1bdhz+EL
	3WmEdA97QBHlwrH3XsQZi77e/4rettmIZQc3EjhRew9F50i7FdMetQzbKnshm8f0Js0zaD0RrAcBm
	TdAbagjS71AL2xdvXDCRa82QHTfZEH8iwzc1DGxP7Asc3BNde7QCTx4jzmC5d3qxx8QJVD9No8bPN
	Hkgg35hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB42-00000003h0D-2CvX;
	Wed, 27 May 2026 10:00:38 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB3v-00000003gpW-0n9s;
	Wed, 27 May 2026 10:00:34 +0000
X-UUID: dec7402459b211f1aa26b74ffac11d73-20260527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1fdcb15d-86a5-4dfd-9310-ad06384d0138,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:21fde180ab3492c37f445fc5f12cf05d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dec7402459b211f1aa26b74ffac11d73-20260527
X-User: liujiajia@kylinos.cn
Received: from nature [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liujiajia@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1695425657; Wed, 27 May 2026 18:00:20 +0800
Date: Wed, 27 May 2026 18:00:17 +0800
From: Jiajia Liu <liujiajia@kylinos.cn>
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Michael Lo <michael.lo@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7925: add wcid publish check in
 mt76_sta_add
Message-ID: <ahbAsYwFCjsvpxEC@nature>
References: <20260526060841.49161-1-liujiajia@kylinos.cn>
 <CAGp9LzqzddmyDHMNsaqigYpVEdo_Pmzwbeh5Ri5_Gr87cVL6Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGp9LzqzddmyDHMNsaqigYpVEdo_Pmzwbeh5Ri5_Gr87cVL6Dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_030031_560076_D9AA3F52 
X-CRM114-Status: GOOD (  28.76  )
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

On Tue, May 26, 2026 at 04:52:32PM -0500, Sean Wang wrote:
> Hi,
> 
> On Tue, May 26, 2026 at 1:09 AM Jiajia Liu <liujiajia@kylinos.cn> wrote:
> >
> > Since mt7925_mac_sta_add publishes wcid, add publish check in mt76_sta_add
> > to avoid reinitializing the wcid->poll_list for mt7925.
> >
> > Found dev->sta_poll_list corruption when using mt7925 and 7.0-rc4.
> > According to the corruption information, prev->next was changed to itself.
> >
> > wlan0: disconnect from AP 90:fb:5d:94:8b:e3 for new auth to 90:fb:5d:94:8b:e2
> > wlan0: authenticate with 90:fb:5d:94:8b:e2 (local address=84:9e:56:9c:7e:6b)
> > wlan0: send auth to 90:fb:5d:94:8b:e2 (try 1/3)
> >  slab kmalloc-8k start ffff8c80958a6000 pointer offset 4160 size 8192
> > list_add corruption. prev->next should be next (ffff8c808a7488f8), but was ffff8c80958a7040. (prev=ffff8c80958a7040).
> >
> >  mt76_wcid_add_poll+0x95/0xd0 [mt76]
> >  mt7925_mac_add_txs.part.0+0xa5/0xe0 [mt7925_common]
> >  mt7925_rx_check+0xa7/0xc0 [mt7925_common]
> >  mt76_dma_rx_poll+0x50d/0x790 [mt76]
> >  mt792x_poll_rx+0x52/0xe0 [mt792x_lib]
> >
> > Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> > ---
> >
> > Reproduced and tested using the script below over ssh. Roam between two
> > bssids with the same SSID on a router.
> >
> > #!/bin/bash
> >
> > set -ex
> >
> > while :; do
> >         num=$(sudo iw wlan0 scan | grep Polaris | wc -l)
> >         if [ $num -eq 2 ]; then
> >                 break
> >         fi
> > done
> >
> > for i in $(seq 1 500); do
> >
> > echo "index $i"
> > wpa_cli -i wlan0 roam 90:fb:5d:94:8b:e3
> > sleep 5
> > wpa_cli -i wlan0 roam 90:fb:5d:94:8b:e2
> > sleep 5
> >
> > done
> >
> > ---
> >  drivers/net/wireless/mediatek/mt76/mac80211.c    | 11 ++++++++---
> >  drivers/net/wireless/mediatek/mt76/mt76.h        |  1 +
> >  drivers/net/wireless/mediatek/mt76/mt7925/main.c |  3 +++
> >  3 files changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
> > index 4ae5e4715a9c..83f4f941b890 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> > @@ -1595,11 +1595,16 @@ mt76_sta_add(struct mt76_phy *phy, struct ieee80211_vif *vif,
> >                 mtxq->wcid = wcid->idx;
> >         }
> >
> > -       ewma_signal_init(&wcid->rssi);
> > -       rcu_assign_pointer(dev->wcid[wcid->idx], wcid);
> > +       if (!test_bit(MT_WCID_FLAG_DRV_PUBLISH, &wcid->flags)) {
> > +               ewma_signal_init(&wcid->rssi);
> > +               rcu_assign_pointer(dev->wcid[wcid->idx], wcid);
> > +               mt76_wcid_init(wcid, phy->band_idx);
> > +       } else {
> > +               wcid->phy_idx = phy->band_idx;
> > +       }
> > +
> >         phy->num_sta++;
> >
> 
> Thanks for spotting the roaming issue.
> 
> I think we can avoid adding MT_WCID_FLAG_DRV_PUBLISH and instead use the
> WCID table itself for the publish check.
> 
> dev->wcid[] already encodes whether a WCID has been published, so checking
> it directly avoids adding a second mirror state. MT_WCID_FLAG_* is also
> better kept for WCID features that affect WTBL setup or data-path handling,
> rather than common bookkeeping state.
> 
> Something like:
> 
> @@ -1620,6 +1620,7 @@ mt76_sta_add(struct mt76_phy *phy, struct
> ieee80211_vif *vif,
> {
>   struct mt76_wcid *wcid = (struct mt76_wcid *)sta->drv_priv;
>   struct mt76_dev *dev = phy->dev;
> +       struct mt76_wcid *published;
>   int ret;
>   int i;
> 
> @@ -1639,7 +1640,10 @@ mt76_sta_add(struct mt76_phy *phy, struct
> ieee80211_vif *vif,
>           mtxq->wcid = wcid->idx;
>   }
> 
> -       if (!test_bit(MT_WCID_FLAG_DRV_PUBLISH, &wcid->flags)) {
> +       published = rcu_dereference_protected(dev->wcid[wcid->idx],
> +                                             lockdep_is_held(&dev->mutex));
> +       if (published != wcid) {
> +               WARN_ON_ONCE(published);
>                  ewma_signal_init(&wcid->rssi);
>                  rcu_assign_pointer(dev->wcid[wcid->idx], wcid);
>                  mt76_wcid_init(wcid, phy->band_idx);
> 
>    ....
> 

Thanks for the suggestion. Will update in v2.

> 
> > -       mt76_wcid_init(wcid, phy->band_idx);
> >  out:
> >         mutex_unlock(&dev->mutex);
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
> > index 527bef97e122..8bfce686bff7 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > @@ -361,6 +361,7 @@ enum mt76_wcid_flags {
> >         MT_WCID_FLAG_PS,
> >         MT_WCID_FLAG_4ADDR,
> >         MT_WCID_FLAG_HDR_TRANS,
> > +       MT_WCID_FLAG_DRV_PUBLISH,
> >  };
> >
> >  #define MT76_N_WCIDS 1088
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> > index 73d3722739d0..35b5c718475c 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> > @@ -1102,6 +1102,9 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
> >                                               &msta->deflink);
> >         }
> >
> > +       if (!err)
> > +               set_bit(MT_WCID_FLAG_DRV_PUBLISH, &msta->deflink.wcid.flags);
> > +
> >         return err;
> >  }
> >  EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
> > --
> > 2.53.0
> >
> >

