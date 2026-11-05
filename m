Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2016606D82D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1RlwVGHo;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=gwfjz7c6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7R2UOvgn9PI8GoXBAsiFuJshfeF1YzTCjF9GuawHyn4=; b=1RlwVGHo4VFoEoEFMy+ottBwJS
	tFI/tPZa9IbnqiywOKcTo1zHHuce4jbFxOgoAWiM6ZQ/ma1Q8QDtzGSHDPhGYXhl1Sw7fGi37kOJR
	MqhgkP9Xy32/KDuQYDcKmaYMJzPPUWCpavk9v4+pn2MDg/rEtl9+rr2adceyU5ccepkFcWFHi8znt
	r+QyRdEXuR43UcRgRdc4RCtDF/olRcMTljkpwHyIUSuUp7Jmzz0Ulhsxy1XJu2YaAFdKa8JNnTGvu
	JJkzt/7qOFzOVozjXoLTf0warxWvGx3pkf/kFd0VvoYh9+asefUs9c0Kp/Du/scTJI7MfaZpBIkFs
	xD5n6PgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtw8-00000008L78-1p6H;
	Thu, 05 Nov 2026 09:39:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtw5-00000008L6Q-3jhz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793871557; x=1825407557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cb0qXMc4wguc0QQCdheJz92gBP+uNeydJh/Nj2aUfIk=;
  b=gwfjz7c64EYiYEsYDenaMoJHnlp0NAInGDdDWjeZpOH9jr9JeGrnEGNs
   t8nEP9sr+yW37nfiLVz7LPezTQE95cZvmZZsoh5gwT6ELE91ugW00p8zT
   hBB0huUr4yDZ3VMWUyez3Pn+T9PYDzOGsYbmg9Ymjw16r0K7ommJrbCVT
   78OQwYTbCpKUU26NlhuqUWbzmT2dIq+kybSrj8iO9veVfXkaoEIjlemIP
   vq1ApQyBdv6RodTJ5f6BNr4OE7lAEspWBI81bkOF+hj4PkiqAZbBA0v3/
   ugvWh6xWT39jFrSBZMpD39lNA+7mtF0GlT8hRrq8fF64e8oIh5T73uRj3
   A==;
X-CSE-ConnectionGUID: uOkjWd00SQKHHMxTU88xVA==
X-CSE-MsgGUID: KkZQKROvQzuPrPC+15rDBA==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="66311469"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2026 02:39:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 5 Nov 2026 02:39:08 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 5 Nov 2026 02:39:06 -0700
Date: Thu, 5 Nov 2026 10:39:05 +0100
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
Message-ID: <20261105093905.ln6tdot26wyej7pi@DEN-DL-M70577>
References: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
 <679b8dcf-0aac-4674-a006-5af0156a82ae@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <679b8dcf-0aac-4674-a006-5af0156a82ae@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_013910_175117_DF8B8AF6 
X-CRM114-Status: GOOD (  22.38  )
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

Yes, I noticed that. I thought you maybe had some magic button you could push,
in order to trigger the review manually.

> 
> The changes looks sane to me, and addressing points raised on v1, but
> I think nowadays we need an explicit AI feedback.

Ack. I think the missing sashiko-nipa check is not isolated to this patchset
alone. Just FYI.

> 
> Could you please re-submit the series?
> 
> Thanks!
> 
> Paolo
>

/Daniel

