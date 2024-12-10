Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66EBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGlHfCPRwEeNJnzFkzx7oxHzKwaRsq7En652tv6XuUI=; b=jfLWEn/BSvzG+P+3nJhT+yWnMA
	46YOtTdthIYoLGZGmCAZu909M9KVQThgKf6enVb0SXAXPylejXPMCDWWdYursKhjZ8stLVZ8teIAs
	bgJU+cFvsReZT06C1IaMudr+l+sl2RxseUrDHXpSjW/sZqrEnCuu7Hm0rDz0gfOyelkeoXJfjTYLz
	cNtqvHQdY0Rz4nIA6mA3TbizNRtPpOyXxjeMEuHf2YEXGPPT1uLQ0KK4K3sSCmHqvwIMkk31i4mqX
	fhby2ABj7/0hWc+eQ33zMWMBghLL7iufGVw0Aca0JuBzkBMDHlmFOTZ/RzJoSuW92h8wiaM2x6wqu
	UrIQotZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvdZ-0000000AiK9-36HB;
	Tue, 10 Dec 2024 08:30:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvbU-0000000Ahp2-0n0b;
	Tue, 10 Dec 2024 08:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819302;
	bh=/jKIo/jdjI6FuL8VJks9eSAhySmo5wzdRz7LPNzXfPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S/MyAWQ5IcH4Q9duLsVf99Z8tUQsKeY9e80fd0GuoQWMo9wrvj9CwoN2Eqh2TwxX+
	 0vQeOHjK0SmReKjZnK4KXxxZyadUqO8iL9YncDU8k1cnZL+udKIRqpiOgQwhOo3BQE
	 0bzoqBaGJS0npLe/RrqnXVn7+qWd41i5wjHCSjutw4KFCMExx2F71ED2Ve4T+RG5u4
	 N5xZ+cmFHyTZIpQMbWtovUo7sxN4ZfJ+IsKo7HRkU7YkHaAdQ67Regnztz2gOPsG0R
	 wErvZkCxNXolmh7WSHjs29a+TlgowcEKUwWWgRptaWh9ToqArVVL7EiPO0NVpJNiGy
	 W8t6XU3J49MjA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AE6017E1522;
	Tue, 10 Dec 2024 09:28:22 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fei Shao <fshao@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241124085739.290556-1-fshao@chromium.org>
References: <20241124085739.290556-1-fshao@chromium.org>
Subject: Re: [PATCH v3 0/2] Add device tree for MT8188-based Chromebook
 "Ciri"
Message-Id: <173381930242.18469.18254539260828193661.b4-ty@collabora.com>
Date: Tue, 10 Dec 2024 09:28:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002824_373184_5E0FEDD8 
X-CRM114-Status: UNSURE (   8.89  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, 24 Nov 2024 16:52:36 +0800, Fei Shao wrote:
> This is the v3 series to introduce the device trees for Ciri. Please
> refer to [v1] and [v2] cover letter for the detail introduction of Ciri
> if needed.
> 
> Note that there are patches for some known dtbs_check warnings:
> - sound: Unevaluated 'mediatek,adsp' property
>   https://lore.kernel.org/all/20241105091246.3944946-1-fshao@chromium.org/
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/2] dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
      commit: 3a11be8938aa7294719c0cf2a4758ed0cf88ab84
[2/2] arm64: dts: mediatek: Introduce MT8188 Geralt platform based Ciri
      commit: 5e6af7f5418950d77eb2193ddfb8557458a070b0

Cheers,
Angelo



