Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F293EA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VR1lN56B6GAl/1Ww24QWmptXswZR9bm1Wx3j1VZ/tKo=; b=3/lPdCHGgZWLKqmlWQBf1XGJna
	bjMj9LqvVIZCNsaP8DJMgTHR1ZkP7g8NhSPD92l/HeaH7X2u+8SKt1o5TkssJVBj5J+jUz2InHyWC
	AzVrXx9K1EcB17bpQMllVA9GBkpKDI5O/MtwTjaJr+dUs/aNe36ruRGe5Bi5JCYDOlSWex1p01oPj
	bfvCiShTq1Wiu/I2c76RVemRZXsjwV5+0EQTW95RIxmpRIrssiDm8FGoS2Gzox2cikQafGSpPwpkX
	fWng6uTh6pHd1fmDhrcdSA0SqOhQL8frhH9GlZiY68SnMP75BKrLEccLIfzU6XELzauXW7LkCw1Vs
	U3uuSDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoEL-0000000ALma-2MMt;
	Thu, 09 Apr 2026 12:11:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoEJ-0000000ALm8-2Fhn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VR1lN56B6GAl/1Ww24QWmptXswZR9bm1Wx3j1VZ/tKo=; b=ufqZXDThZgPZj9ZuOE0NbJ3xbk
	k+8LmvcrQs4zRpbVnsks5GOVsdH6Zx3ffbe9BnJgUyqlGJCdmbW0xIPtGQVFXnSAUl8ggYBLP4E5w
	TadeBe72Y/Gmme6z0n8k1XdSvYh+SILkyInPaHU1HOVR50RcJyJq9QLu67ZMuqUh+/vI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wAoE8-00FQV2-QE; Thu, 09 Apr 2026 14:11:16 +0200
Date: Thu, 9 Apr 2026 14:11:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Alexander Dahl <ada@thorsis.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Message-ID: <aef0a8db-7a16-4620-87dc-d517be946cab@lunn.ch>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
 <20260408-imx8dxl-sr-som-v1-2-ce5a39acd713@solid-run.com>
 <3024c143-520e-49ea-af17-33344ebf7149@lunn.ch>
 <db41d119-2469-4107-94b5-b09e9bbbe9ec@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db41d119-2469-4107-94b5-b09e9bbbe9ec@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_051127_577962_18424CA0 
X-CRM114-Status: UNSURE (   7.41  )
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

> Would it be correct to change phy-mode on the mac to "rgmii",
> and leave switch port as is?

Yes, that is O.K. Please add a comment, say that the switch is
providing the delay.

	Andrew

