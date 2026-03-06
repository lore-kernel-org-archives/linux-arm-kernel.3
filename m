Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF7AF01804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2fxYS9nQcwcAVb4zFvHSPDZU2n+a1ESa4upJ8KVcVA=; b=zdXt4iHvK3mF418Tf25/uAehNW
	1lA+fJTgrMaJyo0eVWEaJ1L+qgQZhGeUwMpTbxIFE8kT6Aci+HF7iogA0F7ItX+EB3ne2oVlKMeaz
	leKBpBiUJzEnSV1ONmKkM76ze34cayR7oUUpdbAEOOqw8TxCpWMDNt3lCkzBmkh/ePFFGIP9cG9UP
	Nxt7FpIAKxQv25CmMNbF3Ke9LxFV/b2Ty+elL0zgVF3sRGB0IjNf7iOBFiFC5cces6CpU4G+m+Rj0
	ul1gaAA8h6V/gTL1DIijixeIl/ZoL4R/LYlxuvsClVHLA0hVZwRQBkvyQIrcgc23s8rb2vbQUd3ER
	n6nYfKdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQKI-00000003FDS-465U;
	Fri, 06 Mar 2026 08:14:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQKG-00000003FCn-0hEL;
	Fri, 06 Mar 2026 08:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8604417D5;
	Fri,  6 Mar 2026 08:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F201C4CEF7;
	Fri,  6 Mar 2026 08:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784863;
	bh=A948579zvWl86p8orwo3k2nV+y6GeQHABHAcfPNG4t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNXyP+doCw3LCMa9HXmzrYDlbaintfckjEXeOiqTJV98tbcEavLIO1YBTnYIhGvjV
	 0c8CjbdIgkVSGa6AW/WraYVvDvOB9RH7cYrwY8Ny7GG0tuthd7CUqTts8YiDciS/gD
	 4rwo3xS6TbrT6Jdil1k9PlBB2sjczN4xQ030RJkJTjbNk17SRZzpzL+cgu2abbJF4A
	 HcubuaGefxkXqilBF8uGo9GFhBLwmODWwFNEXIBOlYuRAbCgySTuVq5XoIi+lIc3E3
	 f/+RtATUML+O7OaQlo4rbmox2MEtATRdhYAdkOrmjJ3hsdhy/8ierSrXbp7jSVWr+Z
	 BnGfAg0daA05Q==
Date: Fri, 6 Mar 2026 09:14:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
Message-ID: <20260306-artichoke-parakeet-of-innovation-af5b36@quoll>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
 <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_001424_232951_D48994E8 
X-CRM114-Status: GOOD (  17.21  )
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

On Thu, Mar 05, 2026 at 10:03:32AM +0100, Jerome Brunet wrote:
> On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:
> 
> > The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> > the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> > Add it to enable proper clock parent configuration for these peripherals.
> 
> ... but this changes the index of the clocks after this mpll3, and those
> index are supposed to be stable if I'm not mistaken.
> 
> It is indeed more convenient to have the optional clocks at the end
> as it avoids writing multiple <0> in DT when we do not have them.
> 
> At the very least, your commit description should say that this change
> will not break any existing DT because these bindings are not used yet.
> 
> I leave it to the DT folks to say if the change is OK in such case.

Based on commit msg it is not OK, that's why we ask about explaining
true problem and actual impact, IOW whether this did not work in the
first place and authors did not bother to test it...

Best regards,
Krzysztof


