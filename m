Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA91BC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPNXK7KQ5MpRRYWq0KLtF7TwN/rOCRuz8TuoIYjdjVY=; b=taj2ae5ylJCX7GvZSoUQWJH6wo
	x5OaFiF/Me+2QGau3svP6wpbHxXlJxRRpJSRJs4yKtQmTYCF+WBg2wluEbRMXYtjFBemrTxBh1TGS
	ac6KXplu2Ac0y27P4ir+j/0lLSQ5injV3BRrSholNPC0qOOWjUrnkDDiXl2wyjd0Ujuk30xVTdiB6
	hDgwC6sJNMS+SCpFDNfmIFH47zrsioEQ2539qABf42s/8dvMCwZDzhC8aTpVcFPiX9blZqQ22EW+H
	4o1+LaXWCouvnTR9g86UkSqOV6dpu7fppyIr4Ht4JGlejRiSj4svc7WitSaNLrRyrBga5aMZo3TGI
	aWxXNhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlL-00000008bWF-20bb;
	Thu, 27 Feb 2025 19:41:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhx9-00000008EwR-2zse;
	Thu, 27 Feb 2025 17:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0000D6111F;
	Thu, 27 Feb 2025 17:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9685C4CEDD;
	Thu, 27 Feb 2025 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740678342;
	bh=axlj6OwJVLYwr+IYJL39G4o+MqL7DKsYZuPxTQMr9eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Itq4eoKtNVNpeFYQ7F357k3WR+YxDtrfU/WrLbn773ZYNI9GB1aPTUGoFWFTPxK1s
	 ZPRPgYSCBXlEQQYxeeA184qAcY+WqsJUXllKK+DG5A1S+iTbcnxf08pqIG80X9whzu
	 8Keuii1YTeNMBU54jhF7Leb0TuETm/Nr5ngiNPyjMN9kiRfW3+xakpRGAE6IT5vIvk
	 du7MXtbCYIbfuCLkdgF9p1TwiFue1ekqKjL7YM/wWeZEpTMrDhnZzySqX7Fqv7+K4+
	 2y71/+2T8whsUxscXC74/WzJzU2a2XC8kFsnYkP2itqPEPn1f6T+0GeqBTUi9PPnP1
	 u/cy38V0JG4qw==
Date: Thu, 27 Feb 2025 17:45:35 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH 4/9] mfd: mt6397: Add support for MT6392 pmic
Message-ID: <20250227174535.GI824852@google.com>
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-5-val@packett.cool>
 <173920541986.1887800.1972669785800121190.b4-ty@kernel.org>
 <CAL_Jsq+PPYeFxr=utwZLemUVCzk5iabtMckOJmNy1-LO39cqeQ@mail.gmail.com>
 <20250227154833.GF824852@google.com>
 <20250227172457.GA3415187-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250227172457.GA3415187-robh@kernel.org>
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

On Thu, 27 Feb 2025, Rob Herring wrote:

> On Thu, Feb 27, 2025 at 03:48:33PM +0000, Lee Jones wrote:
> > On Tue, 25 Feb 2025, Rob Herring wrote:
> > 
> > > On Mon, Feb 10, 2025 at 10:37 AM Lee Jones <lee@kernel.org> wrote:
> > > >
> > > > On Thu, 26 Dec 2024 01:58:04 -0300, Val Packett wrote:
> > > > > Update the MT6397 MFD driver to support the MT6392 PMIC.
> > > > >
> > > > >
> > > >
> > > > Applied, thanks!
> > > >
> > > > [4/9] mfd: mt6397: Add support for MT6392 pmic
> > > >       commit: 896b1eb4ca771b37ea50feb4d90a78dd4e9cb388
> > > 
> > > This should be dropped. Missing the sender's S-o-b and the rest of the
> > > series has issues still.
> > 
> > Are you sure you're commenting on the correct patch?
> 
> Yes.
> 
> > > Signed-off-by: Fabien Parent <parent.f@gmail.com>
> 
> It was sent by Val and is missing their S-o-b. If you send another 
> author's patch, it needs your S-o-b.

Ah, gotcha.  Yes, that's fair.

I'll pull the patch.

-- 
Lee Jones [李琼斯]

