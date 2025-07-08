Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1D1C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWz3CQl3Hyfv4Ozhor8+07wg6X7dBTPFYEAyJfxYObQ=; b=q1ao8D8pNVpXom8iXJijw6zZPB
	M+ZMHlZ0LbXuXf2B3vkmIwF3rbPB9Wag1P+S5kDpb4E7HTeQKRoYF/UV5D3QZcr1egU74a1gBXs/i
	3agEXYVPfaSdCpELwkcVwia66erRvuOA+ROYZRu/WutBAoOSK60s9JOpP35xvWSxRsOMxQnU4WB3a
	+u0qK58VjB8cnoI0SvbI7JpFumNN7ARiPL5Z1BO4Pkgno8oEjnrqlNmO9CzmAkzFtFFpmkKBVTofK
	0JRMNo1yNRFmy/HDlf9f3vszGdv5RhEj1NbEM/tIA2MFGFLBweYgJBGdI9RlOxZGK//k/e85TIc8E
	dcyc3yOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBtp-000000064wb-29Mw;
	Tue, 08 Jul 2025 17:14:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBMZ-00000005zp3-0sF9;
	Tue, 08 Jul 2025 16:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dWz3CQl3Hyfv4Ozhor8+07wg6X7dBTPFYEAyJfxYObQ=; b=W5tDj252G837QmC8BdmftZjzei
	j2OFy2XAgMpSVYiMTPnWSatB5hUYTehmfiGGEpsCcr0WOrKzkSfIw9/+JS4X7ltAaDxvMSnos0+vl
	Mhm1vNbSwFDbffuN/sYNjoUnDFSxjeP0tQuFf+/lh3CaVHB+B0IxkP1g8eGkOdhQaOe4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZBMA-000qSM-HV; Tue, 08 Jul 2025 18:39:46 +0200
Date: Tue, 8 Jul 2025 18:39:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/5] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
Message-ID: <b3c18067-f06e-4818-bf0b-e33fdf27b174@lunn.ch>
References: <20250707184420.275991-1-lukas.schmid@netcube.li>
 <20250707184420.275991-4-lukas.schmid@netcube.li>
 <20250708002205.70ec9097@minigeek.lan>
 <3700020.R56niFO833@lukas-hpz440workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3700020.R56niFO833@lukas-hpz440workstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_094011_245695_CCCF43F9 
X-CRM114-Status: GOOD (  16.40  )
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

On Tue, Jul 08, 2025 at 05:19:31PM +0200, Lukas Schmid wrote:
> On Dienstag, 8. Juli 2025 01:22:05 CEST Andre Przywara wrote:
> > On Mon,  7 Jul 2025 20:44:15 +0200
> > Lukas Schmid <lukas.schmid@netcube.li> wrote:
> > 
> Hi Andre,
> 
> > Hi Lukas,
> > 
> > please try to refrain from sending subsequent patches too quickly, that
> > might just put off and confuse reviewers. To acknowledge a change
> > request, it is probably sufficient to just reply to the mail with a
> > confirmation.
> 
> Sorry about that. I'm still trying to get the hang of this whole "submitting 
> patches" thing. What is a good time/reason to send the next revision/version 
> of a patchset?

It varies per subsystem. For netdev there is a clear rule to wait 24
hours. For other subsystems, it might not be documented. GregKH used
to say he would always respond within 2 weeks for USB patches. To some
extent, you just need to see how fast each Maintainer works, and
resubmit based on that.

Also, if there is a discussion going on, you need to wait for that
discussion to come to some sort of conclusion before reposting a new
version.

	Andrew

