Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D88C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWrEZUhn+CmysOPoc21dv+ciSvoh4bigdHUVKG1EGAA=; b=FhxpwEaFUwXgKCzfEprHzR+kJF
	Lc4NKZSy9eacnnX3la6w+U3BWhAeVUkEWPCJBb2FI83YJRQmBlD/Fgwz0PmBgoIYh0J8uQDzOTA3I
	AKbHxurwggwE+MUk9dHq6HcnI4e/zbckT3OakRJHVrqqI+GURCa4OjPBh+sbFf+ppmZj2HIRZsPoV
	hSi8518qb7KR7jrNqYLpsNBPjhOTFFlWLPif7rnjmehNu3W3rZU+l7DdnTAWjNrWFNdskh4CoaJjw
	yAuWLBlQwrys23QX3YIuElZhezS2MrD4qJx5dtoYbEhD68W/+6LJJwIZ72CJBUfNfIFJyhW1hczaw
	QOoNznAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd6B-00000005imh-29pg;
	Sun, 04 May 2025 17:25:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd2g-00000005iK3-3VJg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC52F5C0D05;
	Sun,  4 May 2025 17:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F62C4CEE7;
	Sun,  4 May 2025 17:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746379337;
	bh=OwvrBnjaTxzXgXfw4YDawAL7+dm0wvIDFuO7EpPK8JY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OO8czlntL2Qmw4cDAdJa/kF0nth0kjjowllgMa57ynDGfPgWh/EB6qbeZ51ylGfgg
	 nhxNRfvcjebb/euGaaaFO/2aJF5oRybPHWAvRigY0pjPOGR2egmhB4+KOPWSo4Jgxx
	 Q6RA5n9JZMU9GVaXd0/jhTRTKDfeQiDb3ZInmdjF/t9MDZeGPO0WNN0G6/s1kg4fBc
	 9YVUGdcNqLG0LFE+czNzRvwM6Vkl3PBK6zxiDIZSm+e0G5BSG9u9DaDOrPe6uRMmh5
	 W+6cTFh3w2CFgC3OuRxwpcjfTcduiXPNjDohLugIfvYnO5+bAmJwvkRUXjbipqQKfK
	 OgoyjSL6pi5Eg==
Date: Sun, 4 May 2025 18:22:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Eugen
 Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
Message-ID: <20250504182207.33ffd560@jic23-huawei>
In-Reply-To: <0082078a-32ef-48cb-a181-c2d598ae29e6@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
	<20250428-iio-introduce-iio_declare_buffer_with_ts-v4-4-6f7f6126f1cb@baylibre.com>
	<0082078a-32ef-48cb-a181-c2d598ae29e6@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_102218_933586_500048BD 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon, 28 Apr 2025 16:37:19 -0400
Trevor Gamblin <tgamblin@baylibre.com> wrote:

> On 2025-04-28 16:23, David Lechner wrote:
> > Rename AD4695_MAX_CHANNELS to AD4695_MAX_VIN_CHANNELS. It has been a
> > point of confusion that this macro is only the voltage input channels
> > and not all channels.
> >
> > Signed-off-by: David Lechner <dlechner@baylibre.com>  
> Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
> 

Drat. I was thinking I could pick up this as well.
Obviously I can't as it was after the one adding the code that is being
changed...

Ah well. I already picked up that other patch so I'll keep that.
If you send the next series with it in as well not a problem.

Thanks,

Jonathan

