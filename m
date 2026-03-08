Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67073EA8540
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 18:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hgoV2lEzPIPhEFtV1EnA1yw19JYkkmQMQkF79YemlQ=; b=dTj0ufE1GU1dAhFc4WvPlwlJzW
	igZfZjjqK20DRPF2FHCYaJnVpuLe9bb02KILd26qL4JzlwOxmylWvUeBGYsZevizXLDaVp3sh+2H1
	eb0P33BrndalxJ39DW/TLt0umiSbvjJASFntz+iWWuCqvzBLKH7W2zacZDS/Y20ri2ttcBgq00XOh
	Ke213vhi1+g1Ms000wCRX3qp9g8LN9yNVWaBuRJUBlvv5UY/NaIrVlR8AlaN00L0SzIl/T1IXD/PI
	4DaU6OZIWHBKyqxG8rrAopwb0jgzIKM4f5kGZZul50ew09MbZpa7Cf/osMNi1SlOLY4CaViQkGgYW
	ArA6IN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzJ3k-00000006GPL-1AHX;
	Sun, 08 Mar 2026 18:41:00 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzJ3h-00000006GOq-3SZq;
	Sun, 08 Mar 2026 18:40:59 +0000
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id D43C38CD9E;
	Sun,  8 Mar 2026 18:40:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 6CBA920025;
	Sun,  8 Mar 2026 18:40:45 +0000 (UTC)
Message-ID: <ca170cbaf2f8bcbc89bbda68914d8e0d7640f0e7.camel@perches.com>
Subject: Re: [PATCH v2 phy-next 24/24] MAINTAINERS: add regexes for linux-phy
From: Joe Perches <joe@perches.com>
To: vladimir.oltean@nxp.com, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Date: Sun, 08 Mar 2026 11:40:44 -0700
In-Reply-To: <20260308114009.2546587-25-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
	 <20260308114009.2546587-25-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Stat-Signature: mibobo4wkbramau4qyjthmehkiqudojz
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 6CBA920025
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/1oqpGv8s8V8RuGZRFC80nZh9ljOj3ohI=
X-HE-Tag: 1772995245-174125
X-HE-Meta: U2FsdGVkX1+4XRzz60ugpVFQWsQctyjPh9D8dWNkk9O80wKikqTLI//fEpSwY7VKkjTAQqCbvy/bDztttYzuNBQP3PDd6DE18CINvDdnHew5cXtwNDDJn4KiBH3EXroYIs/0V5C/aytRQmLMTGCZZlkmVqa0mog1lMlvYoTUOPxP3MIGj9+OItuBdGt7SwG+E1NN8A/Yc9Sq4U8TJPe/XcW25BuE6rH2bXBjLakvy2b4imYLaL6YRBqKlFvDSAukFbzkOlERn3vJJPcvYBJiMotKjWx2PYK5v4pDPHYsRlN9R//2k7hsjvl6B3t7ELpdAjuD6CN+C7OKO7KQLV3bHimDBNhwcxGB9M1yVBNLk9v9/I7LPCcJRUT7SR2W+eai
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_114057_922174_ADE746D6 
X-CRM114-Status: UNSURE (   6.51  )
X-CRM114-Notice: Please train this message.
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

On Sun, 2026-03-08 at 13:40 +0200, vladimir.oltean@nxp.com wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -10713,6 +10713,17 @@ F:	Documentation/devicetree/bindings/phy/
> +K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)

phy-props.h and phy-provider.h don't seem to exist.
Are these going to be added later?
Maybe this should be phy-common-props.h ?

Perhaps if matching only the include uses:
(/ is escaped because get_maintainer is stupid)
something like:

K:	include\s*\<linux\/phy\/phy(?:-common-props|-provider)?\.h\>

