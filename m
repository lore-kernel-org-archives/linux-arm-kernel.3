Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78C2E9A74C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4dl6jLhp3W1p2mPORl5f6Ake69ApJqaLrvJyHK/nMI=; b=JDtwhGsixFI9X7D1h9/U5abxCb
	Wn8t0U3gVlhAIHQ/ojofro27WqbiC165s3XEERhNzErXoJcfs6n0rGhNaMpVXYEdH16lHNTZToPY6
	g6qyJCYlJnWBY3sk6NAQuX6NYtiI33hHCwT1y0x2tjm4hFDvMm99q4+EXzTNwg/J8jmDxRATiDs6Y
	rd874Q8zp1c0pd0XAurYR+MFJDYx/u59jQOTkkQJg0K/BPsWzq5jCbd4rzOrSiBFHO+2fjQZ+IpA7
	3ogo8b6WB1Bk0VrViTQwEd98+c16jjHgO523IBoUQTxV1282j9EJNln0ZXBDd0r5aL1jRfYoxgkW1
	culD8PPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4y5w-0000000165S-3sMp;
	Tue, 24 Mar 2026 09:30:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4y5u-0000000164o-1oFu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE1D44441B;
	Tue, 24 Mar 2026 09:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06239C19424;
	Tue, 24 Mar 2026 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774344637;
	bh=fPiho2SdSuE/+OCezMKP8RHMpCHb8CgGLDiyPgHRfNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPkIlw6oyD+FT6WM0fRQAAw6jDC6dFWSn2j75XjcvJqGWDOjUfb4auQ0EP3YPuk2y
	 bGsghTnu+XLy4Od2LjTE+0Esst8/F0JtP7eixy15SixJwjXKZXK7uOJx6NQ3Hu0Kj+
	 H6h9iJelLDbMq4WJGHfbIB3v8KGrXWL0C0lhtHOKuKV730d112qqfMhMIWiQCKoMn5
	 2i5+qF05mNCc2reebV6xChxKyKBKdPczKlPGBLd5zkHXaR4BSlmG0L6oZHSEsCdZLC
	 Y3JJkSzVS9+Eso7RS0Bp30oZtFV3HabSwLtQUzl1flB0RZHro6UOmH0HRLdYjYwoAu
	 t4CAceiZufW8w==
Date: Tue, 24 Mar 2026 10:30:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH 1/2] dt-bindings: thermal: st,thermal-spear1340: convert
 to dtschema
Message-ID: <20260324-belligerent-armadillo-of-camouflage-e52f7b@quoll>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
 <20260323133814.14152-2-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323133814.14152-2-krishnagopi487@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023038_493036_00C8074C 
X-CRM114-Status: UNSURE (   6.91  )
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

On Mon, Mar 23, 2026 at 07:08:08PM +0530, Gopi Krishna Menon wrote:
> +properties:
> +  compatible:
> +    const: st,thermal-spear1340
> +
> +  reg:
> +    maxItems: 1
> +
> +  st,thermal-flags:
> +    description: flags used to enable thermal sensor
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - reg
> +  - st,thermal-flags
> +
> +unevaluatedProperties: false

additionalProperties: true


Best regards,
Krzysztof


