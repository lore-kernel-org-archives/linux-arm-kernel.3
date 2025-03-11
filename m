Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCF3C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyuT4LMxAdKGhlYP1WXf9dqBk7+//4A4StAQ+Mi/bz4=; b=LyeCXwxYDfpFi8ufaZpdzq0ELQ
	UFZCFVI5zQEu3bIpNYrU4YMLLi7qnrGD6tKoNbSEwdcusYJQXd7CSaAmv6CHH9IuzwHEcQEZ29vrI
	rSlPf7rkwl3bX0bylbW8bHxYGfbLYOqowhc4eb6DuyxKQTSxC+1Ygibr2im0zv+KigOjLrAJlifCY
	U90G/rBOBR5npU2xUgKLu+Pru+R7tZ5ikh5kL4Ce/UWhm7yEAJk/VXAOFi+Kca+VORvZPtsb1SIEv
	1QZWDuToogXrqWFqzmqAMzI58hQRdGp+nTUiRW0loSqelqrG0oTF0nDb/ZJo+28iEvPxWo+N2jB8k
	TO8uEWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4en-00000006g1h-1Q2j;
	Tue, 11 Mar 2025 18:48:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4RS-00000006dov-3sLW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:35:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E96EAA460C8;
	Tue, 11 Mar 2025 18:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71747C4CEE9;
	Tue, 11 Mar 2025 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741718100;
	bh=sVHNbdJnau3K6ieK5h764cFOUI/8Mm9xtddYsKbK+KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNtft3sY19IiVuoDzWfgWESJrNn8CH/auzECap2rnCrOyzG33cEo99oc2alPIEy/f
	 cfy5T3Uj0QvfOnC9Z8Z7W61KLNXyeCfSdqIICG4pUe/lynRsu/ubZghRKuRRf2g/v5
	 VNPXnEL/LCImE+wpS4xk1EZps/FDDPFe2bezUc5M=
Date: Tue, 11 Mar 2025 14:34:56 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
Message-ID: <20250311-omniscient-fiery-bison-8e7feb@lemur>
References: <20250310-varsom6ul-concerto-dts-v3-0-551e60713523@bootlin.com>
 <20250310-varsom6ul-concerto-dts-v3-1-551e60713523@bootlin.com>
 <63f8aa7d-fcd4-450f-b3a1-44886a29fc7e@kernel.org>
 <cd2f3c97-53bb-42f5-a3cd-4385bfda5dc7@kernel.org>
 <D8CQAAKOZ1O5.8JVESQPJSSM8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D8CQAAKOZ1O5.8JVESQPJSSM8@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_113503_059745_C8E92904 
X-CRM114-Status: GOOD (  10.71  )
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

On Mon, Mar 10, 2025 at 05:31:32PM +0100, Antonin Godard wrote:
> > And now I noticed you used b4, so I really do not get how the tags can
> > be missing here. :/
> 
> Sorry, that's totally my fault here, I forgot to run 'b4 trailers -u' before
> sending... :/ And I don't think it's part of the prep checks?

Mostly, because there's no clear picture of how this would work reliably. All
other checks are on a "ran since modifications to the series" basis, but this
one would have to be time-based.

Should it check if the trailer updates have been run in the past XX minutes
(and how long should that XX be?).


-K

