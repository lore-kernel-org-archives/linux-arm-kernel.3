Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4F7FD0652
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hj6OpVGuScAlzgPqxc298oPPnHANlkHnxGerCYGTqkI=; b=tx3Mexlq1JgFuIPm/J/RN7z37h
	2lDaXAtyOoN+udUPhItEHlCDfs9XMbyw4e5DDyOEuFy/40/OIt1F9cbglVICcqAjZlzF4+KGa8d96
	BzXWne0b4A5A6ezmJdeyKVF81CTTPsj5mJFDlCc62aXwuIEsfTdX2d+Tu6C7bzrLLMqImIr9slkAm
	4JLEixNqTlmEgLATBwLaOZUYwIV3gWkLr1WcYxr3+0qgZBpOCWjW6VjQ91JOP1eoC0fBp+eoPNSZo
	3PQIim6Z4kPg6rYJnTbCL9aLopSnoTo1IzaivhaYg00yFqLrTcBIhkMPJef37l77FclWG6CIPAo8j
	lRTpytxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Eo9-0000000B9xh-3iZA;
	Wed, 11 Mar 2026 08:20:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Eo8-0000000B9xI-0zAD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 08:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hj6OpVGuScAlzgPqxc298oPPnHANlkHnxGerCYGTqkI=; b=cH4lcChOg17TkB4oTuRytM6Ml/
	U28ELBXRcvVxUAMNFNZANzpD1uSP61jiijhNYaCZ87UBspVviEZzeKoKLzEzXTi8mz3evQBItpKwA
	/Wg9auj41IpiKqK1DFPLrzttr1cNld3xK04JxFgoPLZkEElRGs+ZFqCTZ68BjcIdowjfzIIdX2L77
	qc/kAGWRtW+7ZlLqH6i2H1WAXpHwvkV482oScs3SM4nWUpWJfW783s3KeMg62A8ZXOz0xNmgFh0gV
	DZCM3Nmc1+pSKMI2Jp8bJfFx7RdKbWBW+xS9cNqS7kp7KRc641l/0ND5Jcqf7fIOqc6/N8u2Ut9Ig
	7XSwBMIQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Eo5-0000000GOCO-1W7d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED8AC4419D;
	Wed, 11 Mar 2026 08:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B39C4CEF7;
	Wed, 11 Mar 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773217239;
	bh=H7RUpwdbl9tXjvEOWJNr9j+D7eGEEGQs6/RxxIrYF9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0WA1/TSV7vcRicRssFJjMvCSBd1wFpYKX2z2Y2AA2l8emu6WHMZ7ec7FxKTwUTw/
	 9vj/lRIw7XjgmOuUnVX+iFHhcrZr95fsQbX3Zt+pMejssDPGKyWnjsvhEnVqt0QfEd
	 g/nesGbBf9Wz412Gk/YZehNUDPQnmDy3TGvgeA+oCZt/QUa3txx3w4xqo0erH1KUk5
	 xhCGoVIO41tg/OWqa5W0NUPB40BM/oEtuZ0kEKQM8B2n1tP+Rzt6v/b6F3rr4q8jJP
	 6YxQjgC5L1KtAxDAbMWi8ArDB7LL0CuioCHUB78Q/FjZuHIwG4IIRZjYcJrlof6edl
	 +lQsIaBHriuJw==
Date: Wed, 11 Mar 2026 09:20:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, shengjiu.wang@gmail.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Message-ID: <20260311-brave-acoustic-mongrel-b3978d@quoll>
References: <20260310063522.362545-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310063522.362545-1-chancel.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082041_640403_6C9B22C0 
X-CRM114-Status: GOOD (  11.49  )
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

On Tue, Mar 10, 2026 at 03:35:22PM +0900, Chancel Liu wrote:
> The imx-card machine driver originally supported only codecs operating
> in i2s or dsp_b formats. This machine driver can support CS42448 codec
> and this codec typically uses dsp_a for its TDM interface. Therefore,

And what about other formats, which was asked last time?

> dsp_a format support is required for describing such sound cards in DT.
> 
> Update DT bindings to include "dsp_a" in the list of supported DAI
> formats.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
>  1 file changed, 1 insertion(+)

Where is changelog?

Where is any explanation how you handled or not handled previous review?

Best regards,
Krzysztof


