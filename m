Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56061088E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 02:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+/Jg4QgJ7m+Com/+v/UrC/8miHvfImONawiP553dIk=; b=mzVXlWA/1/5L3Ht08REadi9Y+a
	UkR97TIKXMoFI41Hpmfepq5AODe2K8Pf5swU1qKTT07A0N4slN9a3PlnhJyt/3s2Zbg9ncw6+DsLh
	TuqL0RpfpsuiLQyJGBgxDw7h4+ehUar8Zsb0sSPq2USbcoEI5szgoHc0yyJwUGCGO4ibKPfg3bTrI
	/VSeEubPb+3kN/9CHcfMjxhGpKb4K5EMsJg8ZLFjaCM7LNWbJNI/QAijU3JsZqwFJdNN8EjRtq98v
	h87KSFIpHFfSw4IrEUem2r8Z9gidVXUBZ5cl6xcm6m3qkB4b2UQHOm/jQYvqSXtzovg37KfTU8xt6
	UaQyFzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33Pg-00000009m73-064O;
	Thu, 19 Mar 2026 02:47:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33Pe-00000009m6s-0ksQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 02:47:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E933060121;
	Thu, 19 Mar 2026 02:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C08C2BC9E;
	Thu, 19 Mar 2026 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888424;
	bh=PLO9nS2n75vnUimWf1VeLbh8JTmsqbT3pzO7PHZj77o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uSHTjflBGUr3JUog/3GkFrvKecwTvrKBmORc8jHsc0CHBH9eI1nCSxdwy4OYIR+XJ
	 I25JMXSf2XezOo/bMDdckZ6jYuCFClbhRwL+wAJehm3bHRUNc9isv0cuuJoW/7nK47
	 arGJOOAgBZWhpgMB67RLrP44p28DkJqKfNKW9FihUVq0/FnmP6YjRGv9W+qe6YzOri
	 Ii8GOK679fiiVeil3FKY6pBbTzS18irZUDlJAylgHOyOuJeH1+uzf3lWE3tt1jUrGv
	 4NSsBFHu9swkvDrtTHlxGpmEiOMP/CmVYU8pO9CZAUvBSZpPLd9wgqNcBQNe3MuJmf
	 bBx1/XLCkg5Dg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
Date: Wed, 18 Mar 2026 21:46:45 -0500
Message-ID: <177388840382.11529.699263730640590840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 18 Mar 2026 12:08:39 +0100, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/5] clk: qcom: kaanapali: Cleanup redundant header includes
      commit: 7b70ccfd5df61504a28a8dd316e44fcd2c8970e3
[2/5] clk: qcom: glymur: Cleanup redundant header includes
      commit: 320d45700c131740cb534f1fd2d7aae04d5f16a7
[3/5] clk: qcom: sm8750: Cleanup redundant header includes
      commit: 82e7613f5d23e9698004453c9cb1d6955373a5b5
[4/5] clk: qcom: milos: Cleanup redundant header includes
      commit: 84b21053fe18af080c6486cea2d68a40ce08a294
[5/5] clk: qcom: eliza: Cleanup redundant header includes
      commit: 04088a68258c3585767c9bae35d70812c69a5341

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

