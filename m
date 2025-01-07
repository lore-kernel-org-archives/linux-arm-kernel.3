Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59013E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00JGiFihZOQk6XQmeMzjSHJE9MwVgVin9IU8D69sosE=; b=z+oUYFD9ZHRRFAO+DolQIiN+ka
	BtoZUKuFxkYpdWou9esq40pNYGB7irpPZP8OwyqifAIdHeZrtKIKE8RO9DhEUBWvVNY85k9jY+UNE
	mEpxRq3Y5YAY/dQaV3rf/UlSaNIEzRAdsKTF3DOsvRUKnZ9CJOSWFSA4q4Cd2OW3cV3krBQn1ckWx
	UJeaHIBGLDifsn+FYrFyHkS9e7joCeKvf4V8JNB+rtzP2V4Ji5agk4/uNdzfdj0hHkiCdGMAfHCsA
	dHO1bZ8XV7NxjOsZJXuwAnXrSMbN6uXN1HnFPd4/ouz8owovFF97rvg1fh/E0mOAT+KiSEyUavaXD
	QtiJVedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Wc-00000004jr8-1aRe;
	Tue, 07 Jan 2025 12:17:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8P2-00000004hxu-2EKg;
	Tue, 07 Jan 2025 12:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736251783;
	bh=rxEU0EmD30MR/FIV1bxTNYLADb5PwBd/rv+n0VlZH2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c/7/NjPzBAMHqGPBtHgBQDCWaWuO1s0uhJ9QMx28kWIHbtWb4c7Ij+IWfyaPN82vo
	 B5TWvGSPEmI6athSe4aF5/w9VkPj04+c0YK9ieNZ1KOa4Ae1nhj2rq5S23cRtZJcSN
	 h5bg0Lhs0c1XyYtcKNPUDvjFWCRMv6FdF2nf8Hx5dUWplcPhYijfuG7F3FycbXRcac
	 tw1tn75aQKHwCKrK/3G9a3eHtkkieO3ScxIEGJ+gZp4q/K4q1jT2Oa5SLPCuyGzIlk
	 yRtfLClN2QkySk4/3Qdj1uBUvpNVIm8Gr3/T+joc+gR6WPj/XHbX8uu1Fxgoms1zxX
	 uzlp+cuI+/AGg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9603217E1567;
	Tue,  7 Jan 2025 13:09:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Sjoerd Simons <sjoerd@collabora.com>
Cc: kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250106085737.227622-1-sjoerd@collabora.com>
References: <20250106085737.227622-1-sjoerd@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8365-evk: Set ethernet
 alias
Message-Id: <173625178253.57526.8389123974774174107.b4-ty@collabora.com>
Date: Tue, 07 Jan 2025 13:09:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_040944_720589_F0D36901 
X-CRM114-Status: UNSURE (   6.80  )
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

On Mon, 06 Jan 2025 09:57:31 +0100, Sjoerd Simons wrote:
> Configure an the ethernet alias to match the ethernet controller (even
> if it's off by default). This allows e.g. u-boot to configure the mac
> address on boot properly
> 
> 

Applied to v6.13-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8365-evk: Set ethernet alias
      commit: 70584fa8db2ea4cd402ac9093fbb4f6cb4f2a2c2

Cheers,
Angelo



