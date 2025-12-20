Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E89D637B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUOOIHxrHLjMfv+UKj+m+q5rjq10R5GlmYvvP2VlrCs=; b=t935d3hm3ntH+v00cBS65EpHw3
	MwCX58WC0ROF4ElDRDaTaK4L0D+GS4Z8oyHEtglAqGGuDQXp+ttudDSPA0Fvqule04lR3FeBmV/MY
	XCOvc+TE9G4L4afKjbNfLPe3DALRNL3iWS6w0mUgSYS8NMkcxv+hEYl+Xkfj8Ax9u8f3zUnjYfBPc
	wueb4kiZ+JPuej8c3pOcKy05H7JJNfmG3REXMnCwaoWQX4BfUYvlAsQMb/ussj5nAQKR5j0Gyz9sK
	6Tncewt/YNzyVMR+6LXtSCORghIbO0pJohUJjvMYl+jJF5VyHvF3JQ1TxfAZ/0eIFUUOeA4gdsECW
	hRuuoMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtF0-0000000BSzL-3QMo;
	Sat, 20 Dec 2025 09:27:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtEz-0000000BSzB-01BQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B518B6001A;
	Sat, 20 Dec 2025 09:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE08C4CEF5;
	Sat, 20 Dec 2025 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766222827;
	bh=9F4vNpz8QF6B9155Cl+o04y6MMtbYNo5s3R/QFrFxhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TT08D7lqfPv7Y1C3ZRe1m/jF5GZsivrY0CuWGAROs7tRhKtL90El/DlnVYuqEgzel
	 Wfu/h5HhMVYJNM2fH0jNNllZByXSfNlvF0XlqMqqLjfl72EbtDX1rzFU6K+qY2wJzQ
	 KNIaq3WXm8KF6RA80XtoI4vf5TBBvTqPn64EuRfChBwPY2ijIP5qMXiBusXIi1yinb
	 5ObCCPSlzyv8pINU8SJVl36On3RHylgYZREnrLHpWs+49HkHlyQldRdmRpLH5pgkgS
	 0GHowk+QXi6VIs3RlkUp6I6gk0CxOlzHwlfzpyHr8uiUlV51Y+wGKqgMd/FV2//dTH
	 FlB6mlNS9hcDQ==
Date: Sat, 20 Dec 2025 10:27:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: media: st: csi: add 'power-domains'
 property
Message-ID: <20251220-impartial-stereotyped-horse-70999f@quoll>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
 <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-1-a6edb2aa8154@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-1-a6edb2aa8154@foss.st.com>
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

On Fri, Dec 19, 2025 at 04:58:03PM +0100, Alain Volmat wrote:
> STM32 CSI may be in a power domain which is the case for the STM32MP2x
> based boards. Allow a single 'power-domains' entry for STM32 CSI.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


