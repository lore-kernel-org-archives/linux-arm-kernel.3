Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB032CFD31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 00:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyuKCeP41T0RhPLm1wR6CXJW1I3cW2J3OinYCkHlCUA=; b=UpuxuYz5ya9m22Hd7lxVR6xnIJ
	qnC7XtNQf1dvJCT6sSeCOpCUFi5wsI4k0Ooj1K5NPfdDJ6m/Gmq9m7Jlf1KM/1C2Ke/BseCJsZk0T
	+ntzNNkdCQm6OD3RNkNrSP+KbHnJNKIH3BdxDos30MOmMSMycMEMdKX3DqawHNb7NEOPB7g37vjHk
	iHQyYf09t5dkwboWlsYBiFmP9FZ/WzlLOS95M7Hjz2cTHuJ72ifXuTiD5ABcaVPZkAe5Hqru+wDn3
	AIum4fGhaw5m8138QZDpxulmMBv22znyxjw9EMcv5RGXkwAFgXS9g31ZvwUGIIB/2ev7uvf+8rxNc
	po4iwKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgiU-0000000CVhJ-1Jzz;
	Tue, 25 Nov 2025 00:15:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgiS-0000000CVgx-0gUI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 00:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QyuKCeP41T0RhPLm1wR6CXJW1I3cW2J3OinYCkHlCUA=; b=wZ1DsvW9la8UgZWAaiXuSHzST4
	z1S07IxHiik6Yuv+/Uv7sn6kcoTV3R8/+AHaP8hD0NqhsK756/W3ib2oICaq03/DQJlI9cslEIlT8
	CXYCuwbYE5FZDfWJ5vzhvzg/f85RBc78Ha5Itgyu76Ma7I4A+j6qAl0U2TAYy/IQZjcs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vNgiA-00ExVk-3k; Tue, 25 Nov 2025 01:15:14 +0100
Date: Tue, 25 Nov 2025 01:15:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"dongas86@gmail.com" <dongas86@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Frank Li <frank.li@nxp.com>,
	"kernel@dh-electronics.com" <kernel@dh-electronics.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux@ew.tq-group.com" <linux@ew.tq-group.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
Message-ID: <10502960-d426-49fb-aabf-dc62f11153e1@lunn.ch>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
 <5432a356-7694-46a5-966b-29257f37a8f5@pengutronix.de>
 <DU0PR04MB929990AF168DA048D26E993480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
 <18901222-fa5a-4e5e-91c9-f252d6bf1a18@pengutronix.de>
 <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_161532_225693_736757CF 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
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

> But how about the remain changes (drop invalid defines and adding new ones)?

You should probably make these separate patches, with good commit
messages why the are invalid, and what the new ones are useful for.

	Andrew

