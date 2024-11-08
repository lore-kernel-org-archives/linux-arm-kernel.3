Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19AED5C0C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDqsw5Pts81B2efw8ch4KvTOpMw40xfDtYhkRLRWB10=; b=ityptZwXEgXTZIlLAuztAVTbVv
	aVjX+QM55lb46XlE6T5RRuy1D6+nmDKzRpcRk1m0vAcmNyQbqGIkasHhTGjskcu9iWHk6lPdRr77X
	n59IjJ6tklJm8M3ZDUNwykaZUbEpGtDCnKgqA+eRhnW0h5UmZxr8V9sZc39uhtNsRzQZo2mdb7cKq
	XdnzN2G33b2sCk6F5If4Spx95ROgJyQ/665DxwsGNliRew2A6wuj5XpyZzWjxQo6H6lTj+xBa4+qM
	M3G6STyaXW4n9QFg4SpbwBzswD/E0ccpKBa+H//8lcQ8zqQkJo+Go44clpbwepQI5RUJTF8KdiXBQ
	mjT46cww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O8t-0000000AXEe-0BLv;
	Fri, 08 Nov 2024 12:31:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O5I-0000000AWLH-0HMS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:27:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 549A2A42794;
	Fri,  8 Nov 2024 12:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF183C4CECD;
	Fri,  8 Nov 2024 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731068846;
	bh=VJQoN1YcVQJtLA//yK1+saQlRJH8EZXmp3hpluZXlgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nk3+Al7pPQkfntj7+HgIjJPTV3IcHoa4IkW4+p5ob4/Es02j4L7K1otGpZrg3EKuy
	 ZhOQ7YceE46J0t3lqJeJP2fvGr1rMpweji/ONWrAI4ddWBPjF404lO45gyOOkGYBrs
	 8WN0I93MN8lmNA7gmuyIFceOwx0b0tUfWexUnPjiD/lvJBwNW+PJaG4U/Toqgt908r
	 4DmLqjk4rosmdTXXR7Z3l7rIriXt7aqFJ/I4cDVnQUoI9txQyswIZkWS1o2/cocrYN
	 F/2G44ZV/GgL55RzuUnM7y3QPYMwMm5umSSXpKc6Y8WN8KEPdW0rKanHVMU+2eCRdf
	 Sb/5xG+karW/g==
Date: Fri, 8 Nov 2024 13:27:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, shengjiu.wang@gmail.com, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx93: Add SPDIF IPG clk
Message-ID: <hlnlunxtfs2a2i6gnw7ysws3hrfncyn7whjf4ws2zmw3p3j5a6@itbzs3bzooqs>
References: <20241108100759.682260-1-shengjiu.wang@nxp.com>
 <20241108100759.682260-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108100759.682260-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_042728_192159_93573C45 
X-CRM114-Status: UNSURE (   8.50  )
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

On Fri, Nov 08, 2024 at 06:07:57PM +0800, Shengjiu Wang wrote:
> Add SPDIF IPG clk. The SPDIF IPG clock and root clock
> share same clock gate.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  include/dt-bindings/clock/imx93-clock.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


