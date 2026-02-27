Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59770FD5309
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mK7ejjEszcEj3xQ/iXH8/grugGUjlRpkQCEWGtEbTLA=; b=Dsj6us+4T72Pd2Ogr8uYJu7IE0
	HmzD05NE2SCrlnE6w9N8r2Rr8JkUIKU/zADqg9pHdCRVbt1B2vuLZ0+yG7iEPxbEdS5sedVvKpunF
	H4K+DJrvHwY38xR1OdwfUguIYSxaijaydK3juWI7wEwL6xnprIstKTB1eU+mJkypyf9JlezJNfSJC
	ZjaiY+6VDUfZrg6mAG+j45jdjwlfKKiHvZz5U3EsKpjHeo2ddexy7Rr2vpiHni08+z30CYSZb+yu1
	7rXHQ2SShUTCEZfrulWTGPgZUZYKDfMEJbumNuh+8zZyWHnpgEKez33M9MTQ8reMiXzWRGKw0g4sQ
	wNEnCRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsYf-00000007ugN-1prv;
	Fri, 27 Feb 2026 07:46:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsYd-00000007ufy-15fv;
	Fri, 27 Feb 2026 07:46:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3F7F43949;
	Fri, 27 Feb 2026 07:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB4CC116C6;
	Fri, 27 Feb 2026 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772178401;
	bh=jePfAZhJyfMoZjEKH9U8utkwSsvmWHCAddqvO5sQK+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNkXZAf7isLJPsVVJPU1ghtKuO6pCphbm0h5j3k1z1wQI0aOh1YUavMjLn7xPJTbA
	 HG5UNeISiQ34BS1I5r/FhhmFbOalvX+z5xBf1K/F9mRG1/EYA8rKZIkXld6uCSjg02
	 QQ1nXE2fCtZQgtq2TJV9EmL4GMM/+ouoW1nxM/tdr6SottErhKNKixbujyhjnS3QhN
	 LdMQ3j2RG52ApgVzbQ/mjUDs7YSReft7UFXb6W66Ti5/Rtt4Py+dUlX/QWYAk0WKGG
	 9k82Ttq/FyJ8JGJLHFY97WSXZcOeGnE6GPgCiiqX01Mzv1j6IqXrKo+m3YuC7Lz3na
	 4R0B18byR9olA==
Date: Fri, 27 Feb 2026 08:46:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260227-observant-roaring-ara-ef7eb0@quoll>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_234643_322223_14D28511 
X-CRM114-Status: GOOD (  14.74  )
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

On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
> register blocks have been provided for the video decoder unit.
> 
> However, the binding does not properly describe the new hardware layout,

As you shown me last time with excerpt of address spaces from
datasheet/manual, the binding correctly describes the hardware and above
sentence is not true.

> as it breaks the convention expecting the unit address to indicate the
> start of the first register range, i.e. 'function' block is listed

Imprecise wording. "start of the main or primary register range"

(if you have 0x1000 with one reg and 0x20000000 with everything, the
unit address will be 0x20000000).

> before 'link' instead of the opposite.
> 
> Since the binding changes have been already released and a fix would
> bring up an ABI break, mark the current 'reg-names' ordering as
> deprecated and introduce an alternative 'link,function,cache' listing
> which follows the address-based ordering according to the TRM.
> 
> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.

This is fine for me.

Best regards,
Krzysztof


