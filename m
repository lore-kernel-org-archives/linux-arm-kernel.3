Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66165EC1EB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyO2zBxRIU1mJcJt51mGLT1ydA/G0ruDcrcXt7o+Xuo=; b=kyMlOHH411CGD4eLkBF07z3lYc
	X4PXkMLwAi6TovglPgWiFi2qLc7jveDtWKwtvVciaqtqn4emJSC3U5pcQC+C0j3t3spIN+bGXiiPX
	QQok9TrzarcWjgtMHy9w/HmhIKqqLpQUAK4jV2F3DpoZszg+Cb6NHHukG5P7ze6JVPFvaBcMARtZ/
	KF74N9gRQXNBB42Y20dfiH0fiIOLMyhEMipX9Q2CZUAV+rd6Gv89Vo0gpahvXHvKxKhpJbOOaI5AP
	/5xkLGaYcXw2IcTQXXUaLFjDTQ6FNXzFY+6H/iMKKNyI6+0yBnbwqJPWcqsA8W4xaWre2EhttRxp9
	dHgXmp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzFk-00000009wEj-104g;
	Thu, 05 Feb 2026 13:18:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzFj-00000009wEb-08Gv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 112C4600AD;
	Thu,  5 Feb 2026 13:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363D9C4CEF7;
	Thu,  5 Feb 2026 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770297513;
	bh=IV8zBF+FT0Oe0sZX1eELrvDeo3H7mnexdAbELDcs4KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWVHDUJ+vFyh+Bq7TynxDlz3g3sSG5KlmgzTUCwIuDp3jP1pwrSXYICttMnC8S6aQ
	 ymSk6DZcOkYaoanOxABEqkvdRnu+yUm9AjF2BlidzK6RRQuRwll15PN+y+96A/rjIm
	 yWCAN9G8BwZ1DLDHBMHraBA8Jgvyb/selV9wiMhXpHZryD5Tan6b6DUthnQJuDUtxv
	 LxNpKoMr8BzR2V7uy3sfp7NG98gCqQxlgHDjp8D4mAC8xD0ULsPOQ9hjWJF6xUhj+Q
	 Fhr64TdUW8a133hEeJ8ZA2eNkd+UJM2HFQpE2tsQPX2xfEGU1VsR4X14MwJOC4CwQR
	 QANwmXebjjwow==
Date: Thu, 5 Feb 2026 14:18:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU
 binding
Message-ID: <20260205-psychedelic-brave-toad-db4936@quoll>
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129040532.382693-2-a0987203069@gmail.com>
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

On Thu, Jan 29, 2026 at 12:05:30PM +0800, Joey Lu wrote:
> +
> +  clocks:
> +    items:
> +      - description: DCU Gate clock for register access
> +      - description: DCU Pixel clock for display timing
> +
> +  clock-names:
> +    items:
> +      - const: dcu_gate

That's bus or apb

> +      - const: dcup_div

That's pixel

Use descriptive names of functions here. Not your clock controller. It
is completely irrelevant whether you provide here gate or div or mux or
whatever else. If by any chance in new design you put here mux, not div,
then completely new binding?


Best regards,
Krzysztof


