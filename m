Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E5C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7R6BzjbS1Abdvfjd8RJt0NOfGc78Xao1EMMZS/CvEMc=; b=hNuTA9/DmgQH9WFrSftQkOc6wR
	IkIDCmpmMaDbY4abZ7a3QMp1WxZjfoy+N/XmObG7DPmbnQp0OdJIOyDvJ5SlNB4QAzeNOiTbLxcMs
	5OolyVolTnteYWJQ5wtTdGItv42PvhLIP4RjuTloPa1dazsAxazYaqbDbZ2+d78643k7pOroiw6Vw
	/X6i0o7cT8uW/ZK7ZvmFwzdq5lCTMwDcSzv3Yv1WDeZdfCB3LUyWMAMtU7Q1uFeZxgEY5MWuct9cl
	hgr8W8AxkinoOihybuAXKASokHccVw33YBk16V7gaqSriI8Vgencj98Oz7J87onNXt3uvj4At8b6g
	NZfvx1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lW-00000008FDz-3T6z;
	Tue, 10 Jun 2025 22:48:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3ZM-00000007mZ5-1kaD;
	Tue, 10 Jun 2025 18:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749579569;
	bh=Sf+/PTs/Lz5YxcSzgeZ6krRCOhaKZUsHSbB6B664SQM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=W1JWv9KpviFteALr6LtWRjuNi/DB62SY7Z7oPEpnHgI/4Lfy85z1VLQ+27tsGhOxY
	 vRxxj/L5s8IpBFHQuyOPcflvF7qUr87yiWLTk9ezT/TWxhfODcCbJIh34EPjqKGM3h
	 wrDIld7ZbHxppg0CNIkKJkh2h7ioXurEzICh4rsVOGu8shQgfzrRPxXym+8iqz1Gcc
	 d6QC7gHCDkaxNsqQggPfMPbkoXAI4w417r4SV+ituO8JQjEynKMllEBoQ9zoLGkfAa
	 9emBbI3vCLjLtvkCek1B6kkL/ZpMXmcjeoaOoQxGLD1lKy0Wbknxog7jm7VJj9RnSf
	 g/Y2ednB6sYtw==
Received: from [172.19.207.65] (unknown [66.205.13.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E891C17E0FAD;
	Tue, 10 Jun 2025 20:19:09 +0200 (CEST)
Message-ID: <c666ab1bbc619cbb99fa38b96891a24ca22c9672.camel@collabora.com>
Subject: Re: [RFC PATCH 00/11] VC8000E H.264 V4L2 Stateless Encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Marco Felsch <m.felsch@pengutronix.de>, benjamin.gaignard@collabora.com,
 	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, Sascha
 Hauer	 <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paulk@sys-base.io, 	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date: Tue, 10 Jun 2025 14:19:02 -0400
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_111932_616223_E9477443 
X-CRM114-Status: GOOD (  12.30  )
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

Hi Marco,


Le vendredi 02 mai 2025 à 17:05 +0200, Marco Felsch a écrit
> 
> [1] https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11
> [2] https://gitlab.freedesktop.org/dude/gstreamer/-/tree/h264-stateless-encoder

Can you rebase against the upstream work:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5676

A lot of changes Michael made in your branch are already in the upstream MR
branch. An example, in the upstream version, the src pad (CAPTURE) is already
being set before the sink pad (OUTPUT).

I'd like to open the discussion about sizes, as I'm writing things down.
In your modification, you affirm that the encoder must ignore the size
set on the CAPTURE. At the moment I tend to disagree with this
interpretation and would like some feedback.

There is couple of different sizes we'll have to support:

1. Allocation sizes
2. coded size
3. display size

My believe is that we want to split the size in 1 and 2 since the padding
added to the allocated size should not affect the amount of bits that will
be compressed. We should be able to further pad frames without increasing
the compressed size.

For this, I wanted to mimic the stateless decoders, and define the coded
size, the one that occupy space in the bitstream and found in the sequence
headers to match the CATPURE size.

3. does not exists in stateless decoders, since it has no implication
in the decoding process. This one I'll leave open for now, since its
only needed if we have to generate some headers in the kernel. We have
had a lot of discussion toward that, and if so, I will pull in the
use of S_SELECTION.

regards,
Nicolas

 

