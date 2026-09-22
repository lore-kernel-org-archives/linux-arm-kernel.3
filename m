Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83109C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nww4PN4xAeVToVmfMKLJur/GFwR8JfTvEvsrd75MdoI=; b=nWrLomiicNJgi8Ckw4W078Fh8e
	RhLHO9pT59ZeG2TWrQUnIZ1I1ueeGW9qn63oFve26Hy67A5TI1siL2CEakYv4LInzpG0LkhLfuFaY
	jlO/0sbxSsq1TJMNZnXXKMT03/xRIrbuWaTnqbUCANTff3N2eqdp+k9Y/TRmg6nuZ5jBaYGaiYfPz
	w4PKykYfjUHHTCfrjl7jTKL3tay2pcvOKzH+MV1ey075XR6kidslHhOZBqkcNMu7xRHCRA8BB15lk
	H0p4Kx0YZqnkO0Qrz+zedjvWfsPjdYySdLRmNGMNhWXEmO1Vcd9xVQDgMQXhmLTMRtEHZ6eKArAbB
	WtUfyk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92mX-00000005wWS-0sHH;
	Tue, 22 Sep 2026 15:51:45 +0000
Received: from mout-y-209.mailbox.org ([91.198.250.237])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92mK-00000005wT3-46qb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:51:34 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4hq2Sj5lw3z7t9l;
	Tue, 22 Sep 2026 16:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790087141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nww4PN4xAeVToVmfMKLJur/GFwR8JfTvEvsrd75MdoI=;
	b=sg0dLjtuM8iAnCpaLE3A6JTj7UDijAHt0HTQ32vnC9d8ksmc4mRnUBY8VcScZ3NB03yTRW
	T3tvEBLGAYwQSwbq3BZ9wStOaHmynSAUFMNqhW4JSgttc+3hUGbSNezGxAaf5vr4t9GPQf
	rj7ilhK8bmRcPmYZQIyWIwB0wQrOIjrEUFJrTOejGV1r6OYVp1X6jOqLqsC18Nuxrzs65r
	3qE7sISvkLyk752gwjmErx9/RNqLVA8SAUNfNu/6YhCRDYSHnUu/6R1++fEnxebcLyAIZu
	UjsWOw9KXFkBN5HELT6ZX1i0YicnWuUPYFgEtO47BiP8w+c2vo1oQ7WXqWZvaA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of alex@chimac.ro designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=alex@chimac.ro
Date: Tue, 22 Sep 2026 17:25:38 +0300 (EEST)
From: Alexandru Chimac <alex@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-ID: <1632826281.78215.1790087138262@app.mailbox.org>
In-Reply-To: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
References: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Rspamd-Queue-Id: 4hq2Sj5lw3z7t9l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_085133_183864_6C7750E4 
X-CRM114-Status: GOOD (  14.55  )
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

Sorry for the spam, I had some issues with the mail host but they're all
fixed now.

> On 09/22/2026 3:15 PM EEST Alexandru Chimac <alex@chimac.ro> wrote:
> 
>  
> All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
> to them, so force the nodes to have clocks assigned to them.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
> Most Samsung Exynos9610 pin controllers (except TOP) have clocks
> designated for them, so allow the device tree node to include clock
> information for the driver.
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 1feb6a6fc690..e4fdedb29631 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -140,6 +140,7 @@ allOf:
>              enum:
>                - google,gs101-pinctrl
>                - samsung,exynos8890-pinctrl
> +              - samsung,exynos9610-pinctrl
>      then:
>        required:
>          - clocks
> 
> ---
> base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
> change-id: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97
> 
> Best regards,
> --  
> Alexandru Chimac <alex@chimac.ro>

