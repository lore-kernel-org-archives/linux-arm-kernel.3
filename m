Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77166E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaTTfpWYjlxdD5b/j6mvCfJ8+dYOS1EuVU8HtmB+G68=; b=JAYbnhOx7//pVRkXICIacNfOwi
	GJrsx9yjpXVm2ldnSCBRKKXv/9jdbtnQLmacGALLgzFFNiVmEUvPGpk5XvZrdf6mABkM9UoejzW2e
	dvD+PQxoVi33738dUPh+vDTPG9ZBwS2rZ6M4aXWA/4f3Pi42QTsgFDUdq+uH4Q1Xt4UTMWlhMNld4
	Hz/VpOQZnMG9wrjhmtjRK3jIaI68nH1ONLWAJbUOC559MuYk9++BeOdkVAouOtrqwPTZ9zS55Z/qY
	tM0Q1lPkqA5UeK+H8P7b1A6KPm0Gz0ZIGq6o9hYsG/uWAiDEUeClffmrtY8MhmLBLWx23k4w3T6d+
	kgr70VVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGg5-00000004ahS-1kl0;
	Mon, 13 Jan 2025 09:24:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGYW-00000004Z9X-3G2I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 690D35C4869;
	Mon, 13 Jan 2025 09:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA21C4CEE2;
	Mon, 13 Jan 2025 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736759780;
	bh=3yK1CkFMlEOY/PMetAalc6+5NlmHuoFvXe8naQX+ibc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqYj4ms/J59VU+rulw5bVn1dpacZEPaDFi4u5FfQfCtx0YqZob88dC2qEedkQZe8r
	 DXsUtla/sIjD3QoKjPJSvMMZ99PMkMwbz1YrPdx9wQ/vG4JIt5AQmbw0fY3RqhFEuR
	 p0vToZ0FkZ6EyVGHnhO7TewLbyXqBin8my7w4rvCItoW6BHWj+Yam8zO72HNtEIU1x
	 sXGzIG9s55gd99X+7IsIY9TFIUt+QuUvQixCJKJSAyUC6tQiF9VyXWuBa88jdC4KGe
	 SCLWdX3EbgxCNB+rJYKUOkETRfcA6gjZotnf/DKGrF0xnvoeWiwMbfyg/K+O0tkVBv
	 nWR0blci4JIBA==
Date: Mon, 13 Jan 2025 10:16:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, kernel@pengutronix.de, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: imx5: Fix the CCM interrupts
 description
Message-ID: <irln3zatlquwajbh66uxfo5kvw32pjzrldjfnuxc4bawv7k4q3@6dp4wnonvtw3>
References: <20250112152745.1079880-1-festevam@gmail.com>
 <20250112152745.1079880-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250112152745.1079880-2-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_011620_854300_E63A0271 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jan 12, 2025 at 12:27:45PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> Make the CCM nodes to follow this format.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Use interrupts = <71>, <72>;

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


