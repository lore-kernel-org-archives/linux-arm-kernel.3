Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DF1C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jipFQTKs0qm3TwDSWG+0Yuzq55IBIg44y29bb7s1EyM=; b=1xPxLuaL0ZnoI+8iP3hFSZEwwE
	aGmjP7thAbfSxeQ0K1rwJisu9d9ELVADgWAk3dUzHoo//dnH4nbiMaxCAvwS+Io7Nve1AHDAXlZ6z
	/35bxQtt84oWSXEKx3CdRH1PpZzc8OB8i9Tg9255PtYXgQKUSZzKMY5Id6DLR/p3lAp5eVCkaxWHP
	yHQk/fDNklCby7Ifyh9WSoEXW3PtnZxrHyKSBxGvQlOjs0XAIRR90SJGkboNDIZbptg8qABCB7O7I
	dnQhxtHla35v/cOlZMrjLg+C+AMCSFFfEelrmrm7n1igVKfIt51KceXYAeQFE1vRIdAWy8Te8meDr
	TdGHiMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4gQ-0000000C3Zf-29Ew;
	Fri, 28 Feb 2025 18:01:58 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4ep-0000000C37t-0mFR;
	Fri, 28 Feb 2025 18:00:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B39B225CD6;
	Fri, 28 Feb 2025 19:00:12 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNSjyzCdGSLb; Fri, 28 Feb 2025 19:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740765606; bh=sTnsqvuknnrk7PfyI85T2uYsvkVUA1Bx/ewBwy69kWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DZIk7HQsgnCdt7LmeYKxxyx0jrWWanw19QAHpdgf6BvsEtGCfLss75KAX5Kbxjfb/
	 Mr7aKa8fBVFX1IZv4ZPSWoalLZXuJk8b6jJOLba5zd0N6959C/yhYGQIiDRy7SoeKd
	 TWoQQGkjPvFawBwsRkU/5IvLO0qpVcUoGNKJM7G1KdqexI/7UK3MXkCxOxOr0L/knb
	 xdYo6piOJedRv08JolbgcJhNxB6fT1iLmo8gMJS3pCq60+JWmJ+YY6F1dZYaIgbNet
	 6/d3FiSnuRVDMLj1GKdl8xjMpoJ92E2rh9sheo2pDnEDVSRk28/53DoyXysap6u1dN
	 QXdx2qnY8B4YA==
Date: Fri, 28 Feb 2025 17:59:42 +0000
From: Yao Zi <ziyao@disroot.org>
To: "Diederik de Haas" <didi.debian@cknow.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"Dragan Simic" <dsimic@manjaro.org>,
	"Johan Jonker" <jbx6244@gmail.com>,
	"Wenhao Cui" <lasstp5011@gmail.com>,
	"Yuteng Zhong" <zonyitoo@gmail.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Remove undocumented sdmmc property
 from lubancat-1
Message-ID: <Z8H5jjE24cZb4IBQ@pie.lan>
References: <20250228163117.47318-2-ziyao@disroot.org>
 <D848JET5TDL6.2L4ZQR0YHYQU6@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D848JET5TDL6.2L4ZQR0YHYQU6@cknow.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_100019_633007_275AB066 
X-CRM114-Status: GOOD (  13.98  )
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

On Fri, Feb 28, 2025 at 05:55:47PM +0100, Diederik de Haas wrote:
> On Fri Feb 28, 2025 at 5:31 PM CET, Yao Zi wrote:
> > Property "supports-cd" isn't documented anywhere and is unnecessary for
> 
> s/supports-cd/supports-sd/ ?

Oops, yes, it's a typo.

As it's a trival patch, could it be fixed on merging? Or should I send
another version?

> Cheers,
>   Diederik

Thanks,
Yao Zi

> > mainline driver to function. It seems a property used by downstream
> > kernel was brought into mainline.
> >
> > This should be reported by dtbs_check, but mmc-controller-common.yaml
> > defaults additionalProperties to true thus allows it. Remove the
> > property to clean the devicetree up and avoid possible confusion.
> >
> > Fixes: 8d94da58de53 ("arm64: dts: rockchip: Add EmbedFire LubanCat 1")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>

