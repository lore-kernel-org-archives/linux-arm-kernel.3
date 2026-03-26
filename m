Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9D010A88EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAAiF8xSgL3z4E5G5/XmRxGLgvCy/D0+zQfYgHI39gw=; b=1yqfr8Xyn99oyPxuiUCErGB3Ec
	wJD/H5DJ7msCu7LFPiJDzcyuSKTCENjoW/gDp9jxb87q/uFRxUNQ/xVTpnIPUj+9WLhtXbg7uuk0d
	L+Ylt6Q8fUGQ38OHihXFO/IvAUYYSwf5orakU+zrPBnGd7utdDZsLgasXJ1BXKVbKw3U/mZrEi0hh
	LqNhkZmvF/B3zauWLqZ7bgAi2DIf2pJiQw68cBSdJVeffiCHLCrEDRnUBIjk7OlKfx32QUVWhRdX4
	Pavx4CbQJ9maUmL1z9sxbiwBmrW6RWKCVv/gCSNLkIXIcchsGDtP2lqcnSYQ+0cKhGFL1QnCHpwv/
	sw3dcjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ofP-00000005y9h-3CnX;
	Thu, 26 Mar 2026 17:38:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ofO-00000005y9Y-46zn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F2DE6011F;
	Thu, 26 Mar 2026 17:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CF3C116C6;
	Thu, 26 Mar 2026 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774546725;
	bh=hAAiF8xSgL3z4E5G5/XmRxGLgvCy/D0+zQfYgHI39gw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=ArEAbT+s3n7x1zNm2qUyfultheclQsMn7Cylk1mxfVokFRrNp3WpcDfI8mmayZ+0h
	 m2cGLs0n6Sh6ZCu8EvHXqLDxmAX8LMqlZoRnQEfHReuoiYU3xPG1brRn0xv/B7nG91
	 dfctDdAzWRRIBz5wDeTdWGKHbyzznewMhiup0tTEhLqFpUABWkXccnP5fkKD1V8bqG
	 AQrp8yU+1knEeWB4pCRAjqoVJNKbnXs/r4tup9fByZXD5EgZfswwbwv0q7Wo741gye
	 MvHPzW2Tb0nrON4/+fHRtWe9N46CjKkZ5ux8WM6YRAe6n1JfA4kFbYnKDRvMa6t1Pa
	 3vRMCPXPpyakA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 18:38:35 +0100
Message-Id: <DHCWB6YQ7B8E.1I9WCHXJ6FBPH@kernel.org>
Cc: "Russell King" <linux@armlinux.org.uk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Nipun Gupta"
 <nipun.gupta@amd.com>, "Nikhil Agarwal" <nikhil.agarwal@amd.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, "Haiyang Zhang" <haiyangz@microsoft.com>,
 "Wei Liu" <wei.liu@kernel.org>, "Dexuan Cui" <decui@microsoft.com>, "Long
 Li" <longli@microsoft.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Bjorn Andersson" <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, "Vineeth Vijayan"
 <vneethv@linux.ibm.com>, "Peter Oberparleiter" <oberpar@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Sven Schnelle" <svens@linux.ibm.com>, "Harald
 Freudenberger" <freude@linux.ibm.com>, "Holger Dengler"
 <dengler@linux.ibm.com>, "Mark Brown" <broonie@kernel.org>, "Jason Wang"
 <jasowang@redhat.com>, "Xuan Zhuo" <xuanzhuo@linux.alibaba.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, "Alex Williamson"
 <alex@shazbot.org>, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Oleksandr Tyshchenko"
 <oleksandr_tyshchenko@epam.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-hyperv@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-s390@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <kvm@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-arm-kernel@lists.infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260325052919-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260325052919-mutt-send-email-mst@kernel.org>
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

On Wed Mar 25, 2026 at 10:29 AM CET, Michael S. Tsirkin wrote:
> vdpa bits:
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> I assume it'll all be merged together?

I can take it through the driver-core tree if you prefer, but you can also =
pick
it up yourself.

