Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB305CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHsZCEj85g2+3xPKItIT+ekixy8fLIMRbzaGW9CP2N8=; b=CT68uIfvnE+bUqaMIoKJt1Xil+
	f9qt5zMhsLDnci9GMproBTpG8oq8zaWNngPy8Ikpo+lG18jrf197v0pwnvYJp7fZB/NFSxA/Wp/+i
	s5GC+uwmI62OAgXWDRJa3xlskQfogC2/IUzErOKkLxI2a+GMbIVGqpmWt9CM16tTQto7lbAvj8Vm8
	FNS9Nhq6e2Xv+vOcPEo8x0ho7hPz0DDOGBUdkeFrxyyejFL6127W/CSuHmQS4BFWIJnAoJM43wZzx
	YE+UMNm9LARVYiyUpavywtzzKE2mWveS1r7tP07hMYqh6ZL2XbYvevmabVBbzkyPPmTk7tC83ak93
	yM9idK1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZvV-0000000BD2E-2Yow;
	Fri, 02 Oct 2026 09:51:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZvU-0000000BD1b-1ZJm;
	Fri, 02 Oct 2026 09:51:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6194160A6F;
	Fri,  2 Oct 2026 09:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544981F000FF;
	Fri,  2 Oct 2026 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934694;
	bh=eHsZCEj85g2+3xPKItIT+ekixy8fLIMRbzaGW9CP2N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ihy44reaHxuYSczcrLLd1iNBISClgjq4j2drJ0oPWGMlYTGhG5Lo8wc/6epbZdDpm
	 yA3SYmY3A+eYAaJTWEqWLa1gZIfMB4gOPLh+3z8VcULkxUkw5S5vUKw0dk2EvRNLl9
	 Cg8/u2H+IMYJBLm4NqWnidVdbhrMil0fxNK1VY7LLSQRqK+mQDSI+i8dJnacGW0aVU
	 y9GgLtGmnkKB5GGBBcuZinAksPXJ5hLUCMXSFPkOlgasspdZEPwT3kwxYu9AYSLAZk
	 7cflJ3Z0EBeCh4VGOWXmQF2GnU6VZwa0fXmYlkyTlF7r2WMkH9hwLk0Jjtgt8Gf1Oo
	 3v1/Q00eZooCg==
Date: Fri, 2 Oct 2026 11:51:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com
Subject: Re: [PATCH v9 1/3] dt-bindings: rtc: Add missing type to
 trickle-voltage-millivolt
Message-ID: <20261002-analytic-conscious-shellfish-251bbb@quoll>
References: <20261001193703.734323-1-sander.speetjens@gmail.com>
 <20261001193703.734323-2-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001193703.734323-2-sander.speetjens@gmail.com>
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

On Thu, Oct 01, 2026 at 09:37:01PM +0200, Sander Speetjens wrote:
> The property uses a non-standard unit suffix (-millivolt) that is not
> recognised by the schema tools, so the type is not inferred. Add an
> explicit uint32 reference.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


