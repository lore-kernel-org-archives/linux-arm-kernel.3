Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC0DCA5FF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UVMLN1VUYbL2fz93vyHWvDDcYyJoHLixv8ttRq8yT8=; b=hz2arTYC3E1wgZ/0iIPsCWQqBq
	rD6fAJ4ojx5qSVQfrb1Om7BRifDtv/eHqfkeqb4Hxvy6fh0lBr+rfNBZW0W7nfBaZvfSh8FX4q98z
	7emWAX/s4ap6LHdv/zb/NstyABmYvUDLw4Ze5ORN9qS7VkuOZd7X53rpQomEk0N+T6tlhetGGbj85
	TnWZNve9hJ7RmtOLIeF9xQbaGP/Pj8orCTRhrThfmxcS1xg6JskRtIEL285a9AkOMqoFPgI5dLPaC
	j+R7RVPsir0WsKH4nsFw6ddxiSANAkkyDzwqivsfQeQlt8niuW2QPWHvcjAaHwQeEU3iXfsj6y76i
	r9RX77bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn6X-00000001qwe-0W9z;
	Mon, 19 Jan 2026 11:07:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn6U-00000001qvp-3tv8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E2FA43814;
	Mon, 19 Jan 2026 11:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C991C2BC86;
	Mon, 19 Jan 2026 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820846;
	bh=cXrQIGq8ghQgg/2tKSWr1ulwNeEYtyDoK9Rxf5XR8Yg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EOAvqiNc4GCvpD1yjoAwVDRZs2iT3IOHlR+F2UAQgOWkMSzesel6Wo+CtWlDfgLIb
	 qqHUdETE4YPQTAgxHXz2Oi1pooZondcvSnLIQAJQ3VA4HAXzzNdikqzVnvH6Xp2Jiy
	 jGUZZrqJnKUSiqvJSxLoBLPuqA09ZDrUfeptW+ykgZvtNOlFtE7cWeGQvgLNRN9Rps
	 aiBTNnR7reEZiRE+bvdOBbOodjPBb6QCyxISi5V15oNoJMi9e8XOC6wQoxs/mKjUxg
	 5LhAd/bl1GXRdTVXfeezwp7e7H/AV+WWwSvtEDZtnnkRvV4e5W1O3AK19Nte89q32h
	 5yUGiBiFsW5BA==
Message-ID: <70d9ba17-59c2-4fc4-89f8-598667daea73@kernel.org>
Date: Mon, 19 Jan 2026 12:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] base: soc: order includes alphabetically
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_030726_991193_303D7916 
X-CRM114-Status: GOOD (  11.77  )
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



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> For easier readability and maintenance, order the included headers
> alphabetically.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/base/soc.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 282c38aece0de88049dc1e6e9bea00df52bed1ea..6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,16 +5,16 @@
>    * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>    */
>   
> -#include <linux/sysfs.h>
> +#include <linux/err.h>
> +#include <linux/glob.h>
> +#include <linux/idr.h>
>   #include <linux/init.h>
>   #include <linux/of.h>
> -#include <linux/stat.h>
>   #include <linux/slab.h>
> -#include <linux/idr.h>
>   #include <linux/spinlock.h>
> +#include <linux/stat.h>
> +#include <linux/sysfs.h>
>   #include <linux/sys_soc.h>
> -#include <linux/err.h>
> -#include <linux/glob.h>
>   
>   static DEFINE_IDA(soc_ida);
>   
> 


