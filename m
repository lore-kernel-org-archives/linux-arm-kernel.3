Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B993CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErXCTMd9axWR1jD8SecS5bDbICUqt/ph2JGq6IOzvnc=; b=C+YPB34FteuXzvp1+mnVT3paz/
	DqdnWlaIyI/r2vnHTWGZLXUg6DTvGLONiUeNcnzuM+8sEn9INEKd0vj85C5QGXgAGcSSjqDjNfFwT
	uD8KvyAqdRv0qoh0X4x0DThUhwBhM7os1QTy+XNWoNlDKyUxCKBBDnLNWzn8u93nd7UaeX+aHho17
	tkZXC8oNncIBKVM6ZiN5PfVzK1gOHMTJ4iFhJWgh89ORzwVcr7ByPAHuKXLLkVpg4gexy7omx4iU7
	tUgsDFXTDn66WXjGBRjbKVDiquH4Sn+BsJg3e3JS2/1L2rN448A5V4pIxCf8MbTQvWaHAaZ0Hsj0e
	mKeBMB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTD2-00000002m8c-2GRC;
	Tue, 29 Sep 2026 08:29:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTCt-00000002m65-4BAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:29:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C62E42B99;
	Tue, 29 Sep 2026 08:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAE61F000FF;
	Tue, 29 Sep 2026 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790670539;
	bh=ErXCTMd9axWR1jD8SecS5bDbICUqt/ph2JGq6IOzvnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UjvnRiVRm1aRTjDBmXAHjvoILtdKlmNUrWu5POLFor62ynYJOA2fqSgDoGskFgpcc
	 GUv26YNxDVioC+74jtuhRekodZlyV6udP1q+3nZlQV7fLMPqrsoznjaCXLLqly9EKP
	 /LG0lATEOjarG/jYJEX8qhJByFwGciiG+KCBY285l7GnGgDTyXJw9/Lo2iFrSBtDB8
	 15ZEZNJNnOoijG2PYgn5j72A13l5JKZ9ALWuw7WH6YzCIgBLTtPhT1DZcBfoMqXNQd
	 s3fgOGNj0DkUN8ypqcb6i5p32tWgsxoTXKgZpzUfaYs1kguO75iiUmjp2uY+iS0TLU
	 kuTlAyyJXLjhQ==
Date: Tue, 29 Sep 2026 10:28:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 2/5] dt-bindings: input: touchscreen: st,stmfts:
 Improve example
Message-ID: <20260929-brilliant-magic-cobra-462c86@quoll>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
 <20260925-stmfts5-v8-2-0fcf49e2c85f@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-stmfts5-v8-2-0fcf49e2c85f@ixit.cz>
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

On Fri, Sep 25, 2026 at 11:22:20PM +0200, David Heidelberg wrote:
> The touchscreen-size-{x,y} is exact number, the -1 deduction is done on
> driver side.
> 
> Example now use interrupts-extended and size obviously not deducted by
> one.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


