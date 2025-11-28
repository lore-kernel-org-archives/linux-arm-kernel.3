Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D810CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 05:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4GBhYCB2u3+AHRi46IvQhn/fs34bNr8z2J3UBAZ03Q=; b=hcO9d2tvAGdU/5KMReo2KvHJt8
	o/sx0bc+KUlu5nd5UOst/PuFm80MN4A3r6OvO5Qt91ECFjsOptqic7IMO8u7J1xe1osdgH+yLWje6
	RumjCN0lIA0iTFK0I95DMZ+co0rn3tLZm97hVlECXCN1xRx3wpbg5TNw7dUwHebvxUUqxR92hH4jE
	iBmJlH+VWd7S81pa6Zcasdw7NhR2Y7jO5cnTqS+dY9+i09hATDYCVhqL4EinkFg4lYPJZ4D1Xgtn4
	uXyw4kKB5aurGufz6GsJrf9ZuPMnCFKa5PHSbvmi272/wPsPfkjg0Adw8q/AlWBdDb+SfZlpw2ya/
	YKjBKMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrPp-000000000vS-40Sf;
	Fri, 28 Nov 2025 05:53:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrPo-000000000v3-2xGe;
	Fri, 28 Nov 2025 05:53:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 206DB602BA;
	Fri, 28 Nov 2025 05:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48709C4CEF1;
	Fri, 28 Nov 2025 05:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764309187;
	bh=sJNE2EqQudNagDwT3Ypqk6yAIXr51FigU3Oyf0BdWoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCSSY75ySualVp9wBNgXvvKLuS2BSTX5ytSYtZe0YgcNmAPcIrVRfY553O65O9OEw
	 K3oDE26LaWPtGvTIl0WcGjW9v91M4KJPrHfxMYP9LVuMIIrLxpjbDWhCsF7K/MNPGI
	 bY8AoNZpm7MjduStHW7SqvEt5ErjRSpVuBoF1AkY=
Date: Fri, 28 Nov 2025 06:53:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Digits_Upstream_Group@mediatek.com,
	liguo.zhang@mediatek.com, Vasanth.Reddy@mediatek.com,
	Yenchia Chen <yenchia.chen@mediatek.com>
Subject: Re: [PATCH] MEDIATEK: serial: 8250_mtk: Add ACPI support
Message-ID: <2025112812-encounter-breath-8948@gregkh>
References: <20251128021850.3459387-1-zhiyong.tao@mediatek.com>
 <20251128021850.3459387-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128021850.3459387-2-zhiyong.tao@mediatek.com>
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

On Fri, Nov 28, 2025 at 10:17:56AM +0800, zhiyong.tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>

Please use your name, not your email alias (i.e. drop the "." from the
name portion.)

> Add ACPI support to 8250_mtk driver. This makes it possible to
> use UART on ARM-based desktops with EDK2 UEFI firmware.
> 
> Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/tty/serial/8250/8250_mtk.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index 5875a7b9b4b1..e6a56cf54ae0 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -19,6 +19,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/tty.h>
>  #include <linux/tty_flip.h>
> +#include <linux/units.h>

Do you also need to update the Kconfig dependencies?

thanks,

greg k-h

