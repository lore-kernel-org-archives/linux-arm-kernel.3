Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB45C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xHTJlXWFv6n0FB41Zy8tLz5CvNTD/kwKc19PDAFoUY=; b=2VBDQHfF/3EmrusqHzTbIk9udg
	ILXmVL5Q6PRHF0KkXAIiEeuBS6vzgy1zprKL/2PDueYb0kMGkpzp3LfpHx+iNeLmWeEwFJZyYQEiu
	Kl+/+Qn8sm+GagAkbqjS5cxmUHlBOhr/FEq+w1OIJIXmtiyYoX69wKZbJ5DH5xzAY64tMbnV8EkBr
	s0OAQ2EfBd5soNOKogNJxJrg8CVpeqOLwnfkc3g/foxE+iciQGqgzv7c0mIBP3UjrY+nlnc4jXhay
	uHIxppUOAY80bpRYSvKxki4bdZb1t03nQ0D+wMaSrbYfNXgKsnjDUrV46i+peSVjMos4semUZZpNW
	JPVj95sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUSB-00000004JnZ-3W80;
	Wed, 23 Jul 2025 08:03:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUBy-00000004HcY-3QFX;
	Wed, 23 Jul 2025 07:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 381FA66923;
	Wed, 23 Jul 2025 07:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494B6C4CEE7;
	Wed, 23 Jul 2025 07:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753256799;
	bh=LP5FBzh1zsHXLLxQPPXTOQl5iCOBwGRUaADi3MQxQGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ab3jZzZVJdtEWMpCDrKwNfxkq7ZqlEImWWlKllK/RsP2knhmTsb7vTvJcmrL4/W7h
	 X9OPO/Q4dgR6Qo/r3RssC3vkuZSmyN1Z7NW3Z71ru7AIgPGNJQKTwvd3WQqiT63oMp
	 1A/3SC1eXsNyJ5AtYnrBKNPP7liUqAp5etIRDYIl9qWJrpqL13kPH5blNheRSXE87z
	 7MbPw9RaduJ8HI6wlsjkOwyMdPsFkYqcHe11mgOEz7zxE0c36vZ/rsmKwFSUjKG+EY
	 oQXPvQd6dW4/+ytwXGReWwZEXwbbRy7ThAnWCNsJ10GYjjZgS3qz7Gqc0dfhu3qj65
	 7UOR/fLLdTxQQ==
Date: Wed, 23 Jul 2025 09:46:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammed.efecetin.67@gmail.com
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, neil.armstrong@linaro.org, lee@kernel.org, 
	rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: khadas-mcu: add new compatible
 for Khadas Edge 2
Message-ID: <20250723-skinny-spectral-zebu-eeaad1@kuoka>
References: <cover.1753179491.git.efectn@protonmail.com>
 <385b22d3f1d30e559cfdc08616812de0f958e5af.1753179491.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <385b22d3f1d30e559cfdc08616812de0f958e5af.1753179491.git.efectn@protonmail.com>
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

On Tue, Jul 22, 2025 at 03:38:11PM +0300, muhammed.efecetin.67@gmail.com wrote:
> From: Muhammed Efe Cetin <efectn@protonmail.com>
> 
> Add new khadas,mcu-v2 compatible which is going to be used with Khadas
> Edge 2 and potantially new Khadas boards like Vim4, using the same fan
> control register.
> 
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> index 084960fd5..fd57ed92c 100644
> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> @@ -11,13 +11,14 @@ maintainers:
>  
>  description: |
>    Khadas embeds a microcontroller on their VIM and Edge boards adding some
> -  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
> +  system feature as PWM Fan control (for VIM2 rev14, VIM3, Edge2), User memory
>    storage, IR/Key resume control, system power LED control and more.
>  
>  properties:
>    compatible:
>      enum:
> -      - khadas,mcu # MCU revision is discoverable
> +      - khadas,mcu    # Used by VIM2 rev14, VIM3
> +      - khadas,mcu-v2 # Used by Edge2

You need documented versioning (provide a link/datasheet). Otherwise you
should use compatibles specific to the hardware, e.g. edge2

Best regards,
Krzysztof


