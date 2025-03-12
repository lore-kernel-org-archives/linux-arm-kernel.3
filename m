Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE86C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oWpVxPq4vySXAUJtvY/NVdr+xG6KlI80pYKhcA8EWU=; b=BIBbS1PzulW/QWGiGhE5TbbyVK
	ttGR/7Rx8QWVuPPry0MQiyUF4bMZRfYEkTGafOM0bmoIsj/cClXBPQIucIhAYRMedUqK5/iLodHjR
	VdQGOLPiL9KNONXahPsBIjzIRrttO7PPgiqjakPO11nn5Gul6P6gjyizlXj374J1AXXNlQhDoDZeW
	7Kax91Vusc1eoILjb+KehKgyDo0qGWP9sppl9q4kUwGsnt97rcpWi/NTAbg0fk1QQ5NR4G1W+cF9W
	yImhJwfJhBYTIU52v7LJKf09YjTsfYFPt+qcfEhbnrWmOl8ng3zJpfJrOjw5BVaRr9xD2FljfwBm/
	xSgGArrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQPD-00000009D7U-1CKI;
	Wed, 12 Mar 2025 18:02:11 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQMc-00000009CJD-1b7r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1741802366; bh=XvrF3yVE/G56SwGUDsatfsDt/hGysLL5ZnG+rclTcPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iEquGJ608MXIhmBzMIp3HJ5OnIyCEK/PSn4JQTrOyTqydjE//gNb8KWbt040NjPqf
	 8WT+C3BkM12w1O0s3i408LG+nKQF66SpcEwuDL5RhIJK1UDw4EGs4oAD5+irZ/+bWh
	 3Ei4vMdSAHbB+7cro6QE1Sg1yd67aKVflNG3Cr1tlcWZ4rlHgV3ZuG0P+tT179eZMr
	 PtMK3ARcv+qsKXGMbXdCJf6VMIDa3xKFNKt8Hxl2or630SpmAUPE9s9f4bLUM0lslA
	 jZFenTmU3O+2LCq5muvEUiQ6yKNUvA41FYyLtlSXXuGAGr9onx2u5x+v/zEhDsDb15
	 M85ErSBwOWfGw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 0BCCC3A8907;
	Wed, 12 Mar 2025 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1741802365; bh=XvrF3yVE/G56SwGUDsatfsDt/hGysLL5ZnG+rclTcPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cuboc5SlGsRp6FT/y7LhbsQjWc4HOSl86dMHlOApVkyHygph78l4/0ko/v58ziuT9
	 WHsMHoJ8WgMqZvXNpncpVbq1DetkzymXnry/xat45BXOReL6OMVmK39IhzqOGDeA9W
	 w9BK9jujkPEC9O+6JkzF3OEZSdo3bQz+zsS4hix2MpfvkiBS2E35zbB8vHuzo06pw/
	 7d4g3aI+vXdj7yTitXZtrOuM3UNed4wWDY9rJcrPMP6NYFO2RJbAAoPMQLuQpCP4Nw
	 98tQ0pWSaZqaGwfyTOdJQVE3AlRYVVvJCP9WXAotIjSEK0rxHGOMyY4mtnu80jPBlf
	 hlxJ2PtcQdbOw==
Received: from [192.168.1.228] (74-111-126-194.sta.estpak.ee [194.126.111.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id E524B3A86E9;
	Wed, 12 Mar 2025 17:59:23 +0000 (UTC)
Message-ID: <57ae63a2-544b-4241-a54d-8fa9917c1e44@mleia.com>
Date: Wed, 12 Mar 2025 19:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
Content-Language: ru-RU
To: Purva Yeshi <purvayeshi550@gmail.com>, ukleinek@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 piotr.wojtaszczyk@timesys.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250312122750.6391-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250312_175926_066546_4494210E 
X-CRM114-Status: GOOD (  17.83  )
/bin/ln: failed to access 'reaver_cache/texts/20250312_175926_066546_4494210E': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_175926_066546_4494210E 
X-CRM114-Status: GOOD (  18.97  )
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

Hello Purva.

Thank you for your contribution.

On 3/12/25 14:27, Purva Yeshi wrote:
> Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
> YAML schema (`nxp,lpc3220-pwm.yaml`).
> 
> Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.

Actually it shall be set to 1.

> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
> V1 - https://lore.kernel.org/all/20250311125756.24064-1-purvayeshi550@gmail.com/
> V2 - Correct filename to match the compatible string, remove unnecessary
> quotes in maintainers, and refine commit message.
> 
>   .../devicetree/bindings/pwm/lpc32xx-pwm.txt   | 17 ---------
>   .../bindings/pwm/nxp,lpc3220-pwm.yaml         | 38 +++++++++++++++++++
>   2 files changed, 38 insertions(+), 17 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
>   create mode 100644 Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
> deleted file mode 100644
> index 74b5bc5dd..000000000
> --- a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -LPC32XX PWM controller
> -
> -Required properties:
> -- compatible: should be "nxp,lpc3220-pwm"
> -- reg: physical base address and length of the controller's registers
> -
> -Examples:
> -
> -pwm@4005c000 {
> -	compatible = "nxp,lpc3220-pwm";
> -	reg = <0x4005c000 0x4>;
> -};
> -
> -pwm@4005c004 {
> -	compatible = "nxp,lpc3220-pwm";
> -	reg = <0x4005c004 0x4>;
> -};
> diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> new file mode 100644
> index 000000000..432a5e9d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/nxp,lpc3220-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LPC32XX PWM controller
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vz@mleia.com>
> +  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3

It shall be 1.

> +
> +required:
> +  - compatible
> +  - reg
> +

There is an error in the original lpc32xx-pwm.txt file, one more property
"clocks" is strictly required, please add it along with the conversion.

Thank you!

> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwm@4005c000 {
> +        compatible = "nxp,lpc3220-pwm";
> +        reg = <0x4005c000 0x4>;
> +        #pwm-cells = <3>;
> +    };

--
Best wishes,
Vladimir

