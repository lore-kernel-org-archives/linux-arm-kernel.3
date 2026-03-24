Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252DCF532F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTrxnqhxUElLZFMeZprtVj0IVhPIzo7cILI0/E6FO+c=; b=NadypXjZ7k0dWCsHnl3k5DoarN
	JxsMjfXwatAXykzoOX9igxwV4ullC30WDylxMN5yHWcUwtjrubrWr2SfYkNv7ILtBFIB6W2XgD5zC
	AeKzbAQ1hljDKYugEPWBVpSCTi6Bx9vCNL5XUraaIKb0d4ipwwu4RJWSj1WQx0h0c69jPkp6ZsqAR
	u7BXxoKC/AC3pm0QWyL8EPr7FDh1QgndMqsMLovFQJcf6QjbyQ4bqyY20sT9TZDcKvdPA9UPNQR6n
	sv/sMwgYb18sVdrPPZmKzXvI9V7tEC7ktpM5BSPTjWpzCh0/neE/s0cESldJMvEkx4z8jcuHUmwGL
	X1dU0pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xQh-000000011SX-0Her;
	Tue, 24 Mar 2026 08:48:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xQg-000000011SO-1srl;
	Tue, 24 Mar 2026 08:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB47460127;
	Tue, 24 Mar 2026 08:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5DEC19424;
	Tue, 24 Mar 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774342081;
	bh=ix2Fecint5FiA5s4mDWUWlFNQNkl4uSNPkhTuoKP12s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnnfWuz82pjwgSh/h6fYf0TXk243a8v7a1di3JppVUY23vzEqT7xvFmdBmc/7nUmA
	 bEMp3Db02y6MRqJgu9fyMuxNIqgjLF5QA4LvrwNS87mV5OZ4v6FzxiQIuSSXHbHfri
	 KF/2j8WeohRz+pi87mV4eA5O7q5W9Dm2AWmSgcczp2NfNyomz+ey3jP9NlFMbQi1cF
	 gfFCKz+dtGKwaZ2tMAV5Cuzzlrd+w4p/moO80HHk/LAkcW9EpOX/lpdz0Y2BOKn03I
	 4DodTuA6xP20OZ2d2sDtBda3LoLn6idzjwbJS6Bu+2+OHF0/ezmW3NYtIA3qPVqbzZ
	 KTSnibFDJcTJg==
Date: Tue, 24 Mar 2026 09:47:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	afaerber@suse.com, jyanchou@realtek.com, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v5 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Message-ID: <20260324-chirpy-vigilant-pony-c16e2f@quoll>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
 <20260324025332.3416977-2-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324025332.3416977-2-eleanor.lin@realtek.com>
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

On Tue, Mar 24, 2026 at 10:53:22AM +0800, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek RTD1625 clock and reset controller
> 
> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


