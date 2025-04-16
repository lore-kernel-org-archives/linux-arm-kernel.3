Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03787C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2nkQ8kggNLvP40t1bwGaEEkhe1SwVi5A/FCvejGF4o=; b=zYwe2hmINpfCkl79U2c5gGEsKi
	Gi415ZvrNfGJS1E75RDG3KZzsd2XOLP954JZne2G6i5lpFA3A8s48nJM5AacUwgtk/PFi3YeB7VmX
	EdBEwjvrme9jCAag5r+W/zYqL6icF2Mf2U/wMUh1QnWP7kIKCJoiA9uUxXRZYIzJxAnEE+R+JPdyu
	+VVeoJLWgVVCVEryQsWkbGexXMP+QuD9lNpFrF+ZLJMbR/8So13D+T6Lu3Yv+IWsaGrz9kgrPWy0H
	4dhMmvymrYtBRteTL8DHDWBmrDebLJofUKom8TrNEJrimZUsfSvW0zX3PAcvYaJauiA80un1lKyXx
	aFcLTdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56Zw-0000000AQ5c-1YWa;
	Wed, 16 Apr 2025 17:29:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56Bw-0000000AMJP-3fuE;
	Wed, 16 Apr 2025 17:04:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B362549E55;
	Wed, 16 Apr 2025 17:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0242C4CEE2;
	Wed, 16 Apr 2025 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744823091;
	bh=X+hdtTE3I9nqlJM1Kle+k2xO66KF4y9d+l1InnmbIiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awnWpg25stPGEkodW2n6rnQ3VmVbQtYG8CCZIlZiliFhJs+7xUGxTVNYwRtZvAmJm
	 yNpebVgMFRsUHholtmTylAm/4Th5ePfNID6jHsIkEPlBJMet3GGkIfEKgCNgSwGGVc
	 TdleW0HW23lgmrc5+EA8yXUTZKsFdQ2yONvZs2yiC4xrRnJOD/p83Bo4s8K5gxpi9R
	 IOsjBMM1EdXotdADKeszaGnEH6TapkcQ6v3nLUL7Kx4ZYM8xKH6adys86BhHPsXmQ4
	 qg0moAdibw6QADJc1jxLzUbeBG8u2fNQhmUb94fc+NkERqTRZsYsSjH/YQuNGLWQmh
	 ONEPE20yPI4aw==
Date: Wed, 16 Apr 2025 18:04:47 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <20250416170447.GU395307@horms.kernel.org>
References: <20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org>
 <20250416154144.GT395307@horms.kernel.org>
 <Z__S_m9fBEKmoos1@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__S_m9fBEKmoos1@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_100452_949399_B542B42D 
X-CRM114-Status: GOOD (  32.30  )
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

On Wed, Apr 16, 2025 at 05:55:42PM +0200, Lorenzo Bianconi wrote:
> > On Tue, Apr 15, 2025 at 09:27:21AM +0200, Lorenzo Bianconi wrote:
> > > The official Airoha EN7581 firmware requires adding max_packet filed in
> > > ppe_mbox_data struct while the unofficial one used to develop the Airoha
> > > EN7581 flowtable offload does not require this field. This patch fixes
> > > just a theoretical bug since the Airoha EN7581 firmware is not posted to
> > > linux-firware or other repositories (e.g. OpenWrt) yet.
> > > 
> > > Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  drivers/net/ethernet/airoha/airoha_npu.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
> > > index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..16201b5ce9f27866896226c3611b4a154d19bc2c 100644
> > > --- a/drivers/net/ethernet/airoha/airoha_npu.c
> > > +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> > > @@ -104,6 +104,7 @@ struct ppe_mbox_data {
> > >  			u8 xpon_hal_api;
> > >  			u8 wan_xsi;
> > >  			u8 ct_joyme4;
> > > +			u8 max_packet;
> > >  			int ppe_type;
> > >  			int wan_mode;
> > >  			int wan_sel;
> > 
> > Hi Lorenzo,
> > 
> > I'm a little confused by this.
> > 
> > As I understand it ppe_mbox_data is sent as the data of a mailbox message
> > send to the device.  But by adding the max_packet field the layout is
> > changed. The size of the structure changes. And perhaps more importantly
> > the offset of fields after max_packet, e.g.  wan_mode, change.
> > 
> > Looking at how this is used, f.e. in the following code, I'm unclear on
> > how this change is backwards compatible.
> 
> you are right Simon, this change is not backwards compatible but the fw
> is not publicly available yet and the official fw version will use this
> new layout (the previous one was just a private version I used to develop
> the driver).  Can we use this simple approach or do you think we should
> differentiate the two firmware version in some way? (even if the previous
> one will never be used).

Hi Lorenzo,

Sorry, I misunderstood the commit message.

Yes, I think this simple approach is fine if there is no
compatibility issue wrt firmwares we can reasonably expect
in the wild. Which seems to be the case here.

Reviewed-by: Simon Horman <horms@kernel.org>



