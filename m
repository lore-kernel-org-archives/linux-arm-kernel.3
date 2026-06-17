Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5E8CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vf55Z27wBvYv5++UeYCjXZHA1iYmcLSXC7ozvIxrmWQ=; b=SXb9armCNOf3nnEK1A0NMriSSY
	Optc/IaUkAdz0nl8DTD72X2Mupsh/k3rIqrVGdAain8b+kevvySwSVWWIcLYGqQ/pRZWbcmfLG3Jw
	NPxPxKeGAKiEmWs/Xm++rGoDy+IqMlrqOKlSF9mt/yk1J2ZIei2YXgyN1S+nqHVPEGby565wLWZQj
	9zsXyYYzX0+JKmeVJNbCTqJ4MitLtmtDb66aXmxvzuVw1lAKCEB3DrBCelv3fokPr0PY18OtcYTZv
	hHz65Gbd/AyZBnsDBBDYnD+mr0eB23HuY5RpBhpPz3JFrqVq60yhArz7oPcVuH2YhUAvnq3zREa/N
	Auha61rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn2i-0000000GzOK-1viy;
	Wed, 17 Jun 2026 09:58:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn2h-0000000GzOC-1zxA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:58:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E202B600AA;
	Wed, 17 Jun 2026 09:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C081F000E9;
	Wed, 17 Jun 2026 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781690322;
	bh=vf55Z27wBvYv5++UeYCjXZHA1iYmcLSXC7ozvIxrmWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8kJnIBm1jSmrk2QikHqGG6bK1/5+Ofq3pmQ45J9JHLQXBFissEibc1nEPgk60hw6
	 mBZ3XvX9Y0pV2Ve5kuvKvUo14CtbLx6pPoUzyfVVbM18ux/1qHODNcUF+zmUo+mFVp
	 q1i6Zn1dTeBQJMk9HGbyr7H8LBrdwWw6Mm0SJ6wbKLluYCoC3x35r8BKFiVdMY7p0H
	 OYnxP2DKGkR9ZBMwH2IsFRGXt8d+nHVDCAlcyhHFQGlpaWmMhXR1yT3EjsU5whp2Sd
	 JEesksXMx4E3wbx9EzkoNxnfFYzzxmelGRdy1iXgLu/9PPiuPbzqn3u7bKzmUQILRC
	 HPsXjlZPSF+7w==
Date: Wed, 17 Jun 2026 11:58:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 resend 1/5] dt-bindings: soc: cix,sky1-system-control:
 add audss system control
Message-ID: <20260617-resolute-sarcastic-orangutan-0fcf73@quoll>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
 <20260617064100.1504617-2-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617064100.1504617-2-joakim.zhang@cixtech.com>
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

On Wed, Jun 17, 2026 at 02:40:56PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
> and control registers in a dedicated CRU block. Software reset lines are
> exposed on the syscon parent via #reset-cells, following the same model
> as the existing Sky1 FCH and S5 system control bindings.
> 
> A clock-controller child node is required under the audss syscon. It has
> no reg property of its own and accesses the parent register block for mux,
> divider and gate fields.
> 
> The AUDSS is also controlled by one power domain and reset part.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../soc/cix/cix,sky1-system-control.yaml      | 48 +++++++++++++++++++
>  .../reset/cix,sky1-audss-system-control.h     | 25 ++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


