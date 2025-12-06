Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EF8D3B7D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoXkHMqEW+qV635ZOf7B0SAMsy9mwe60v92erWlwCB0=; b=CKbvzQqU93Ugv+sIsKkQ64L30e
	mUY5KwYf5YXzWmA4czC2VwO28w3z45a0ITwEIY91Q08VbLMvzeDuhrHKnaO6xKnmmUSpgdH+TCqpk
	LluGgt7oprDbEnE/ssVWCirmA8VyU6Z8BWuq9oH9MpuJNO4jJVlEGqar6eJAyol0Xk8k2JRHVNHyN
	B/s1SfCr3Yh/BCSgEDlVh2zFn8j69w1KvbxTQgrPhl6cO+rQtdDwADOBXeMePS0FR0B+iOwYAVlxq
	S3dIf+4Vw8njvfOa3ubwDW+aTHuVCSDl54+UoDWbobT2PO+QyIeqxaLRDnsmO/uyBRDqLz5bRZvJb
	/INHYBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRppJ-0000000ApkJ-1tZw;
	Sat, 06 Dec 2025 10:47:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRppI-0000000ApkB-3DIE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 10:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E385160138;
	Sat,  6 Dec 2025 10:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A011C4CEF5;
	Sat,  6 Dec 2025 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765018063;
	bh=z/x/1pDOX2OLLC4hlVDnfT3qQtrpkFmTIq0Yt5Ja2Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bc8UGQCbBHA7FUoVdDqKDZQOmK0kA4G0RYShfN6nlWKgwbLBxtUmd27DI39yCyNSd
	 6cBuAeUMuSBUMhZ+OV5J0ILJYR9VU9hNIUpOANtnMKBPei5ARc8138D8MGf2y3Fcw8
	 QzihVaQkz6TSjCPxQIRPyYkh7DZvJfMNXb82NTVSzXjTCaaSyAjrI6b9X0vGFc8Vxt
	 tF5iekf8K8um9uSxYKj83Ix2r7afDBAh66KC2U4UFj67QDCfZ0y4Jj09/1EiTVvuHE
	 LfA6maXU7JMQIEoY9kG3l7IKdf0Bkv5pBpW88Pzd+S3L6IgrwD77pqQYPcqM3ibFJZ
	 IsI5vPdm57rvg==
Date: Sat, 6 Dec 2025 11:47:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251206-perky-tentacled-lori-bc71d9@quoll>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-1-9f158b18f979@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205-controller-v9-1-9f158b18f979@google.com>
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

On Fri, Dec 05, 2025 at 02:26:37AM +0000, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation (codename: laguna).
> 
> The Tensor G5 silicon represents a complete architectural departure from
> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
> this new device tree binding.
> 
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 141 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


