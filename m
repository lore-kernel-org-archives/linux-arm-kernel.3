Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCCE606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ljMM0fSt;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=FLGmsb+k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4Ze/vAO+3B8RU6Gc23uzZvY6MDhudox9hNR2cpt0FU=; b=ljMM0fStL/e+xZ1eO2K3x8UDGx
	9N03fBg7ajyKnPCNU4QQCMocEEA6qPeFp8KqzU3Q3VxdhO7FINS3EG2mVxdeZcKuyrY8OV1USaT4e
	o8XYC4dSkAiFtvQoVIs+enP6euh3MlGBeJn7tIW8/7lhEvIzKcWCAL3kiu9fFGoC07AVYg/5EDAnS
	eCaTflryaboy4/tmiSwvyTmxPgEum7bfk99+89NLMlqNjQ0RCnvJb48kvijR5KANYfhxUkW2BA+W6
	r1tdBfZD5AjaylETkk6mb5O0X7CjViyKc8QrsujwgY5dlYql0S+ouFONB+L8Veu2vtLzyLmz/7Ak+
	CWphyQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJURx-0000000Bicl-05G9;
	Wed, 21 Oct 2026 11:25:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJURt-0000000BicM-0bcg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792581937; x=1824117937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f6mbtOsoHCOt/e4/sMr9Gei9ixDW9trlJp/NUEcYDZ4=;
  b=FLGmsb+kXXRda+QGqP7ExnbY6vQcffVVSgnL7TsodOK1I+3fYA5+jImJ
   t4ZgE6rymuA3/l/cRMZCeCZ80Yp2vX8auNS/goc5cUwoAO5fP6obw6ZXv
   oAbBW5QTxtATh6z8f1WTQT4o/7osPEswTeZCPX/hX46WXS/vYe2JuLBXC
   xegOaJCtjLZvT6phHnOOt+4fmA/Z4sY4zPb2LZyCr+t8ebfP+Zq3HlIYS
   8vcpaa6zMVkw/cTV2asKaJ+DCjJoqVTwMkKwtj87O9KV19W+rANcsEpL7
   z1kzKnJ+bUcK2MEMtX2syyjtGAeO8LG9TYswE+IekrAdzpwVjDBH1rQVn
   w==;
X-CSE-ConnectionGUID: lWCzV498TpKkNg5mcN8lnA==
X-CSE-MsgGUID: +wcjJoM9RbWrVnCYe05rdw==
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="65361838"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:25:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Wed, 21 Oct 2026 04:25:35 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 21 Oct 2026 04:25:33 -0700
Date: Wed, 21 Oct 2026 13:25:33 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Bjarni
 Jonasson" <bjarni.jonasson@microchip.com>, Lars Povlsen
	<lars.povlsen@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: sparx5/lan969x: do not read past skb->len when
 injecting a frame
Message-ID: <20261021112533.m6fh7xoqp74uevho@DEN-DL-M70577.microsemi.net>
References: <20261021-sparx5-inject-tail-bytes-v1-1-7dcc035c8ddf@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261021-sparx5-inject-tail-bytes-v1-1-7dcc035c8ddf@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_042538_324389_78607746 
X-CRM114-Status: GOOD (  15.32  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> sparx5_inject() writes the frame to the injection FIFO one 32-bit word
> at a time, and pads frames shorter than 60 bytes with zero words.
> 
> Before this patch, the last word is loaded whole even when skb->len is
> not a multiple of four, so 1 to 3 bytes past the end of the frame are
> read. For a frame shorter than 60 bytes those bytes are also
> transmitted, as VLD_BYTES marks the whole last word valid and the
> padding starts at the next word.
> 
> Write the trailing bytes from a zeroed word. The number of words written
> and VLD_BYTES are unchanged.
> 
> Found by an AI code review agent, and reproduced on lan969x and sparx5
> with register injection: bytes 57 to 59 of a 57 byte frame were not
> zero. With the fix they are zero, and traffic still passes on both
> chips.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

I somehow forgot to include the target tree. This one goes to net.

/Daniel


