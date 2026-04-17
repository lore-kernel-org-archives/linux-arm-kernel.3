Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D88F99C63
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PferZXItiTPVFBRS0IK+uOWQB/jVSQNLOY1v0D1zpyc=; b=3Rz+42fbIX7FvNZIX8S7QrHoUn
	2Jt/UTQcsjK2hkvBoqYtLworWWXftFf96ElSei1F/nAWlX+loD2o1iZo6eWADUahg96MpGNiWd8SL
	8TLPYjJbhVySomX1G12RWTESipVyi7+jwejW3t3oGSysKzRi6RNW1QtK2/H6+GasUrg3erYomPlKI
	yrkOnFKrcScnwqPFkCQrFTSLYw+FjpukfMYhhKrxRO2lVp3nXYDpY5jm2zKz/f0Rt1pvwLDM22A3r
	zKAWu7tWSsMD+klbfgZtLpkFrmGej2DZkwMzfZhFGgaRV3KAFosTcjRdrbFXdOnnb/GDM/HprWFYN
	E7oY6+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDqQk-00000004TXC-3RGb;
	Fri, 17 Apr 2026 21:08:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDqQi-00000004TWm-12KW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 21:08:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3A0243CA1;
	Fri, 17 Apr 2026 21:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5371EC19425;
	Fri, 17 Apr 2026 21:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776460126;
	bh=MlXq0E4vLxLPXAKEw640HPvJY2bMGUevY4/dF94aKgE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mxb3+uSnxRr6/OVoGFDF+IlJsrhMEDLoS0wDed5eHAjq1x+30saw+3SIduDnjaC5d
	 3hVGIaFFLmKFGTVrq5qedL/dzA2W20siQL2K4NZGa+Enw909+/oCIzOzkUjVMzZvbR
	 g+qA95jspvty4OByC0mjMd5ET1rXoKF6DJaejQVD/LDLWSH/KA1SWhITNBYLYRL/e8
	 RGj5VfrkYP3KDokJ1SVSkrf0v3zZE0FqB4zgSJQ0860XqsTosUgeDGSxwJELX3fwKB
	 taHhcy73LJ6fgVvU02Ay3wrDb/AI85FICnrpQ3BEnicEg/8NyD8IiuwmGTYXwZi2G3
	 eKvLQ+0ZbAXmA==
Date: Fri, 17 Apr 2026 16:08:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, soc@lists.linux.dev, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260416-send-v4-2-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-2-e19d02b944ec@gmail.com>
Message-Id: <177646012448.2165534.5760108355183774935.robh@kernel.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: arm: Add zx297520v3 board binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_140848_308356_01F9C1BE 
X-CRM114-Status: GOOD (  14.05  )
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


On Thu, 16 Apr 2026 23:19:10 +0300, Stefan Dösinger wrote:
> Add a compatible for boards based on the ZTE zx297520v3 SoC.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> The list of devices is the devices I have access to for testing. There
> are many more devices based on this board and it is not always easy to
> identify them. Often they are sold without any branding ("4G home
> router") or with mobile carrier branding.
> ---
>  Documentation/devicetree/bindings/arm/zte.yaml | 25 +++++++++++++++++++++++++
>  MAINTAINERS                                    |  1 +
>  2 files changed, 26 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/zte.yaml:19:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260416-send-v4-2-e19d02b944ec@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


