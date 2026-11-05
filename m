Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAB7606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qPiiAhkZ;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=HLAwbYY5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IAkDT+xOxuplCH0DU1qbjq1v0CAsiM+XsgikQ8pVRS0=; b=qPiiAhkZcEaiLmXKenzH66DVDX
	CHtUOiiZU+IF2fTN6fGPfbr+u6aPY6mCInFRAs+iL0NQtjOtc1Y0fntQQQRNAgHJYnqlYgoJGiMvW
	f6Fj/Cj8hXwr4bVmaPDCM1HjsgZhGpsG9Y3VSWhvdaDGmWIcUu67NvBwkIYueLIG2bA8vcvBfwES9
	zkvJtu44KV8HE46onUydyD9zJWBCFrxs6SgUnbj3wuh6dS07HsbX9FFAXH76rUWZbFhRC2OV81D8p
	ttqAnvgZIpEkMVfDEI16IhDQWtuqnNbwMWomCerq2avS2kJ44z0jnsbgWZJW6OWdyYsb6WcRzJ+AI
	iX7RCusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtx3-00000008LIg-00EN;
	Thu, 05 Nov 2026 09:40:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtwz-00000008LHr-3yib
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793871606; x=1825407606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0zMxg5jJREjnB3ChtK0twT9anfZvUFbnTRKAGFoCWSM=;
  b=HLAwbYY5tqvUgi7SPPX043EgrN3ERkh9mmA7knp7aET83U/rRYCahXrb
   IEn+Dqz5GYxVyLS0qbdX3EOcteeXD/mue4sqF7dDLEPLJfPEJ4+cKsh1g
   1+zzYi/3f4cZ7dt8AQtPinxLYSIDOP1OZ46pvxgAFUa4PFsnMCpTbQjrD
   h1NWOSUud/w9gIQuQqShlKww0ISOz21/ynnhSPrWSlorKa00XODF8FA/Q
   ejqp6Lzxrbelk7ZaLM7H5FjdIe9VL9iLH00Gm9RPZB70zgvjupngI2HIJ
   8WO0bw2pkLkA4gkPS4396i9oiYyD2E/rirTNq59nBN/9VYXy4wdG+pmsi
   g==;
X-CSE-ConnectionGUID: /4wbJlm7S2GHsXCNxkp7Ng==
X-CSE-MsgGUID: qIHMoxitTvqGuLVkkg26/g==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="297491437"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2026 02:40:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 5 Nov 2026 02:40:03 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 5 Nov 2026 02:40:01 -0700
Date: Thu, 5 Nov 2026 10:40:01 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <robert.marko@sartura.hr>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2 0/5] net: sparx5: add tc matchall port
 policer offload
Message-ID: <20261105094001.dqcpzra54a2okwc6@DEN-DL-M70577>
References: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
 <679b8dcf-0aac-4674-a006-5af0156a82ae@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <679b8dcf-0aac-4674-a006-5af0156a82ae@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_014006_341316_F9F39927 
X-CRM114-Status: GOOD (  21.30  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > This series adds offload of tc matchall filters with a police action to
> > the ingress port policers of Sparx5 and lan969x, which are both served
> > by the sparx5 driver.
> > 
> > In hardware, each ingress port has four single-rate leaky bucket
> > policers. A policer drops the frames that exceed its rate and burst.
> > The four policers of a port share the pass and drop statistics counters
> > of the port.
> > 
> > The driver uses one policer per port, because with more than one, the
> > statistics reported to tc could not be attributed to the right policer.
> > This matches lan966x and ocelot. The policer meters each frame without
> > preamble and inter-frame gap, so the configured rate is a data rate, as
> > tc police expects and as on lan966x and ocelot.
> > 
> > Since the policer meters all ingress frames on the port, only filters on
> > chain 0 with protocol all are offloaded, and filters on shared blocks
> > are rejected. A police action that is already offloaded as a port
> > policer on another port is rejected too, since in software it is a
> > single bucket for all of its users. Only drop is supported as the exceed
> > action, and the police overhead parameter is not supported.
> > 
> > Patch #1 drops a redundant prefix from the existing POL_UPD_INT_CFG
> > register macros.
> > 
> > Patch #2 adds the registers used by the port policer.
> > 
> > Patch #3 tracks whether the ingress block of a port is shared, and adds
> > the per-port policer state.
> > 
> > Patch #4 adds the hardware programming of the port policer.
> > 
> > Patch #5 adds the tc matchall offload.
> > 
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> I understand the following will be very frustrating, but for unknown
> reason AI review did not kick on this series.
> 
> The changes looks sane to me, and addressing points raised on v1, but
> I think nowadays we need an explicit AI feedback.
> 
> Could you please re-submit the series?
> 
> Thanks!
> 
> Paolo
>

pw-bot: cr

