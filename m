Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522A1CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXE6/BJRemAq7RxRueDMGrDTNSK83D/7EL8IkyIKpEk=; b=ylqUYenlvzpbSbniuopXW0ASGH
	NjmKlLVRuwy7eRLlODbyDQsKFtbAdSAsDolT0P3Ie2gUMdoFiVk/FD2Yjsm4CtvztsfTK34egCjiz
	dAbD4sCvC+19R78SyH9pK5Rt6xgU0yM3/7a6bXT+wqFNYGulmqwFcm5UNH0JAAfilqlbNBmI9NauR
	NAcjxcPopByT4nxWx9yP1HTM6QfQ0n86HO1q5pBrs92ghOx5YZH5PzAweV5Qb9jLzWWMQ0n/oxOkn
	MbymgVn5+ji6zsSNbhrgyvoP10qoBHry+mRCw4aKHLYfAwkbAGiGpRYbgqUIltPWvgGJs65WJJ4Ie
	naNb1ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGro-0000000GnKv-1qQT;
	Fri, 07 Nov 2025 07:26:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGrl-0000000GnK8-3a2s;
	Fri, 07 Nov 2025 07:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B189E43512;
	Fri,  7 Nov 2025 07:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10497C113D0;
	Fri,  7 Nov 2025 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762500396;
	bh=jIST4hjxq5HplSFzRwdaLH4nRDcRq+Ij0iiF33GFWmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihHs0DELxwvTDxAejhC7XR/P/lOOp9kNziuIGKr0/hKdLMvVafh8sWYxq1aSBHsBM
	 Ir5qPxk9ttx7nJXnowB3Fm5V8OU1Q7kLtLBxAgcCTdu89igvTwN8N9thlolYnOoAsm
	 /Nb9fI7W0UGw6ZONWsmpwuGCZJFWuvMcrKnDfXTpaxyS8TkGVNZPc8ML6adS52xHnl
	 vJgCvw+RoUgKqQ6H9GWgvZcpjlNNFa1X76UB04ocACm4X3jdxgwDL4rDBbfMwhubzE
	 tFUqqen+YkPk7HMxNJdQErgBR4YckhJSxcBGeJr6fEz01PJOPxewe+t+GA9StzmMS3
	 tkSPhTv2RLDyw==
Date: Fri, 7 Nov 2025 08:26:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	"irving.ch.lin" <irving-ch.lin@mediatek.com>, linux-kernel@vger.kernel.org, sirius.wang@mediatek.com, 
	Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, jh.hsu@mediatek.com, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Qiqi Wang <qiqi.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, 
	vince-wl.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 02/21] dt-bindings: power: mediatek: Add MT8189 power
 domain definitions
Message-ID: <20251107-polar-satisfied-kestrel-8bd72b@kuoka>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
 <20251106124330.1145600-3-irving-ch.lin@mediatek.com>
 <176243607706.3652517.3944575874711134298.robh@kernel.org>
 <20251106-spearhead-cornmeal-1a03eead6e8a@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106-spearhead-cornmeal-1a03eead6e8a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_232637_916408_23A015B6 
X-CRM114-Status: GOOD (  12.69  )
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

On Thu, Nov 06, 2025 at 05:17:39PM +0000, Conor Dooley wrote:
> On Thu, Nov 06, 2025 at 07:34:37AM -0600, Rob Herring (Arm) wrote:
> > 
> > On Thu, 06 Nov 2025 20:41:47 +0800, irving.ch.lin wrote:
> > > From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > > 
> > > Add device tree bindings for the power domains of MediaTek MT8189 SoC.
> > > 
> > > Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > > ---
> > >  .../power/mediatek,power-controller.yaml      |  1 +
> > >  .../dt-bindings/power/mediatek,mt8189-power.h | 38 +++++++++++++++++++
> > >  2 files changed, 39 insertions(+)
> > >  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > ./Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> pw-bot: changes-requested

I think this was bot's false positive - that's a different file, not
changed here. The patch seems fine.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


