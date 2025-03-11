Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C30C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hm0m/tkYYyctI9l5qAkGhOhqiKMr67/SLfz+3kxFqXY=; b=In0h5VIIyPbrd6Zm/ukzTnMDUD
	5rukZqw5Cr2bh8zRvNzkMe0wvSHfudWDiWEgFPg5ejY801Q+H5bobT9nYOkXVJDJB69Zi0OD5hk2O
	c5WSsbh4DPH42uDQdSbCtEzOhJA9RWPuLHePgbns+5pVAAas+sVDDvh3hGe8exZUOYBWs+Ya95B9R
	gRwv9NwBf8YJ8sn0SMtGY9hlZCEMrOlynlZINTW5ng9LMNZf4A48Bibyk2eDLKOW1NtKWeN0RRq8x
	IrqKF4VldvHDcEfeFNMYkNzMxFcRrcIEQohlp7d5KMBVTmgGLxhPJ3orCI8rZ8C78pivLg/7nmgXu
	MPM7UxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5J6-00000006mMD-3QuQ;
	Tue, 11 Mar 2025 19:30:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5HP-00000006lzo-3NiD;
	Tue, 11 Mar 2025 19:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2D24A45521;
	Tue, 11 Mar 2025 19:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B460C4CEE9;
	Tue, 11 Mar 2025 19:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721322;
	bh=H3kO2r1YHqxOT0791Hw1VPh7Nc7EXwaxXhF8SUKEhAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4PTllD6WjqfM+ONBVzQNHYqwqJbS4VN7qu4hpUiZvOqQAMrkl8GMVB4LNZvOp5GI
	 HipPgYYCwc8cowhS9DVIKvW6suOv2pbZaTOQ72qt4pT4lwuT+/lfKjYfuQQFKElXr/
	 9grSNR+KjyqhUECE65UQbKQDtHnvY2Ii4m9KGn5gVtNz15lRXPpOP+1uRA4fQyhSqr
	 uV8tPAtKbfz5F1S/hK+x9yG+HnV/rqbST7e9TUDyOp8+KDTdH15L74JrkPoGGqHtHg
	 mnn7oYmGpP/4E3hjxY4qxJbxTvObsSBy0DVe/htX4/v3qQ+hy8lrjaHVHtoiItWCug
	 2I5cCQC7CxeSg==
Date: Tue, 11 Mar 2025 14:28:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: meson: meson-axg-audio-arb:
 claim support of A1 SoC family
Message-ID: <174172132043.4178261.11828911327621158641.robh@kernel.org>
References: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
 <20250309182127.1322890-2-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309182127.1322890-2-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_122843_912733_8B2EAFAF 
X-CRM114-Status: UNSURE (   8.57  )
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


On Sun, 09 Mar 2025 21:21:22 +0300, Jan Dakinevich wrote:
> Add "amlogic,meson-a1-audio-arb" compatible string alias to
> "amlogic,meson-sm1-audio-arb".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../bindings/reset/amlogic,meson-axg-audio-arb.yaml    | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


