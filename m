Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AAAE909C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMuHuDboJOUu00uJIftapYBECe57uBS1skPmmrMya9I=; b=2/wQggS6ThPNOUDsex5UXH6M9v
	IPf1LtMAlPqbJYlVTrtDt4PsHtyKK0VF6LjtUVfgDcPiIvJ4PZUUpifOot2S4p8ZgzoBurb2AdGub
	FcbItIpDFJjeHZf2HuejC3zOLzNFJk9bpkaMzq5BwEtA7IbLVHvWR4Y0O9WPL+XZ/GWiLULLxvz0X
	+bN2zKS/GXfYtrxIM+EbuQf6B+GGIqX1wWSRnXqCBLg89cZJe55EGjfOYAOja3LpYLmDKCan0UKN1
	xykl2phU8Tf5i3Cao/gLz+XMGdOIQLZAxvGtELOG9/NyhxYPN2V0V6RdHQN0M7+l29zu4zph94Tv7
	6/dCzKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMem-00000008Ty3-2ziE;
	Tue, 17 Feb 2026 15:06:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMek-00000008Txf-3IUO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZMuHuDboJOUu00uJIftapYBECe57uBS1skPmmrMya9I=; b=pnXmV2pPZ3/C/SS6EyXrdqFasH
	NKqo9klORAGON0S1c7A6pjPqKkHqxGzHdLHCaIdRzD3sIlJr0Exgk+XDraakMeF8p3YJdEhghbJLD
	tLqQLOYWG+zASBKqVOs3Yo5wLlEn84P4ol+2Zx7zYW3jdMwl6lPbcr3ZxHdEVuTy37iM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsMec-007elf-58; Tue, 17 Feb 2026 16:06:22 +0100
Date: Tue, 17 Feb 2026 16:06:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/5] ARM: dts: imx: {bx50v3,b850v3}: Update device
 trees
Message-ID: <538e99b3-be4b-4f1b-a3e1-dffc6240461b@lunn.ch>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_070630_844791_15045159 
X-CRM114-Status: UNSURE (   9.40  )
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

On Tue, Feb 17, 2026 at 03:55:15PM +0200, Ian Ray wrote:
> Configure PHY speed and mode.
> Configure b850v3 gpio4 line name.
> Disable b850v3 usdhc4 interface.
> 
> Changes since v1:
> - Clarify the exact warning message in patch 2
> - Add patch 3 to order reference modififcations correctly
> - Correct the ordering of reference modification in patch 4

Please wait at least 24 hours between versions. You need to give
reviewers time to actually review our patches.

At the moment, because the merge window is open, your patches are
going to be rejected anyway, and you will need to repost in two weeks
time.

Please go back to version 1 and answer my questions.

       Andrew

