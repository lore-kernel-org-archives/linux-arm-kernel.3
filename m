Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453DAFF4956
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xw+dDc76MO/W6Zu1Yd9OI9SCCjLPLtfQ9bJrtIRoe5g=; b=tD7gJN5wpwiudh9CJvpPIoU2yP
	9P3AdeKZThry+7KPjL1ZPzELHoZv+/7YTopOTPIri4wzhDUKSKHuOSK+uLOVGmAz3gnQLvdZZljsN
	jyLYpYX7ceetRVp2JJHKA95h4EqBqO4ZdkwPPF99ui0ONlK+Ds4RwIAdss+bSccjvgiKIq2AkE4it
	UhSjFITCOEq5pWRPW5LqPQE8v6sDumQvN83O1bBBalDaawjBDGTqmSiCyPbki42DNWh6gJ4JJolzc
	L8En4hzZqb0ORRzatKK2WfyDwN4YdscgZjX+rlyKcp473NSeJZemgUJn3A/veuy6VnW92G3p5cn9m
	lFo46d3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76wJ-0000000Akva-0tS3;
	Mon, 30 Mar 2026 07:21:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76wH-0000000AkvU-31d1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:21:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD273600AC;
	Mon, 30 Mar 2026 07:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26A8C4CEF7;
	Mon, 30 Mar 2026 07:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774855292;
	bh=o3Et1NtRWZGCHJSScVwUEUiAkoBRhbPjg9+RqO4e9+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkVLn3lF1YQszaC8FfEJhY0ghQja6SEHTjE/W2px2PnKaRX0LJv7TUW2n82nUA9E+
	 BGpKs+0qf/IeFHb2arM+7tEBLL2QRpvd+HfPXiRHUXD3nDEVU+rjyLrsagNzixYY9L
	 lqBJUP7I3gmIcBjNO8cjHXQbBVP658zFeufe/uWUWweYASqj0q4aLUcSlHGHaGIM2C
	 D9FX80lmBQjLBcJ+7TXlimEteOuPF9+jTmsQU0Hze0sqiDeR+dWdVa8cIzV6VAft4V
	 0nF7aE2xQR8UNhDj8QvyWIKMl5aWpK6TtW34gMguWm9CjGk45wBXdC7c3sxula1ksC
	 29LElVNPan7tQ==
Date: Mon, 30 Mar 2026 09:21:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ulli.kroll@googlemail.com, linusw@kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: power: reset:
 cortina,gemini-power-controller: convert to DT schema
Message-ID: <20260330-premium-pastoral-labrador-58f0a2@quoll>
References: <20260329205151.15161-1-khushalchitturi@gmail.com>
 <20260329205151.15161-2-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329205151.15161-2-khushalchitturi@gmail.com>
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

On Mon, Mar 30, 2026 at 02:21:50AM +0530, Khushal Chitturi wrote:
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    gemini-poweroff@4b000000 {

I gave a list of possible names, yet you chosen different one. No, it
does not work like that.

Please read the feedback and choose one of the names mentioned there.

And next time please read DT maintainer review feedback more carefully.

Best regards,
Krzysztof


