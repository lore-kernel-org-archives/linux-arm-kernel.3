Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B031C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 13:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ga8+ou5CBo3eNaNQlYb6k+oKn+U+JMiMAvBQkW16ixU=; b=U7Jwxp0S+4iRDv4jRWVm39jxF6
	kE7kMn6XZjSgTwYfd/gterDuRiDMsQMUsOZS4RPz25KmHTxil7vne48I7lkTmiR/m/P1eInh5Orpj
	3h2VVy3DKEFEdItn1GAM1ZV972Nzcbf8MC0GyqpHaoTHkxY7auAc9LSB/1o9zl4ZJFhH7zzX3dInI
	bONtc1ZOkJpOUCKw4LHKPq+Q0YetEQbeRSY+FqvaJgzK5wpIpAPjqrXumRgz64ZyPmklbvilGWepV
	JtCTHdUmlTDP0W4lDsiYg17JkNt9Vx5F9rsv4rVZAIKZ3fLzBhwsuuUIdOdLyGEyZAUpCQiGWqPwo
	7MVwTVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI67F-000000018NY-0luO;
	Thu, 22 May 2025 13:37:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI65D-000000018FF-1iHU;
	Thu, 22 May 2025 13:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F23AA4A710;
	Thu, 22 May 2025 13:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6461DC4CEE4;
	Thu, 22 May 2025 13:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747920938;
	bh=cDpLf9w9kJIkCs7eLyikioOmbhYa051mNL6Ae5uvGT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nTo4tTt5Sd5/HslZvfepJvdmrkL0amvLuM7Cr25q4Nb4m24BDqjsyBEVAJHqix5pk
	 PZ+Z2d2U+m8dVsH6xvDSl0jirf6wODJ/zF4UBnS5taL/uN4KIPI9vGXFNk7PnPue7o
	 s3frdn8b0RJ//T0GyNvrkZ8FQeSg0iprQRqkPijUdy5Oz93BnPLOvvojUc9aZEtcNU
	 UGkSKJoMjWnPvDlKc4fJcL+JmJLvqRvpl+sG0DvbMWa3db7gW1pZCwrMr2hnR3j14r
	 5tsvv+BhV70rIW79J9mf8J5gXBeeIQIPkbsykoFIx8IvCn2LnAK5Xb71rN7FiRQgjv
	 8vk+v2j/EiGnA==
Date: Thu, 22 May 2025 14:35:34 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/4] net: airoha: Add the capability to
 allocate hfwd descriptors in SRAM
Message-ID: <20250522133534.GB365796@horms.kernel.org>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
 <20250521-airopha-desc-sram-v3-4-a6e9b085b4f0@kernel.org>
 <20250522123913.GY365796@horms.kernel.org>
 <aC8fkFUEmBgyT3-W@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC8fkFUEmBgyT3-W@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_063539_528613_E52EE1E4 
X-CRM114-Status: GOOD (  28.60  )
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

On Thu, May 22, 2025 at 02:58:56PM +0200, Lorenzo Bianconi wrote:
> > On Wed, May 21, 2025 at 09:16:39AM +0200, Lorenzo Bianconi wrote:
> > > In order to improve packet processing and packet forwarding
> > > performances, EN7581 SoC supports consuming SRAM instead of DRAM for
> > > hw forwarding descriptors queue.
> > > For downlink hw accelerated traffic request to consume SRAM memory
> > > for hw forwarding descriptors queue.
> > > 
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  drivers/net/ethernet/airoha/airoha_eth.c | 11 +----------
> > >  drivers/net/ethernet/airoha/airoha_eth.h |  9 +++++++++
> > >  drivers/net/ethernet/airoha/airoha_ppe.c |  6 ++++++
> > >  3 files changed, 16 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > > index 20e590d76735e72a1a538a42d2a1f49b882deccc..3cd56de716a5269b1530cff6d0ca3414d92ecb69 100644
> > > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > > @@ -71,15 +71,6 @@ static void airoha_qdma_irq_disable(struct airoha_irq_bank *irq_bank,
> > >  	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
> > >  }
> > >  
> > > -static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
> > > -{
> > > -	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
> > > -	 * GDM{2,3,4} can be used as wan port connected to an external
> > > -	 * phy module.
> > > -	 */
> > > -	return port->id == 1;
> > > -}
> > > -
> > >  static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
> > >  {
> > >  	struct airoha_eth *eth = port->qdma->eth;
> > > @@ -1128,7 +1119,7 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
> > >  			LMGR_INIT_START | LMGR_SRAM_MODE_MASK |
> > >  			HW_FWD_DESC_NUM_MASK,
> > >  			FIELD_PREP(HW_FWD_DESC_NUM_MASK, HW_DSCP_NUM) |
> > > -			LMGR_INIT_START);
> > > +			LMGR_INIT_START | LMGR_SRAM_MODE_MASK);
> > 
> > Hi Lorenzo,
> 
> Hi Simon,
> 
> > 
> > I'm wondering if setting the LMGR_SRAM_MODE_MASK bit (maybe a different
> > name for the #define would be nice) is dependent on the SRAM region
> 
> I did this way because LMGR_SRAM_MODE_MASK is just a bit. Do you prefer
> to do something like:
> 
> FIELD_PREP(LMGR_SRAM_MODE_MASK, 1)?

Let's leave it as you have it in this patch :)

> 
> > being described in DT, as per code added above this line to this
> > function by the previous patch in this series.
> 
> Are you referring to qdma0_buf/qdma1_buf memory regions?
> https://patchwork.kernel.org/project/netdevbpf/patch/20250521-airopha-desc-sram-v3-1-a6e9b085b4f0@kernel.org/
> 
> If so, they are DRAM memory-regions and not SRAM ones. They are used for
> hw forwarding buffers queue. SRAM is used for hw forwarding descriptor queue.

Yes, my mistake.

With that cleared up I think this patch looks good.

Reviewed-by: Simon Horman <horms@kernel.org>

