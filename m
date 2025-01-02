Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAAFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IFkv1QVlo/0/X7+UvFDEej5oH9R58nP8xGXqCXJKmo=; b=q/WyW7sm7Xpn1oWgphyFy0rUhA
	sMM+ZA3Uj1M9q61D6jySwSwYiw8oiilefdyPmkGdNSnjiKO47Rj+evCn7kb+PRUKlAUwzqsRxm7lC
	2L/alKs5E+Ja/GdZch0S55XoFE/mjLmiO73rtazU9ROGI4jC6XBFpEIicXK19Ww5q8lrUZRQieoY7
	mKL/rDtYAy2Z3baEM64IAuaoJrUXu1NwPa3ddxIWWIR5buyvvSY7syvYaWJrpSszELD3lb1ry+AQw
	wYkQ4Mzik6T6vnJNBDluPk5dppVbLaCGi2T4EVYfS8By7mvFx3zndLPP+X+vxNvxObO5NMubinQqq
	fQJdoHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTL5G-0000000ASj5-1NTF;
	Thu, 02 Jan 2025 13:17:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTL43-0000000ASZI-2qiH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 13:16:40 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF79B22F;
	Thu,  2 Jan 2025 14:15:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735823750;
	bh=GG6D7VW5sd8El2PazlyUfirAusWPoT+77452AHeQhAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRT8wAz8TR7vl6piGX6CDCiUanlmik07VbRId2KXLVDNNg7RF0/Yh+jD/K+B6i6df
	 IK9MHSiGNonYPiPiDkE8qOmXEv1KIOo2dBny4B9N2Q6Q9PzjYhCvTVFcbobBaCsX7m
	 Y0x+B7kRNU/fdukewUli/ALDpTynPugNZW/whas0=
Date: Thu, 2 Jan 2025 15:16:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 8/8] MAINTAINERS: Add entries for Toshiba Visconti
 Video Input Interface
Message-ID: <20250102131638.GH554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-9-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-9-yuji2.ishikawa@toshiba.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_051639_882454_48473913 
X-CRM114-Status: GOOD (  19.76  )
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

Hi Ishikawa-san,

Thank you for the patch.

On Mon, Nov 25, 2024 at 06:21:46PM +0900, Yuji Ishikawa wrote:
> Added entries for visconti Video Input Interface driver, including;

Commit messages are written using the imperative mood, as if you were
giving orders to someone:

s/Added/Add/

> * device tree bindings
> * source files
> * documentation files
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

I would have added the MAINTAINERS entry in 1/8 with just the DT binding
file, and added more files in corresponding patches. That would be
easier to review and check if entries are missing. I don't mind much
though, so if you prefer keeping it this way:

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changelog v2:
> - no change
> 
> Changelog v3:
> - added entry for driver API documentation
> 
> Changelog v4:
> - added entry for header file
> 
> Changelog v5:
> - no change
> 
> Changelog v6:
> - update path to VIIF driver source files
> 
> Changelog v7:
> - no change
> 
> Changelog v8:
> - rename bindings description file
> 
> Changelog v9:
> - no change
> 
> Changelog v10:
> - add a separate entry of VIIF driver
> 
> Changelog v11:
> - no change
> 
> Changelog v12:
> - add a bindings description of CSI2RX driver
> 
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b878ddc99f94..b5c819e94e9b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23430,6 +23430,18 @@ F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>  
> +TOSHIBA VISCONTI VIIF DRIVER
> +M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/admin-guide/media/visconti-viif.*
> +F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> +F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> +F:	Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
> +F:	drivers/media/platform/toshiba/visconti/
> +F:	include/uapi/linux/visconti_viif.h
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org

-- 
Regards,

Laurent Pinchart

