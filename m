Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B119AF3ED6E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID8mP01osyj2OPyILXQkvbtBRBEolL67WOjdOaurXEw=; b=DWgNy+Dxv3l9kYd193X1E1nzDL
	2pQ3ZPp7N3gXQn/Dx+nypjgLomb1xyDMiixpe4/TdZlsop2A7a8k/miF9QBwJfKNJ18XVXUweSzDA
	vkr6kyh5eTs8xAbPKnwJKM34vmIxt8o1sgqxIxregIzkEoTNDv5jWq1VMiR9t7A/pg4R3PYwK6oAw
	fSgLI4rbkzseUlupL6Ea6M4K+XAUO/1mmX/HorJatkDLDTnNfdCaoRZovVchPgxgIJrlY8Nmn12Kk
	+ROaZT+URlPoZup0iCRR2F74xUBCzGS89FnQ+yGVhEBmCtHh9zokVXKHBaN7S/ltWM2ZTH2gsak6n
	XFLDmfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqzr-0000000EBzF-2DU3;
	Sun, 12 Apr 2026 09:20:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqzp-0000000EBz5-30ta;
	Sun, 12 Apr 2026 09:20:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C363F60008;
	Sun, 12 Apr 2026 09:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24EDC19424;
	Sun, 12 Apr 2026 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775985647;
	bh=rczNStscr53iHBjcCqFVqCWDf/LgHdrfBQWMDLQbIgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALCNqMc807cOnpuj/vzKIl/RhVfL4NOVch/USLcg39xaO1JZB2xJpSSAP3gRt5h1i
	 EKmsTD9+OoSB0DicvqKI5n3ge/ehwC7Hx2B+x5TZxCY9jquSaVVtFhD5kBldrAknOw
	 NEpKTA8lzq5FJbtojsus8omjX3B2rgMh4v9NL87m3MN1cT6/zR+oV5OxuN6Oc6ak9z
	 2fv7BG04zNvWXZKLLzb16hT/DZczh6akwCKo4IUTSEx6cKI8XNki449zaErQtQ5e+L
	 Zx19E+wjNEBJ6htte0HqCPwVU1Uf1yzWAoNyNtPVTH0PU89h6z7UoMcahbs0VdT2bb
	 61ozkiM0CZlkg==
Date: Sun, 12 Apr 2026 11:20:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
Message-ID: <20260412-elite-mushroom-of-happiness-fade9c@quoll>
References: <cover.1775829499.git.andrea.porta@suse.com>
 <6f0fa1a817b5af5040b652320daa7268297932a9.1775829499.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f0fa1a817b5af5040b652320daa7268297932a9.1775829499.git.andrea.porta@suse.com>
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

On Fri, Apr 10, 2026 at 04:09:57PM +0200, Andrea della Porta wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add the devicetree binding documentation for the PWM
> controller found in the Raspberry Pi RP1 chipset.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


