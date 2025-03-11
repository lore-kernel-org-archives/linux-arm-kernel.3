Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E674C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJDXCGn536p5nYD60HqmGftDiHXhjp3AxSGFwHdtP18=; b=dpl5BvTNg8Jf5qjF45RWsx8CKw
	gFdM4gqS1kxjV0wG5At7qqZmyjMLtEep3u2uQWyPT1HapJetrJO7Vqhxn3K65DgTaC1lDUI2xldRa
	oVMSetkezAnJdFWNyb/2FmHfFT2M+M7Gq54qpGPdIcWVVPOafXNXg1DPjMzXWToE/ggLGhmDEfsHQ
	ADvy/BdK8+0yT/OM089QK96cUmWKbfdzAqYBqzsjJJK50QmddjI9yGv7YINIgjpfO87ew1iWJ485L
	w6Q8L+kKzdnuwhjQ0tVRjdBX3+PzX7/vkh9iKKD+fgplJtkMwt0A3Zn1ESPql+Mjc4RqrFmUrhsvN
	qRmkI8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Ki-00000006maT-3mNj;
	Tue, 11 Mar 2025 19:32:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Hi-00000006m6I-0VZP;
	Tue, 11 Mar 2025 19:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42541A464C4;
	Tue, 11 Mar 2025 19:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A650AC4CEE9;
	Tue, 11 Mar 2025 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721341;
	bh=rnZvifO8Lr86AKQ53zV9O+jmy9mpPl//7AxgH0/4mzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEmzdN5HT3sz3xDVmsbaOTbGrOIgc0maGqaMTrqrjgju+1K/gWeUVPzHyN0MKGN9D
	 ySidgE6YKyK8qYNSaRAHJZaHJEOmD2F7UWZK2o4Au3/eRSP71Ydb1P+WAX4vQPc+cY
	 g40g73j9zytqbqX8Y+LXQ5+kgegmTvWMUspAUg2CR3HzZMzP6LyP0S4Ipgj4LQhMcQ
	 sRX1cBHggK6sWvX1HHr6Y+E+AK+lQXlYnCSdR6k1mtd54VmyXZbx4gYoJ/NwwuUTVt
	 vay3VHdk1jG2YYKDgfT0nJOWAYmd8gjfLtMc5Ly4ezzjXNHW4bTkEVFA6OECS+53WU
	 AmQylG3JNqAWQ==
Date: Tue, 11 Mar 2025 14:28:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: dt-bindings: meson: axg-fifo: claim support
 of A1 SoC family
Message-ID: <174172133877.4178691.16143200124324981216.robh@kernel.org>
References: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
 <20250309182127.1322890-3-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309182127.1322890-3-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_122902_225039_93F64DAA 
X-CRM114-Status: UNSURE (   8.58  )
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


On Sun, 09 Mar 2025 21:21:23 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-toddr" and "amlogic,a1-frddr" compatible string aliases
> to "amlogic,sm1-toddr" and "amlogic,sm1-frddr" respectevely.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-fifo.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


