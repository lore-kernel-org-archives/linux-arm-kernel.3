Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B576F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qk3va7EqRblQvPQuIP+Xv3Nh0k9Ts3EEcLUkbWFDR6M=; b=hOIlczpP4XcDxRFlJkOn1PwEli
	CympCkX/Y8N2+HCAeWp+B9sGxpjKv9ZxRKMyqlkj3JtXvcFWf7gFyjWKuWS2vSjutTNdYixgYRYGl
	HMxlD2rvYS2lNpwBEqE2NuNAnQxabMeQD4Bricvlp+NCKVPGD3t0X64SrmI/5FQkWiWJW/QODX5TO
	MVhxZtr7n+MBN2hc8/DE47h+P5gZ171GBTP2SVQ7AEXNxhh8Uxu0HVB74SS/CHCrFquSo5XfZ6vnM
	7ka5vPZj468hGlM1+/2pKhQjTu73W5DxipowG9vX00g6kiN1dNEqJ8ok3mwRhQ19Np5PZQnkwCWo5
	gEH3ufng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJfI-00000002oh0-1LUY;
	Fri, 06 Mar 2026 01:07:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJfF-00000002ofU-0eQC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55EC8600B0;
	Fri,  6 Mar 2026 01:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE7BC116C6;
	Fri,  6 Mar 2026 01:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772759256;
	bh=z4HAlmfWQOzRiBcoGIB7Q03RvJNuqThL39CBgE2qsQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVBdL4JbvNDpAyuFRvZ4/vfZMSnu/DOz00U914ktPjcw25bz52wXCvzP6ewL5u6R5
	 Nx7uVkwPkXEP//pyRcA2eI1OLDS1VwRRzl+c4dV/Cdxolaf7GgEJsz5MgP1gUrSfeD
	 VU3koytaulSA8xghO/zH0OymywkkRdjnuu2N6v4vQcLOZ1ueg6Uw5kMp2VzijUqK5d
	 qIFFD6RZYUIQM+QB3c+1ctLSWojQ64qRo8dX3Bh+mGaTDMf6RDtO+6vxacaipPCp0G
	 zEaeTrAO4YQYJCt5BpK/cn5xZvpwbb2uEyab5r8eKA19i1U668Fo8aVvW8oDWBdmlI
	 A5KDJ4s3leZJg==
Date: Thu, 5 Mar 2026 19:07:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	imx@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	asahi@lists.linux.dev, Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Message-ID: <177275925396.907435.14412144819851551606.robh@kernel.org>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-2-c6ac5351489a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-tdm-idle-slots-v3-2-c6ac5351489a@gmail.com>
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


On Sun, 01 Mar 2026 18:05:21 +1000, James Calligeros wrote:
> Ensure that all references to tdm-slot.txt have been updated to
> tdm-slot.yaml, and are schema-compliant.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/imx-audio-card.yaml   |  9 +++------
>  .../bindings/sound/simple-card.yaml      | 14 ++------------
>  2 files changed, 5 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


