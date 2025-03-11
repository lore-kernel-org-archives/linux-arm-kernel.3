Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37A6C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76z9RpT7LbHnxRUebI6Gml/hAxFlmH1pJcX7CqSNz9M=; b=Y5ccx/Vyr6Hl6O951T8n+LReD7
	OOenj4dgYtXgwbM4Im38DQsGX9VhPhrOF8E/GtlKHH/O5X7O3W9UMSv4ediJOzQ7LnYvE34AonJci
	owg/rKCfUFTyHCHSuxt1urXwbCQL08jb1SCDzacmGa+W41CDKrueqz/R1tTCAzamQO+pkA0W9Fl15
	6RKkBYZV16XrQlcqzo2IOgjN6embFop11BlNm0t0dNih5WFLlBgfgiaM88zOQ98Yu+SNGk6QXUzfe
	+i85qIYVnCGgK60ybm4LwCR/hjtXGArbKiQYjQ5HmvAsz81swsD3ZNG9ec+vpCIJNDRp/9tV7GBTP
	u04GOGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5MK-00000006mpV-3lbn;
	Tue, 11 Mar 2025 19:33:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5IQ-00000006mIE-0Ubg;
	Tue, 11 Mar 2025 19:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B831A454AD;
	Tue, 11 Mar 2025 19:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F5BC4CEE9;
	Tue, 11 Mar 2025 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721385;
	bh=zTUZGlfaZpw/Esi/Rx26qQ9HkUg2MBXXI98BiYNbEkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkU6GE2ZoqCga4zPItg0MI/rxit2xUJe8qwZl6umPLewMufleSQJGedR3Zvsm5DC1
	 +rNO/0FQjmKvajmYeNlCmbEpGGfuO61bdGdmVLIFNQ1Hb9swc341BTAgKWQUYpItQN
	 xbVw47aMuuLuq3CAfG2m512Tm4+fCsmQ3ZhtcFShHjdpujsFFuzDJGyavOChTzI1lt
	 h2rWxY7opyLSOGeXjq8nP1DZGY0HDT9Pv7yQip9rK7OraJ79LQSZXGk0HzrWWduMkT
	 RH8Ea6xrJscRlNd4rwG0thXQBoSVW5i8txpSYm1ikphPUtbmrFlP+zsnhMIByUNkf2
	 SrW/RmFbsAwHw==
Date: Tue, 11 Mar 2025 14:29:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] ASoC: dt-bindings: meson: axg-pdm: claim support
 of A1 SoC family
Message-ID: <174172138330.4179604.2763607780913254611.robh@kernel.org>
References: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
 <20250309182127.1322890-4-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309182127.1322890-4-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_122946_229047_2ABE7F34 
X-CRM114-Status: UNSURE (   8.12  )
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


On Sun, 09 Mar 2025 21:21:24 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-pdm" compatible string alias to "amlogic,axg-pdm".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


