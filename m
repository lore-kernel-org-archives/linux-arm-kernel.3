Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459FBC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Mo12jIp7JGdEvtjsw2OulO3/3LfrKIJdrPsh7bBfbU=; b=An8j4qKn3NIP1Qt5c5ZUIQybPI
	0H7n0M0iIPIrwEycCnWzILELndesFWZYPza9g97pByj5xOXLEUg9KGlU9f81tDTtJ2anVX87NeiBG
	86pKsaYq4XSwc7cfUf/2vXTKwxYkd2jtyyLSI+2o8ew5HP98/1zvcrHgdylK/ZcH7w8kmOMGJF73z
	PsE10dHkU7G/5PCGJlzz4Y8c8NDPDfUQFnd/mlpe2uOWR6lxGZeeHB9Dra+mepieUBtP9WwGruMOC
	wg1dpHboSjAWIIszLuVEkgIaEHQ0783HXNcsMe2Y0GK6qOzFhyqsSyh4hCWEjc0fONGhOKV88HCwl
	HMBIufaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYewh-00000001VRt-1ju4;
	Mon, 07 Jul 2025 06:03:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYetO-00000001V9M-0lHa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 05:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=1Mo12jIp7JGdEvtjsw2OulO3/3LfrKIJdrPsh7bBfbU=; b=Pc
	+Prd8uRRGn3vPyj24SLIx2z/vxR16IRch5EJPI/NXNW9bNOWeLFTm1l68YI/NTY7xFLTYdSxDgrc3
	yynyqF3Kmtjcjw/TqyhrRhsnj9lF7L2jHEMEECKcQq3MEhxtiFE6grgkwXhaXM0l/61W8tKwDH4uK
	QEF71+OpQGxs4LM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYetE-000gGj-GK; Mon, 07 Jul 2025 07:59:44 +0200
Date: Mon, 7 Jul 2025 07:59:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH RFT net-next 02/10] net: stmmac: Add support for
 Allwinner A523 GMAC200
Message-ID: <e04e30fe-6f7c-4e48-90bb-24bf3f2081ad@lunn.ch>
References: <20250701165756.258356-1-wens@kernel.org>
 <20250701165756.258356-3-wens@kernel.org>
 <c464d56b-dfd2-4e8c-a77a-4a0d05588768@lunn.ch>
 <CAGb2v65rDZ+V6EuZQ5NDrV7n0C-4CpHLXP_M9M2hA-oR4cMJUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65rDZ+V6EuZQ5NDrV7n0C-4CpHLXP_M9M2hA-oR4cMJUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_225954_218082_4D94BCC7 
X-CRM114-Status: GOOD (  13.11  )
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

On Mon, Jul 07, 2025 at 11:06:55AM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 3, 2025 at 4:19 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +     if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {
> >
> > Please use the standard properties rx-internal-delay-ps and
> > tx-internal-delay-ps.
> 
> Since they share the same binding, I guess I either need to split the
> binding so that the new compatible uses the standard properties, or
> introduce them to the existing dwmac-sun8i driver as well?

You should get them for free from ethernet-controller.yaml. But you
might need to add a constraint that allwinner,tx-delay-ps etc is not
valid for this device.

	Andrew

