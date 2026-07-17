Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4B4C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fH6R8hn0ak8zD7fv35y08My2tU9GV+iZZyKJ5q64h7Q=; b=YTJHTZF2knq407VXjPvoGcjBS9
	OlT8vd8F7JPIDapiiFXwG30KHEsmySLhPUZf2ujiL0vHV8ZCHWNDFMtEy7WqjYQMQl+sJXUJQuBGI
	WrDrQTE4CWwrC1e73fMP1Ln1iJX6gHr0whj4sYLs01L6bm4LcWZb+GaCngv6IZrXt1D4vyU6+Scds
	EzROxo/iKBoBeQAocx2b55DciAa7o+TX3EpoOyhC0QFaJfA3Yc2aLserY/b09t7TQAFhk0NP9dxIA
	BVwDxyw/m+upVkIS3VDC7R6aIon7/kamYIl5WG69R82tGpHUt4j9BTj1eY7KGc/K4l6Co1Jj4BKOJ
	L7dWI8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkejg-00000001p08-0X3P;
	Fri, 17 Jul 2026 09:20:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkejf-00000001p00-0t1v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:19:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3ECB60204;
	Fri, 17 Jul 2026 09:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADFF1F000E9;
	Fri, 17 Jul 2026 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279998;
	bh=fH6R8hn0ak8zD7fv35y08My2tU9GV+iZZyKJ5q64h7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bi5jrNctuBSBcjGj6YGUX8fsIAEr+SfhD0fN/WvTQ/IGK5FM/5nDQ4lN/KoO4MLy2
	 Xz1zFFW/TEpu5/PBuJXPl9dng8eNTuN70mddIbcdzkqiCjMGz8QUmVnHkxx0+Q37bd
	 zMvS1ZSH9tkxNHjhso0qmC2rlWLWrD7na/OVEMwNQX/MT5b/enTDPBrSRO9zn6WjiY
	 H2RzMftbNwFOdCXuCdZJZrSu6H1bUgpzrhfZjn2Tx+kSIpfT5Lzd/vtzSG3edIVByk
	 ytCGhenAFUTnZqRD/ByAwuyz2FQ4JM2kFYeN+nnl0MjNwrFETMjCQW1fTiy1URfBJv
	 ylrbtYhavXKJQ==
Date: Fri, 17 Jul 2026 11:19:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harini T <harini.t@amd.com>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com, 
	appana.durga.kedareswara.rao@amd.com, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Replace maintainer for Xilinx CAN driver
Message-ID: <20260717-subtle-perfect-scallop-1d18e7@quoll>
References: <20260717021415.2234865-1-harini.t@amd.com>
 <20260717021415.2234865-2-harini.t@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717021415.2234865-2-harini.t@amd.com>
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

On Fri, Jul 17, 2026 at 07:44:14AM +0530, Harini T wrote:
> Replace Appana Durga Kedareswara rao with Harini T as the maintainer
> of the Xilinx CAN driver. Kedar is no longer maintaining it.
> 
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
>  Documentation/devicetree/bindings/net/can/xilinx,can.yaml | 2 +-
>  MAINTAINERS                                               | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


