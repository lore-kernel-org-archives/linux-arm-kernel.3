Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15C3CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fkl/Jj9ydf8PXJruNkZkOdYK5N7nJjHeodLNEE5XJg=; b=fiRysEL9fLJnHwpznhxHZWbGOq
	8MI99UFKFkClesVWvzNq2zx8g6SFDfZDIw8WnOGAxElOSUxLYUArvHGnUmlzOBGmEgNL1v0TtGiPd
	7ggltcAmI9tHD0BYA1a2AOQww3CVeuY0HNC+xwcKEzXUgnlwNj7V5v8/7IadfNPc5jZ0xoi592SQ+
	QkeSrMjR3M0WWSHhF8hh77P5ANnU8tTT5DNF/Ye6L4+CREH5hbgTKppaejs6b9J5nDuBnOwu4UBo8
	/WNzkvGJOw4H/rLd2iVT67vUT/Mfm2fQVLo8PRlNwuD96B2qiVPo5esnbyw53KkhPt+w/i1yG8V/w
	1Kg3PU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7Vl-0000000157X-3MqU;
	Tue, 06 Oct 2026 15:55:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7Vk-0000000157J-2DQl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:55:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31470434DD;
	Tue,  6 Oct 2026 15:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C4C1F0089B;
	Tue,  6 Oct 2026 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791302124;
	bh=1fkl/Jj9ydf8PXJruNkZkOdYK5N7nJjHeodLNEE5XJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WnzIo1+TBh8goDe8OxLSELwGQB+lfy9DSLQTR1RyhjJmYZJ7filX5XIdGI6Fn6+Ga
	 31q14emKNWnFqnJkdgZURYvsLqRU10mUE5sXiSmzUhUACAHjG7IhWFc+2Y6HHRYfE9
	 ANM44cMqJDCLQ0pEfYJZ4QjuSXwGHLHEF1AsLLA0YMMdeORctv8L6Es82mtacdGemN
	 H4gm0dOtDktmEq7ODl5rJa5hNBj88vMYBx3gdsTL3Kzir1pLwtWU6qjWSC60a6JmZd
	 mzefn4WrjYvQm6GbQ6Mtd7RX4yeCiTtUACaD27WW7rRQLw0iQrOBv/F2xHjFNPuqA0
	 OwhRzYyLIiHHA==
Date: Tue, 6 Oct 2026 10:55:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Julian Braha <julianbraha@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Yureka Lilian <yureka@cyberchaos.dev>, Neal Gompa <neal@gompa.dev>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>, devicetree@vger.kernel.org,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
	iommu@lists.linux.dev, Hector Martin <marcan@marcan.st>,
	Will Deacon <will@kernel.org>, asahi@lists.linux.dev,
	Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH v4 02/10] dt-bindings: mailbox: apple: Add DockChannel
 mailbox
Message-ID: <179130212273.2406323.10596921268948570337.robh@kernel.org>
References: <20260925-apple-mtp-keyboard-final-v4-0-304c267518f4@gmail.com>
 <20260925-apple-mtp-keyboard-final-v4-2-304c267518f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-apple-mtp-keyboard-final-v4-2-304c267518f4@gmail.com>
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


On Fri, 25 Sep 2026 22:09:29 +1000, Michael Reeves wrote:
> DockChannel is a FIFO and interrupt block used by Apple coprocessors
> to exchange byte-stream traffic with the AP.
> 
> Describe it as a mailbox provider for HID and serial clients. The FIFO
> interrupt pair is configurable because MTP and DebugUSB use different
> pairs.
> 
> Suggested-by: Yureka Lilian <yureka@cyberchaos.dev>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> 
> ---
> Conor's v3 Reviewed-by is not carried forward because this version adds
> the apple,irq-index property.
> ---
>  .../bindings/mailbox/apple,t8112-dockchannel.yaml  | 88 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 89 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


