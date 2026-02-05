Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6ADE9128C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxAAsoCwSCWQ/fsyrWvwNOOGo7u767YkIi27jUP85K4=; b=t7JGTrNTg7n78S3KATVG7bhBhr
	ZigA2Wyx78VLkmC+sm3+3wsgt/ovMVBowcEpmPSt29r72dmUk5okWd8w/FHW1+Is7+glixmyEaz/G
	5Gl+Qq6ynzLLhM5bTnX5IMbP/FZ0NGYmMj4FwhKTe7fven1drRQls8ZGhIRyF9H/iaLk+ffwgXo9g
	VVRlXbVhKzyN41Dwlduvd61ITxnJZnP3VlnujGw3xTGdlnrIrJ86jrvUI4HtYBSRM3Gvik1y953lO
	/u8fd6akFvb3+QKGWz/h2GDkgXexdEKHO+rcWUtsQr+8SEgQjqx7dutzPn/tXbMJpql9ZqZuPgh9y
	VOBJ+hPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnu1X-00000009ZhE-1N04;
	Thu, 05 Feb 2026 07:43:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnu1V-00000009Zgz-2oFt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 07:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B304C60010;
	Thu,  5 Feb 2026 07:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE149C4CEF7;
	Thu,  5 Feb 2026 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770277412;
	bh=jmTc98Ww6U1WEm7DhnUsuqNavBGcbSITF8l+RkaMFwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLSgS7EPfTvG1eNEc7J6aAsEz6Vmpw9HfoOjR3CBdepqtQ/Nm7EZPhBlCwpMIEW9g
	 AhAVANKd96p5nFOyHDi/MAttnDkt14a+jEx5glzJpwm/wLhW7PbcBBhJ4S/IGOyDqp
	 a2PCufX428/KIBfSfNlCgS9zJUxK+wwjOiTzb3EY=
Date: Thu, 5 Feb 2026 08:43:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: Krutik Shah <krutikshah@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entries for the Axiado USB UDC
Message-ID: <2026020550-uncle-bullfight-e15b@gregkh>
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
 <20260202-axiado-ax3000-usb-device-controller-v1-3-45ce0a8b014f@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-3-45ce0a8b014f@axiado.com>
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

On Mon, Feb 02, 2026 at 05:16:30AM -0800, Vladimir Moravcevic wrote:
> Add the MAINTAINERS entries for the Axiado USB Device Controller.
> 
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 67db88b04537..e63b6b308a3f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4234,6 +4234,16 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/axentia,*
>  F:	sound/soc/atmel/tse850-pcm5142.c
>  
> +AXIADO USB UDC DRIVER
> +M:	Krutik Shah <krutikshah@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained

So you all are not paid to look after this?  That feels like an odd
business decision of your company, but thanks for documenting it
properly :(

greg k-h

