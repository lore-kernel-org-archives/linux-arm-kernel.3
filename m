Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8811BF8FA9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYNRr78Bk7kKy8q5PZ8wAhWa1XHOZpv8D1mw9I7KD98=; b=QB8bTJW0fHtPIvwwpU8aAfvskD
	Gprb4d4yM1qTKyYaDQajklGUfw+WbbFr/1eMnnMpiar+Wg/XMWhbFLACC69knn2WcW6DeT8lstc0x
	D5+QJWWD2qA+azKc+QnQ398DAPEg2Kmk0HSc9LjnFrm3cgeYlQtShqaWSJfDE9UZqF6ZavOgx0MeS
	NZ/B57uUdDvyO0zUkVkp5XntQfOhCDwDorvG4gaCYEssedozizSTRR0xfFQ2Z+2HzBdyHdX/IE+aD
	0xsQRr1wOnvST+2PDPdejkMu2DVv98hYBpPFcDkcjWFccEPISA2Hf96NrnC6+HNS55IU4WNX6eZcA
	Hwxe43Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE7T-00000008v9k-0uzk;
	Tue, 21 Apr 2026 16:38:39 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE7P-00000008v8E-28gE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 16:38:37 +0000
Date: Tue, 21 Apr 2026 16:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776789512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYNRr78Bk7kKy8q5PZ8wAhWa1XHOZpv8D1mw9I7KD98=;
	b=RSg0wuXin0pVrh27qZrwL8SFBe6CUFcCoX5mUHmHSVFNgDcpusGKhUDQqcoSnZc8rwLAvx
	WXsEuOz92oH8jypRR5oA6XeD6sqtjH96SMgOVnm9c/z/mNfrQQVJczEj78YcfYMdhiEu7o
	7OC2crjL0ZftcPXXU+i+jGH+xJ+iayi35yjsUenWjQgxfa6H9FX96wLZotJDf9/qqrJ6XS
	rqXg0GrSZMWwWEQt6FO9LXXRi71EKCd3A+ZX0uSuTdAL3gQwObeJY3WlnazDeThfGWvAvD
	cKE3ZI+Jzg7Yp1TamJ3rokhAi7u8MolP3Q0Yzav9VDfNGEgv75TV0LgPakcgtg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v3 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdurk1.2nkwjyfysqjik@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_093835_697007_794D311E 
X-CRM114-Status: GOOD (  10.32  )
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

On Tue, 21 Apr 2026 15:53, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>Changes in v3:
>- Change position of the entry in the amlogic.yaml.
>- Change formatting of the Amlogic W150S1 Wi-Fi module comment.
>- Fix several formatting issues.
>
>Changes in v2:
>- Split dt-bindings and dts changes into separate patches.
>- Updated model string to match documented vendor prefix.
>- Put vddio_sd states array in a single line.
>- Added a comment for the unsupported Amlogic W150S1 Wi-Fi module.
>

Where did the rest of the cover letter go?

>Christian Stefan Kövér-Draxl (2):
>  dt-bindings: arm: amlogic: add support for Amediatech X98Q
>  arm64: dts: amlogic: add support for X98Q
>
> .../devicetree/bindings/arm/amlogic.yaml      |   7 +
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
> 3 files changed, 257 insertions(+)
> create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
>
>-- 
>2.53.0

--
Best regards,
Ferass

