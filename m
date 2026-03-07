Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B35F5141C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/tp3eNy0p+VlmcD5Nu1H2jKPIcziL3DwWYKL0kT1s4=; b=FEvnlAQYneAJhDKlrq58s+zeFK
	6UnlDugTdYE73BYL8O/iRc1rZBaOXCj+2Ov6X4NRISFPrEATKThNfohYaBjR0lmihGBxnFF9Cbbd5
	TNYDLrat9fTMmhAzJdKBS75XNTDwdtSAE8i2dUzAoKpTpxGn+jnwBoIEiEI+2tX+VGdzK1sRqbLxg
	PkBG+yjHLcURknZ39F0fbq4lRB+mUo70+8ILkee3sXtNsntL8mfTBWWT+6fkOswoA+GTcW9sSsXPV
	jkAk9g69P4fC2LGprxv7kuFse+zwFS1xwbQxtyAkXjzvIqpaadbNherHKnGIerRopAAREda0OSXQ0
	7P+WpEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytRc-00000005IOA-2yNe;
	Sat, 07 Mar 2026 15:19:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytRa-00000005INo-0tPH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D76943E38;
	Sat,  7 Mar 2026 15:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD32AC19422;
	Sat,  7 Mar 2026 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772896793;
	bh=1AnC7JuzY6vxujjqCJ8Mk1cswzSyhfw/ZCAQjD3UQf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLRmUA7UHsZdMOdy4AkblVCwT2uBpYuNr6s15csCBqJVJe58asVD0AnULdsv7v4rp
	 wSpMD49CR1o00bt8X8RZ0YaE9+ea1YNBG3Mf31B9OrccPyyuUh1wTpf5sFYCgCoxLk
	 SEmaXSIUEp0QlhkPzexhXjkE4OmR8yVr/ysDzctOUAUVvMcOq0BkcdteaFUH1gsoti
	 UeEHadMHeqwlIKWJ3u8YiSD50pWGNq6xh2cZX/p13gqQu69vMpzY2YW0efFZ/0IjDQ
	 1iv46LnVots9IJPzjIq9o1Xp4GqRyCakWAJuIONInevd3dv/kKFqZcc245DtUfs8PT
	 XF3g37QofXGZQ==
Date: Sat, 7 Mar 2026 16:19:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, peter.chen@cixtech.com, 
	fugang.duan@cixtech.com, jank@cadence.com, cix-kernel-upstream@cixtech.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Message-ID: <20260307-foamy-happy-bumblebee-cddd75@quoll>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_071954_270222_096F28D6 
X-CRM114-Status: GOOD (  16.70  )
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

On Fri, Mar 06, 2026 at 05:32:37PM +0800, Zichar Zhang wrote:
> From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
> 
> Add the optional 'clock-names' property to specify the name of the GPIO
> controller's input clock, aligning with standard clock binding conventions.

No, there are no such standard clock binding conventions. DT maintainer
tells you that.

Otherwise explain me where did we document such convention?

> This complements the existing 'clocks' property and ensures proper clock
> handling in device tree descriptions.
> 
> Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>

Messed From/DCO.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> ---
>  Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> index a84d60b39459..c242b31edcbf 100644
> --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> @@ -24,6 +24,12 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  clock-names:
> +    description:
> +      Optional name for the GPIO controller input clock.
> +    minItems: 1

Nope. From where did you take such syntax? Missing proper constraints
for names.

I don't see reason for this in the first place and your commit msg is
really poor in explaining WHY you are doing this.

Best regards,
Krzysztof


