Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D638C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99vDdnfsiKCtWUgxL3Zk6sQKfS5uHo+91SzNtW49+Qk=; b=lkcqUwLodTEfhnvQS4+yKsR/8z
	tCMdgtZPkgpVjvkeYcMYIb3Ua5DF16+tE/5voovb727qaj2+rX/d1eqyDpApSuBDfQ/KW7mPL+Ayn
	EtOi3vTWdO1BQCnBGML9I3IxsplzFS3+3Gi98EgLm0EK6b82cWwyYrD0B1hZ1rUz02ahhZd1Wm4Is
	HhBlbvoKmneEo6rLw1GpNUWB3b3YZM7xn24vqiFPAMRSvN3Tgb5iioubIIheICw7DA8DNERlCIcd7
	eLDUN0dPhn86LOyTyTRdGg7juXbdnHIc464rmerZQJ/0KKWaesUwjAOWdsJp43oIYBx9SmMDUESEx
	Kcu4JfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Nw-00000006n6e-3w37;
	Tue, 11 Mar 2025 19:35:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Ix-00000006mL8-3BaS;
	Tue, 11 Mar 2025 19:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E395BA45521;
	Tue, 11 Mar 2025 19:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6E0C4CEE9;
	Tue, 11 Mar 2025 19:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721418;
	bh=3S+4LpN7e7b3uZJfj1/E1QA354tpygy85q1MowEoWK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CjXiFobVMTTSDVt0smcHIZTaw5+NmUk0LtIwKkkcGwNOcWt+j8cogMEfFrCDGP7CH
	 RcuAMniMwc37BgtVwZVMUfk5GVOceJ1VDa/aGNNiaNfU/Tsgj8hCJOwUzvcwgSOQak
	 yvc7yY0rWnWGu9UYpZzY7tDo9wF+mtCUqaGEPOxy1U1+TPwPo7NTTZubzvkAoPoS7M
	 8vWVS2iEGYyYzAe6BJZswI9tqVWKa7a+jFCvJt7l9PGxxUczQTrqWGw8LEu1bczfC7
	 DNi5Z9HjesAw26IG/FEkiDODCJVBrHAEPHGyG+PD7HTcHDVDDrZ54IOZsqOOEAKO7T
	 +DPzht/EdUv9Q==
Date: Tue, 11 Mar 2025 14:30:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: linux-amlogic@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 4/6] ASoC: dt-bindings: meson: axg-tdm-formatters:
 claim support of A1 SoC family
Message-ID: <174172141671.4180325.1225905170416898844.robh@kernel.org>
References: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
 <20250309182127.1322890-5-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309182127.1322890-5-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_123019_865921_E22F580F 
X-CRM114-Status: UNSURE (   8.55  )
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


On Sun, 09 Mar 2025 21:21:25 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-tdmout" and "amlogic,a1-tdmin" compatible string aliases
> to "amlogic,sm1-tdmout" and "amlogic,sm1-tdmin" respectevely.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


