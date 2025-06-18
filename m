Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7843C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HByeNZ8cLNLzOIJZepVLlBz8za+i7Ey7O0rPTWMtvU=; b=rPuolH2mIUU9b2jY7DG5jXyYYq
	z3HDaorixrKaC2xhc1uhoKhX1x93LUv6JIRWtaLASng3SU+16ETghNPfRFAB1fXJdl054dfdJVaP9
	YQIg9ggkjjcVvi4GiKjupHqtRPbQj1GErV/EigcW8suzLB6KmadMlkmHoST22/6XlUtriHcsOww/f
	TShqZHRnO50bwMS5ORopjGJDK5VIOao4owZdDQ2jfPYHNhrjfG/Ywtd+7g9iO989U3pnk4tlb2dG6
	/T6Y8Lm31rdIEFnsgkmGZJ0pmemYnFOVk7bOxmDEJ0sNWUb3QEoCz3nBn8otbVyyMmsKynt/5YuL8
	ZrsUxI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvYP-0000000Ailb-1HQr;
	Wed, 18 Jun 2025 16:22:25 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtph-0000000ARYy-2S9o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:32:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1C8A325C7E;
	Wed, 18 Jun 2025 16:32:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47V5HVKOwdqE; Wed, 18 Jun 2025 16:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750257127; bh=cicdrtZh663PWbSEKE4hOM5LhEMjv/zDMK4ao90EPD4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bfogrMgv7T1arQVWMn++RUlfeiHxF+VbYu+NGxeeHjNrZFMhUPNPgdxmExzqmxjps
	 qguKkX+78TMTVDLiwMlg8YCtKV37LwBXZ29sjqAkTR6jyQpS92LfueOPPLKZBeUZp5
	 +mhlnF+XkEqzwoIcqr4P1GkcMVYVhzl0hyFwmDZc/q7EQhgKkXCjljg6LifbEgLZLu
	 wSSJOEmv2DctErS6/FY3ZDC8un0MLoF/yyE3xPGUFqhuDy+z3NJ2go6GLvFXqOVBo9
	 Bbs8fyKx/DqU3jTpvwYVbo+Kx/da/ZOwZEdElCde/LRYHaxlNxe5IdCNM8aadeuABQ
	 RGEAwDVjn+3/g==
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 14:32:07 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
In-Reply-To: <7bb375c8-1a43-40e2-891c-8815c9cc94ff@kernel.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
 <20250612-exynos7870-drm-dts-v1-1-88c0779af6cb@disroot.org>
 <7bb375c8-1a43-40e2-891c-8815c9cc94ff@kernel.org>
Message-ID: <76df5b2d6b2c8de73519e1862e105c67@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_073209_781120_FFED1378 
X-CRM114-Status: GOOD (  11.32  )
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

On 2025-06-18 09:46, Krzysztof Kozlowski wrote:
> On 12/06/2025 17:23, Kaustabh Chakraborty wrote:
>> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
>> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml      | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> index d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..174bdb8ee932ff965de6fc17aef004a3cedffeb3 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> @@ -52,6 +52,12 @@ properties:
>>                - samsung,exynosautov9-sysreg
>>            - const: syscon
>>          deprecated: true
>> +      - items:
>> +          - enum:
>> +              - samsung,exynos7870-cam-sysreg
>> +              - samsung,exynos7870-disp-sysreg
>> +          - const: samsung,exynos7870-sysreg
> 
> 
> Drop. These are not really compatible or your commit msg is incomplete.
> Don't use deprecated syntax and backwards compatible solutions for new
> hardware.

Are you sure? The deprecated one is actually the item above. From what I
understand, those are generic sysregs and don't mention their functions.

      - items:
          - enum:
              - samsung,exynos5433-sysreg
              - samsung,exynos850-sysreg
              - samsung,exynosautov9-sysreg
          - const: syscon
        deprecated: true

> 
> Best regards,
> Krzysztof

