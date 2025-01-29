Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA00C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AdkLd2bbdCMBhcVCEZ8aFo++SfzGcThAIbhnoiYvtc=; b=q5SPyFbXAYK8RG66qYTjmJZKF/
	I+q0XW23EY+afVJmFT+gbQEB0bSQulZR6qJPkQBLhDQOJuTDq10QAj3Rf2xfiR5AO+wI+Ie8KAAcV
	zMSmsS6r7DCyRi3+qXzQ11Gert4/syiBnPd6yL/3Eyf5LAca0OmqiJgsgDR/bqOg+WusYm7DRXlw/
	BJsPDExDNKGIZPM6HSbvcOqhUwiF37qc8PEaF+PybUwatZdC45f3oFqpClveY44cAtmWJ0QqdDgNg
	m/B1nerVvy1NAfQtLB0XJI/8LftFNnT2BbJr2QIhu1heBISBIrXpPPDnqwsS9v/gBxGPT1UKKHRjj
	OL/hXauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td3Eo-00000006XSf-2cur;
	Wed, 29 Jan 2025 08:15:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td3CU-00000006X8t-1SGa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 08:13:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC35FA41631;
	Wed, 29 Jan 2025 08:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43CDC4CED3;
	Wed, 29 Jan 2025 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738138409;
	bh=8kHLU8vSdujAnBb2iwEz8l17q8H48pYFvZK+ja1jkU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgBEeOzSPMqIWdN96Kyu5185y0Aa7hpIzgcZFKL5+qCi5boTycpVCwCprldXDxeCe
	 KiSVgMPZVkFAUrX7aoZhx4R5u8/wd4Pf8aQXy4kUeZ1P5rBW5XqZ0gkCIhSUCWFYhA
	 /2Q1Lbo8SXhyTR0M8ljCLnA24LaQK3Jzb5Ti/QKG7yp0rcthgQR3KVQyE/Y5iDhzYR
	 KguEX+I+nTGb+CmZmEAM32j7nwj06dwZHamndDgMlk6eDRqenGi2F6Kzcy+rRKAmA6
	 Nin/V3F3DBoc03C5MfbFm9C3ZI7V4f47euLozJd1N35wxFn7v3ck5udLvVKjL4Db/3
	 Gxqbmg+Hv+UlA==
Date: Wed, 29 Jan 2025 09:13:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Update the documentation file supported
 for MICROCHIP SSC DRIVER
Message-ID: <20250129-benevolent-granite-catfish-c7d818@krzk-bin>
References: <20250128161842.44541-1-andrei.simion@microchip.com>
 <20250128161842.44541-3-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128161842.44541-3-andrei.simion@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_001330_444256_7836DC67 
X-CRM114-Status: UNSURE (   7.89  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, broonie@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jan 28, 2025 at 06:18:45PM +0200, Andrei Simion wrote:
> Replace the documentation file supported after the conversion of
> atmel-ssc.txt to YAML schema named atmel,at91-ssc.yaml.
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
>

NAK

That's NEVER a separate patch. Your patchset is not bisectable.

Best regards,
Krzysztof


