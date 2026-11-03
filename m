Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2200606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KgQxSoXh;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fvclDBt8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=; b=KgQxSoXhXyJ19nTPYm6EX1lyaY
	Fo8b/XOfz2jxp7AyOHzEK/o2rvBNf5Kc1NUcHBm1223J5mrUe2Efo7NqI3hNjaUsesp3xskeremMZ
	vlBlXIrjokkHaDj7JXOuEhg2IY+YG05iBb0XcFgUAii5wq46Vzj1BMDHh2jurnyM93EPBqPFjgylA
	TnJMUgdltX1SKMUTe6C3Zr0K2jBEqSEVYnXVLAbhsnMcbRAIlAqgkEBvKtVvYcUVaKUkP3fy+X7gA
	rAprjnTeyYXUA07c4ZG8WVkzMwoR/zBIUgYRX7mfEcjcED49RFwVuvWpPbacjnIo9Oou4w34I6J/2
	30wBRW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJZB-00000003THr-2KiH;
	Tue, 03 Nov 2026 18:49:05 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJZ7-00000003TGp-48uY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:49:03 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4751996a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793731741; x=1794336541; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=;
        b=fvclDBt85p+edK2vJu0FEtM08JPqR1+QDc832Sz3RAu+muh7PiYu91XHvtEMROCYhh
         +2NVem+ItrYwlNVcuBwlFsqlcxmQuvJIYrlDh/i5XCZ7wUmRpYkVaRXzFLZytk21iBEM
         SV31t7+suxrZFn5iCq4A711SoGBVAKHC7gI4tM3dzkVuawlmwixuZdgQeq4IkDo08bMS
         k5KICiWumfvIupcCDVYnfWU8BF1HdxP3pXa3gyzwjfE20f9Dd3TmsI82tbFsJpUIni0o
         Gp8i6HmDS07bKigD81Sm+OgUNnPlpmKCsnNNd/0dIz+YKNof3fWX7KHREmjHkxKxsjOm
         WdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731741; x=1794336541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=;
        b=fapsgaFGrMyFrLmhabai10Urz85cRYkKbZ1mGXpKuFVcPYrkcCm2ljSx1kzTHWjnwh
         KvUgWApEDk/loGFj7wGGLjJQbYHibaBzrCP3BhyXV2wJaWgtJf+DmFANCwgAvlySn3gV
         4rpwnv8LQI+ZZidYOdJX7sGj/pRwA6cV9mOAhxeaHUD8in0XOtVb/2tESoUHbm1v+cSs
         Z8wR/1VejIeLYLGA96javwm3KVRIaR2ITcyLXQ/DljaY6gw/lV2gW7rI2KH6rS3k1SDX
         GCRS5ZZLKw2JLQZDiuThVisENZ547H/cYRi29VuE385fFi0vNRgG6ln4lf0zMRo1SaXp
         n8kw==
X-Forwarded-Encrypted: i=1; AKwUvBzQSN3RPRWiSo5YBTQ9WnHINoKKeePYerT93Uol1Aael4XdNdzMCthDAUvqVtWKnQPPOrabLN3QzkPdImbTIFa2@lists.infradead.org
X-Gm-Message-State: APuU4Z+wWGyBlb5GTzHmXPqlX7gzuMS88dRfhE0Z/SIZ4u7ZkXRsOdZc
	6+yxZOmeYy4HMdscWwkEDvLKKO4etyfbKyyNnNpPWDXKjo4oel34iZF6tQzRZRzrwlk=
X-Gm-Gg: AYBFou1GDjqBALx83dXuggemXNGs8haqOT3zoo6ouBrITszTrv01EXn9HuWpmWBFyGf
	/v+iRK4FWv3sVmcKIqqNPTtd6mzthbg5vnHYUwEZkKDB1m4VjdikEZ04iIpVKVRRsnCdIX6vsCi
	JdpitP1SmbGpd+PFHrLR7Rb5r5DSRojd1CVnq9dG3BOmBpEENmUL6W1wLTPt3EQXxPqvW9rW5ZI
	J2GQI26OmRJt6mqEYwhbTziWulJQJ3J7z+L9C3bAepu62wpLLlhdWwPfH6C0JJQG2yXrSqVIiMU
	DXFSbqvx0B9aNcPM4Dn0lOBMe73MEBPrVAvV8bg5FXcfy47mCA72+kP5P8nN9jeXnFZADlSrH5y
	O6U7LjzlY9+0qWFkOVzUeyHqp2L2ziqnlqVYsJ9p/srpC5vCSOEIZP6YLyKFwCC9QjnwJ/Zcvwi
	esed+1U7e5eg08xNU7j+v2H+ZY/JcwUCkSAaysNXFkQcssd1Fg9AY9VglnaT2vCOglR6br6v5px
	iN/OrofIcsInhZSvw9wwWEGjytIylzPRm+VI45X3miDrPPAZ/y4qRCzD6zsrfAPmSX14nfyd/gx
	K61XpuVDGCL5hq7SPPucNwPVtCluQg3NpGTK5VlPzA==
X-Received: by 2002:a17:90b:1d03:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3ae8984de33mr11985967a91.60.1793731740597;
        Tue, 03 Nov 2026 10:49:00 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944bd88bsm210133a91.12.2026.11.03.10.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:49:00 -0800 (PST)
Date: Tue, 3 Nov 2026 10:48:59 -0800
From: Joe Damato <joe@dama.to>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
Message-ID: <auosm8mCULyafyny@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank Li <Frank.li@oss.nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
 <aukcoWLVvSorX5a9@devvm20253.cco0.facebook.com>
 <aun4W3dvmfWRDFeQ@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aun4W3dvmfWRDFeQ@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_104902_256231_3BCFA872 
X-CRM114-Status: GOOD (  27.22  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 09:06:03AM -0600, Frank Li wrote:
> On Mon, Nov 02, 2026 at 03:28:33PM -0800, Joe Damato wrote:
> > On Mon, Nov 02, 2026 at 02:19:16PM -0500, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Replace open-coded assignments to callback and callback_param fields
> > > of struct dma_async_tx_descriptor with calls to the
> > > dmaengine_desc_set_callback() helper across net drivers.
> > >
> > > No functional change intended. Prepare to make struct
> > > dma_async_tx_descriptor private to the DMA engine.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
> > >  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
> > >  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
> > >  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
> > >  4 files changed, 9 insertions(+), 16 deletions(-)
> >
> > [...]
> >
> > > diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> > > index cc6ace8d64371..1479f8362e04e 100644
> > > --- a/drivers/net/wwan/qcom_bam_dmux.c
> > > +++ b/drivers/net/wwan/qcom_bam_dmux.c
> > > @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmux_skb_dma *skb_dma)
> > >  		return false;
> > >  	}
> > >
> > > -	desc->callback = bam_dmux_tx_callback;
> > > -	desc->callback_param = skb_dma;
> > > -	desc->cookie = dmaengine_submit(desc);
> > > +	dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb_dma);
> > > +	dmaengine_submit(desc);
> > >  	return true;
> > >  }
> > >
> > > @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
> > >  		return false;
> > >  	}
> > >
> > > -	desc->callback = bam_dmux_rx_callback;
> > > -	desc->callback_param = skb_dma;
> > > -	desc->cookie = dmaengine_submit(desc);
> > > +	dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb_dma);
> > > +	dmaengine_submit(desc);
> >
> > I noticed in the above that the return value of dmaengine_submit is discarded
> > instead of stored.
> >
> > Is that intentional? I suppose it might be because AFAICT cookie is never
> > used and the commit message says "no functional change intended".
> 
> dma_cookie_assign() already set desc->cookie in dmaengine_submit(). Of couse
> it is not obvious. Do you need me update commit message to descript it.

Ah, I see it now. In the tx_submit callback it looks like dma drivers set the
cookie.

So removing it here really is a no-op since it was getting set, as you said,
during submit.

My mistake. I don't think it's worth respinning just to fix the commit
message just because I didn't dig deep enough :)

