Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A681E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 20:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hs8uP3N/mTdsE3JF6EEgjMUW9ubX3QrUliIYU0W1Efw=; b=ZJEJuvy1VhFNHLNogatMNkia2Q
	TPcKbMMTe77yLiAbo1FWVE3wuZtUI9+x0vPZCUOA38aKWyRmQB7ZkIWuAOHQS2Yq/1s6WGInCwUCG
	zx2iTTuOmnjFhKO4XpawSAImuIRInyXCGmWoMzie6wq51qd2LJj3c1kVTbX6+/zTTFaj0OJzkIfCL
	KOsYPHR8bXwS5KrJWA3C7v7r7T+tkiY7yT87QnatNB8yf66beEo6kGN7X9bvD/Alz/NqnzXCvH7UH
	MChiwZ1oMNZenpfepfJ4nzNT9bAFA3E3SkCRed6rT2UhwbswrahCQHpzbb9v7nuuvd0UH1+chX0xV
	1ksfNlwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVcSq-00000009jh9-3kNA;
	Wed, 08 Jan 2025 20:15:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVcRc-00000009jOE-43pV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 20:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hs8uP3N/mTdsE3JF6EEgjMUW9ubX3QrUliIYU0W1Efw=; b=cokaGl5rbCCWR5PLEEXlzlK4cg
	61kIh8CGC74Kzu7whTHy6mmGZiSShEsvkL/AiJ79CgmLhcin6x2cZmY33bJNEFJBTn2rnElphfZ8A
	QoBXD8JA3+CWcAR2AKXIabgI7RguloybklWjZ7s0SMDRD9wP03I3Y1lpAgkiPSW+xw0s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVcR0-002fvx-Ne; Wed, 08 Jan 2025 21:13:46 +0100
Date: Wed, 8 Jan 2025 21:13:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	ratbert@faraday-tech.com, openipmi-developer@lists.sourceforge.net,
	netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/10] ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <b80b9224-d428-4ad9-a30d-40e2d30be654@lunn.ch>
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <20250108163640.1374680-6-ninad@linux.ibm.com>
 <1dd0165b-22ff-4354-bfcb-85027e787830@lunn.ch>
 <0aaa13de-2282-4ea3-a11b-4edefb7d6dd3@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aaa13de-2282-4ea3-a11b-4edefb7d6dd3@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_121425_003990_FC012C25 
X-CRM114-Status: GOOD (  18.77  )
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

On Wed, Jan 08, 2025 at 12:43:07PM -0600, Ninad Palsule wrote:
> Hello Andrew,
> 
> 
> On 1/8/25 11:03, Andrew Lunn wrote:
> > On Wed, Jan 08, 2025 at 10:36:33AM -0600, Ninad Palsule wrote:
> > > system1 has 2 transceiver connected through the RGMII interfaces. Added
> > > device tree entry to enable RGMII support.
> > > 
> > > ASPEED AST2600 documentation recommends using 'rgmii-rxid' as a
> > > 'phy-mode' for mac0 and mac1 to enable the RX interface delay from the
> > > PHY chip.
> > You appear to if ignored my comment. Please don't do that. If you have
> > no idea about RGMII delays, please say so, so i can help you debug
> > what is wrong.
> > 
> > NACK
> 
> I think there is a misunderstanding. I did not ignore your comment. I have
> contacted ASPEED and asked them to respond. I think Jacky from Aspeed
> replied to your mail.

You did not mention in the cover letter, or the patch. I asked for a
detailed explanation in the commit message why it is correct, which
you did not do.

Now we have more details, it is clear Ethernet support for this board
needs to wait until we figure out how to fix the MAC driver. Please
either wait with this patchset until that is done, or drop this one
patch for the moment and submit it later once the MAC driver is fixed.

      Andrew


