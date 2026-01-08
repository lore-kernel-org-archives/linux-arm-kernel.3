Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441F1D1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bo8KblqaTVttHaZHjTiWJT6gnJOAPh7WKPiJxBQ1kTo=; b=LvtMMUouqq/Shsx3o32ttBdILq
	mBUySz+nL7GfvdOe6hwsob3VaoLgBcw1ACAliaCR8bwL6fy4IrZH8v+YfKjwbixuO3USRKX/EpaGN
	K8hdtELgf4bx5NEL4sO+j0pFaqq2yIGwkOc7ejzO/NARVXUaZyYLQrPSEWHReL/eEVd/C4QY05d5f
	OzoysBVOAm26icH2rFNepHNM3Cc8qkCHFGy+hUrmmdvjzfXg8m3996RkvJFfmkTKn+nvpedZImrT7
	I6GteB5C3bU3Op8QKlWeKCnP6lzyNy89xIIBsDW2dsl2dGQoMlbH0evpdvtBX397YcOv8nNKiHuyV
	/cGJbSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxLY-00000000s7C-0qCt;
	Thu, 08 Jan 2026 21:15:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxLX-00000000s76-1WWb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CBAF60130;
	Thu,  8 Jan 2026 21:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DFEC116C6;
	Thu,  8 Jan 2026 21:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767906905;
	bh=FYItuciEvFj6YCFlj2vV0fO7QS8ZeMzmtjFPAelyWz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lPfzE15J/ZLXfaTFsco+lkGWh8yEpmg5YdHYs8YSUZu/kjsFTxMmGeSSvTW7Y9UhF
	 0XpXu/SvD0UrrJjCg8YPvUtgRTkAq5vgxAt2o227owuSIRZXIyrf6drcryR9sAjtzt
	 CidZQGthYX9ML0+NrvQUdj2LJtYD28/ODGscHLh0ErxvX7NtlYAPbP0WXOMjzWZblu
	 Xte/BvahItZX8ZpiUqiRIqBoqptmAQpHRK9H35OyjK1ErWx1QTQTaA7Cl33SExT7R/
	 c7zLyZTpVEsC7vf9rf2s+jyBjY5QGEY6mWodUm1ODl0ckN+eulYIrhCA2pl961GW1P
	 2o3bTO/v9b8WQ==
Message-ID: <50608fda-e720-4d9c-8f88-cdb43affbb25@kernel.org>
Date: Thu, 8 Jan 2026 22:15:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: apple: t8103: Mark ATC USB AON domains as
 always-on
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Rob Herring <robh@kernel.org>
References: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
 <20260108-apple-dt-pmgr-fixes-v1-2-cfdce629c0a8@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260108-apple-dt-pmgr-fixes-v1-2-cfdce629c0a8@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 1/8/26 22:04, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Shutting these down breaks dwc3 init done by the firmware. We probably
> never want to do this anyway. It might be possible remove this once
> a PHY driver is in place to do the init properly, but it may not be
> worth it.
Even with that PHY driver now in place we still need this. No need to 
resend to fix the commit description, I can do that when applying the 
series.


Sven




