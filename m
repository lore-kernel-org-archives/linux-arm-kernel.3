Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D90CE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/2412CaR/LufvJ8Kwi5yL2Zktoc6TzhEG36635Zq30=; b=aXz6PU/qtbTxPaNiMvvhhTRTBl
	X577UhdIFmKga3mhfdgSTkc4HyaCGckoWI4UKWQuTAQ4vYXUnvV8QgL1+GeR4szYqyx5Tdg/2JWv2
	N7XXqgj3k/UYAqoNkPGSsDj37snEhK5o9Bu/yntO299KB0L/rlSLrpuEsI5vma/jbmHY4Z8tqB5bY
	ZMAdDaxpZu2OUrgRGEt9JvuYSquB8W8L9MpY0UhzhtmE9PkMqsTKgjBE/c/Lw8acm4n2sviN2tWvk
	RCQ1S/MLuhLZYJO6HgCSMT3s+K30SeB9Ca3bmVtYQZP4q2hQ4X4YzwIBSljnOM9c1oh1ojYG69Rl0
	YrhxDZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zrQ-00000000vr5-43Bs;
	Thu, 24 Oct 2024 15:34:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zXJ-00000000sXK-0liW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F26F5A4560C;
	Thu, 24 Oct 2024 15:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD76C4CEE3;
	Thu, 24 Oct 2024 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782843;
	bh=SvIjThtAz+3hs0BLjpnwpREjkQ1yKHezPlmKnO8bpQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6/MspT8ZJ0LLZj+iNLOjKgo8wheWidUEy+VwJuRFZtDHLkZ0PFaaex/lolqsEWFf
	 /lEh5hGXtTNDLspunWrHzz9+0sYOXkJpG/1DEYIbGHz4M/ydkxvxB7zFgTEYZx3r8O
	 pbVxZnA2N8pP2zAHFT6XEUSpHhGmWGYZBAbjC+riZHbuj+x9LKXBNtx86OStRQoIPF
	 gPePp87I+9lQX4uGVCP5AKGZxu0z5LEXXibG0KCswUQgRvqn7ihP1umkvIk7js1CzM
	 5/0WjF23w5Kcv415AhGbg2VciNdlPiM4M3fwuIpyYjxx7yIicw3JYGtpsCT5W1Dq/W
	 XK0qkC9RySdpQ==
Date: Thu, 24 Oct 2024 10:14:02 -0500
From: Rob Herring <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	linux-spi@vger.kernel.org, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: misc: lwn,bk4-spi: Add binding
Message-ID: <20241024151402.GA499355-robh@kernel.org>
References: <20241023120015.1049008-1-festevam@gmail.com>
 <20241023171739.475a2bb7@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023171739.475a2bb7@wsk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_081405_316113_B2C9D042 
X-CRM114-Status: GOOD (  15.66  )
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

On Wed, Oct 23, 2024 at 05:17:39PM +0200, Lukasz Majewski wrote:
> Hi Fabio,
> 
> > From: Fabio Estevam <festevam@denx.de>
> > 
> > Add a lwn,bk4-spi.yaml binding for Liebherr's BK4 external SPI
> > controller.
> > 
> > Currently, the compatible string used for this device is "lwn,bk4",
> > which is the same as the board compatible string documented at
> > fsl.yaml.
> > 
> > This causes several dt-schema warnings:
> > 
> > make dtbs_check DT_SCHEMA_FILES=fsl.yaml
> > ...
> > 
> > ['lwn,bk4'] is too short
> > 'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
> > 'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
> > 'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
> > ...
> > 
> > Use a more specific "lwn,bk4-spi" compatible string for this
> > device.
> > 
> 
> Thanks for updating this.
> 
> BK4 is another example of to be long-time supported device... :-)

Does that mean we shouldn't be changing this compatible?

Rob

