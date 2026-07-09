Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F731C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MprQAKh2M/FtwGqOd4VDQqoZaU2yZXCQ18QWe8n/Kng=; b=Kos4tbXqPzY0RBMGu+HtbDbtJk
	E5HvFhAeysHolOFTRejSjQ4OcSqfEEL2PurUwZPOXlZfCLd6697ydMH32HPKglNOTvnGxc7azFCCI
	+R+6dGZUCkBdBN/7aZtM40r0EWvNRHgTfBHji9byiL5F8zkqiTHQbunjiYIdEPU3VsxLIgOtYahHx
	7nnjgi7c3I7mS3xENJNrJsgCwDcwSfFJOkHSz1JqbLjn2TVU0b8Cdk+zM/M65oj4U1CrAXIG4WJmD
	bbHP7ptSW66t6u0/f4bBHvyVUMmH7twcQeHyPaB8Fit0b7km9SPGdEQRk8f/pc4AcsZuPDnG8cn7h
	OyQjsM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmUB-0000000249S-1YtT;
	Thu, 09 Jul 2026 11:00:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmU9-0000000249D-4Air
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:00:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03178412B0;
	Thu,  9 Jul 2026 11:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5971F000E9;
	Thu,  9 Jul 2026 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783594803;
	bh=MprQAKh2M/FtwGqOd4VDQqoZaU2yZXCQ18QWe8n/Kng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MU5ohz9bmKHFCulLWiU8ZqPv5hZFxfJzR0OkiWeQ2G8uJYXIXQXInlOo0qCBwHHJP
	 09mOvg9wZj8HP6g3wXbL4tx9uDhqXRCZCPk0xhibWa73B8uTh5B/WlQHss96tEgDj/
	 X2ehGRo5lUQALbIc93vI1o413xDOkiHfnJG8Jm50du3Kk1sF3fnaezkDWZxNKrBYJ9
	 K/4Ai66OKaHVMT+TgysvQj6bfdarHmBiUqgYPkDj8vVuDsGC/5MghGzRyhZxvvh9xg
	 vN20w6xPqIbUSomclxBcPp2GJem99Zr+unNKUmNAw2M5x/WbY2o2K1LS/noslRr2RQ
	 k2hosyPEkt3VQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Colin Foster <colin.foster@in-advantage.com>, 
 linux-kernel@vger.kernel.org, 
 James Ogletree <jogletre@opensource.cirrus.com>, 
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
In-Reply-To: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
References: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1 0/3] mfd: Initialize spi_device_id arrays using
 member names
Message-Id: <178359479977.2113490.16055346814964770733.b4-ty@b4>
Date: Thu, 09 Jul 2026 11:59:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Thu, 02 Jul 2026 16:53:38 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> this series targets to use named initializers for spi_device_id arrays.
> In general these are better readable for humans and more robust to
> changes in the respective struct definition.
> 
> This robustness is needed as I want to do
> 
> 	diff --git a/include/linux/device-id/spi.h b/include/linux/device-id/spi.h
> 	index 812e7c3854a7..93d9cd45569a 100644
> 	--- a/include/linux/device-id/spi.h
> 	+++ b/include/linux/device-id/spi.h
> 	@@ -13,7 +13,11 @@ typedef unsigned long kernel_ulong_t;
> 
> [...]

Applied, thanks!

[1/3] mfd: Drop unused assignment of spi_device_id driver data
      commit: 8339fb0eca348d41f04bb9631707192569f753e6
[2/3] mfd: Initialize spi_device_id arrays using member names
      commit: bdaceafafa54b3fd4f9dba9e0044a910f16e4a2c
[3/3] mfd: Unify style of spi_device_id arrays
      commit: 6384e5c5e0bcfbc9a915d70cb3925e0022d7b337

--
Lee Jones [李琼斯]


